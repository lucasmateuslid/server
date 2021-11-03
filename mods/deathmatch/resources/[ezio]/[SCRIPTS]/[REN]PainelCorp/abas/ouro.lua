function abaOuro()
	drawBorde(x*275, y*133, x*815, y*502, tocolor(11,11,11,AlphaVip[2]))
	drawBorde(x*275, y*133, x*815, y*67, tocolor(21,21,21,AlphaVip[2]))

	if localPlayer:getData("Vip_Bronze") ~= "Sim" then
		drawBorde(x*297, y*222, x*772, y*379, tocolor(21,21,21,AlphaVip[2]))
		dxDrawText("Você não esta autorizado a usar esse painel!!", x*565, y*370, x*62, y*28, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[4], "left", "top")
	else
		drawBorde(x*297, y*222, x*772, y*379, tocolor(21,21,21,AlphaVip[2]))
		-- EB
		if cursorPosition(x*323, y*249, x*90, y*35) then
			drawBorde(x*323, y*249, x*90, y*35, tocolor(0,122,23,AlphaVip[1]))
		else
			drawBorde(x*323, y*249, x*90, y*35, tocolor(11,11,11,AlphaVip[1]))
		end
		dxDrawText("EB PRAÇA", x*340, y*256, x*90, y*21, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[5], "left", "top")

		if cursorPosition(x*323, y*298, x*90, y*35) then
			drawBorde(x*323, y*298, x*90, y*35, tocolor(0,122,23,AlphaVip[1]))
		else
			drawBorde(x*323, y*298, x*90, y*35, tocolor(11,11,11,AlphaVip[1]))
		end
		dxDrawText("EB PQD", x*340, y*305, x*111, y*21, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[5], "left", "top")

		if cursorPosition(x*323, y*347, x*90, y*35) then
			drawBorde(x*323, y*347, x*90, y*35, tocolor(0,122,23,AlphaVip[1]))
		else
			drawBorde(x*323, y*347, x*90, y*35, tocolor(11,11,11,AlphaVip[1]))
		end
		dxDrawText("EB FEM", x*340, y*354, x*111, y*21, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[5], "left", "top")

		if cursorPosition(x*323, y*396, x*90, y*35) then
			drawBorde(x*323, y*396, x*90, y*35, tocolor(0,122,23,AlphaVip[1]))
		else
			drawBorde(x*323, y*396, x*90, y*35, tocolor(11,11,11,AlphaVip[1]))
		end
		dxDrawText("EB OFC", x*340, y*403, x*111, y*21, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[5], "left", "top")
		dxDrawText("Fardas EB", x*345, y*225, x*173, y*21, tocolor(255,255,255,AlphaVip[2]), 1.00, fontsVip.robotoVip[5], "left", "top")

		-- ROTA
		if cursorPosition(x*430, y*249, x*90, y*35) then
			drawBorde(x*430, y*249, x*90, y*35, tocolor(0,122,23,AlphaVip[1]))
		else
			drawBorde(x*430, y*249, x*90, y*35, tocolor(11,11,11,AlphaVip[1]))
		end
		dxDrawText("ROTA Praça", x*450, y*256, x*111, y*21, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[5], "left", "top")
		if cursorPosition(x*430, y*298, x*90, y*35) then
			drawBorde(x*430, y*298, x*90, y*35, tocolor(0,122,23,AlphaVip[1]))
		else
			drawBorde(x*430, y*298, x*90, y*35, tocolor(11,11,11,AlphaVip[1]))
		end
		dxDrawText("ROTA Elite", x*450, y*305, x*111, y*21, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[5], "left", "top")
		if cursorPosition(x*430, y*347, x*90, y*35) then
			drawBorde(x*430, y*347, x*90, y*35, tocolor(0,122,23,AlphaVip[1]))
		else
			drawBorde(x*430, y*347, x*90, y*35, tocolor(11,11,11,AlphaVip[1]))
		end
		dxDrawText("ROTA Fem", x*450, y*354, x*111, y*21, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[5], "left", "top")
		dxDrawText("Fardas ROTA", x*445, y*225, x*173, y*21, tocolor(255,255,255,AlphaVip[2]), 1.00, fontsVip.robotoVip[5], "left", "top")

		-- FN
		if cursorPosition(x*540, y*249, x*90, y*35) then
			drawBorde(x*540, y*249, x*90, y*35, tocolor(0,122,23,AlphaVip[1]))
		else
			drawBorde(x*540, y*249, x*90, y*35, tocolor(11,11,11,AlphaVip[1]))
		end
		dxDrawText("FN Praça", x*550, y*256, x*111, y*21, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[5], "left", "top")

		if cursorPosition(x*540, y*298, x*90, y*35) then
			drawBorde(x*540, y*298, x*90, y*35, tocolor(0,122,23,AlphaVip[1]))
		else
			drawBorde(x*540, y*298, x*90, y*35, tocolor(11,11,11,AlphaVip[1]))
		end
		dxDrawText("FN OFC", x*550, y*305, x*111, y*21, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[5], "left", "top")

		if cursorPosition(x*540, y*347, x*90, y*35) then
			drawBorde(x*540, y*347, x*90, y*35, tocolor(0,122,23,AlphaVip[1]))
		else
			drawBorde(x*540, y*347, x*90, y*35, tocolor(11,11,11,AlphaVip[1]))
		end
		dxDrawText("FN Fem", x*550, y*354, x*111, y*21, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[5], "left", "top")

		dxDrawText("Fardas FN", x*560, y*225, x*173, y*21, tocolor(255,255,255,AlphaVip[2]), 1.00, fontsVip.robotoVip[5], "left", "top")

		-- PMESP
		if cursorPosition(x*640, y*249, x*90, y*35) then
			drawBorde(x*640, y*249, x*90, y*35, tocolor(0,122,23,AlphaVip[1]))
		else
			drawBorde(x*640, y*249, x*90, y*35, tocolor(11,11,11,AlphaVip[1]))
		end
		dxDrawText("PMESP Praça", x*650, y*256, x*111, y*21, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[5], "left", "top")
		if cursorPosition(x*640, y*298, x*90, y*35) then
			drawBorde(x*640, y*298, x*90, y*35, tocolor(0,122,23,AlphaVip[1]))
		else
			drawBorde(x*640, y*298, x*90, y*35, tocolor(11,11,11,AlphaVip[1]))
		end
		dxDrawText("PMESP Fem", x*650, y*305, x*111, y*21, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[5], "left", "top")
		if cursorPosition(x*640, y*347, x*90, y*35) then
			drawBorde(x*640, y*347, x*90, y*35, tocolor(0,122,23,AlphaVip[1]))
		else
			drawBorde(x*640, y*347, x*90, y*35, tocolor(11,11,11,AlphaVip[1]))
		end
		dxDrawText("PMESP OFC", x*650, y*354, x*111, y*21, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[5], "left", "top")
		dxDrawText("Fardas PMESP", x*650, y*225, x*173, y*21, tocolor(255,255,255,AlphaVip[2]), 1.00, fontsVip.robotoVip[5], "left", "top")
		-- BAEP
		if cursorPosition(x*840, y*249, x*90, y*35) then
			drawBorde(x*840, y*249, x*90, y*35, tocolor(0,122,23,AlphaVip[1]))
		else
			drawBorde(x*840, y*249, x*90, y*35, tocolor(11,11,11,AlphaVip[1]))
		end
		dxDrawText("BAEP Praça", x*850, y*256, x*111, y*21, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[5], "left", "top")
		if cursorPosition(x*840, y*298, x*90, y*35) then
			drawBorde(x*840, y*298, x*90, y*35, tocolor(0,122,23,AlphaVip[1]))
		else
			drawBorde(x*840, y*298, x*90, y*35, tocolor(11,11,11,AlphaVip[1]))
		end
		dxDrawText("BAEP Fem", x*850, y*305, x*111, y*21, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[5], "left", "top")
		if cursorPosition(x*840, y*347, x*90, y*35) then
			drawBorde(x*840, y*347, x*90, y*35, tocolor(0,122,23,AlphaVip[1]))
		else
			drawBorde(x*840, y*347, x*90, y*35, tocolor(11,11,11,AlphaVip[1]))
		end
		dxDrawText("BAEP OFC", x*850, y*354, x*111, y*21, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[5], "left", "top")
		dxDrawText("Fardas BAEP", x*850, y*225, x*173, y*21, tocolor(255,255,255,AlphaVip[2]), 1.00, fontsVip.robotoVip[5], "left", "top")
			-- PC
		if cursorPosition(x*740, y*249, x*90, y*35) then
			drawBorde(x*740, y*249, x*90, y*35, tocolor(0,122,23,AlphaVip[1]))
		else
			drawBorde(x*740, y*249, x*90, y*35, tocolor(11,11,11,AlphaVip[1]))
		end
		dxDrawText("PC Agente", x*750, y*256, x*111, y*21, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[5], "left", "top")
		if cursorPosition(x*740, y*298, x*90, y*35) then
			drawBorde(x*740, y*298, x*90, y*35, tocolor(0,122,23,AlphaVip[1]))
		else
			drawBorde(x*740, y*298, x*90, y*35, tocolor(11,11,11,AlphaVip[1]))
		end
		dxDrawText("PC Fem", x*750, y*305, x*111, y*21, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[5], "left", "top")
		if cursorPosition(x*740, y*347, x*90, y*35) then
			drawBorde(x*740, y*347, x*90, y*35, tocolor(0,122,23,AlphaVip[1]))
		else
			drawBorde(x*740, y*347, x*90, y*35, tocolor(11,11,11,AlphaVip[1]))
		end
		dxDrawText("PC Superior", x*750, y*354, x*111, y*21, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[5], "left", "top")
		dxDrawText("Fardas PC", x*750, y*225, x*173, y*21, tocolor(255,255,255,AlphaVip[2]), 1.00, fontsVip.robotoVip[5], "left", "top")

			dxDrawText("Desenvolvido por: ๖̶̶̶ζ͜͡Lima#0132 - Renan|B|EB", x*650, y*580, x*173, y*35, tocolor(99, 99, 99,AlphaVip[1]), 1.00, fontsVip.robotoVip[1], "center", "top")


	end

	if cursorPosition(x*474, y*148, x*127, y*38) or Select == "Bronze" then
		drawBorde(x*474, y*148, x*127, y*38, tocolor(0,122,23,AlphaVip[1]))
	else
		drawBorde(x*474, y*148, x*127, y*38, tocolor(11,11,11,AlphaVip[1]))
	end

	if cursorPosition(x*630, y*148, x*127, y*38) or Select == "Prata" then
		drawBorde(x*630, y*148, x*127, y*38, tocolor(0,122,23,AlphaVip[1]))
	else
		drawBorde(x*630, y*148, x*127, y*38, tocolor(11,11,11,AlphaVip[1]))
	end

	if cursorPosition(x*790, y*148, x*127, y*38) or Select == "Ouro" then
		drawBorde(x*790, y*148, x*127, y*38, tocolor(0,122,23,AlphaVip[1]))
	else
		drawBorde(x*790, y*148, x*127, y*38, tocolor(11,11,11,AlphaVip[1]))
	end

	if cursorPosition(x*942, y*148, x*127, y*38) or Select == "Diamante" then
		drawBorde(x*942, y*148, x*127, y*38, tocolor(0,122,23,AlphaVip[1]))
	else
		drawBorde(x*942, y*148, x*127, y*38, tocolor(11,11,11,AlphaVip[1]))
	end

	dxDrawImage(x*482, y*154, x*487, y*25, "assets/icons/bg.png", 0, 0, 0, tocolor(255,255,255,AlphaVip[1]))

	dxDrawImage(x*292, y*143, x*48, y*48, "assets/avatars/"..Avatar..".png", 0, 0, 0, tocolor(255,255,255,AlphaVip[1]))

	dxDrawText("ID: "..ID, x*344, y*148, x*30, y*12, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[2], "left", "top")
	dxDrawText("Apelido:\n "..Nick, x*344, y*161, x*30, y*12, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[2], "left", "top")
	--dxDrawText("Cash: "..Cash, x*344, y*174, x*30, y*12, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[2], "left", "top")

	dxDrawText("Armas", x*517, y*154, x*62, y*23, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[1], "left", "top")
	dxDrawText("Veiculos", x*681, y*156, x*62, y*23, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[1], "left", "top")
	dxDrawText("Skins", x*839, y*156, x*62, y*23, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[1], "left", "top")
	dxDrawText("Outros", x*977, y*156, x*62, y*23, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[1], "left", "top")
end