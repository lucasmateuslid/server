    function vehicleGodMod(player)
        if not (hasObjectPermissionTo(player,"general.adminpanel",false)) then
        outputChatBox("Voce não tem acesso a este comando" ,player,255) return end
        if (isVehicleDamageProof(getPedOccupiedVehicle(player))) then
        setVehicleDamageProof(getPedOccupiedVehicle(player),false)
        outputChatBox("Seu veiculo não esta mas protegido",player,255)
    else
        setVehicleDamageProof(getPedOccupiedVehicle(player),true)
        outputChatBox("Seu veiculo esta protegido",player,0,255)
        end
    end
    addCommandHandler("blind",vehicleGodMod)
    addCommandHandler("blindar",vehicleGodMod)