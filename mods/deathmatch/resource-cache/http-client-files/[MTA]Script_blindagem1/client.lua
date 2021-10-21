function DanoBlindado ( attacker, weapon, bodypart )
	local blindadocar = getPedOccupiedVehicle ( localPlayer )
         if (blindadocar) then
          if getElementModel(blindadocar) == 427 then
		cancelEvent()
        setElementHealth(localPlayer, 100)
	end
    end
end
addEventHandler ( "onClientPlayerDamage", getLocalPlayer(), DanoBlindado )