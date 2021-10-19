------------------------------------------------
------------------------------------------------
----- https://vk.com/aleksander_kasyanchuk -----
------------------------------------------------
------------------------------------------------
local circle

local lights
local lightsColor = 0xFF707070

local vehicleLock
local vehicleLockColor = 0xFF707070

local engine
local engineColor = 0xFF707070

local circleX
local circleY

local rotation = 180

local displayLockVehicle = false
local displayVehicleElem = false
local playerVehicleFound

function renderCircle()
	dxDrawImage(circleX, circleY, 298, 298, circle, rotation)
	if displayLockVehicle then
		dxDrawImage(circleX + 30, circleY + 200, 48, 48, vehicleLock, 0, 0, 0, vehicleLockColor)
	end
	if displayVehicleElem then
		dxDrawImage(circleX + 120, circleY + 245, 48, 48, lights, 0, 0, 0, lightsColor)
		dxDrawImage(circleX + 5, circleY + 120, 48, 48, engine, 0, 0, 0, engineColor)
	end
end

function cursorMoveHandler(_, _, absoluteX, absoluteY)
	local b1, b2 = screenWidth * 0.5 - absoluteX, absoluteY - screenHeight * 0.5
	rotation = math.acos( b2 / math.sqrt(b1*b1 + b2*b2) ) * 57.3
	if rotation ~= rotation then
		rotation = 0
	end
	if b1 < 0 then
		rotation  = -rotation
	end
	if rotation >= -22.5 and rotation <= 22.5 then
		lightsColor = 0xFFFFFFFF
		engineColor = 0xFF707070
		vehicleLockColor = 0xFF707070
	elseif rotation > 22.5 and rotation <= 67.5 then
		vehicleLockColor = 0xFFFFFFFF
		engineColor = 0xFF707070
		lightsColor = 0xFF707070
	elseif rotation > 67.5 and rotation <= 112.5 then
		engineColor = 0xFFFFFFFF
		vehicleLockColor = 0xFF707070
		lightsColor = 0xFF707070
	else
		engineColor = 0xFF707070
		vehicleLockColor = 0xFF707070
		lightsColor = 0xFF707070
	end
end

function setCircleOpened(opened)
	if opened then
		if getPedOccupiedVehicle(localPlayer) and getPedOccupiedVehicleSeat(localPlayer) == 0 then
			displayLockVehicle = true
			playerVehicleFound = getPedOccupiedVehicle(localPlayer)
		else
			local x, y, z = getElementPosition(localPlayer)
			local vehiclesNearby = getElementsWithinRange(x, y, z, 10, "vehicle")
			local playerLogin = getElementData(localPlayer, "playerLogin")
			playerVehicleFound = false
			for i,v in ipairs(vehiclesNearby) do
				if getElementData(v, "owner") == playerLogin then
					playerVehicleFound = v
					break
				end
			end
			displayLockVehicle = (playerVehicleFound ~= false)
		end
		addEventHandler("onClientRender", root, renderCircle)
		openedWinCount = openedWinCount + 1
		if not isCursorShowing() then
			setCursorAlpha(0)
			setCursorPosition(screenWidth / 2, screenHeight / 2 + 2)
		end
		displayCursor(true)
		addEventHandler("onClientCursorMove", root, cursorMoveHandler)
	else
		removeEventHandler("onClientRender", root, renderCircle)
		openedWinCount = openedWinCount - 1
		displayCursor(false)
		setCursorAlpha(255)
		removeEventHandler("onClientCursorMove", root, cursorMoveHandler)
	end
end

function startup()
	circle = dxCreateTexture("Files/Circle.png")
	lights = dxCreateTexture("Files/lights-small.png")
	vehicleLock = dxCreateTexture("Files/vehiclelock-small.png")
	engine = dxCreateTexture("Files/engine-small.png")
	circleX = (screenWidth - 298) * 0.5
	circleY = (screenHeight - 298) * 0.5
	addEvent("tcFracPanelAction", true)
	addEventHandler("onClientPlayerVehicleEnter", localPlayer,
	function(_, seat)
		if seat == 0 then
			displayVehicleElem = true
		end
	end)
	addEventHandler("onClientPlayerVehicleExit", localPlayer,
	function(vehicle)
		displayVehicleElem = false
	end)
	if getPedOccupiedVehicle(localPlayer) and getPedOccupiedVehicleSeat(localPlayer) == 0 then
		displayVehicleElem = true
		displayLockVehicle = true
	end
	
	addEventHandler("onClientKey", root,
	function(button, press)
		if button == "tab" then
			setCircleOpened(press)
			if not press and displayVehicleElem and vehicleLockColor == 0xFF707070 then
				vehicle = getPedOccupiedVehicle(localPlayer)
				if vehicle and getPedOccupiedVehicleSeat(localPlayer) ~= 0 then return end
				if lightsColor == 0xFFFFFFFF then
					triggerServerEvent("tcFracPanelAction", localPlayer, vehicle, "lights")
				elseif engineColor == 0xFFFFFFFF then
					triggerServerEvent("tcFracPanelAction", localPlayer, vehicle, "engine")
				end
			end
			if not press and displayLockVehicle and vehicleLockColor == 0xFFFFFFFF then
				triggerServerEvent("tcFracPanelAction", localPlayer, playerVehicleFound, "lock")
			end
		end
	end)

end

addEventHandler("onClientResourceStart", resourceRoot, startup)