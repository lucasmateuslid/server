------------------------------------------------
------------------------------------------------
----- https://vk.com/aleksander_kasyanchuk -----
------------------------------------------------
------------------------------------------------
screenWidth = nil
screenHeight = nil

----------------
local passportWidth = 600
local passportHeight = 400

openedWinCount = 0

function renderPassport()
	dxDrawRectangle(passportX, passportY, passportWidth, passportHeight, 0xE0303030)
	dxDrawText("ПАСПОРТ ГРАЖДАНИНА", passportX + 160, passportY + 10, leftX, topY, 0xFFFFC000, 1, titleFont)
	dxDrawRectangle(passportX + 30, passportY + 50, passportWidth - 60, 3, 0xFFFFC000)
	dxDrawRectangle(passportX + 30, passportY + 70, 100, 150, 0xFFC0C0C0)
	dxDrawText("ФАМИЛИЯ", passportX + 160, passportY + 70, leftX, topY, 0xFFE0E0E0, 1, labelFont)
	dxDrawText("ИМЯ", passportX + 160, passportY + 110, leftX, topY, 0xFFE0E0E0, 1, labelFont)
	dxDrawText("ПОЛ", passportX + 160, passportY + 150, leftX, topY, 0xFFE0E0E0, 1, labelFont)
	dxDrawText("ДАТА РЕГИСТРАЦИИ", passportX + 300, passportY + 150, leftX, topY, 0xFFE0E0E0, 1, labelFont)
	dxDrawText("МЕСТО РЕГИСТРАЦИИ", passportX + 160, passportY + 190, leftX, topY, 0xFFE0E0E0, 1, labelFont)
	dxDrawText("ВОЕННЫЙ БИЛЕТ", passportX + 160, passportY + 230, leftX, topY, 0xFFE0E0E0, 1, labelFont)
	dxDrawText("ПАСПОРТ ВЫДАН", passportX + 30, passportY + 280, leftX, topY, 0xFFE0E0E0, 1, labelFont)
	dxDrawLine(passportX + 565, passportY + 5, passportX + 595, passportY + 35, 0xFFE0E0E0, 2)
	dxDrawLine(passportX + 595, passportY + 5, passportX + 565, passportY + 35, 0xFFE0E0E0, 2)
end

function renderWorkbook()
	dxDrawRectangle(workbookX, workbookY, workbookWidth, workbookHeight, 0xE0303030)
	dxDrawText("ТРУДОВАЯ КНИЖКА", workbookX + 160, workbookY + 10, leftX, topY, 0xFFFFC000, 1, titleFont)
	dxDrawRectangle(passportX + 30, workbookY + 50, workbookWidth - 60, 3, 0xFFFFC000)
	dxDrawText("Фамилия", workbookX + 30, workbookY + 70, leftX, topY, 0xFFE0E0E0, 1, labelFont)
	dxDrawText("Имя", workbookX + 30, workbookY + 100, leftX, topY, 0xFFE0E0E0, 1, labelFont)
	dxDrawText("Дата регистрации", workbookX + 30, workbookY + 130, leftX, topY, 0xFFE0E0E0, 1, labelFont)
	dxDrawText("СВЕДЕНИЯ О РАБОТЕ", workbookX + 160, workbookY + 160, leftX, topY, 0xFFFFC000, 1, titleFont)
	dxDrawRectangle(workbookX + 30, workbookY + 200, 2, 180, 0xFFE0E0E0)
	dxDrawRectangle(workbookX + 60, workbookY + 200, 2, 180, 0xFFE0E0E0)
	dxDrawRectangle(workbookX + 150, workbookY + 200, 2, 180, 0xFFE0E0E0)
	dxDrawRectangle(workbookX + 400, workbookY + 200, 2, 180, 0xFFE0E0E0)
	dxDrawRectangle(workbookX + 570, workbookY + 200, 2, 180, 0xFFE0E0E0)
	dxDrawRectangle(workbookX + 570, workbookY + 200, 2, 180, 0xFFE0E0E0)
	dxDrawRectangle(workbookX + 30, workbookY + 200, 540, 2, 0xFFE0E0E0)
	dxDrawRectangle(workbookX + 30, workbookY + 230, 540, 2, 0xFFE0E0E0)
	dxDrawText("№", workbookX + 38, workbookY + 208, leftX, topY, 0xFFE0E0E0, 1, tableFont)
	dxDrawText("Дата", workbookX + 68, workbookY + 208, leftX, topY, 0xFFE0E0E0, 1, tableFont)
	dxDrawText("Сведения", workbookX + 158, workbookY + 208, leftX, topY, 0xFFE0E0E0, 1, tableFont)
	dxDrawText("Ответственный", workbookX + 408, workbookY + 208, leftX, topY, 0xFFE0E0E0, 1, tableFont)
	dxDrawLine(workbookX + 565, workbookY + 5, workbookX + 595, workbookY + 35, 0xFFE0E0E0, 2)
	dxDrawLine(workbookX + 595, workbookY + 5, workbookX + 565, workbookY + 35, 0xFFE0E0E0, 2)
end

function setPassportOpened(isOpened)
	if isOpened then
		if not passportOpened then
			openedWinCount = openedWinCount + 1
		end
		passportOpened = true
		displayCursor(true)
		addEventHandler("onClientRender", root, renderPassport)
	else
		if passportOpened then
			openedWinCount = openedWinCount - 1
		end
		passportOpened = false
		displayCursor(false)
		removeEventHandler("onClientRender", root, renderPassport)
	end
end

function setWorkbookOpened(isOpened)
	if isOpened then
		addEventHandler("onClientRender", root, renderWorkbook)
		if not workbookOpened then
			openedWinCount = openedWinCount + 1
		end
		workbookOpened = true
		displayCursor(true)
	else
		if workbookOpened then
			openedWinCount = openedWinCount - 1
		end
		removeEventHandler("onClientRender", root, renderWorkbook)
		workbookOpened = false
		displayCursor(false)
	end
end

function setInventoryOpened(isOpened)
	if isOpened then
		addEventHandler("onClientRender", root, renderInventory)
		if not inventoryOpened then
			openedWinCount = openedWinCount + 1
		end
		inventoryOpened = true
		displayCursor(true)
	else
		removeEventHandler("onClientRender", root, renderInventory)
		if inventoryOpened then
			openedWinCount = openedWinCount - 1
		end
		inventoryOpened = false
		displayCursor(false)
	end
end

function displayCursor(display)
	if display then
		showCursor(true)
	else
		if openedWinCount == 0 then
			showCursor(false)
		end
	end
end

function handleKeys(button, press)
	if button == "q" then
		setInventoryOpened(press)
		displayCursor(press)
		passportActivated = false
		workbookActivated = false
	end
	if button == "mouse1" and press then
		local curX, curY = getCursorPosition()
		if not curX then return false end
		curX = curX * screenWidth
		curY = curY * screenHeight
		if curX >= inventoryX + 15 and curX <= inventoryX + 75 and curY >= inventoryY + 40 and curY <= inventoryY + 100 then
			passportActivated = true
			workbookActivated = false
		end
		if curX >= inventoryX + 90 and curX <= inventoryX + 150 and curY >= inventoryY + 40 and curY <= inventoryY + 100 then
			passportActivated = false
			workbookActivated = true
		end
	end
	if button == "mouse1" and not press then
		local curX, curY = getCursorPosition()
		if not curX then return false end
		curX = curX * screenWidth
		curY = curY * screenHeight
		if curX >= passportX + 560 and curX <= passportX + 600 and curY >= passportY and curY <= passportY + 40 then
			if passportOpened then
				setPassportOpened(false)
			end
		end
		if curX >= workbookX + 560 and curX <= workbookX + 600 and curY >= workbookY and curY <= workbookY + 40 then
			if workbookOpened then
				setWorkbookOpened(false)
			end
		end
	end
	if button == "mouse1" and not press then
		if passportActivated then
			local screenx, screeny, worldx, worldy, worldz = getCursorPosition()
            local px, py, pz = getCameraMatrix()
            local hit, x, y, z, elementHit = processLineOfSight ( px, py, pz, worldx, worldy, worldz )
			if elementHit then
				if getElementType(elementHit) == "player" then
					triggerServerEvent("tcSendPassportInfo", localPlayer, elementHit)
					passportActivated = false
				end
			end
		elseif workbookActivated then
			local screenx, screeny, worldx, worldy, worldz = getCursorPosition()
            local px, py, pz = getCameraMatrix()
            local hit, x, y, z, elementHit = processLineOfSight ( px, py, pz, worldx, worldy, worldz )
			if elementHit then
				if getElementType(elementHit) == "player" then
					triggerServerEvent("tcSendWorkbookInfo", localPlayer, elementHit)
					passportActivated = false
				end
			end
		end
	end
end

function startup()
	screenWidth, screenHeight = guiGetScreenSize()
	passportX = (screenWidth - passportWidth) * 0.5
	passportY = (screenHeight - passportHeight) * 0.5
	workbookX = (screenWidth - workbookWidth) * 0.5
	workbookY = (screenHeight - workbookHeight) * 0.5
	inventoryY = screenHeight - 400
	titleFont = dxCreateFont("Files/calibri.ttf", 20)
	labelFont = dxCreateFont("Files/calibri.ttf", 14)
	tableFont = dxCreateFont("Files/calibri.ttf", 10)
	passportTexture = dxCreateTexture("Files/passport.jpg")
	workbookTexture = dxCreateTexture("Files/workbook.jpg")
	addEvent("tcSendPassportInfo", true)
	addEvent("tcSendWorkbookInfo", true)
	addEvent("tcRegisterNewPassport", true)
	addEventHandler("tcSendPassportInfo", root,
	function(passport)
		setPassportOpened(true)
	end)
	addEventHandler("tcSendWorkbookInfo", root,
	function(workbook)
		setWorkbookOpened(true)
	end)
	addEventHandler("onClientKey", root, handleKeys)
	addEventHandler("onClientRender", root, renderLabel)
end
addEventHandler("onClientResourceStart", resourceRoot, startup)