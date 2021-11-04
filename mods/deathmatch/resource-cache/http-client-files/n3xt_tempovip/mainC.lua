addEvent("N3xT.onManagerVip", true)
addEvent("N3xT.setStartVip", true)

GUIEditor = {
    tab = {},
    label = {},
    tabpanel = {},
    edit = {},
    gridlist = {},
    window = {},
    button = {},
    combobox = {}
}

GUIEditor.window[1] = guiCreateWindow(481, 261, 411, 280, "Gerenciador Tempo VIP", false)
guiWindowSetSizable(GUIEditor.window[1], false)
guiSetProperty(GUIEditor.window[1], "CaptionColour", "FF00FF7F")
GUIEditor.tabpanel[1] = guiCreateTabPanel(18, 24, 376, 241, false, GUIEditor.window[1])

GUIEditor.tab[1] = guiCreateTab("Adicionar Jogador", GUIEditor.tabpanel[1])
GUIEditor.combobox[1] = guiCreateComboBox(24, 84, 144, 95, acl[1], false, GUIEditor.tab[1])
GUIEditor.combobox[2] = guiCreateComboBox(24, 129, 144, 80, "Minutos", false, GUIEditor.tab[1])
guiComboBoxAddItem(GUIEditor.combobox[2], "Dias")
guiComboBoxAddItem(GUIEditor.combobox[2], "Horas")
guiComboBoxAddItem(GUIEditor.combobox[2], "Minutos")
GUIEditor.label[1] = guiCreateLabel(24, 65, 140, 19, "Informe o VIP", false, GUIEditor.tab[1])
GUIEditor.label[2] = guiCreateLabel(24, 110, 140, 19, "Tipo de Tempo", false, GUIEditor.tab[1])
GUIEditor.edit[1] = guiCreateEdit(24, 30, 81, 31, "Conta", false, GUIEditor.tab[1])
GUIEditor.label[3] = guiCreateLabel(24, 12, 140, 19, "Informe a Conta", false, GUIEditor.tab[1])
GUIEditor.button[1] = guiCreateButton(219, 85, 110, 35, "Adicionar", false, GUIEditor.tab[1])
guiSetProperty(GUIEditor.button[1], "NormalTextColour", "FF0000FF")
GUIEditor.edit[2] = guiCreateEdit(24, 174, 81, 31, "0", false, GUIEditor.tab[1])
GUIEditor.label[4] = guiCreateLabel(24, 155, 140, 19, "Tempo", false, GUIEditor.tab[1])

for _, v in ipairs(acl) do
    guiComboBoxAddItem(GUIEditor.combobox[1], v)
end

guiSetVisible(GUIEditor.window[1], false)

addEventHandler("N3xT.onManagerVip", root,
    function()
        if (guiGetVisible(GUIEditor.window[1]) ~= true) then
            guiSetVisible(GUIEditor.window[1], true)
            showCursor(true)
            playSoundFrontEnd(20)
        else
            guiSetVisible(GUIEditor.window[1], false)
            showCursor(false)
            playSoundFrontEnd(20)
        end
    end
)

addEventHandler("N3xT.setStartVip", root,
    function()
        guiSetText(GUIEditor.edit[1], "Conta")
        guiSetText(GUIEditor.edit[2], "0")
    end
)

addEventHandler("onClientGUIClick", root,
    function()
        if (source == GUIEditor.button[1]) then
            local conta = guiGetText(GUIEditor.edit[1])
            local vip = guiComboBoxGetItemText(GUIEditor.combobox[1], -1)
            local data = guiComboBoxGetItemText(GUIEditor.combobox[2], -1)
            local tempo = guiGetText(GUIEditor.edit[2])
            if (conta ~= "Conta") and (conta ~= "") then
                if tonumber(tempo) and (tempo ~= "0") then
                    if (data == "Minutos") then
                        time = (tonumber(tempo) * 60000)
                    elseif (data == "Horas") then
                        time = (tonumber(tempo) * 3600000)
                    elseif (data == "Dias") then
                        time = (tonumber(tempo) * 3600000 * 24)
                    end
                    triggerServerEvent("N3xT.onRequestNewVip", localPlayer, conta, vip, data, tempo, time)
                else
                    triggerEvent("N3xT.dxNotification", root, "Preencha um Tempo válido!", "error")
                end
            else
                triggerEvent("N3xT.dxNotification", root, "Preencha uma Conta válido!", "error")
            end
        end
    end
)