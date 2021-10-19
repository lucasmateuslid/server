------------------------------------------------
------------------------------------------------
----- https://vk.com/aleksander_kasyanchuk -----
------------------------------------------------
------------------------------------------------

function fracPanelAction(vehicle, action)
	if action == "engine" and vehicle then
		setVehicleEngineState(vehicle, not getVehicleEngineState(vehicle))
		notificationText = g
	elseif action == "lights" and vehicle then
		if getVehicleOverrideLights(vehicle) ~= 2 then
			setVehicleOverrideLights(vehicle, 2)
		else
			setVehicleOverrideLights(vehicle, 1)
		end
	elseif action == "lock" then
		local account = getPlayerAccount(client)
		if not account then return end
		local playerLogin = getAccountName(account)
		if vehicle then
			local vehicleOwner = getElementData(vehicle, "owner")
			if vehicleOwner == playerLogin then
				setVehicleLocked(vehicle, not isVehicleLocked(vehicle))
				local text = (isVehicleLocked(vehicle)) and "Автомобиль закрыт" or "Автомобиль открыт"
				outputChatBox(text, client)
			else
				exports.HUD:showNotification("g")
			end
		end
	end
end

function startup()
	addEvent("tcFracPanelAction", true)
	addEventHandler("tcFracPanelAction", root, fracPanelAction)
	addEventHandler("onPlayerLogin", root,
	function(_, newAccount)
		setElementData(source, "playerLogin", getAccountName(newAccount))
	end)
	local players = getElementsByType("player")
	for i,p in ipairs(players) do
		local account = getPlayerAccount(p)
		if not isGuestAccount(account) then
			setElementData(p, "playerLogin", getAccountName(account))
		end
	end
end

addEventHandler("onResourceStart", resourceRoot, startup)