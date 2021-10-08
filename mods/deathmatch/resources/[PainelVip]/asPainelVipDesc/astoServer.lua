servernamer = "Default MTA Server"

addEventHandler("onResourceStart", resourceRoot, function(resource)
	if (resource == getThisResource()) then
		server = getServerName()
		mysql = dbConnect("sqlite", "vips.db")
		if (mysql and server == servernamer) then
			outputDebugString("resource foi iniciado com sucesso")
			print("Criação database sucess")
			outputServerLog("Criação database sucess")
			dbExec(mysql, "CREATE TABLE IF NOT EXISTS skinsVip (Id INTEGER, nick INTEGER, skin_id INTEGER)")
			dbExec(mysql, "CREATE TABLE IF NOT EXISTS vehiclesVip (Id INTEGER, nick INTEGER, pos INTEGER, car_name INTEGER)")
		else
			outputDebugString("resource não foi iniciado por que não esta no nome do server certo!!")
			print("Criação database falho")
			outputServerLog("Criação database falho")
			outputServerLog("resource não foi iniciado por que não esta no nome do server certo!!")
			cancelEvent()
		end
	end
end)

addEvent("asto.vipClicks", true)
addEventHandler("asto.vipClicks", root, function(Tipo, Vip, ID)
	if (mysql) then
		if Tipo == "Veiculos" then
			local x, y, z = getElementPosition(source)
			local rx, ry, rz = getElementRotation(source)

			if isTimer(TimerCar) then
				outputChatBox("ERRO > #ff0000(Espere 10m para voce pegar o veiculo novamente)", source, 255, 255, 255, true)
				return
			end

			if isElement(vehiclesVips[source]) then
				destroyElement(vehiclesVips[source])
			end

			if Vip == "Bronze" and ID == 1 then
				vehiclesVips[source] = createVehicle(configS.bronze.veiculoB_1, x, y, z)
				outputChatBox("INFO > #00ff00(Você acaba de pegar um veiculo, Espere 5m para pegar outro veiculo novamente)", source, 255, 255, 255, true)
				TimerCar = setTimer(function() end, 500000, 1)

			elseif Vip == "Prata" and ID == 1 then
				vehiclesVips[source] = createVehicle(configS.prata.veiculoP_1, x, y, z)
				outputChatBox("INFO > #00ff00(Você acaba de pegar um veiculo, Espere 5m para pegar outro veiculo novamente)", source, 255, 255, 255, true)
				TimerCar = setTimer(function() end, 500000, 1)

			elseif Vip == "Prata" and ID == 2 then
				vehiclesVips[source] = createVehicle(configS.prata.veiculoP_2, x, y, z)
				outputChatBox("INFO > #00ff00(Você acaba de pegar um veiculo, Espere 5m para pegar outro veiculo novamente)", source, 255, 255, 255, true)
				TimerCar = setTimer(function() end, 500000, 1)

			elseif Vip == "Ouro" and ID == 1 then
				vehiclesVips[source] = createVehicle(configS.ouro.veiculoO_1, x, y, z)
				outputChatBox("INFO > #00ff00(Você acaba de pegar um veiculo, Espere 5m para pegar outro veiculo novamente)", source, 255, 255, 255, true)
				TimerCar = setTimer(function() end, 500000, 1)

			elseif Vip == "Ouro" and ID == 2 then
				vehiclesVips[source] = createVehicle(configS.ouro.veiculoO_2, x, y, z)
				outputChatBox("INFO > #00ff00(Você acaba de pegar um veiculo 2, Espere 5m para pegar outro veiculo novamente)", source, 255, 255, 255, true)
				TimerCar = setTimer(function() end, 500000, 1)

			elseif Vip == "Ouro" and ID == 3 then
				vehiclesVips[source] = createVehicle(configS.ouro.veiculoO_3, x, y, z)
				outputChatBox("INFO > #00ff00(Você acaba de pegar um veiculo 3, Espere 5m para pegar outro veiculo novamente)", source, 255, 255, 255, true)
				TimerCar = setTimer(function() end, 500000, 1)

			elseif Vip == "Diamante" and ID == 1 then
				vehiclesVips[source] = createVehicle(configS.diamante.veiculoD_1, x, y, z)
				outputChatBox("INFO > #00ff00(Você acaba de pegar um veiculo, Espere 5m para pegar outro veiculo novamente)", source, 255, 255, 255, true)
				TimerCar = setTimer(function() end, 500000, 1)

			elseif Vip == "Diamante" and ID == 2 then
				vehiclesVips[source] = createVehicle(configS.diamante.veiculoD_2, x, y, z)
				outputChatBox("INFO > #00ff00(Você acaba de pegar um veiculo 2, Espere 5m para pegar outro veiculo novamente)", source, 255, 255, 255, true)
				TimerCar = setTimer(function() end, 500000, 1)

			elseif Vip == "Diamante" and ID == 3 then
				vehiclesVips[source] = createVehicle(configS.diamante.veiculoD_3, x, y, z)
				outputChatBox("INFO > #00ff00(Você acaba de pegar um veiculo 3, Espere 5m para pegar outro veiculo novamente)", source, 255, 255, 255, true)
				TimerCar = setTimer(function() end, 500000, 1)

			elseif Vip == "Diamante" and ID == 4 then
				vehiclesVips[source] = createVehicle(configS.diamante.veiculoD_4, x, y, z)
				outputChatBox("INFO > #00ff00(Você acaba de pegar um veiculo 4, Espere 5m para pegar outro veiculo novamente)", source, 255, 255, 255, true)
				TimerCar = setTimer(function() end, 500000, 1)

				dbFree(dbQuery(mysql, "INSERT INTO vehiclesVip (Id, nick, pos, car_name) VALUES (?, ?, ?, ?) ", getElementData(source, "ID"), getPlayerName(source), toJSON({x, y, z}), getVehicleName(vehiclesVips[source]), 0))
			end

			setElementRotation(vehiclesVips[source], rx, ry, rz)
			warpPedIntoVehicle(source, vehiclesVips[source])

		elseif Tipo == "Personagens" then

			if isTimer(TimerSkin) then
				outputChatBox("ERRO > #ff0000(Espere 5m para voce pegar o skins novamente)", source, 255, 255, 255, true)
				return
			end

			if Vip == "Bronze" and ID == 1 then
				setElementModel(source, configS.bronze.personagemB_1)
				outputChatBox("INFO > (Você acaba de pegar uma skin, Espere 2m para pegar novamente)", source, 255, 255, 255, true)
				TimerSkin = setTimer(function() end, 100000, 1)

			elseif Vip == "Prata" and ID == 1 then
				setElementModel(source, configS.prata.personagemP_1)
				outputChatBox("INFO > (Você acaba de pegar uma skin, Espere 2m para pegar novamente)", source, 255, 255, 255, true)
				TimerSkin = setTimer(function() end, 100000, 1)

			elseif Vip == "Prata" and ID == 2 then
				setElementModel(source, configS.prata.personagemP_2)
				outputChatBox("INFO > (Você acaba de pegar uma skin 2, Espere 2m para pegar novamente)", source, 255, 255, 255, true)
				TimerSkin = setTimer(function() end, 100000, 1)

			elseif Vip == "Ouro" and ID == 1 then
				setElementModel(source, configS.ouro.personagemO_1)
				outputChatBox("INFO > (Você acaba de pegar uma skin, Espere 2m para pegar novamente)", source, 255, 255, 255, true)
				TimerSkin = setTimer(function() end, 100000, 1)

			elseif Vip == "Ouro" and ID == 2 then
				setElementModel(source, configS.ouro.personagemO_2)
				outputChatBox("INFO > (Você acaba de pegar uma skin 2, Espere 2m para pegar novamente)", source, 255, 255, 255, true)
				TimerSkin = setTimer(function() end, 100000, 1)

			elseif Vip == "Ouro" and ID == 3 then
				setElementModel(source, configS.ouro.personagemO_3)
				outputChatBox("INFO > (Você acaba de pegar uma skin 3, Espere 2m para pegar novamente)", source, 255, 255, 255, true)
				TimerSkin = setTimer(function() end, 100000, 1)

			elseif Vip == "Diamante" and ID == 1 then
				setElementModel(source, configS.diamante.personagemD_1)
				outputChatBox("INFO > (Você acaba de pegar uma skin, Espere 2m para pegar novamente)", source, 255, 255, 255, true)
				TimerSkin = setTimer(function() end, 100000, 1)

			elseif Vip == "Diamante" and ID == 2 then
				setElementModel(source, configS.diamante.personagemD_2)
				outputChatBox("INFO > (Você acaba de pegar uma skin 2, Espere 2m para pegar novamente)", source, 255, 255, 255, true)
				TimerSkin = setTimer(function() end, 100000, 1)

			elseif Vip == "Diamante" and ID == 3 then
				setElementModel(source, configS.diamante.personagemD_3)
				outputChatBox("INFO > (Você acaba de pegar uma skin 3, Espere 2m para pegar novamente)", source, 255, 255, 255, true)
				TimerSkin = setTimer(function() end, 100000, 1)

			elseif Vip == "Diamante" and ID == 4 then
				setElementModel(source, configS.diamante.personagemD_4)
				outputChatBox("INFO > (Você acaba de pegar uma skin 4, Espere 2m para pegar novamente)", source, 255, 255, 255, true)
				TimerSkin = setTimer(function() end, 100000, 1)

				dbFree(dbQuery(mysql, "INSERT INTO skinsVip (Id, nick, skin_id) VALUES (?, ?, ?) ", getElementData(source, "ID"), getPlayerName(source),getElementModel(source), 0))
			end

		elseif Tipo == "Armas" then

			if isTimer(TimerWeapon) then
				outputChatBox("ERRO > #ff0000(Espere 6m para voce pegar o kit armas novamente)", source, 255, 255, 255, true)
				return
			end

			if Vip == "Bronze" and ID == 1 then
				for _, gun in ipairs(configS.bronze.kitArmasB_1) do
					giveWeapon(source, gun, 200)
				end
				outputChatBox("INFO > (Você acaba de pegar um kit de armas, Espere 6m para pegar novamente)", source, 255, 255, 255, true)
				TimerWeapon = setTimer(function() end, 400000, 1)

			elseif Vip == "Prata" and ID == 1 then
				for _, gun in ipairs(configS.prata.kitArmasP_1) do
					giveWeapon(source, gun, 200)
				end
				outputChatBox("INFO > (Você acaba de pegar um kit de armas, Espere 6m para pegar novamente)", source, 255, 255, 255, true)
				TimerWeapon = setTimer(function() end, 400000, 1)

			elseif Vip == "Prata" and ID == 2 then
				for _, gun in ipairs(configS.prata.kitArmasP_2) do
					giveWeapon(source, gun, 200)
				end
				outputChatBox("INFO > (Você acaba de pegar um kit de armas 2, Espere 6m para pegar novamente)", source, 255, 255, 255, true)
				TimerWeapon = setTimer(function() end, 400000, 1)

			elseif Vip == "Ouro" and ID == 1 then
				for _, gun in ipairs(configS.ouro.kitArmasO_1) do
					giveWeapon(source, gun, 200)
				end
				outputChatBox("INFO > (Você acaba de pegar um kit de armas, Espere 6m para pegar novamente)", source, 255, 255, 255, true)
				TimerWeapon = setTimer(function() end, 400000, 1)

			elseif Vip == "Ouro" and ID == 2 then
				for _, gun in ipairs(configS.ouro.kitArmasO_2) do
					giveWeapon(source, gun, 200)
				end
				outputChatBox("INFO > (Você acaba de pegar um kit de armas 2, Espere 6m para pegar novamente)", source, 255, 255, 255, true)
				TimerWeapon = setTimer(function() end, 400000, 1)

			elseif Vip == "Ouro" and ID == 3 then
				for _, gun in ipairs(configS.ouro.kitArmasO_3) do
					giveWeapon(source, gun, 200)
				end
				outputChatBox("INFO > (Você acaba de pegar um kit de armas 3, Espere 6m para pegar novamente)", source, 255, 255, 255, true)
				TimerWeapon = setTimer(function() end, 400000, 1)

			elseif Vip == "Diamante" and ID == 1 then
				for _, gun in ipairs(configS.diamante.kitArmasD_1) do
					giveWeapon(source, gun, 200)
				end
				outputChatBox("INFO > (Você acaba de pegar um kit de armas, Espere 6m para pegar novamente)", source, 255, 255, 255, true)
				TimerWeapon = setTimer(function() end, 400000, 1)

			elseif Vip == "Diamante" and ID == 2 then
				for _, gun in ipairs(configS.diamante.kitArmasD_2) do
					giveWeapon(source, gun, 200)
				end
				outputChatBox("INFO > (Você acaba de pegar um kit de armas 2, Espere 6m para pegar novamente)", source, 255, 255, 255, true)
				TimerWeapon = setTimer(function() end, 400000, 1)

			elseif Vip == "Diamante" and ID == 3 then
				for _, gun in ipairs(configS.diamante.kitArmasD_3) do
					giveWeapon(source, gun, 200)
				end
				outputChatBox("INFO > (Você acaba de pegar um kit de armas 3, Espere 6m para pegar novamente)", source, 255, 255, 255, true)
				TimerWeapon = setTimer(function() end, 400000, 1)

			elseif Vip == "Diamante" and ID == 4 then
				for _, gun in ipairs(configS.diamante.kitArmasD_4) do
					giveWeapon(source, gun, 200)
				end
				outputChatBox("INFO > (Você acaba de pegar um kit de armas 4, Espere 6m para pegar novamente)", source, 255, 255, 255, true)
				TimerWeapon = setTimer(function() end, 400000, 1)
			end

		elseif Tipo == "Vidas" then

			if isTimer(TimerHealth) then
				outputChatBox("ERRO > #ff0000(Espere 10m para voce pegar o kit vida novamente)", source, 255, 255, 255, true)
				return
			end

			if Vip == "Prata" and ID == 1 then
				setElementHealth(source, configS.prata.vidaP_1)
				outputChatBox("INFO > (Você acaba de pegar um kit de vida, Espere 10m para pegar novamente)", source, 255, 255, 255, true)
				TimerHealth = setTimer(function() end, 1000000, 1)

			elseif Vip == "Ouro" and ID == 1 then
				setElementHealth(source, configS.ouro.vidaO_1)
				outputChatBox("INFO > (Você acaba de pegar um kit de vida, Espere 10m para pegar novamente)", source, 255, 255, 255, true)
				TimerHealth = setTimer(function() end, 1000000, 1)

			elseif Vip == "Diamante" and ID == 1 then
				setElementHealth(source, configS.diamante.vidaD_1)
				outputChatBox("INFO > (Você acaba de pegar um kit de vida, Espere 10m para pegar novamente)", source, 255, 255, 255, true)
				TimerHealth = setTimer(function() end, 1000000, 1)
			end

		elseif Tipo == "Coletes" then

			if isTimer(TimerArmor) then
				outputChatBox("ERRO > #ff0000(Espere 10m para voce pegar o colete novamente)", source, 255, 255, 255, true)
				return
			end

			if Vip == "Ouro" and ID == 1 then
				setPedArmor(source, configS.ouro.coleteO_1)
				outputChatBox("INFO > (Você acaba de pegar um colete aprova de bala, Espere 10m para pegar novamente)", source, 255, 255, 255, true)
				TimerArmor = setTimer(function() end, 1000000, 1)

			elseif Vip == "Diamante" and ID == 1 then
				setPedArmor(source, configS.diamante.coleteD_1)
				outputChatBox("INFO > (Você acaba de pegar um colete aprova de bala, Espere 10m para pegar novamente)", source, 255, 255, 255, true)
				TimerArmor = setTimer(function() end, 1000000, 1)
			end

		elseif Tipo == "Estilo Anda" then

			if isTimer(TimerSyle) then
				outputChatBox("ERRO > #ff0000(Espere 2m para voce mudar seu estilo de anda novamente)", source, 255, 255, 255, true)
				return
			end

			if Vip == "Ouro" and ID == 1 then
				setPedWalkingStyle(source, configS.ouro.estiloO_1)
				outputChatBox("INFO > #00ff00(Você acaba de mudar o seu estilo de anda)", source, 255, 255, 255, true)
				TimerSyle = setTimer(function() end, 10000, 1)

			elseif Vip == "Ouro" and ID == 2 then
				setPedWalkingStyle(source, configS.ouro.estiloO_2)
				outputChatBox("INFO > #00ff00(Você acaba de mudar o seu estilo de anda 2)", source, 255, 255, 255, true)
				TimerSyle = setTimer(function() end, 10000, 1)

			elseif Vip == "Diamante" and ID == 1 then
				setPedWalkingStyle(source, configS.diamante.estiloD_1)
				outputChatBox("INFO > #00ff00(Você acaba de mudar o seu estilo de anda)", source, 255, 255, 255, true)
				TimerSyle = setTimer(function() end, 20000, 1)

			elseif Vip == "Diamante" and ID == 2 then
				setPedWalkingStyle(source, configS.diamante.estiloD_2)
				outputChatBox("INFO > #00ff00(Você acaba de mudar o seu estilo de anda 2)", source, 255, 255, 255, true)
				TimerSyle = setTimer(function() end, 20000, 1)

			elseif Vip == "Diamante" and ID == 3 then
				setPedWalkingStyle(source, configS.diamante.estiloD_3)
				outputChatBox("INFO > #00ff00(Você acaba de mudar o seu estilo de anda 3)", source, 255, 255, 255, true)
				TimerSyle = setTimer(function() end, 20000, 1)
			end

		elseif Tipo == "Estilo Luta" then

			if isTimer(TimerFighting) then
				outputChatBox("ERRO > #ff0000(Espere 3m para voce mudar seu estilo de luta novamente)", source, 255, 255, 255, true)
				return
			end

			if Vip == "Diamante" and ID == 1 then
				setPedFightingStyle(source, configS.diamante.estilolutaD_1)
				outputChatBox("INFO > #00ff00(Você acaba de mudar o seu estilo de luta)", source, 255, 255, 255, true)
				TimerFighting = setTimer(function() end, 200000, 1)

			elseif Vip == "Diamante" and ID == 2 then
				setPedFightingStyle(source, configS.diamante.estilolutaD_2)
				outputChatBox("INFO > #00ff00(Você acaba de mudar o seu estilo de luta 2)", source, 255, 255, 255, true)
				TimerFighting = setTimer(function() end, 200000, 1)

			elseif Vip == "Diamante" and ID == 3 then
				setPedFightingStyle(source, configS.diamante.estilolutaD_3)
				outputChatBox("INFO > #00ff00(Você acaba de mudar o seu estilo de luta 3)", source, 255, 255, 255, true)
				TimerFighting = setTimer(function() end, 200000, 1)
			end
		end
	end
end)

function loadVips()
	for i, p in ipairs(getElementsByType("player")) do
		local acc = getPlayerAccount(p)
		if acc and not isGuestAccount(acc) then
			local accName = getAccountName(acc)
			if isObjectInACLGroup("user."..accName, aclGetGroup(configS.groups.vip_1)) then
			    setElementData(p, "Vip_Bronze", "Sim")
			else
			    setElementData(p, "Vip_Bronze", "Não")
			end
			if isObjectInACLGroup("user."..accName, aclGetGroup(configS.groups.vip_2)) then
			    setElementData(p, "Vip_Prata", "Sim")
			else
			    setElementData(p, "Vip_Prata", "Não")
			end
			if isObjectInACLGroup("user."..accName, aclGetGroup(configS.groups.vip_3)) then
			    setElementData(p, "Vip_Ouro", "Sim")
			else
			    setElementData(p, "Vip_Ouro", "Não")
			end
			if isObjectInACLGroup("user."..accName, aclGetGroup(configS.groups.vip_4)) then
			    setElementData(p, "Vip_Diamante", "Sim")
			else
			    setElementData(p, "Vip_Diamante", "Não")
			end
		end
	end
end
setTimer(loadVips, 1500, 0)