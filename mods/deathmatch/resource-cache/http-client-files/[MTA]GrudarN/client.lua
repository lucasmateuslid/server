function glue()
	local player = getLocalPlayer()
	if not getPedOccupiedVehicle(player) then
		local vehicle = getPedContactElement(player)
		if vehicle then
			if getElementType(vehicle) == "vehicle" then
				local px, py, pz = getElementPosition(player)
				local vx, vy, vz = getElementPosition(vehicle)
				local sx = px - vx
				local sy = py - vy
				local sz = pz - vz
				local rotpX = 0
				local rotpY = 0
				local rotpZ = getPedRotation(player)
				local rotvX,rotvY,rotvZ = getElementRotation(vehicle)
				local t = math.rad(rotvX)
				local p = math.rad(rotvY)
				local f = math.rad(rotvZ)
				local ct = math.cos(t)
				local st = math.sin(t)
				local cp = math.cos(p)
				local sp = math.sin(p)
				local cf = math.cos(f)
				local sf = math.sin(f)
				local z = ct*cp*sz + (sf*st*cp + cf*sp)*sx + (-cf*st*cp + sf*sp)*sy
				local x = -ct*sp*sz + (-sf*st*sp + cf*cp)*sx + (cf*st*sp + sf*cp)*sy
				local y = st*sz - sf*ct*sx + cf*ct*sy
				local rotX = rotpX - rotvX
				local rotY = rotpY - rotvY
				local rotZ = rotpZ - rotvZ
				local slot = getPedWeaponSlot(player)
				triggerServerEvent("gluePlayer", player, slot, vehicle, x, y, z, rotX, rotY, rotZ)
				unbindKey("n","down",glue)
				bindKey("n","down",unglue)
				bindKey("jump","down",unglue)
			end
		end
	end
end
addCommandHandler("glue",glue)

function unglue ()
	local player = getLocalPlayer()
	triggerServerEvent("ungluePlayer", player)
	unbindKey("jump","down",unglue)
	unbindKey("n","down",unglue)
	bindKey("n","down",glue)
end
addCommandHandler("unglue",unglue)

bindKey("n","down",glue)