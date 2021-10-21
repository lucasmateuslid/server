 --==================================== ID System
function getPlayerID(id)
	v = false
	for i, player in ipairs (getElementsByType("player")) do
		if getElementData(player, "ID") == id then
			v = player
			break
		end
	end
	return v
end

--============================================================================================================================--
                                   --=============================--
                                   ----------- ID PLAYER ------------
                                   --=============================--







----------------- Fuel
addCommandHandler("setgas",
	function(playerSource,commandName,id)
	if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(playerSource)), aclGetGroup ("Staff")) then
    if(id) then
        local playerID = tonumber(id)
		if(playerID) then
				local targetPlayer, targetPlayerName = getPlayerID(playerID)
				local veh = getPedOccupiedVehicle(targetPlayer)
				if targetPlayer then
                     setElementHealth ( targetPlayer, 100 )
					 setElementData(veh, "fuel", 100)
					else
                   
					end
				end
			end
	end
	end
)
----------------
function setPlayerSkin2(thePlayer, commandName, skin)
	if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(thePlayer)), aclGetGroup ("Staff")) then
			if getElementModel(thePlayer) == skin then
				outputChatBox(error .. "O jogador já tem essa skin.", thePlayer, 255, 255, 255, true)
				return
			end
			setElementModel(thePlayer, skin)
			outputChatBox("Você mudou com sucesso sua skin", thePlayer, 255, 255, 255, true)
			
	end
end
addCommandHandler("ss", setPlayerSkin2, false, false)
-----------
function fly(thePlayer, commandName)
	if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(thePlayer)), aclGetGroup ("Staff")) then
		triggerClientEvent(thePlayer, "onClientFlyToggle", thePlayer)
	else
	end
end
addCommandHandler("fly", fly, false, false)
-----------
addCommandHandler("vida",
	function(playerSource,commandName,id)
	if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(playerSource)), aclGetGroup ("Staff")) then
    if(id) then
        local playerID = tonumber(id)
		if(playerID) then
				local targetPlayer, targetPlayerName = getPlayerID(playerID)
				if targetPlayer then
                     setElementHealth ( targetPlayer, 100 )
					else
                   
					end
				end
			end
	end
	end
)

----------- 
addCommandHandler("fix",
	function(playerSource,commandName,id)
	if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(playerSource)), aclGetGroup ("Staff")) then
    if(id) then
        local playerID = tonumber(id)
		if(playerID) then
				local targetPlayer, targetPlayerName = getPlayerID(playerID)
				if targetPlayer then
                  local veh = getPedOccupiedVehicle(targetPlayer)
				     if veh then
						fixVehicle(veh)
       					setVehicleDamageProof (veh, false ) 
					else
				outputChatBox("o Jogador não está em um Veiculo", thePlayer, 255, 255, 255, true)
			       end
                    end
					else
                   
					end
				end
			end
	end
)
--------------------------
addCommandHandler("dv",
		function(playerSource,commandName,id)
	if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(playerSource)), aclGetGroup ("Staff")) then
    if(id) then
        local playerID = tonumber(id)
		if(playerID) then
				local targetPlayer, targetPlayerName = getPlayerID(playerID)
				if targetPlayer then
                  local veh = getPedOccupiedVehicle(targetPlayer)
				     if veh then
						destroyElement(veh)
       					setVehicleDamageProof (veh, false ) 
					else
				outputChatBox("o Jogador não está em um Veiculo", thePlayer, 255, 255, 255, true)
			       end
                    end
					else
                   
					end
				end
			end
	end
)

-------------------------------
addCommandHandler("colete",
	function(playerSource,commandName,id)
	if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(playerSource)), aclGetGroup ("Staff")) then
    if(id) then
        local playerID = tonumber(id)
		if(playerID) then
				local targetPlayer, targetPlayerName = getPlayerID(playerID)
				if targetPlayer then
                     setPedArmor ( targetPlayer, 100 ) 
					else
                   
					end
				end
			end
	end
	end
)
---------------------------------
addCommandHandler("setfome",
	function(playerSource,commandName,id)
	if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(playerSource)), aclGetGroup ("Staff")) then
    if(id) then
        local playerID = tonumber(id)
		if(playerID) then
				local targetPlayer, targetPlayerName = getPlayerID(playerID)
				if targetPlayer then
                     setElementData ( targetPlayer, "KND:Sede", 100 )
					 setElementData ( targetPlayer, "KND:Fome", 100 )
					else
                   
					end
				end
			end
	end
	end
)
-----------------------------------------------------------------------------
                                   --=============================--
addCommandHandler("tp",
	function(playerSource,commandName,id)
	if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(playerSource)), aclGetGroup ("Staff")) then
    if(id) then
        local playerID = tonumber(id)
		if(playerID) then
				local targetPlayer, targetPlayerName = getPlayerID(playerID)
				if targetPlayer then
					local x, y, z = getElementPosition(targetPlayer)
					local interior = getElementInterior(targetPlayer)
					local dimension = getElementDimension(targetPlayer)
					local r = getPedRotation(targetPlayer)
					setCameraInterior(playerSource, interior)
					if (isPedInVehicle(playerSource)) then
						local veh = getPedOccupiedVehicle(playerSource)
						setVehicleTurnVelocity(veh, 0, 0, 0)
						setElementInterior(playerSource, interior)
						setElementDimension(playerSource, dimension)
						setElementInterior(veh, interior)
						setElementDimension(veh, dimension)
						setElementPosition(veh, x, y, z + 1)
						warpPedIntoVehicle ( playerSource, veh ) 
						setTimer(setVehicleTurnVelocity, 50, 20, veh, 0, 0, 0)
					else
						setElementPosition(playerSource, x, y, z+2)
						setElementInterior(playerSource, interior)
						setElementDimension(playerSource, dimension)
						
						
					end
				end
			end
	end
	end
	end
)






---------------------- Puxar
addCommandHandler("puxar",
	function(playerSource,commandName,id)
	if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(playerSource)), aclGetGroup ("Staff")) then
    if(id) then
        local playerID = tonumber(id)
		if(playerID) then
				local targetPlayer = getPlayerID(playerID)
				if targetPlayer then
				local x, y, z = getElementPosition(playerSource)
				local interior = getElementInterior(playerSource)
				local dimension = getElementDimension(playerSource)
				local r = getPedRotation(playerSource)
				setCameraInterior(targetPlayer, interior)
				if (isPedInVehicle(targetPlayer)) then
					local veh = getPedOccupiedVehicle(targetPlayer)
					setVehicleTurnVelocity(veh, 0, 0, 0)
					setElementPosition(veh, x, y, z + 2)
					setTimer(setVehicleTurnVelocity, 50, 10, veh, 0, 0, 0)
					setElementInterior(veh, interior)
					setElementDimension(veh, dimension)	
				else
					setElementPosition(targetPlayer, x, y, z+2)
					setElementInterior(targetPlayer, interior)
					setElementDimension(targetPlayer, dimension)

				    end
								

				end
			end
	end
	end
	end
)



-----------------------

function toggleInvisibility(thePlayer)
	if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(thePlayer)), aclGetGroup ("Staff")) then
		local enabled = getElementData(thePlayer, "invisible")
		if (enabled == true) then
			setElementAlpha(thePlayer, 255)
			setElementData(thePlayer, "reconx", false)
			outputChatBox ("Você desativou a invisible", thePlayer)
			setElementData(thePlayer, "invisible", false)
		elseif (enabled == false or enabled == nil) then
			setElementAlpha(thePlayer, 0)
			setElementData(thePlayer, "reconx", true)
			outputChatBox ("Você ficou invisible", thePlayer)
			setElementData(thePlayer, "invisible", true)
		else
			
		end
		else
		outputChatBox ("Acesso negado", thePlayer)
	end
end
addCommandHandler("disappear", toggleInvisibility)
addCommandHandler("v", toggleInvisibility)

