function centerWindow (center_window)
    local screenW, screenH = guiGetScreenSize()
    local windowW, windowH = guiGetSize(center_window, false)
    local x, y = (screenW - windowW) /2,(screenH - windowH) /2
    return guiSetPosition(center_window, x, y, false)
end

local gui = {
    window = {},
	edit = {},
	button = {},
	combobox = {},
	label = {}
}

addEventHandler("onClientResourceStart", resourceRoot, function()
	gui.window[1] = guiCreateWindow(339, 225, 370, 280, "Painel Manager", false)
	guiWindowSetSizable(gui.window[1], false)
	centerWindow(gui.window[1])
	
	gui.edit[1] = guiCreateEdit(10, 30, 360, 25, "ID...", false, gui.window[1])
	
	gui.label[1] = guiCreateLabel(10, 60, 360, 20, "Grupos: ", false, gui.window[1])
	guiSetFont(gui.label[1], "default-bold-small")

	gui.label[2] = guiCreateLabel(10, 80, 360, 20, "Nome da conta: ", false, gui.window[1])
	guiSetFont(gui.label[2], "default-bold-small")
	
	gui.label[3] = guiCreateLabel(10, 100, 360, 20, "Status: ", false, gui.window[1])
	guiSetFont(gui.label[3], "default-bold-small")

	gui.combobox[1] = guiCreateComboBox(10, 130, 370, 135, "Selecione", false, gui.window[1])
	
    gui.button[1] = guiCreateButton(10, 170, 370, 25, "Dar", false, gui.window[1])
	gui.button[2] = guiCreateButton(10, 200, 370, 25, "Retirar", false, gui.window[1])
	gui.button[3] = guiCreateButton(10, 240, 370, 25, "Cancelar", false, gui.window[1])
	
	guiSetVisible(gui.window[1], false)
end)

function fClientOpenPanel()
	if guiGetVisible(gui.window[1]) then
		guiSetVisible(gui.window[1], false)
		showCursor(false)
	else
		guiSetVisible(gui.window[1], true)
		showCursor(true)

		guiComboBoxClear(gui.combobox[1])
		for index, acl in ipairs(ACLS) do 
			guiComboBoxAddItem(gui.combobox[1], acl) 
		end
	end
end	
addEvent("onClientOpenPanel" , true)
addEventHandler("onClientOpenPanel", resourceRoot, fClientOpenPanel)	

function fClientGUIClick(button)
	if button == "left" then
		if guiGetVisible(gui.window[1]) then
			if source == gui.button[1] then
				local theID = guiGetText(gui.edit[1])
				if theID ~= "" and theID ~= "ID..." then
					local text = guiComboBoxGetSelected(gui.combobox[1])
					if text ~= -1 then
						local group = guiComboBoxGetItemText(gui.combobox[1], text)
						triggerServerEvent("onPlayerManagerTag", resourceRoot, "add", theID, group)
					else
						outputChatBox("Selecione um grupo", 255, 0, 0)
					end
				else
					outputChatBox("Digite um ID", 255, 0, 0)
				end
			elseif source == gui.button[2] then
				local theID = guiGetText(gui.edit[1])
				if theID ~= "" and theID ~= "ID..." then
					local text = guiComboBoxGetSelected(gui.combobox[1])
					if text ~= -1 then
						local group = guiComboBoxGetItemText(gui.combobox[1], text)
						triggerServerEvent("onPlayerManagerTag", resourceRoot, "remove", theID, group)
					else
						outputChatBox("Selecione um grupo", 255, 0, 0)
					end
				else
					outputChatBox("Digite um ID", 255, 0, 0)
				end
			elseif source == gui.button[3] then
				fClientOpenPanel()
			elseif source == gui.edit[1] then
				if guiGetText(source) == "ID..." then 
					guiSetText(source, "")
				end
				guiSetInputMode("no_binds_when_editing")
			end
		end
	end			
end
addEventHandler("onClientGUIClick", guiRoot, fClientGUIClick)

addEventHandler("onClientGUIAccepted", guiRoot, function(theElement)
	if theElement == gui.edit[1] then
		local theID = guiGetText(gui.edit[1])
		if theID ~= "" and theID ~= "ID..." then
			triggerServerEvent("onPlayerManagerTag", resourceRoot, "check", theID)
		end
	end
end)

function setGroupsText(text, accName, status)
	guiSetText(gui.label[1], "Grupos: "..tostring(text))
	guiSetText(gui.label[2], "Nome da conta: "..tostring(accName))
	guiSetText(gui.label[3], "Status: "..tostring(status))
	if tostring(status) == "Offline" then
		guiLabelSetColor(gui.label[3], 255, 0, 0)
	elseif tostring(status) == "Online" then
		guiLabelSetColor(gui.label[3], 0, 255, 0)
	else
		guiLabelSetColor(gui.label[3], 255, 255, 255)
	end
end
addEvent("setGroupsText", true)
addEventHandler("setGroupsText", resourceRoot, setGroupsText)

addEventHandler("onClientGUIChanged", guiRoot, function(theElement)
	if theElement == gui.edit[1] then
		local currText = guiGetText(theElement)
		local newText = string.gsub(currText, "[^0-9]", "")
		if newText ~= currText then
			guiSetText(theElement, newText)
		end
	end
end)