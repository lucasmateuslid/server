function abaPrata()
	drawBorde(x*275, y*133, x*815, y*502, tocolor(11,11,11,AlphaVip[2]))
	drawBorde(x*275, y*133, x*815, y*67, tocolor(21,21,21,AlphaVip[2]))

	if localPlayer:getData("Vip_Prata") ~= "Sim" then
		drawBorde(x*297, y*222, x*772, y*379, tocolor(21,21,21,AlphaVip[2]))
		dxDrawText("Você não é Vip Prata", x*565, y*370, x*62, y*28, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[4], "left", "top")
	else
		drawBorde(x*297, y*222, x*772, y*379, tocolor(21,21,21,AlphaVip[2]))

		if cursorPosition(x*323, y*249, x*173, y*35) then
			drawBorde(x*323, y*249, x*173, y*35, tocolor(58,91,154,AlphaVip[1]))
		else
			drawBorde(x*323, y*249, x*173, y*35, tocolor(11,11,11,AlphaVip[1]))
		end
		dxDrawText("Viatura Hilux", x*334, y*256, x*111, y*21, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[5], "left", "top")

		if cursorPosition(x*323, y*298, x*173, y*35) then
			drawBorde(x*323, y*298, x*173, y*35, tocolor(58,91,154,AlphaVip[1]))
		else
			drawBorde(x*323, y*298, x*173, y*35, tocolor(11,11,11,AlphaVip[1]))
		end
		dxDrawText("Viatura TrailBlazer", x*334, y*305, x*111, y*21, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[5], "left", "top")

		if cursorPosition(x*323, y*347, x*173, y*35) then
			drawBorde(x*323, y*347, x*173, y*35, tocolor(58,91,154,AlphaVip[1]))
		else
			drawBorde(x*323, y*347, x*173, y*35, tocolor(11,11,11,AlphaVip[1]))
		end
		dxDrawText("Camburão Blindado", x*334, y*354, x*111, y*21, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[5], "left", "top")

		if cursorPosition(x*323, y*396, x*173, y*35) then
			drawBorde(x*323, y*396, x*173, y*35, tocolor(58,91,154,AlphaVip[1]))
		else
			drawBorde(x*323, y*396, x*173, y*35, tocolor(11,11,11,AlphaVip[1]))
		end
		dxDrawText("Rocam", x*334, y*403, x*111, y*21, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[5], "left", "top")

		if cursorPosition(x*511, y*249, x*173, y*35) then
			drawBorde(x*511, y*249, x*173, y*35, tocolor(58,91,154,AlphaVip[1]))
		else
			drawBorde(x*511, y*249, x*173, y*35, tocolor(11,11,11,AlphaVip[1]))
		end
		dxDrawText("Helicoptero 1", x*520, y*256, x*111, y*21, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[5], "left", "top")

		if cursorPosition(x*511, y*298, x*173, y*35) then
			drawBorde(x*511, y*298, x*173, y*35, tocolor(58,91,154,AlphaVip[1]))
		else
			drawBorde(x*511, y*298, x*173, y*35, tocolor(11,11,11,AlphaVip[1]))
		end
		dxDrawText("Helicoptero 2", x*520, y*305, x*111, y*21, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[5], "left", "top")

		if cursorPosition(x*820, y*249, x*173, y*35) then
			drawBorde(x*820, y*249, x*173, y*35, tocolor(58,91,154,AlphaVip[1]))
		else
			drawBorde(x*820, y*249, x*173, y*35, tocolor(11,11,11,AlphaVip[1]))
		end
		dxDrawText("Urus", x*830, y*256, x*173, y*35, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[5], "left", "top")
		if cursorPosition(x*820, y*298, x*173, y*35) then
			drawBorde(x*820, y*298, x*173, y*35, tocolor(58,91,154,AlphaVip[1]))
		else
			drawBorde(x*820, y*298, x*173, y*35, tocolor(11,11,11,AlphaVip[1]))
		end
		dxDrawText("Z100", x*830, y*305, x*173, y*35, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[5], "left", "top")


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
	dxDrawText("Apelido:\n "..Nick, x*344, y*161, x*30, y*12, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[2], "left", "top")
	--dxDrawText("Cash: "..Cash, x*344, y*174, x*30, y*12, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[2], "left", "top")
	dxDrawText("Desenvolvido por: ๖̶̶̶ζ͜͡Lima#0132 - Renan|B|EB", x*650, y*580, x*173, y*35, tocolor(99, 99, 99,AlphaVip[1]), 1.00, fontsVip.robotoVip[1], "center", "top")
	dxDrawText("Veiculos Militares", x*465, y*225, x*173, y*35, tocolor(255, 255, 255,AlphaVip[1]), 1.00, fontsVip.robotoVip[4], "left", "top")
		dxDrawText("Veiculos Civis", x*850, y*225, x*173, y*35, tocolor(255, 255, 255,AlphaVip[1]), 1.00, fontsVip.robotoVip[4], "left", "top")

	dxDrawText("Armas", x*517, y*154, x*62, y*23, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[1], "left", "top")
	dxDrawText("Veiculos", x*681, y*156, x*62, y*23, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[1], "left", "top")
	dxDrawText("Skins", x*839, y*156, x*62, y*23, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[1], "left", "top")
	dxDrawText("Outros", x*977, y*156, x*62, y*23, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[1], "left", "top")
end