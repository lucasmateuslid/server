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
				vehiclesVips[source] = createVehicle(configS.prata.veiculoP_1, x, y, z)

				TimerCar = setTimer(function() end, 1, 1)


			elseif Vip == "Bronze" and ID == 2 then
				vehiclesVips[source] = createVehicle(configS.prata.veiculoP_2, x, y, z)

				TimerCar = setTimer(function() end, 1, 1)

			elseif Vip == "Bronze" and ID == 3 then
				vehiclesVips[source] = createVehicle(configS.prata.veiculoP_3, x, y, z)

				TimerCar = setTimer(function() end, 1, 1)

			elseif Vip == "Ouro" and ID == 4 then
				vehiclesVips[source] = createVehicle(configS.prata.veiculoP_4, x, y, z)

				TimerCar = setTimer(function() end, 1, 1)

			elseif Vip == "Ouro" and ID == 5 then
				vehiclesVips[source] = createVehicle(configS.prata.veiculoP_5, x, y, z)

				TimerCar = setTimer(function() end, 1, 1)

			elseif Vip == "Ouro" and ID == 6 then
				vehiclesVips[source] = createVehicle(configS.prata.veiculoP_6, x, y, z)

				TimerCar = setTimer(function() end, 1, 1)

			elseif Vip == "Bronze" and ID == 7  then
				vehiclesVips[source] = createVehicle(configS.prata.veiculoP_7, x, y, z)

				TimerCar = setTimer(function() end, 1, 1)


			elseif Vip == "Bronze" and ID == 8 then
				vehiclesVips[source] = createVehicle(configS.prata.veiculoP_8, x, y, z)

				TimerCar = setTimer(function() end, 1, 1)



			elseif Vip == "Ouro" and ID == 1 then
				vehiclesVips[source] = createVehicle(configS.ouro.veiculoO_1, x, y, z)

				TimerCar = setTimer(function() end, 1, 1)

			elseif Vip == "Ouro" and ID == 2 then
				vehiclesVips[source] = createVehicle(configS.ouro.veiculoO_2, x, y, z)
				outputChatBox("INFO > #00ff00(Você acaba de pegar um veiculo 2, Espere 5m para pegar outro veiculo novamente)", source, 255, 255, 255, true)
				TimerCar = setTimer(function() end, 1, 1)

			elseif Vip == "Ouro" and ID == 3 then
				vehiclesVips[source] = createVehicle(configS.ouro.veiculoO_3, x, y, z)
				outputChatBox("INFO > #00ff00(Você acaba de pegar um veiculo 3, Espere 5m para pegar outro veiculo novamente)", source, 255, 255, 255, true)
				TimerCar = setTimer(function() end, 1, 1)

			elseif Vip == "Diamante" and ID == 1 then
				vehiclesVips[source] = createVehicle(configS.diamante.veiculoD_1, x, y, z)

				TimerCar = setTimer(function() end, 1, 1)

			elseif Vip == "Diamante" and ID == 2 then
				vehiclesVips[source] = createVehicle(configS.diamante.veiculoD_2, x, y, z)
				outputChatBox("INFO > #00ff00(Você acaba de pegar um veiculo 2, Espere 5m para pegar outro veiculo novamente)", source, 255, 255, 255, true)
				TimerCar = setTimer(function() end, 1, 1)

			elseif Vip == "Diamante" and ID == 3 then
				vehiclesVips[source] = createVehicle(configS.diamante.veiculoD_3, x, y, z)
				outputChatBox("INFO > #00ff00(Você acaba de pegar um veiculo 3, Espere 5m para pegar outro veiculo novamente)", source, 255, 255, 255, true)
				TimerCar = setTimer(function() end, 1, 1)

			elseif Vip == "Diamante" and ID == 4 then
				vehiclesVips[source] = createVehicle(configS.diamante.veiculoD_4, x, y, z)
				outputChatBox("INFO > #00ff00(Você acaba de pegar um veiculo 4, Espere 5m para pegar outro veiculo novamente)", source, 255, 255, 255, true)
				TimerCar = setTimer(function() end, 1, 1)

				dbFree(dbQuery(mysql, "INSERT INTO vehiclesVip (Id, nick, pos, car_name) VALUES (?, ?, ?, ?) ", getElementData(source, "ID"), getPlayerName(source), toJSON({x, y, z}), getVehicleName(vehiclesVips[source]), 0))
			end

			setElementRotation(vehiclesVips[source], rx, ry, rz)
			warpPedIntoVehicle(source, vehiclesVips[source])

		elseif Tipo == "Personagens" then

			if isTimer(TimerSkin) then
				outputChatBox("ERRO > #ff0000(Espere 5m para voce pegar o skins novamente)", source, 255, 255, 255, true)
				return
			end

			if Vip == "Ouro" and ID == 1 then
				setElementModel(source, configS.ouro.personagemO_1)
				TimerSkin = setTimer(function() end, 1, 1)

			elseif Vip == "Ouro" and ID == 2 then
				setElementModel(source, configS.ouro.personagemO_2)
				TimerSkin = setTimer(function() end, 1, 1)

			elseif Vip == "Ouro" and ID == 3 then
				setElementModel(source, configS.ouro.personagemO_3)
				TimerSkin = setTimer(function() end, 1, 1)

			elseif Vip == "Ouro" and ID == 4 then
				setElementModel(source, configS.ouro.personagemO_4)
				TimerSkin = setTimer(function() end, 1, 1)

			elseif Vip == "Ouro" and ID == 5 then
				setElementModel(source, configS.ouro.personagemO_5)
				TimerSkin = setTimer(function() end, 1, 1)

			elseif Vip == "Ouro" and ID == 6 then
				setElementModel(source, configS.ouro.personagemO_6)
				TimerSkin = setTimer(function() end, 1, 1)

			elseif Vip == "Ouro" and ID == 7 then
				setElementModel(source, configS.ouro.personagemO_7)
				TimerSkin = setTimer(function() end, 1, 1)

			elseif Vip == "Ouro" and ID == 8 then
				setElementModel(source, configS.ouro.personagemO_8)
				TimerSkin = setTimer(function() end, 1, 1)

			elseif Vip == "Ouro" and ID == 9 then
				setElementModel(source, configS.ouro.personagemO_9)
				TimerSkin = setTimer(function() end, 1, 1)

			elseif Vip == "Ouro" and ID == 10 then
				setElementModel(source, configS.ouro.personagemO_10)
				TimerSkin = setTimer(function() end, 1, 1)

			elseif Vip == "Ouro" and ID == 11 then
				setElementModel(source, configS.ouro.personagemO_11)
				TimerSkin = setTimer(function() end, 1, 1)

			elseif Vip == "Ouro" and ID == 12 then
				setElementModel(source, configS.ouro.personagemO_12)
				TimerSkin = setTimer(function() end, 1, 1)

			elseif Vip == "Ouro" and ID == 13 then
				setElementModel(source, configS.ouro.personagemO_13)
				TimerSkin = setTimer(function() end, 1, 1)

			elseif Vip == "Ouro" and ID == 14 then
				setElementModel(source, configS.ouro.personagemO_14)
				TimerSkin = setTimer(function() end, 1, 1)

			elseif Vip == "Ouro" and ID == 15 then
				setElementModel(source, configS.ouro.personagemO_15)
				TimerSkin = setTimer(function() end, 1, 1)

			elseif Vip == "Ouro" and ID == 16 then
				setElementModel(source, configS.ouro.personagemO_16)
				TimerSkin = setTimer(function() end, 1, 1)

			elseif Vip == "Ouro" and ID == 17 then
				setElementModel(source, configS.ouro.personagemO_17)
				TimerSkin = setTimer(function() end, 1, 1)

			elseif Vip == "Ouro" and ID == 18 then
				setElementModel(source, configS.ouro.personagemO_18)
				TimerSkin = setTimer(function() end, 1, 1)

			elseif Vip == "Ouro" and ID == 19 then
				setElementModel(source, configS.ouro.personagemO_19)
				TimerSkin = setTimer(function() end, 1, 1)

			elseif Vip == "Ouro" and ID == 20 then
				setElementModel(source, configS.ouro.personagemO_20)
				TimerSkin = setTimer(function() end, 1, 1)

			elseif Vip == "Ouro" and ID == 21 then
				setElementModel(source, configS.ouro.personagemO_21)
				TimerSkin = setTimer(function() end, 1, 1)

			elseif Vip == "Ouro" and ID == 22 then
				setElementModel(source, configS.ouro.personagemO_22)
				TimerSkin = setTimer(function() end, 1, 1)

			elseif Vip == "Ouro" and ID == 23 then
				setElementModel(source, configS.ouro.personagemO_23)
				TimerSkin = setTimer(function() end, 1, 1)

			elseif Vip == "Ouro" and ID == 24 then
				setElementModel(source, configS.ouro.personagemO_24)
				TimerSkin = setTimer(function() end, 1, 1)

			elseif Vip == "Ouro" and ID == 25 then
				setElementModel(source, configS.ouro.personagemO_25)
				TimerSkin = setTimer(function() end, 1, 1)


			elseif Vip == "Ouro" and ID == 26 then
				setElementModel(source, configS.ouro.personagemO_26)
				TimerSkin = setTimer(function() end, 1, 1)


				dbFree(dbQuery(mysql, "INSERT INTO skinsVip (Id, nick, skin_id) VALUES (?, ?, ?) ", getElementData(source, "ID"), getPlayerName(source),getElementModel(source), 0))
			end

		elseif Tipo == "Armas" then

			if isTimer(TimerWeapon) then
				outputChatBox("ERRO > #ff0000(Você não tem Autorização para pegar as Armas)", source, 255, 255, 255, true)
				return
			end

			if Vip == "Bronze" and ID == 1 then
				for _, gun in ipairs(configS.bronze.kitArmasB_1) do
					giveWeapon(source, gun, 900)
				end
				outputChatBox("INFO > (Você Acabou de Pegar um Kit de Arma Apaisana)", source, 255, 255, 255, true)
				TimerWeapon = setTimer(function() end, 1, 1)

			elseif Vip == "Bronze" and ID == 2 then
				for _, gun in ipairs(configS.bronze.kitArmasB_2) do
					giveWeapon(source, gun, 900)
				end
				outputChatBox("INFO > (Você Acabou de Pegar um Kit de Arma Patrulha)", source, 255, 255, 255, true)
				TimerWeapon = setTimer(function() end, 1, 1)

			elseif Vip == "Bronze" and ID == 3 then
				for _, gun in ipairs(configS.bronze.kitArmasB_3) do
					giveWeapon(source, gun, 900)
				end
				outputChatBox("INFO > (Você Acabou de Pegar um Kit de Arma Bandido)", source, 255, 255, 255, true)
				TimerWeapon = setTimer(function() end, 1, 1)

			elseif Vip == "Bronze" and ID == 4 then
				for _, gun in ipairs(configS.bronze.kitArmasB_4) do
					giveWeapon(source, gun, 900)
				end
				outputChatBox("INFO > (Você Acabou de Pegar uma ParaFAl)", source, 255, 255, 255, true)
				TimerWeapon = setTimer(function() end, 1, 1)

			elseif Vip == "Bronze" and ID == 5 then
				for _, gun in ipairs(configS.bronze.kitArmasB_5) do
					giveWeapon(source, gun, 900)
				end
				outputChatBox("INFO > (Você Acabou de Pegar uma AK-47)", source, 255, 255, 255, true)
				TimerWeapon = setTimer(function() end, 1, 1)

			elseif Vip == "Bronze" and ID == 6 then
				for _, gun in ipairs(configS.bronze.kitArmasB_6) do
					giveWeapon(source, gun, 900)
				end
				outputChatBox("INFO > (Você Acabou de Pegar uma Deagle)", source, 255, 255, 255, true)
				TimerWeapon = setTimer(function() end, 1, 1)

			elseif Vip == "Bronze" and ID == 7 then
				for _, gun in ipairs(configS.bronze.kitArmasB_7) do
					giveWeapon(source, gun, 900)
				end
				outputChatBox("INFO > (Você Acabou de Pegar uma Taser)", source, 255, 255, 255, true)
				TimerWeapon = setTimer(function() end, 1, 1)

			elseif Vip == "Bronze" and ID == 8 then
				for _, gun in ipairs(configS.bronze.kitArmasB_8) do
					giveWeapon(source, gun, 900)
				end
				outputChatBox("INFO > (Você Acabou de Pegar uma Glock)", source, 255, 255, 255, true)
				TimerWeapon = setTimer(function() end, 1, 1)

			elseif Vip == "Bronze" and ID == 9 then
				for _, gun in ipairs(configS.bronze.kitArmasB_9) do
					giveWeapon(source, gun, 900)
				end
				outputChatBox("INFO > (Você Acabou de Pegar uma Shotgun)", source, 255, 255, 255, true)
				TimerWeapon = setTimer(function() end, 1, 1)

			elseif Vip == "Bronze" and ID == 10 then
				for _, gun in ipairs(configS.bronze.kitArmasB_10) do
					giveWeapon(source, gun, 900)
				end
				outputChatBox("INFO > (Você Acabou de Pegar um Paraquedas)", source, 255, 255, 255, true)
				TimerWeapon = setTimer(function() end, 1, 1)

			elseif Vip == "Bronze" and ID == 11 then
				for _, gun in ipairs(configS.bronze.kitArmasB_11) do
					giveWeapon(source, gun, 900)
				end
				outputChatBox("INFO > (Você Acabou de Pegar uma Sawed-OFF)", source, 255, 255, 255, true)
				TimerWeapon = setTimer(function() end, 1, 1)

			elseif Vip == "Bronze" and ID == 12 then
				for _, gun in ipairs(configS.bronze.kitArmasB_12) do
					giveWeapon(source, gun, 900)
				end
				outputChatBox("INFO > (Você Acabou de Pegar uma MP5)", source, 255, 255, 255, true)
				TimerWeapon = setTimer(function() end, 1, 1)

			elseif Vip == "Bronze" and ID == 13 then
				for _, gun in ipairs(configS.bronze.kitArmasB_13) do
					giveWeapon(source, gun, 900)
				end
				outputChatBox("INFO > (Você Acabou de Pegar uma UZI)", source, 255, 255, 255, true)
				TimerWeapon = setTimer(function() end, 1, 1)

			elseif Vip == "Prata" and ID == 1 then
				for _, gun in ipairs(configS.prata.kitArmasP_1) do
					giveWeapon(source, gun, 900)
				end
				outputChatBox("INFO > (Você Acabou de Pegar um Kit de Arma)", source, 255, 255, 255, true)
				TimerWeapon = setTimer(function() end, 1, 1)

			elseif Vip == "Prata" and ID == 2 then
				for _, gun in ipairs(configS.prata.kitArmasP_2) do
					giveWeapon(source, gun, 900)
				end
				outputChatBox("INFO > (Você acaba de pegar um kit de armas 2, Espere 6m para pegar novamente)", source, 255, 255, 255, true)
				TimerWeapon = setTimer(function() end, 1, 1)

			elseif Vip == "Ouro" and ID == 1 then
				for _, gun in ipairs(configS.ouro.kitArmasO_1) do
					giveWeapon(source, gun, 900)
				end
				outputChatBox("INFO > (Você Acabou de Pegar um Kit de Arma)", source, 255, 255, 255, true)
				TimerWeapon = setTimer(function() end, 1, 1)

			elseif Vip == "Ouro" and ID == 2 then
				for _, gun in ipairs(configS.ouro.kitArmasO_2) do
					giveWeapon(source, gun, 900)
				end
				outputChatBox("INFO > (Você acaba de pegar um kit de armas 2, Espere 6m para pegar novamente)", source, 255, 255, 255, true)
				TimerWeapon = setTimer(function() end, 1, 1)

			elseif Vip == "Ouro" and ID == 3 then
				for _, gun in ipairs(configS.ouro.kitArmasO_3) do
					giveWeapon(source, gun, 900)
				end
				outputChatBox("INFO > (Você acaba de pegar um kit de armas 3, Espere 6m para pegar novamente)", source, 255, 255, 255, true)
				TimerWeapon = setTimer(function() end, 1, 1)

			elseif Vip == "Diamante" and ID == 1 then
				for _, gun in ipairs(configS.diamante.kitArmasD_1) do
					giveWeapon(source, gun, 900)
				end
				outputChatBox("INFO > (Você Acabou de Pegar um Kit de Arma)", source, 255, 255, 255, true)
				TimerWeapon = setTimer(function() end, 1, 1)

			elseif Vip == "Diamante" and ID == 2 then
				for _, gun in ipairs(configS.diamante.kitArmasD_2) do
					giveWeapon(source, gun, 900)
				end
				outputChatBox("INFO > (Você acaba de pegar um kit de armas 2, Espere 6m para pegar novamente)", source, 255, 255, 255, true)
				TimerWeapon = setTimer(function() end, 1, 1)

			elseif Vip == "Diamante" and ID == 3 then
				for _, gun in ipairs(configS.diamante.kitArmasD_3) do
					giveWeapon(source, gun, 900)
				end
				outputChatBox("INFO > (Você acaba de pegar um kit de armas 3, Espere 6m para pegar novamente)", source, 255, 255, 255, true)
				TimerWeapon = setTimer(function() end, 1, 1)

			elseif Vip == "Diamante" and ID == 4 then
				for _, gun in ipairs(configS.diamante.kitArmasD_4) do
					giveWeapon(source, gun, 900)
				end
				outputChatBox("INFO > (Você acaba de pegar um kit de armas 4, Espere 6m para pegar novamente)", source, 255, 255, 255, true)
				TimerWeapon = setTimer(function() end, 1, 1)
			end

		elseif Tipo == "Vidas" then

			if isTimer(TimerHealth) then
				outputChatBox("ERRO > #ff0000(Espere 10m para voce pegar o kit vida novamente)", source, 255, 255, 255, true)
				return
			end

			if Vip == "Prata" and ID == 1 then
				setElementHealth(source, configS.prata.vidaP_1)
				outputChatBox("INFO > (Você acaba de pegar um kit de vida, Espere 10m para pegar novamente)", source, 255, 255, 255, true)
				TimerHealth = setTimer(function() end, 10, 1)

			elseif Vip == "Ouro" and ID == 1 then
				setElementHealth(source, configS.ouro.vidaO_1)
				outputChatBox("INFO > (Você acaba de pegar um kit de vida, Espere 10m para pegar novamente)", source, 255, 255, 255, true)
				TimerHealth = setTimer(function() end, 10, 1)

			elseif Vip == "Diamante" and ID == 1 then
				setElementHealth(source, configS.diamante.vidaD_1)
				outputChatBox("INFO > (Você acaba de pegar um kit de vida, Espere 10m para pegar novamente)", source, 255, 255, 255, true)
				TimerHealth = setTimer(function() end, 10, 1)
			end

		elseif Tipo == "Coletes" then

			if isTimer(TimerArmor) then
				outputChatBox("ERRO > #ff0000(Espere 10m para voce pegar o colete novamente)", source, 255, 255, 255, true)
				return
			end

			if Vip == "Ouro" and ID == 1 then
				setPedArmor(source, configS.ouro.coleteO_1)
				outputChatBox("INFO > (Você acaba de pegar um colete aprova de bala, Espere 10m para pegar novamente)", source, 255, 255, 255, true)
				TimerArmor = setTimer(function() end, 10, 1)

			elseif Vip == "Diamante" and ID == 1 then
				setPedArmor(source, configS.diamante.coleteD_1)
				outputChatBox("INFO > (Você acaba de pegar um colete aprova de bala, Espere 10m para pegar novamente)", source, 255, 255, 255, true)
				TimerArmor = setTimer(function() end, 10, 1)
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
				TimerSyle = setTimer(function() end, 90000, 1)

			elseif Vip == "Diamante" and ID == 2 then
				setPedWalkingStyle(source, configS.diamante.estiloD_2)
				outputChatBox("INFO > #00ff00(Você acaba de mudar o seu estilo de anda 2)", source, 255, 255, 255, true)
				TimerSyle = setTimer(function() end, 90000, 1)

			elseif Vip == "Diamante" and ID == 3 then
				setPedWalkingStyle(source, configS.diamante.estiloD_3)
				outputChatBox("INFO > #00ff00(Você acaba de mudar o seu estilo de anda 3)", source, 255, 255, 255, true)
				TimerSyle = setTimer(function() end, 90000, 1)
			end

		elseif Tipo == "Estilo Luta" then

			if isTimer(TimerFighting) then
				outputChatBox("ERRO > #ff0000(Espere 3m para voce mudar seu estilo de luta novamente)", source, 255, 255, 255, true)
				return
			end

			if Vip == "Diamante" and ID == 1 then
				setPedFightingStyle(source, configS.diamante.estilolutaD_1)
				outputChatBox("INFO > #00ff00(Você acaba de mudar o seu estilo de luta)", source, 255, 255, 255, true)
				TimerFighting = setTimer(function() end, 900000, 1)

			elseif Vip == "Diamante" and ID == 2 then
				setPedFightingStyle(source, configS.diamante.estilolutaD_2)
				outputChatBox("INFO > #00ff00(Você acaba de mudar o seu estilo de luta 2)", source, 255, 255, 255, true)
				TimerFighting = setTimer(function() end, 900000, 1)

			elseif Vip == "Diamante" and ID == 3 then
				setPedFightingStyle(source, configS.diamante.estilolutaD_3)
				outputChatBox("INFO > #00ff00(Você acaba de mudar o seu estilo de luta 3)", source, 255, 255, 255, true)
				TimerFighting = setTimer(function() end, 900000, 1)
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
setTimer(loadVips, 1, 0)