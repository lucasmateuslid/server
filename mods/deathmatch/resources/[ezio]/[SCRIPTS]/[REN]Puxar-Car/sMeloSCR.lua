addCommandHandler(CONFIG["Comando"].puxarcarro, 
function (thePlayer, cmd, idplayer, idcarro)
    if getElementType(thePlayer) == "player" and tonumber(idplayer) and tonumber(idcarro) then 
        local conta = getAccountName(getPlayerAccount(thePlayer))
        for i,v in ipairs(CONFIG["ACLpermitida"]) do 
            if aclGetGroup(v[1]) and isObjectInACLGroup("user."..conta, aclGetGroup(v[1])) then 
                for i,v in ipairs(getElementsByType("player")) do 
                    local ID = getElementData(v, CONFIG["ElementID"].element)
                    if tonumber(ID) == tonumber(idplayer) then 
                        local x, y, z = getElementPosition(v)
                        if CarroCriado[v] and isElement(CarroCriado[v]) then destroyElement(CarroCriado[v]) end 
                        CarroCriado[v] = createVehicle(idcarro, x, y, z)
                        if CarroCriado[v] and isElement(CarroCriado[v]) then 
                            warpPedIntoVehicle(v,CarroCriado[v] )
                            outputChatBox("#FFFF00[INFO]#FFFFFF Carro Criado com sucesso!", thePlayer, 255, 255, 255, true)
                        else 
                            outputChatBox("#FF0000[ERROR]#FFFFFF Ocorreu um erro ao criar o carro!", thePlayer, 255, 255, 255, true)
                        end 
                    else 
                        outputChatBox("#FF0000[ERROR]#FFFFFF Jogador não encontrado!", thePlayer, 255, 255, 255, true)
                    end 
                end 
                break
            else 
                if i == #CONFIG["ACLpermitida"] then 
                    outputChatBox("#FF0000[ERROR]#FFFFFF Você não tem permissão para usar esse comando!", thePlayer, 255, 255, 255, true)
                end 
            end 
        end 
    else 
        outputChatBox("#FF0000[ERROR]#FFFFFF Você deve digitar /"..CONFIG["Comando"].puxarcarro.." (IDplayer) (IDveiculo)", thePlayer, 255, 255, 255, true)
    end 
end)