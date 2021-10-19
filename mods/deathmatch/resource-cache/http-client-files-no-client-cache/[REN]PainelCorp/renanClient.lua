screenW, screenH = guiGetScreenSize()
resW, resH = 1366, 768
x, y = (screenW/resW), (screenH/resH)
Select = nil
TickVip = getTickCount(1)
AlphaVip = {}

fontsVip = {
	robotoVip = {
		[1] = dxCreateFont("assets/fonts/bold.ttf", 13),
		[2] = dxCreateFont("assets/fonts/bold.ttf", 8),
		[3] = dxCreateFont("assets/fonts/bold.ttf", 10),
		[4] = dxCreateFont("assets/fonts/bold.ttf", 17),
		[5] = dxCreateFont("assets/fonts/bold.ttf", 12),
	},
}

function setSelect(state)
	Select = state
end


bindKey(configC.binds.tecla, configC.binds.tipo, function()
	if isEventHandlerAdded("onClientRender", root, vipMenu)
		or isEventHandlerAdded("onClientRender", root, abaBronze)
		or isEventHandlerAdded("onClientRender", root, abaPrata)
		or isEventHandlerAdded("onClientRender", root, abaOuro)
		or isEventHandlerAdded("onClientRender", root, abaDiamante)
	then
		removeEventHandler("onClientRender", root, vipMenu)
		TickVip = getTickCount()
		Select = nil
		showCursor(false)
	elseif not isEventHandlerAdded("onClientRender", root, vipMenu) then
		addEventHandler("onClientRender", root, vipMenu)
		TickVip = getTickCount()
		Select = nil
		showCursor(true)
		playSound("assets/sounds/open.ogg")
	end
	if isEventHandlerAdded("onClientRender", root, abaBronze) then
		removeEventHandler("onClientRender", root, abaBronze)
		Select = nil
	end
	if isEventHandlerAdded("onClientRender", root, abaPrata) then
		removeEventHandler("onClientRender", root, abaPrata)
		Select = nil
	end
	if isEventHandlerAdded("onClientRender", root, abaOuro) then
		removeEventHandler("onClientRender", root, abaOuro)
		Select = nil
	end
	if isEventHandlerAdded("onClientRender", root, abaDiamante) then
		removeEventHandler("onClientRender", root, abaDiamante)
		Select = nil
	end
end)
-- Select to Other (Base)
addEventHandler("onClientClick", root, function(b, s)
	if isEventHandlerAdded("onClientRender", root, vipMenu) then
		if (b == "left" and s == "down") then
			if cursorPosition(x*474, y*148, x*127, y*38) then
				addEventHandler("onClientRender", root, abaBronze)
				removeEventHandler("onClientRender", root, vipMenu)
				removeEventHandler("onClientRender", root, abaOuro)
				removeEventHandler("onClientRender", root, abaPrata)
				removeEventHandler("onClientRender", root, abaDiamante)
				TickVip = getTickCount()
				Select = "Bronze"
				playSound("assets/sounds/click.ogg")
			elseif cursorPosition(x*630, y*148, x*127, y*38) then
				addEventHandler("onClientRender", root, abaPrata)
				removeEventHandler("onClientRender", root, vipMenu)
				removeEventHandler("onClientRender", root, abaBronze)
				removeEventHandler("onClientRender", root, abaOuro)
				removeEventHandler("onClientRender", root, abaDiamante)
				TickVip = getTickCount()
				Select = "Prata"
				playSound("assets/sounds/click.ogg")
			elseif cursorPosition(x*786, y*148, x*127, y*38) then
				addEventHandler("onClientRender", root, abaOuro)
				removeEventHandler("onClientRender", root, vipMenu)
				removeEventHandler("onClientRender", root, abaBronze)
				removeEventHandler("onClientRender", root, abaPrata)
				removeEventHandler("onClientRender", root, abaDiamante)
				TickVip = getTickCount()
				Select = "Ouro"
				playSound("assets/sounds/click.ogg")
			elseif cursorPosition(x*942, y*148, x*127, y*38) then
				addEventHandler("onClientRender", root, abaDiamante)
				removeEventHandler("onClientRender", root, vipMenu)
				removeEventHandler("onClientRender", root, abaBronze)
				removeEventHandler("onClientRender", root, abaPrata)
				removeEventHandler("onClientRender", root, abaOuro)
				TickVip = getTickCount()
				Select = "Diamante"
				playSound("assets/sounds/click.ogg")
			end
		end
	end
end)
-- Select to Other (Bronze)
addEventHandler("onClientClick", root, function(b, s)
	if isEventHandlerAdded("onClientRender", root, abaBronze) then
		if (b == "left" and s == "down") then
			if cursorPosition(x*474, y*148, x*127, y*38) then
				addEventHandler("onClientRender", root, abaBronze)
				removeEventHandler("onClientRender", root, vipMenu)
				removeEventHandler("onClientRender", root, abaOuro)
				removeEventHandler("onClientRender", root, abaPrata)
				removeEventHandler("onClientRender", root, abaDiamante)
				TickVip = getTickCount()
				Select = "Bronze"
				playSound("assets/sounds/click.ogg")
			elseif cursorPosition(x*630, y*148, x*127, y*38) then
				addEventHandler("onClientRender", root, abaPrata)
				removeEventHandler("onClientRender", root, vipMenu)
				removeEventHandler("onClientRender", root, abaBronze)
				removeEventHandler("onClientRender", root, abaOuro)
				removeEventHandler("onClientRender", root, abaDiamante)
				TickVip = getTickCount()
				Select = "Prata"
				playSound("assets/sounds/click.ogg")
			elseif cursorPosition(x*786, y*148, x*127, y*38) then
				addEventHandler("onClientRender", root, abaOuro)
				removeEventHandler("onClientRender", root, vipMenu)
				removeEventHandler("onClientRender", root, abaBronze)
				removeEventHandler("onClientRender", root, abaPrata)
				removeEventHandler("onClientRender", root, abaDiamante)
				TickVip = getTickCount()
				Select = "Ouro"
				playSound("assets/sounds/click.ogg")
			elseif cursorPosition(x*942, y*148, x*127, y*38) then
				addEventHandler("onClientRender", root, abaDiamante)
				removeEventHandler("onClientRender", root, vipMenu)
				removeEventHandler("onClientRender", root, abaBronze)
				removeEventHandler("onClientRender", root, abaPrata)
				removeEventHandler("onClientRender", root, abaOuro)
				TickVip = getTickCount()
				Select = "Diamante"
				playSound("assets/sounds/click.ogg")
			end
		end
	end
end)
-- Select to Other (Prata)
addEventHandler("onClientClick", root, function(b, s)
	if isEventHandlerAdded("onClientRender", root, abaPrata) then
		if (b == "left" and s == "down") then
			if cursorPosition(x*474, y*148, x*127, y*38) then
				addEventHandler("onClientRender", root, abaBronze)
				removeEventHandler("onClientRender", root, vipMenu)
				removeEventHandler("onClientRender", root, abaOuro)
				removeEventHandler("onClientRender", root, abaPrata)
				removeEventHandler("onClientRender", root, abaDiamante)
				TickVip = getTickCount()
				Select = "Bronze"
				playSound("assets/sounds/click.ogg")
			elseif cursorPosition(x*630, y*148, x*127, y*38) then
				addEventHandler("onClientRender", root, abaPrata)
				removeEventHandler("onClientRender", root, vipMenu)
				removeEventHandler("onClientRender", root, abaBronze)
				removeEventHandler("onClientRender", root, abaOuro)
				removeEventHandler("onClientRender", root, abaDiamante)
				TickVip = getTickCount()
				Select = "Prata"
				playSound("assets/sounds/click.ogg")
			elseif cursorPosition(x*786, y*148, x*127, y*38) then
				addEventHandler("onClientRender", root, abaOuro)
				removeEventHandler("onClientRender", root, vipMenu)
				removeEventHandler("onClientRender", root, abaBronze)
				removeEventHandler("onClientRender", root, abaPrata)
				removeEventHandler("onClientRender", root, abaDiamante)
				TickVip = getTickCount()
				Select = "Ouro"
				playSound("assets/sounds/click.ogg")
			elseif cursorPosition(x*942, y*148, x*127, y*38) then
				addEventHandler("onClientRender", root, abaDiamante)
				removeEventHandler("onClientRender", root, vipMenu)
				removeEventHandler("onClientRender", root, abaBronze)
				removeEventHandler("onClientRender", root, abaPrata)
				removeEventHandler("onClientRender", root, abaOuro)
				TickVip = getTickCount()
				Select = "Diamante"
				playSound("assets/sounds/click.ogg")
			end
		end
	end
end)

-- Select to Other (Ouro)
addEventHandler("onClientClick", root, function(b, s)
	if isEventHandlerAdded("onClientRender", root, abaOuro) then
		if (b == "left" and s == "down") then
			if cursorPosition(x*474, y*148, x*127, y*38) then
				addEventHandler("onClientRender", root, abaBronze)
				removeEventHandler("onClientRender", root, vipMenu)
				removeEventHandler("onClientRender", root, abaOuro)
				removeEventHandler("onClientRender", root, abaPrata)
				removeEventHandler("onClientRender", root, abaDiamante)
				TickVip = getTickCount()
				Select = "Bronze"
				playSound("assets/sounds/click.ogg")
			elseif cursorPosition(x*630, y*148, x*127, y*38) then
				addEventHandler("onClientRender", root, abaPrata)
				removeEventHandler("onClientRender", root, vipMenu)
				removeEventHandler("onClientRender", root, abaBronze)
				removeEventHandler("onClientRender", root, abaOuro)
				removeEventHandler("onClientRender", root, abaDiamante)
				TickVip = getTickCount()
				Select = "Prata"
				playSound("assets/sounds/click.ogg")
			elseif cursorPosition(x*786, y*148, x*127, y*38) then
				addEventHandler("onClientRender", root, abaOuro)
				removeEventHandler("onClientRender", root, vipMenu)
				removeEventHandler("onClientRender", root, abaBronze)
				removeEventHandler("onClientRender", root, abaPrata)
				removeEventHandler("onClientRender", root, abaDiamante)
				TickVip = getTickCount()
				Select = "Ouro"
				playSound("assets/sounds/click.ogg")
			elseif cursorPosition(x*942, y*148, x*127, y*38) then
				addEventHandler("onClientRender", root, abaDiamante)
				removeEventHandler("onClientRender", root, vipMenu)
				removeEventHandler("onClientRender", root, abaBronze)
				removeEventHandler("onClientRender", root, abaPrata)
				removeEventHandler("onClientRender", root, abaOuro)
				TickVip = getTickCount()
				Select = "Diamante"
				playSound("assets/sounds/click.ogg")
			end
		end
	end
end)

-- Select to Other (Diamante)
addEventHandler("onClientClick", root, function(b, s)
	if isEventHandlerAdded("onClientRender", root, abaDiamante) then
		if (b == "left" and s == "down") then
			if cursorPosition(x*474, y*148, x*127, y*38) then
				addEventHandler("onClientRender", root, abaBronze)
				removeEventHandler("onClientRender", root, vipMenu)
				removeEventHandler("onClientRender", root, abaOuro)
				removeEventHandler("onClientRender", root, abaPrata)
				removeEventHandler("onClientRender", root, abaDiamante)
				TickVip = getTickCount()
				Select = "Bronze"
				playSound("assets/sounds/click.ogg")
			elseif cursorPosition(x*630, y*148, x*127, y*38) then
				addEventHandler("onClientRender", root, abaPrata)
				removeEventHandler("onClientRender", root, vipMenu)
				removeEventHandler("onClientRender", root, abaBronze)
				removeEventHandler("onClientRender", root, abaOuro)
				removeEventHandler("onClientRender", root, abaDiamante)
				TickVip = getTickCount()
				Select = "Prata"
				playSound("assets/sounds/click.ogg")
			elseif cursorPosition(x*786, y*148, x*127, y*38) then
				addEventHandler("onClientRender", root, abaOuro)
				removeEventHandler("onClientRender", root, vipMenu)
				removeEventHandler("onClientRender", root, abaBronze)
				removeEventHandler("onClientRender", root, abaPrata)
				removeEventHandler("onClientRender", root, abaDiamante)
				TickVip = getTickCount()
				Select = "Ouro"
				playSound("assets/sounds/click.ogg")
			elseif cursorPosition(x*942, y*148, x*127, y*38) then
				addEventHandler("onClientRender", root, abaDiamante)
				removeEventHandler("onClientRender", root, vipMenu)
				removeEventHandler("onClientRender", root, abaBronze)
				removeEventHandler("onClientRender", root, abaPrata)
				removeEventHandler("onClientRender", root, abaOuro)
				TickVip = getTickCount()
				Select = "Diamante"
				playSound("assets/sounds/click.ogg")
			end
		end
	end
end)

addEventHandler("onClientClick", root, function(b, s)
	if isEventHandlerAdded("onClientRender", root, abaBronze) then
		if b == "left" and s == "down" then
			if localPlayer:getData("Vip_Bronze") == "Sim" then
				if cursorPosition(x*323, y*249, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Armas", "Bronze", 1) -- Kit Patrulha
					playSound("assets/sounds/click.ogg")
				elseif cursorPosition(x*323, y*298, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Armas", "Bronze", 2) -- Kit Apaisana
					playSound("assets/sounds/click.ogg")
				elseif cursorPosition(x*323, y*347, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Armas", "Bronze", 3) -- Kit Bandido
					playSound("assets/sounds/click.ogg")
				elseif cursorPosition(x*620, y*249, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Armas", "Bronze", 4) -- ParaFAl
					playSound("assets/sounds/click.ogg")
				elseif cursorPosition(x*620, y*298, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Armas", "Bronze", 5) -- Ak-47
					playSound("assets/sounds/click.ogg")
				elseif cursorPosition(x*620, y*347, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Armas", "Bronze", 6) -- Deagle
					playSound("assets/sounds/click.ogg")
				elseif cursorPosition(x*620, y*396, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Armas", "Bronze", 7) -- Taser
					playSound("assets/sounds/click.ogg")
				elseif cursorPosition(x*620, y*445, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Armas", "Bronze", 8) -- Glock
					playSound("assets/sounds/click.ogg")

				elseif cursorPosition(x*818, y*249, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Armas", "Bronze", 9) -- Shotgun
					playSound("assets/sounds/click.ogg")

				elseif cursorPosition(x*818, y*298, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Armas", "Bronze", 10) -- Paraquedas
					playSound("assets/sounds/click.ogg")

				elseif cursorPosition(x*848, y*347, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Armas", "Bronze", 11) -- Sawed-Off
					playSound("assets/sounds/click.ogg")

				elseif cursorPosition(x*818, y*396, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Armas", "Bronze", 12) -- Glock
					playSound("assets/sounds/click.ogg")

				elseif cursorPosition(x*818, y*445, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Armas", "Bronze", 13) -- UZI
					playSound("assets/sounds/click.ogg")
				end
			end
		end
	end
end)

addEventHandler("onClientClick", root, function(b, s)
	if isEventHandlerAdded("onClientRender", root, abaPrata) then
		if b == "left" and s == "down" then
			if localPlayer:getData("Vip_Prata") == "Sim" then
				if cursorPosition(x*323, y*249, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Veiculos", "Bronze", 1) -- Viatura Hilux
					playSound("assets/sounds/click.ogg")
				elseif cursorPosition(x*323, y*298, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Veiculos", "Bronze", 2) -- Viatura TrailBlazer
					playSound("assets/sounds/click.ogg")
				elseif cursorPosition(x*323, y*396, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Veiculos", "Bronze", 3) -- Viatura Rocam
					playSound("assets/sounds/click.ogg")
				elseif cursorPosition(x*323, y*347, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Veiculos", "Ouro", 4) -- Viatura Blindado
					playSound("assets/sounds/click.ogg")
				elseif cursorPosition(x*511, y*249, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Veiculos", "Ouro", 5) -- Helicoptero 1
					playSound("assets/sounds/click.ogg")
				elseif cursorPosition(x*511, y*298, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Veiculos", "Ouro", 6) -- Helicoptero 2
					playSound("assets/sounds/click.ogg")
				elseif cursorPosition(x*820, y*249, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Veiculos", "Bronze", 7) -- Urus
					playSound("assets/sounds/click.ogg")
				elseif cursorPosition(x*820, y*298, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Veiculos", "Bronze", 8) -- Z100
					playSound("assets/sounds/click.ogg")

				end
			end
		end
	end
end)



addEventHandler("onClientClick", root, function(b, s)
	if isEventHandlerAdded("onClientRender", root, abaOuro) then
		if b == "left" and s == "down" then
			if localPlayer:getData("Vip_Ouro") == "Sim" then
				if cursorPosition(x*323, y*249, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Personagens", "Ouro", 1) -- EB PRAÇA
					playSound("assets/sounds/click.ogg")
				elseif cursorPosition(x*323, y*298, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Personagens", "Ouro", 2) -- EB PQD
					playSound("assets/sounds/click.ogg")
				elseif cursorPosition(x*323, y*347, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Personagens", "Ouro", 3) -- EB FEM
					playSound("assets/sounds/click.ogg")
				elseif cursorPosition(x*323, y*396, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Personagens", "Ouro", 4) -- EB OFC
					playSound("assets/sounds/click.ogg")

				elseif cursorPosition(x*430, y*249, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Personagens", "Ouro", 5) -- ROTA PRAÇA
					playSound("assets/sounds/click.ogg")
				elseif cursorPosition(x*430, y*298, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Personagens", "Ouro", 6) -- ROTA Elite
					playSound("assets/sounds/click.ogg")
				elseif cursorPosition(x*430, y*347, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Personagens", "Ouro", 7) -- ROTA FEM
					playSound("assets/sounds/click.ogg")

				elseif cursorPosition(x*540, y*249, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Personagens", "Ouro", 8) -- FN PRAÇA
					playSound("assets/sounds/click.ogg")
				elseif cursorPosition(x*540, y*298, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Personagens", "Ouro", 2) -- FN OFC
					playSound("assets/sounds/click.ogg")
				elseif cursorPosition(x*540, y*347, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Personagens", "Ouro", 2) -- FN FEM
					playSound("assets/sounds/click.ogg")

				elseif cursorPosition(x*540, y*298, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Personagens", "Ouro", 2) -- FN OFC
					playSound("assets/sounds/click.ogg")

				end
			end
		end
	end
end)

addEventHandler("onClientClick", root, function(b, s)
	if isEventHandlerAdded("onClientRender", root, abaDiamante) then
		if b == "left" and s == "down" then
			if localPlayer:getData("Vip_Diamante") == "Sim" then
				if cursorPosition(x*323, y*249, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Personagens", "Diamante", 1)
					playSound("assets/sounds/click.ogg")
				elseif cursorPosition(x*323, y*298, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Personagens", "Diamante", 2)
					playSound("assets/sounds/click.ogg")
				elseif cursorPosition(x*323, y*347, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Personagens", "Diamante", 3)
					playSound("assets/sounds/click.ogg")
				elseif cursorPosition(x*323, y*396, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Personagens", "Diamante", 4)
					playSound("assets/sounds/click.ogg")
					--car
				elseif cursorPosition(x*323, y*445, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Veiculos", "Diamante", 1)
					playSound("assets/sounds/click.ogg")
				elseif cursorPosition(x*323, y*494, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Veiculos", "Diamante", 2)
					playSound("assets/sounds/click.ogg")
				elseif cursorPosition(x*323, y*543, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Veiculos", "Diamante", 3)
					playSound("assets/sounds/click.ogg")
				elseif cursorPosition(x*521, y*249, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Veiculos", "Diamante", 4)
					playSound("assets/sounds/click.ogg")
					--kit ar
				elseif cursorPosition(x*521, y*298, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Armas", "Diamante", 1)
					playSound("assets/sounds/click.ogg")
				elseif cursorPosition(x*521, y*347, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Armas", "Diamante", 2)
					playSound("assets/sounds/click.ogg")
				elseif cursorPosition(x*521, y*396, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Armas", "Diamante", 3)
					playSound("assets/sounds/click.ogg")
				elseif cursorPosition(x*521, y*445, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Armas", "Diamante", 4)
					playSound("assets/sounds/click.ogg")
					--andar
				elseif cursorPosition(x*521, y*494, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Estilo Anda", "Diamante", 1)
					playSound("assets/sounds/click.ogg")
				elseif cursorPosition(x*521, y*543, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Estilo Anda", "Diamante", 2)
					playSound("assets/sounds/click.ogg")
				elseif cursorPosition(x*719, y*249, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Estilo Anda", "Diamante", 3)
					playSound("assets/sounds/click.ogg")
				elseif cursorPosition(x*719, y*298, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Vidas", "Diamante", 1)
					playSound("assets/sounds/click.ogg")
				elseif cursorPosition(x*719, y*347, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Coletes", "Diamante", 1)
					playSound("assets/sounds/click.ogg")
				elseif cursorPosition(x*719, y*396, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Estilo Luta", "Diamante", 1)
					playSound("assets/sounds/click.ogg")
				elseif cursorPosition(x*719, y*445, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Estilo Luta", "Diamante", 2)
					playSound("assets/sounds/click.ogg")
				elseif cursorPosition(x*719, y*494, x*173, y*35) then
					triggerServerEvent("asto.vipClicks", localPlayer, "Estilo Luta", "Diamante", 3)
					playSound("assets/sounds/click.ogg")
				end
			end
		end
	end
end)