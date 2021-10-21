limit = true


key = "c"

allowedTypes = { "Automobile", "Bike", "Boat", "Train" }


function getElementSpeed(element,unit)
	if (unit == nil) then unit = 0 end
	if (isElement(element)) then
		local x,y,z = getElementVelocity(element)
		if (unit=="mph" or unit==1 or unit =='1') then
			return (x^2 + y^2 + z^2) ^ 0.5 * 100
		else
			return (x^2 + y^2 + z^2) ^ 0.5 * 1.61 * 100
		end
	else
		return false
	end
end

function setElementSpeed(element, unit, speed)
	if (unit == nil) then unit = 0 end
	if (speed == nil) then speed = 0 end
	speed = tonumber(speed)
	local acSpeed = getElementSpeed(element, unit)
	if (acSpeed~=false) then
		local diff = speed/acSpeed
		local x,y,z = getElementVelocity(element)
		setElementVelocity(element,x*diff,y*diff,z*diff)
		return true
	else
		return false
	end
end

function in_array(e, t)
	for _,v in pairs(t) do
		if (v==e) then return true end
	end
	return false
end

function round2(num, idp)
  return tonumber(string.format("%." .. (idp or 0) .. "f", num))
end


function angle(vehicle)
	local vx,vy,vz = getElementVelocity(vehicle)
	local modV = math.sqrt(vx*vx + vy*vy)
	
	if not isVehicleOnGround(vehicle) then return 0,modV end
	
	local rx,ry,rz = getElementRotation(vehicle)
	local sn,cs = -math.sin(math.rad(rz)), math.cos(math.rad(rz))

	
	local cosX = (sn*vx + cs*vy)/modV

	return math.deg(math.acos(cosX))*0.5, modV
end

lp = getLocalPlayer()
ccEnabled = false

myveh = false
targetSpeed = 1
multiplier = 1

function cc()
	if (not isElement(myveh)) then
		removeEventHandler("onClientRender", getRootElement(), cc)
		ccEnabled=false

		outputChatBox("#AD11FD|| #FFFFFFPiloto automático desativado.", 255, 255, 255, true )
		return false
	end
	local x,y = angle(myveh)

	if (x<15) then
		local speed = getElementSpeed(myveh)
		local targetSpeedTmp = speed + multiplier
		if (targetSpeedTmp > targetSpeed) then
			targetSpeedTmp = targetSpeed
		end
		if (targetSpeedTmp > 3) then
			setElementSpeed(myveh, "k", targetSpeedTmp)
		end
	end
end

bindKey(key, "up", function()
	local veh = getPedOccupiedVehicle(lp)
	if (veh) then
		if (lp==getVehicleOccupant(veh)) then
			if getElementData(veh, "vehicle.cnh") then 
				return 
			end
			myveh = veh
			if (ccEnabled) then
				removeEventHandler("onClientRender", getRootElement(), cc)
				ccEnabled=false

				outputChatBox( "#AD11FD|| #FFFFFFPiloto automático desativado.", 255, 255, 255, true )
			else
				targetSpeed = getElementSpeed(veh)
				if targetSpeed > 4 then
					if (limit) then
					if getVehicleEngineState ( veh ) then
						if in_array(getVehicleType(veh), allowedTypes) then
							targetSpeed = round2(targetSpeed)

							outputChatBox( "#AD11FD|| #FFFFFFPiloto automático ativado em: #7CC576"..math.floor(targetSpeed).."#ffffffkm/h.", 255, 255, 255, true )

							addEventHandler("onClientRender", getRootElement(), cc)
							ccEnabled=true				
						end
						end
					else
						if getVehicleEngineState ( veh ) then
						targetSpeed = round2(targetSpeed)
						addEventHandler("onClientRender", getRootElement(), cc)
						ccEnabled=true
						end
					end
				end
			end
		end
	end
end)

bindKey("w", "down", function()
	local veh = getPedOccupiedVehicle(lp)
	if (veh) then
		if (lp==getVehicleOccupant(veh)) then
			myveh = veh
			if (ccEnabled) then
				removeEventHandler("onClientRender", getRootElement(), cc)
				ccEnabled=false

				outputChatBox( "#AD11FD|| #FFFFFFPiloto automático desativado pois você pisou no acelerador.", 255, 255, 255, true )
			end
		end
	end
end)

bindKey("s", "down", function()
	local veh = getPedOccupiedVehicle(lp)
	if (veh) then
		if (lp==getVehicleOccupant(veh)) then
			myveh = veh
			if (ccEnabled) then
				removeEventHandler("onClientRender", getRootElement(), cc)
				ccEnabled=false

				outputChatBox( "#AD11FD|| #FFFFFFPiloto automático desativado pois você pisou no freio.", 255, 255, 255, true )
			end
		end
	end
end)

bindKey("j", "down", function()
	local veh = getPedOccupiedVehicle(lp)
	if (veh) then
		if (lp==getVehicleOccupant(veh)) then
			myveh = veh
			if (ccEnabled) then
				removeEventHandler("onClientRender", getRootElement(), cc)
				ccEnabled=false
				outputChatBox( "#AD11FD|| #FFFFFFPiloto automático desativado pois você pisou no acelerador.", 255, 255, 255, true )
			end
		end
	end
end)

addEventHandler("onClientPlayerVehicleExit", getLocalPlayer(), function(veh, seat)
	if (seat==0) then
		if (ccEnabled) then
			removeEventHandler("onClientRender", getRootElement(), cc)
			ccEnabled=false

			outputChatBox( "#AD11FD|| #FFFFFFPiloto automático desativado.", 255, 255, 255, true )
		end
	end
end)


addEventHandler("onClientVehicleCollision", root, function(collider, force, bodyPart, x, y, z, nx, ny, nz)
    if source == getPedOccupiedVehicle(localPlayer) then
		local fDamageMultiplier = getVehicleHandling(source).collisionDamageMultiplier
		local realDamage = force * fDamageMultiplier * 0.05
		
		if realDamage > 1 then
			if not ccEnabled then return end
			removeEventHandler("onClientRender", getRootElement(), cc)
			ccEnabled=false		
			outputChatBox( "#AD11FD|| #FFFFFFPiloto automático desativado.", 255, 255, 255, true )
		end
    end
end)