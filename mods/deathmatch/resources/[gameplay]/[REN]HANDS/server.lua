








local predefinedHandling = {
			  --
                                                                                              --
	--ID del coche                                                                            --
	[596] = {                                                                                 --
		["maxVelocity"] = 300, --Maxima Velocidad                                             --
		["engineAcceleration"] = 25, --Aceleracion	                                          --
		["tractionMultiplier"] = 0.9-, --Traccion                                             --
		["suspensionLowerLimit"] = -0.5, --Altura de suspencion
		["engineInertia"] = -50, --Altura de suspencion                            --
	},
	[598] = {
		["mass"] = 5600, --Massa
		["turnMass"] = 8000, -- Transformação da massa
		["dragCoeff"] = 9, -- Arraste do Multiplicador
		["suspensionForceLevel"] = 1.09
		["suspensionDamping"] = 1.05

		["maxVelocity"] = 300, --Maxima Velocidad                                             --
		["engineAcceleration"] = 25, --Aceleracion	                                          --
		["tractionMultiplier"] = 0.99, --Traccion                                             --
		["suspensionLowerLimit"] = -0.5, --Altura de suspencion
		["engineInertia"] = -50, --Altura de suspencion                            --
	},                          --
------------------------------------------------------------------------------------------------



}

for i,v in pairs (predefinedHandling) do
	if i then
		for handling, value in pairs (v) do
			if not setModelHandling (i, handling, value) then
				outputDebugString ("* Predefined handling '"..tostring(handling).."' for vehicle model '"..tostring(i).."' could not be set to '"..tostring(value).."'")
			end
		end
	end
end

for _,v in ipairs (getElementsByType("vehicle")) do
	if v and predefinedHandling[getElementModel(v)] then
		for k,vl in pairs (predefinedHandling[getElementModel(v)]) do
			setVehicleHandling (v, k, vl)
		end
	end
end

function resetHandling()
	for model in pairs (predefinedHandling) do
		if model then
			for k in pairs(getOriginalHandling(model)) do
				setModelHandling(model, k, nil)
			end
		end
	end

	for _,v in ipairs (getElementsByType("vehicle")) do
		if v then
			local model = getElementModel(v)
			if predefinedHandling[model] then
				for k,h in pairs(getOriginalHandling(model)) do
					setVehicleHandling(v, k, h)
				end
			end
		end
	end
end
addEventHandler("onResourceStop", resourceRoot, resetHandling)

-------------------------------------------------------------------------------------
local msg_red,msg_green,msg_blue = 255,255,0

function servertalkprivate(message, sendto)

	outputChatBox(tostring(message), sendto, msg_red, msg_green, msg_blue, true)
end



addEventHandler("onPlayerJoin",getRootElement(),onJoin)