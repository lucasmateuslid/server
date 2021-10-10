function abaDiamante()
	drawBorde(x*275, y*133, x*815, y*502, tocolor(11,11,11,AlphaVip[2]))
	drawBorde(x*275, y*133, x*815, y*67, tocolor(21,21,21,AlphaVip[2]))

	if localPlayer:getData("Vip_Ouro") ~= "Sim" then
		drawBorde(x*297, y*222, x*772, y*379, tocolor(21,21,21,AlphaVip[2]))
		dxDrawText("Você não é Vip Diamante", x*565, y*370, x*62, y*28, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[4], "left", "top")
	else
		drawBorde(x*297, y*222, x*772, y*379, tocolor(21,21,21,AlphaVip[2]))

		if cursorPosition(x*323, y*249, x*173, y*35) then
			drawBorde(x*323, y*249, x*173, y*35, tocolor(58,91,154,AlphaVip[1]))
		else
			drawBorde(x*323, y*249, x*173, y*35, tocolor(11,11,11,AlphaVip[1]))
		end
		dxDrawText("Personagem |", x*354, y*256, x*111, y*21, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[5], "left", "top")

		if cursorPosition(x*323, y*298, x*173, y*35) then
			drawBorde(x*323, y*298, x*173, y*35, tocolor(58,91,154,AlphaVip[1]))
		else
			drawBorde(x*323, y*298, x*173, y*35, tocolor(11,11,11,AlphaVip[1]))
		end
		dxDrawText("Personagem ||", x*354, y*305, x*111, y*21, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[5], "left", "top")

		if cursorPosition(x*323, y*347, x*173, y*35) then
			drawBorde(x*323, y*347, x*173, y*35, tocolor(58,91,154,AlphaVip[1]))
		else
			drawBorde(x*323, y*347, x*173, y*35, tocolor(11,11,11,AlphaVip[1]))
		end
		dxDrawText("Personagem |||", x*354, y*354, x*111, y*21, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[5], "left", "top")

		if cursorPosition(x*323, y*396, x*173, y*35) then
			drawBorde(x*323, y*396, x*173, y*35, tocolor(58,91,154,AlphaVip[1]))
		else
			drawBorde(x*323, y*396, x*173, y*35, tocolor(11,11,11,AlphaVip[1]))
		end
		dxDrawText("Personagem ||||", x*354, y*403, x*111, y*21, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[5], "left", "top")

		if cursorPosition(x*323, y*445, x*173, y*35) then
			drawBorde(x*323, y*445, x*173, y*35, tocolor(58,91,154,AlphaVip[1]))
		else
			drawBorde(x*323, y*445, x*173, y*35, tocolor(11,11,11,AlphaVip[1]))
		end
		dxDrawText("Veiculo |", x*370, y*452, x*111, y*21, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[5], "left", "top")

		if cursorPosition(x*323, y*494, x*173, y*35) then
			drawBorde(x*323, y*494, x*173, y*35, tocolor(58,91,154,AlphaVip[1]))
		else
			drawBorde(x*323, y*494, x*173, y*35, tocolor(11,11,11,AlphaVip[1]))
		end
		dxDrawText("Veiculo ||", x*370, y*501, x*111, y*21, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[5], "left", "top")

		if cursorPosition(x*323, y*543, x*173, y*35) then
			drawBorde(x*323, y*543, x*173, y*35, tocolor(58,91,154,AlphaVip[1]))
		else
			drawBorde(x*323, y*543, x*173, y*35, tocolor(11,11,11,AlphaVip[1]))
		end
		dxDrawText("Veiculo |||", x*370, y*550, x*111, y*21, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[5], "left", "top")

		-- Parte 2

		if cursorPosition(x*521, y*249, x*173, y*35) then
			drawBorde(x*521, y*249, x*173, y*35, tocolor(58,91,154,AlphaVip[1]))
		else
			drawBorde(x*521, y*249, x*173, y*35, tocolor(11,11,11,AlphaVip[1]))
		end
		dxDrawText("Veiculo ||||", x*568, y*256, x*111, y*21, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[5], "left", "top")

		if cursorPosition(x*521, y*298, x*173, y*35) then
			drawBorde(x*521, y*298, x*173, y*35, tocolor(58,91,154,AlphaVip[1]))
		else
			drawBorde(x*521, y*298, x*173, y*35, tocolor(11,11,11,AlphaVip[1]))
		end
		dxDrawText("Kit Armas |", x*568, y*305, x*111, y*21, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[5], "left", "top")

		if cursorPosition(x*521, y*347, x*173, y*35) then
			drawBorde(x*521, y*347, x*173, y*35, tocolor(58,91,154,AlphaVip[1]))
		else
			drawBorde(x*521, y*347, x*173, y*35, tocolor(11,11,11,AlphaVip[1]))
		end
		dxDrawText("Kit Armas ||", x*568, y*354, x*111, y*21, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[5], "left", "top")

		if cursorPosition(x*521, y*396, x*173, y*35) then
			drawBorde(x*521, y*396, x*173, y*35, tocolor(58,91,154,AlphaVip[1]))
		else
			drawBorde(x*521, y*396, x*173, y*35, tocolor(11,11,11,AlphaVip[1]))
		end
		dxDrawText("Kit Armas |||", x*568, y*403, x*111, y*21, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[5], "left", "top")

		if cursorPosition(x*521, y*445, x*173, y*35) then
			drawBorde(x*521, y*445, x*173, y*35, tocolor(58,91,154,AlphaVip[1]))
		else
			drawBorde(x*521, y*445, x*173, y*35, tocolor(11,11,11,AlphaVip[1]))
		end
		dxDrawText("Kit Armas ||||", x*568, y*452, x*111, y*21, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[5], "left", "top")

		if cursorPosition(x*521, y*494, x*173, y*35) then
			drawBorde(x*521, y*494, x*173, y*35, tocolor(58,91,154,AlphaVip[1]))
		else
			drawBorde(x*521, y*494, x*173, y*35, tocolor(11,11,11,AlphaVip[1]))
		end
		dxDrawText("Estilo Anda |", x*568, y*501, x*111, y*21, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[5], "left", "top")

		if cursorPosition(x*521, y*543, x*173, y*35) then
			drawBorde(x*521, y*543, x*173, y*35, tocolor(58,91,154,AlphaVip[1]))
		else
			drawBorde(x*521, y*543, x*173, y*35, tocolor(11,11,11,AlphaVip[1]))
		end
		dxDrawText("Estilo Anda ||", x*568, y*550, x*111, y*21, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[5], "left", "top")

		--aba 3

		if cursorPosition(x*719, y*249, x*173, y*35) then
			drawBorde(x*719, y*249, x*173, y*35, tocolor(58,91,154,AlphaVip[1]))
		else
			drawBorde(x*719, y*249, x*173, y*35, tocolor(11,11,11,AlphaVip[1]))
		end
		dxDrawText("Estilo Anda |||", x*757, y*256, x*111, y*21, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[5], "left", "top")

		if cursorPosition(x*719, y*298, x*173, y*35) then
			drawBorde(x*719, y*298, x*173, y*35, tocolor(58,91,154,AlphaVip[1]))
		else
			drawBorde(x*719, y*298, x*173, y*35, tocolor(11,11,11,AlphaVip[1]))
		end
		dxDrawText("Kit de vida 100%", x*757, y*305, x*111, y*21, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[5], "left", "top")

		if cursorPosition(x*719, y*347, x*173, y*35) then
			drawBorde(x*719, y*347, x*173, y*35, tocolor(58,91,154,AlphaVip[1]))
		else
			drawBorde(x*719, y*347, x*173, y*35, tocolor(11,11,11,AlphaVip[1]))
		end
		dxDrawText("Colete 80%", x*757, y*354, x*111, y*21, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[5], "left", "top")

		if cursorPosition(x*719, y*396, x*173, y*35) then
			drawBorde(x*719, y*396, x*173, y*35, tocolor(58,91,154,AlphaVip[1]))
		else
			drawBorde(x*719, y*396, x*173, y*35, tocolor(11,11,11,AlphaVip[1]))
		end
		dxDrawText("Estilo de luta |", x*757, y*401, x*111, y*21, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[5], "left", "top")

		if cursorPosition(x*719, y*445, x*173, y*35) then
			drawBorde(x*719, y*445, x*173, y*35, tocolor(58,91,154,AlphaVip[1]))
		else
			drawBorde(x*719, y*445, x*173, y*35, tocolor(11,11,11,AlphaVip[1]))
		end
		dxDrawText("Estilo de luta ||", x*757, y*452, x*111, y*21, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[5], "left", "top")

		if cursorPosition(x*719, y*494, x*173, y*35) then
			drawBorde(x*719, y*494, x*173, y*35, tocolor(58,91,154,AlphaVip[1]))
		else
			drawBorde(x*719, y*494, x*173, y*35, tocolor(11,11,11,AlphaVip[1]))
		end
		dxDrawText("Estilo de luta |||", x*757, y*501, x*111, y*21, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[5], "left", "top")

	end

	if cursorPosition(x*474, y*148, x*127, y*38) or Select == "Bronze" then
		drawBorde(x*474, y*148, x*127, y*38, tocolor(58,91,154,AlphaVip[1]))
	else
		drawBorde(x*474, y*148, x*127, y*38, tocolor(11,11,11,AlphaVip[1]))
	end

	if cursorPosition(x*630, y*148, x*127, y*38) or Select == "Prata" then
		drawBorde(x*630, y*148, x*127, y*38, tocolor(58,91,154,AlphaVip[1]))
	else
		drawBorde(x*630, y*148, x*127, y*38, tocolor(11,11,11,AlphaVip[1]))
	end

	if cursorPosition(x*786, y*148, x*127, y*38) or Select == "Ouro" then
		drawBorde(x*786, y*148, x*127, y*38, tocolor(58,91,154,AlphaVip[1]))
	else
		drawBorde(x*786, y*148, x*127, y*38, tocolor(11,11,11,AlphaVip[1]))
	end

	if cursorPosition(x*942, y*148, x*127, y*38) or Select == "Diamante" then
		drawBorde(x*942, y*148, x*127, y*38, tocolor(58,91,154,AlphaVip[1]))
	else
		drawBorde(x*942, y*148, x*127, y*38, tocolor(11,11,11,AlphaVip[1]))
	end

	dxDrawImage(x*482, y*154, x*487, y*25, "assets/icons/bg.png", 0, 0, 0, tocolor(255,255,255,AlphaVip[1]))

	dxDrawImage(x*292, y*143, x*48, y*48, "assets/avatars/"..Avatar..".png", 0, 0, 0, tocolor(255,255,255,AlphaVip[1]))

	dxDrawText("ID: "..ID, x*344, y*148, x*30, y*12, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[2], "left", "top")
	dxDrawText("Apelido: \n "..Nick, x*344, y*161, x*30, y*12, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[2], "left", "top")
--	dxDrawText("Cash: "..Cash, x*344, y*174, x*30, y*12, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[2], "left", "top")

	dxDrawText("Armas", x*517, y*156, x*62, y*23, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[1], "left", "top")
	dxDrawText("Veiculos", x*681, y*156, x*62, y*23, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[1], "left", "top")
	dxDrawText("Skins", x*839, y*156, x*62, y*23, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[1], "left", "top")
	dxDrawText("Outros", x*977, y*156, x*62, y*23, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[1], "left", "top")
end