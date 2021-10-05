function vipMenu()
	AlphaVip[1] = interpolateBetween(0, 0, 0, 255, 0, 0, (getTickCount()-TickVip)/800, "Linear")
	AlphaVip[2] = interpolateBetween(0, 0, 0, 230, 0, 0, (getTickCount()-TickVip)/800, "Linear")

	Avatar = (localPlayer:getData("avatar") or 0)
	ID = (localPlayer:getData("ID") or "N/D")
	Nick = getPlayerName(localPlayer)
	Cash = (localPlayer:getData("Cash") or 0)

	drawBorde(x*275, y*133, x*815, y*502, tocolor(11,11,11,AlphaVip[2]))
	drawBorde(x*275, y*133, x*815, y*67, tocolor(21,21,21,AlphaVip[2]))

	drawBorde(x*297, y*222, x*772, y*379, tocolor(21,21,21,AlphaVip[2]))

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
	dxDrawText("Apelido: "..Nick, x*344, y*161, x*30, y*12, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[2], "left", "top")
	--dxDrawText("Cash: "..Cash, x*344, y*174, x*30, y*12, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[2], "left", "top")

	dxDrawText("Bronze", x*517, y*156, x*62, y*23, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[1], "left", "top")
	dxDrawText("Prata", x*681, y*156, x*62, y*23, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[1], "left", "top")
	dxDrawText("Ouro", x*839, y*156, x*62, y*23, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[1], "left", "top")
	dxDrawText("Diamante", x*977, y*156, x*62, y*23, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[1], "left", "top")

	dxDrawText("Seja muito bem vindo! \nEsse é o novo sistema de Painel VIP\ndo Servidor\n\nSeja VIP!!\n\n Bronze: R$:"..configC.precosV.preco_1.." \n Prata: R$:"..configC.precosV.preco_2.." \n Ouro: R$:"..configC.precosV.preco_3.." \n Diamante: R$:"..configC.precosV.preco_4.." \n\nNosso discord para entra em contato\n"..configC.links.discord.."", x*316, y*286, x*346, y*252, tocolor(255,255,255,AlphaVip[1]), 1.00, fontsVip.robotoVip[3], "left", "top")
end