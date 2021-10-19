local screenH, screenW = guiGetScreenSize()
local x, y = (screenH/1366), (screenW/768)

local font_Menu = dxCreateFont("files/font/font.ttf", 15)
local movertexto = 0
local parte1 = false

alpha = 0
logo = 1

cor = {}
local source = getLocalPlayer()

local idModel = {
[1] = 14399,
[2] = 14400,
[3] = 14401,
[4] = 14402,
[5] = 14403,
[6] = 14404
}

function part1()

        local posX1, posY1, posZ1 = interpolateBetween(1400, 0, 0, 1250, 0, 0, ((getTickCount() - tick1) / 2500), "OutBounce")
		local posX2, posY2, posZ2 = interpolateBetween(1400, 0, 0, 1273, 0, 0, ((getTickCount() - tick1) / 2500), "OutBounce")
		local posX3, posY3, posZ3 = interpolateBetween(1400, 0, 0, 1274, 0, 0, ((getTickCount() - tick1) / 2500), "OutBounce")
		local posX4, posY4, posZ4 = interpolateBetween(1400, 0, 0, 1275, 0, 0, ((getTickCount() - tick1) / 2500), "OutBounce")
		local posX5, posY5, posZ5 = interpolateBetween(1400, 0, 0, 1222, 0, 0, ((getTickCount() - tick1) / 2500), "OutBounce")
		local posX6, posY6, posZ6 = interpolateBetween(1400, 0, 0, 1265, 0, 0, ((getTickCount() - tick1) / 2500), "OutBounce")
		
		
        dxDrawRectangle(x*posX1, y*130, x*110, y*405, tocolor(0, 0, 0, 180), false)
        dxDrawEmptyRec(x*posX1, y*130, x*110, y*405, tocolor(0, 0, 0, 255), 2)
		
		dxDrawRectangle(x*posX1, y*130, x*110, y*20, tocolor(0, 0, 0, 180), false)
		dxDrawRectangle(x*posX1, y*515, x*110, y*20, tocolor(0, 0, 0, 180), false)
		
		dxDrawImage(x*posX2, y*160, x*60, y*50, "files/img/carro.png", 0, 0, 0, cor[1], true)
		dxDrawImage(x*posX2, y*230, x*60, y*50, "files/img/motor.png", 0, 0, 0, cor[2], true)
		dxDrawImage(x*posX3, y*387, x*60, y*50, "files/img/suspensao.png", 0, 0, 0, cor[3], true)
		dxDrawImage(x*posX4, y*460, x*60, y*50, "files/img/farol.png", 0, 0, 0, cor[4], true)
		dxDrawImage(x*posX4, y*307, x*60, y*50, "files/img/roda.png", 0, 0, 0, cor[5], true)
		
		
		dxDrawImage(x*posX5, y*210, x*200, y*20, "files/img/reta.png", 0, 0, 0, tocolor(255,255,255,255), true)
		dxDrawImage(x*posX5, y*278, x*200, y*20, "files/img/reta.png", 0, 0, 0, tocolor(255,255,255,255), true)
		dxDrawImage(x*posX5, y*363, x*200, y*20, "files/img/reta.png", 0, 0, 0, tocolor(255,255,255,255), true)
		dxDrawImage(x*posX5, y*440, x*200, y*20, "files/img/reta.png", 0, 0, 0, tocolor(255,255,255,255), true)
		
			
		--dxDrawImage(x*posX6, y*677, x*80, y*70, "files/img/logo.png", logo, 0, 0, tocolor(255, 255, 255, alpha), true) logo = logo +1
		logo = logo +2
		
		cor[1] = tocolor(255, 255, 255, 255)
	    if isCursorOnElement(x*1273, y*160, x*60, y*50) then cor[1] = tocolor(173, 255, 47) end
		cor[2] = tocolor(255, 255, 255, 255)
	    if isCursorOnElement(x*1273, y*230, x*60, y*50) then cor[2] = tocolor(173, 255, 47) end
		cor[3] = tocolor(255, 255, 255, 255)
	    if isCursorOnElement(x*1274, y*387, x*60, y*50) then cor[3] = tocolor(173, 255, 47) end
		cor[4] = tocolor(255, 255, 255, 255)
	    if isCursorOnElement(x*1275, y*460, x*60, y*50) then cor[4] = tocolor(173, 255, 47) end
		cor[5] = tocolor(255, 255, 255, 255)
	    if isCursorOnElement(x*1275, y*307, x*60, y*50) then cor[5] = tocolor(173, 255, 47) end		

		dxDrawText("PAINEL VEICULO", x*644550, y*13, x*715, y*350, tocolor(255, 255, 255, 255), x*1.0, font_Menu, "center", "center", false, false, false, false, false)
	
end	


function updateRatio(Scrolled)
	local position = guiScrollBarGetScrollPosition(Scrolled)
	local door = getElementData(Scrolled, "Type")
	triggerServerEvent("moveThisShit", getLocalPlayer(), door, position)
end
addEventHandler("onClientGUIScroll", getRootElement(), updateRatio)

img = {}

local parte2 = false
function part2()
	local seconds = getTickCount() / 1000
	local angle = math.sin(seconds) * 10

	img[6] = "files/img/seta.png"
	img[7] = "files/img/seta.png"
	img[8] = "files/img/seta.png"
	img[9] = "files/img/seta.png"
	img[10] = "files/img/seta.png"
	img[11] = "files/img/seta.png"
	
   if cursorPosition(x*650, y*170, x*90, y*90) then img[6] = "files/img/seta2.png" end
	if cursorPosition(x*508, y*290, x*90, y*90) then img[7] = "files/img/seta2.png" end
	if cursorPosition(x*508, y*370, x*90, y*90) then img[8] = "files/img/seta2.png" end
	if cursorPosition(x*650, y*500, x*90, y*90) then img[9] = "files/img/seta2.png" end
	if cursorPosition(x*785, y*370, x*90, y*90) then img[10] = "files/img/seta2.png" end
	if cursorPosition(x*785, y*290, x*90, y*90) then img[11] = "files/img/seta2.png" end
	
	    dxDrawImage(x*650, y*170, x*90, y*90, img[6], angle, 0, -20 , tocolor(255, 255, 255, 255), true)
        dxDrawImage(x*508, y*290, x*90, y*90, img[7], angle+270, 0, -20, tocolor(255, 255, 255, 255), true)
        dxDrawImage(x*508, y*370, x*90, y*90, img[8], angle+270, 0, -20, tocolor(255, 255, 255, 255), true)
        dxDrawImage(x*650, y*500, x*90, y*90, img[9], angle+180, 0, -20, tocolor(255, 255, 255, 255), true)
        dxDrawImage(x*785, y*370, x*90, y*90, img[10], angle+90, 0, -20, tocolor(255, 255, 255, 255), true)
        dxDrawImage(x*785, y*290, x*90, y*90, img[11], angle+90, 0, -20, tocolor(255, 255, 255, 255), true)

		 
		 
		 
        dxDrawRectangle(x*430, y*130, x*550, y*415, tocolor(0, 0, 0, 180), false)
        dxDrawEmptyRec(x*430, y*130, x*550, y*415, tocolor(0, 0, 0, 255), 2)

        dxDrawRectangle(x*430, y*130, x*550, y*35, tocolor(0, 0, 0, 180), false)
        dxDrawText("ABRIR PORTAS", x*690, y*13, x*715, y*285, tocolor(255, 255, 255, 255), x*1.0, font_Menu, "center", "center", false, false, false, false, false)
		


        dxDrawImage(x*570, y*247, x*250, y*220, "files/img/arrow.png", 0, 0, 0 , tocolor(255, 255, 255, 255), false)		

end

local motor = "#00FF00ON"
local lanterna = "#FF0000OFF"
local trancar = "#FF0000OFF"
local freio = "#FF0000OFF"

local parte3 = false
function part3()


        dxDrawRectangle(x*447, y*220, x*524, y*155, tocolor(0, 0, 0, 180), false)
        dxDrawEmptyRec(x*447, y*220, x*524, y*155, tocolor(0, 0, 0, 255), 2)

        dxDrawRectangle(x*447, y*220, x*524, y*35, tocolor(0, 0, 0, 180), false)
        dxDrawText("MOTOR", x*720, y*13, x*715, y*465, tocolor(255, 255, 255, 255), x*1.0, font_Menu, "center", "center", false, false, false, false, false)
		
		dxDrawImage(x*480, y*270, x*60, y*50, "files/img/motor.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
		dxDrawImage(x*620, y*270, x*60, y*50, "files/img/farol.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
		dxDrawImage(x*750, y*270, x*60, y*50, "files/img/cadiado.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
		dxDrawImage(x*880, y*270, x*60, y*45, "files/img/freio.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)
		
		
        dxDrawEmptyRec(x*470, y*325, x*80, y*30, tocolor(0, 0, 0, 255), 3)
		dxDrawRectangle(x*470, y*325, x*80, y*30, cor[41], false)
		
		dxDrawEmptyRec(x*605, y*325, x*80, y*30, tocolor(0, 0, 0, 255), 3)
		dxDrawRectangle(x*605, y*325, x*80, y*30, cor[42], false)

        dxDrawEmptyRec(x*740, y*325, x*80, y*30, tocolor(0, 0, 0, 255), 3)
		dxDrawRectangle(x*740, y*325, x*80, y*30, cor[43], false)

        dxDrawEmptyRec(x*870, y*325, x*80, y*30, tocolor(0, 0, 0, 255), 3)
		dxDrawRectangle(x*870, y*325, x*80, y*30, cor[44], false)	
		
		cor[41] = tocolor(0, 0, 0, 180)
	    if isCursorOnElement(x*470, y*325, x*80, y*30) then cor[41] = tocolor(173, 255, 47) end
		cor[42] = tocolor(0, 0, 0, 180)
	    if isCursorOnElement(x*605, y*325, x*80, y*30) then cor[42] = tocolor(173, 255, 47) end
		cor[43] = tocolor(0, 0, 0, 180)
	    if isCursorOnElement(x*740, y*325, x*80, y*30) then cor[43] = tocolor(173, 255, 47) end
		cor[44] = tocolor(0, 0, 0, 180)
	    if isCursorOnElement(x*870, y*325, x*80, y*30) then cor[44] = tocolor(173, 255, 47) end
		
		dxDrawText(motor, x*305, y*218, x*715, y*465, tocolor(255, 255, 255, 255), x*1.0, font_Menu, "center", "center", false, false, true, true, false)
		dxDrawText(lanterna, x*580, y*218, x*715, y*465, tocolor(255, 255, 255, 255), x*1.0, font_Menu, "center", "center", false, false, true, true, false)
		dxDrawText(trancar, x*845, y*218, x*715, y*465, tocolor(255, 255, 255, 255), x*1.0, font_Menu, "center", "center", false, false, true, true, false)
		dxDrawText(freio, x*1105, y*218, x*715, y*465, tocolor(255, 255, 255, 255), x*1.0, font_Menu, "center", "center", false, false, true, true, false)		
end		
alpha1 = 0

local parte4 = false
function part4()

        dxDrawRectangle(x*430, y*160, x*520, y*285, tocolor(0, 0, 0, 180), false)
        dxDrawEmptyRec(x*430, y*160, x*520, y*285, tocolor(0, 0, 0, 255), 2)

        dxDrawRectangle(x*430, y*160, x*520, y*35, tocolor(0, 0, 0, 180), false)
        dxDrawText("CONTROLE DAS RODAS", x*665, y*13, x*715, y*345, tocolor(255, 255, 255, 255), x*1.0, font_Menu, "center", "center", false, false, false, false, false)
		
		dxDrawImage(x*542, y*222.5, x*81, y*55, "files/img/roda.png", 0, 0, 0, tocolor(255, 255, 255, alpha1), true)
		dxDrawImage(x*542, y*341.5, x*81, y*55, "files/img/roda.png", 0, 0, 0, tocolor(255, 255, 255, alpha1), true)
		
		dxDrawImage(x*760, y*222.5, x*81, y*55, "files/img/roda.png", 0, 0, 0, tocolor(255, 255, 255, alpha1), true)
		dxDrawImage(x*760, y*341.5, x*81, y*55, "files/img/roda.png", 0, 0, 0, tocolor(255, 255, 255, alpha1), true)
	
		

		
		
		
		

	    dxDrawImage(x*473, y*215, x*81, y*69, "files/img/seta3.png", 180, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(x*473, y*334, x*81, y*69, "files/img/seta3.png", 180, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(x*687, y*334, x*81, y*69, "files/img/seta3.png", 180, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(x*687, y*215, x*81, y*69, "files/img/seta3.png", 180, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(x*609, y*215, x*81, y*69, "files/img/seta3.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(x*609, y*334, x*81, y*69, "files/img/seta3.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(x*834, y*334, x*81, y*69, "files/img/seta3.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(x*834, y*215, x*81, y*69, "files/img/seta3.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
		
end

local parte5 = false
function part5()
	local seconds = getTickCount() / 1000
	local angle = math.sin(seconds) * 10

	img[12] = "files/img/seta.png"
	img[13] = "files/img/seta.png"

        dxDrawRectangle(x*430, y*160, x*530, y*285, tocolor(0, 0, 0, 180), false)
        dxDrawEmptyRec(x*430, y*160, x*530, y*285, tocolor(0, 0, 0, 255), 2)

        dxDrawRectangle(x*430, y*160, x*530, y*35, tocolor(0, 0, 0, 180), false)
        dxDrawText("CONFIGURAÇÃO 2", x*665, y*13, x*715, y*345, tocolor(255, 255, 255, 255), x*1.0, font_Menu, "center", "center", false, false, false, false, false)
		
		dxDrawImage(x*570, y*200, x*250, y*120, "files/img/car.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
		
    if cursorPosition(x*604, y*285, x*50, y*50) then img[12] = "files/img/seta2.png" end
	if cursorPosition(x*750, y*302, x*50, y*50) then img[13] = "files/img/seta2.png" end
	
	    dxDrawImage(x*604, y*285, x*50, y*50, img[12], angle, 0, -20 , tocolor(255, 255, 255, 255), true)
        dxDrawImage(x*750, y*317, x*50, y*50, img[13], angle+180, 0, -20, tocolor(255, 255, 255, 255), true)
		
		
		dxDrawRectangle(x*450, y*360, x*150, y*40, cor[14], false)
		dxDrawRectangle(x*620, y*360, x*150, y*40, cor[15], false)
		dxDrawRectangle(x*790, y*360, x*150, y*40, cor[16], false)
		 dxDrawEmptyRec(x*450, y*360, x*150, y*40, tocolor(0, 0, 0, 255), 2)
		  dxDrawEmptyRec(x*620, y*360, x*150, y*40, tocolor(0, 0, 0, 255), 2)
		   dxDrawEmptyRec(x*790, y*360, x*150, y*40, tocolor(0, 0, 0, 255), 2)
		
	
		cor[14] = tocolor(0, 0, 0, 140)
	    if isCursorOnElement(x*450, y*360, x*150, y*40) then cor[14] = tocolor(173, 255, 47) end
		cor[15] = tocolor(0, 0, 0, 140)
	    if isCursorOnElement(x*620, y*360, x*150, y*40) then cor[15] = tocolor(173, 255, 47) end
		cor[16] = tocolor(0, 0, 0, 140)
	    if isCursorOnElement(x*790, y*360, x*150, y*40) then cor[16] = tocolor(173, 255, 47) end	

        dxDrawText("REPARAR", x*335, y*13, x*715, y*747, tocolor(255, 255, 255, 255), x*1.0, font_Menu, "center", "center", false, false, false, false, true)	
        dxDrawText("VIRAR", x*680, y*13, x*715, y*747, tocolor(255, 255, 255, 255), x*1.0, font_Menu, "center", "center", false, false, false, false, true)	
        dxDrawText("NITRO", x*1007, y*13, x*715, y*747, tocolor(255, 255, 255, 255), x*1.0, font_Menu, "center", "center", false, false, false, false, true)			



end

local parte6 = false
function part6()

        dxDrawRectangle(x*430, y*160, x*520, y*285, tocolor(0, 0, 0, 180), false)
        dxDrawEmptyRec(x*430, y*160, x*520, y*285, tocolor(0, 0, 0, 255), 2)

        dxDrawRectangle(x*430, y*160, x*520, y*35, tocolor(0, 0, 0, 180), false)
        dxDrawText("LUZES/NEON", x*665, y*13, x*715, y*345, tocolor(255, 255, 255, 255), x*1.0, font_Menu, "center", "center", false, false, false, false, false)
		
		dxDrawImage(x*590, y*222, x*37, y*37, "files/img/bola.png", 0, 0, 0, cor[21])
		dxDrawImage(x*575, y*262, x*37, y*37, "files/img/bola.png", 0, 0, 0, cor[22])
		dxDrawImage(x*590, y*298, x*37, y*37, "files/img/bola.png", 0, 0, 0, cor[23])
		dxDrawImage(x*740, y*222, x*37, y*37, "files/img/bola.png", 0, 0, 0, cor[24])
		dxDrawImage(x*760, y*262, x*37, y*37, "files/img/bola.png", 0, 0, 0, cor[25])
		dxDrawImage(x*740, y*298, x*37, y*37, "files/img/bola.png", 0, 0, 0, cor[26])	
		dxDrawImage(x*650, y*240, x*70, y*80, "files/img/icocar.png", 0, 0, 0, cor[27])	

	cor[21] = tocolor(255, 64, 64)
	cor[22] = tocolor(0, 191, 255)
	cor[23] = tocolor(124, 252, 0)
	cor[24] = tocolor(255, 255, 0)
	cor[25] = tocolor(255, 0, 255)
	cor[26] = tocolor(255, 255, 255, 100)
	cor[27] = tocolor(255, 255, 255, 255)

	if cursorPosition(x*590, y*222, x*37, y*37) then cor[21] = tocolor(238, 59, 59) end
	if cursorPosition(x*575, y*262, x*37, y*37) then cor[22] = tocolor(0, 178, 238) end
	if cursorPosition(x*590, y*298, x*37, y*37) then cor[23] = tocolor(173, 255, 47) end
	if cursorPosition(x*740, y*222, x*37, y*37) then cor[24] = tocolor(255, 215, 0) end
	if cursorPosition(x*760, y*262, x*37, y*37) then cor[25] = tocolor(208, 32, 144) end
	if cursorPosition(x*740, y*298, x*37, y*37) then cor[26] = tocolor(255, 255, 255, 255) end
	if cursorPosition(x*650, y*240, x*70, y*80) then cor[27] = tocolor(0, 0, 0, 220) end
	
	dxDrawText("Cor Do Veiculo", x*655, y*13, x*715, y*747, tocolor(255, 255, 255, 255), x*1.0, font_Menu, "center", "center", false, false, true, true, true)
		  dxDrawRectangle(x*610, y*360, x*150, y*40, tocolor(0, 0, 0, 140), false)
		  dxDrawEmptyRec(x*610, y*360, x*150, y*40, tocolor(0, 0, 0, 255), 2)

	local veiculo = getPedOccupiedVehicle(getLocalPlayer())

	if veiculo then
		local r1, g1, b1, r2, g2, b2 = getVehicleColor(veiculo, true)
		dxDrawRectangle(x*610, y*360, x*150, y*40, tocolor(r1, g1, b1, 255), false)
	else
		dxDrawRectangle(x*610, y*360, x*150, y*40, tocolor(255, 255, 255, 0), false)
	end	  
end

function clickHabilidades(button, state)
	if parte2 and button == "left" and state == "down" then
		if cursorPosition(x*650, y*170, x*90, y*90) then
			triggerServerEvent("porta1", getLocalPlayer())
			playSound( "gfx/button.mp3")
		elseif cursorPosition(x*508, y*290, x*90, y*90) then
			triggerServerEvent("porta2", getLocalPlayer())
			playSound( "gfx/button.mp3")
		elseif cursorPosition(x*785, y*290, x*90, y*90) then
			triggerServerEvent("porta3", getLocalPlayer())
			playSound( "gfx/button.mp3")
		elseif cursorPosition(x*785, y*370, x*90, y*90) then
			triggerServerEvent("porta4", getLocalPlayer())
			playSound( "gfx/button.mp3")
		elseif cursorPosition(x*508, y*370, x*90, y*90) then
			triggerServerEvent("porta5", getLocalPlayer())
			playSound( "gfx/button.mp3")
		elseif cursorPosition(x*650, y*500, x*90, y*90) then
			triggerServerEvent("porta6", getLocalPlayer())
			playSound( "gfx/button.mp3")
		end
	end	
	if parte4 and button == "left" and state == "down" then
	if cursorPosition(x*834, y*215, x*81, y*69) then
			addEventHandler ("onClientRender", root, openTOP)
			playSound( "gfx/button.mp3")
	elseif cursorPosition(x*687, y*215, x*81, y*69) then
			addEventHandler ("onClientRender", root, openTOPp)
			playSound( "gfx/button.mp3")
	elseif cursorPosition(x*609, y*215, x*81, y*69) then
			addEventHandler ("onClientRender", root, openTOPpp)
			playSound( "gfx/button.mp3")
	elseif cursorPosition(x*473, y*215, x*81, y*69) then
			addEventHandler ("onClientRender", root, openTOPppp)
			playSound( "gfx/button.mp3")
	elseif cursorPosition(x*834, y*334, x*81, y*69) then
			addEventHandler ("onClientRender", root, openTOPpppp)
			playSound( "gfx/button.mp3")
	elseif cursorPosition(x*687, y*334, x*81, y*69) then
			addEventHandler ("onClientRender", root, openTOPppppp)
			playSound( "gfx/button.mp3")
	elseif cursorPosition(x*609, y*334, x*81, y*69) then
			addEventHandler ("onClientRender", root, openTOPpppppp)
			playSound( "gfx/button.mp3")
	elseif cursorPosition(x*473, y*334, x*81, y*69) then
			addEventHandler ("onClientRender", root, openTOPppppppp)
			playSound( "gfx/button.mp3")
		end
	end	
	if parte5 and button == "left" and state == "down" then
		if cursorPosition(x*604, y*285, x*50, y*50) then
			triggerServerEvent("subir", getLocalPlayer())
			playSound( "gfx/decer.mp3")
		elseif cursorPosition(x*750, y*302, x*50, y*50) then
			triggerServerEvent("descer", getLocalPlayer())
			playSound( "gfx/decer.mp3")
		elseif cursorPosition(x*450, y*360, x*150, y*40) then
			triggerServerEvent("reparar", getLocalPlayer())
			playSound( "gfx/button.mp3")
		elseif cursorPosition(x*620, y*360, x*150, y*40) then
			triggerServerEvent("virar", getLocalPlayer())
			playSound( "gfx/button.mp3")
		elseif cursorPosition(x*790, y*360, x*150, y*40) then
			triggerServerEvent("nitro", getLocalPlayer())
			playSound( "gfx/button.mp3")
		end
	end	
	if parte6 and button == "left" and state == "down" then
		if cursorPosition(x*590, y*222, x*37, y*37) then
setElementData( localPlayer, "neon", idModel[1] )
playSound( "gfx/button.mp3")
outputChatBox("#FFFFFF[#ADFF2FVeiculo#FFFFFF:#ADFF2FNeon#FFFFFF] #ADFF2FVocê Pegou O Neon Vermelho", 255,255,255, true)
local theVehicle = getPedOccupiedVehicle ( localPlayer )
triggerServerEvent ("detachNeon", getLocalPlayer(), theVehicle)
triggerServerEvent ("attachNeon", getLocalPlayer(), theVehicle)
		elseif cursorPosition(x*575, y*262, x*37, y*37) then
setElementData( localPlayer, "neon", idModel[2] )
playSound( "gfx/button.mp3")
outputChatBox("#FFFFFF[#ADFF2FVeiculo#FFFFFF:#ADFF2FNeon#FFFFFF] #ADFF2FVocê Pegou O Neon Azul", 255,255,255, true)
local theVehicle = getPedOccupiedVehicle ( localPlayer )
triggerServerEvent ("detachNeon", getLocalPlayer(), theVehicle)
triggerServerEvent ("attachNeon", getLocalPlayer(), theVehicle)
		elseif cursorPosition(x*590, y*298, x*37, y*37) then
setElementData( localPlayer, "neon", idModel[3] )
playSound( "gfx/button.mp3")
outputChatBox("#FFFFFF[#ADFF2FVeiculo#FFFFFF:#ADFF2FNeon#FFFFFF] #ADFF2FVocê Pegou O Neon Verde", 255,255,255, true)
local theVehicle = getPedOccupiedVehicle ( localPlayer )
triggerServerEvent ("detachNeon", getLocalPlayer(), theVehicle)
triggerServerEvent ("attachNeon", getLocalPlayer(), theVehicle)
		elseif cursorPosition(x*740, y*222, x*37, y*37) then
setElementData( localPlayer, "neon", idModel[4] )
playSound( "gfx/button.mp3")
outputChatBox("#FFFFFF[#ADFF2FVeiculo#FFFFFF:#ADFF2FNeon#FFFFFF] #ADFF2FVocê Pegou O Neon Amarelo", 255,255,255, true)
local theVehicle = getPedOccupiedVehicle ( localPlayer )
triggerServerEvent ("detachNeon", getLocalPlayer(), theVehicle)
triggerServerEvent ("attachNeon", getLocalPlayer(), theVehicle)
		elseif cursorPosition(x*760, y*262, x*37, y*37) then
setElementData( localPlayer, "neon", idModel[5] )
playSound( "gfx/button.mp3")
outputChatBox("#FFFFFF[#ADFF2FVeiculo#FFFFFF:#ADFF2FNeon#FFFFFF] #ADFF2FVocê Pegou O Neon Rosa", 255,255,255, true)
local theVehicle = getPedOccupiedVehicle ( localPlayer )
triggerServerEvent ("detachNeon", getLocalPlayer(), theVehicle)
triggerServerEvent ("attachNeon", getLocalPlayer(), theVehicle)
		elseif cursorPosition(x*650, y*240, x*70, y*80) then
setElementData( localPlayer, "neon", idModel[0] )
playSound( "gfx/button.mp3")
outputChatBox("#FFFFFF[#ADFF2FVeiculo#FFFFFF:#ADFF2FNeon#FFFFFF] #ADFF2FVocê Removeu O Neon", 255,255,255, true)
local theVehicle = getPedOccupiedVehicle ( localPlayer )
triggerServerEvent ("detachNeon", getLocalPlayer(), theVehicle)
triggerServerEvent ("attachNeon", getLocalPlayer(), theVehicle)
		elseif cursorPosition(x*740, y*298, x*37, y*37) then
setElementData( localPlayer, "neon", idModel[6] )
playSound( "gfx/button.mp3")
outputChatBox("#FFFFFF[#ADFF2FVeiculo#FFFFFF:#ADFF2FNeon#FFFFFF] #ADFF2FVocê Pegou O Neon Branco", 255,255,255, true)
local theVehicle = getPedOccupiedVehicle ( localPlayer )
triggerServerEvent ("detachNeon", getLocalPlayer(), theVehicle)
triggerServerEvent ("attachNeon", getLocalPlayer(), theVehicle)	
        elseif cursorPosition(x*610, y*360, x*150, y*40) then	
            openColorPicker()			
		end
	end		
end
addEventHandler("onClientClick", getRootElement(), clickHabilidades)

function clickcb1 (_,state)
   if parte3 == true then
    if state == "down" then
	 if isCursorOnElement (x*470, y*325, x*80, y*30) then
	 playSound( "gfx/button.mp3")
		if motor == "#00FF00ON" then
	   motor = "#FF0000OFF"
	   triggerServerEvent ("m1", localPlayer)
	   elseif motor == "#FF0000OFF" then
	   motor = "#00FF00ON"
	   triggerServerEvent ("motor1", localPlayer)
	   playSound( "files/sons/padrao.mp3")
                 end
            end
        end
    end
end
addEventHandler ("onClientClick", root, clickcb1)

function clickcb2 (_,state)
   if parte3 == true then
    if state == "down" then
	 if isCursorOnElement (x*605, y*325, x*80, y*30) then
	 playSound( "gfx/button.mp3")
		if lanterna == "#FF0000OFF" then
	   lanterna = "#00FF00ON"
	   triggerServerEvent ("l1", localPlayer)
	   elseif lanterna == "#00FF00ON" then
	   lanterna = "#FF0000OFF"
	   triggerServerEvent ("l2", localPlayer)
                 end
            end
        end
    end
end
addEventHandler ("onClientClick", root, clickcb2)

function clickcb3 (_,state)
   if parte3 == true then
    if state == "down" then
	 if isCursorOnElement (x*740, y*325, x*80, y*30) then
	 playSound( "gfx/button.mp3")
		if trancar == "#00FF00ON" then
	   trancar = "#FF0000OFF"
	   triggerServerEvent ("t1", localPlayer)
	   elseif trancar == "#FF0000OFF" then
	   trancar = "#00FF00ON"
	   triggerServerEvent ("t2", localPlayer)
                 end
            end
        end
    end
end
addEventHandler ("onClientClick", root, clickcb3)

function clickcb4 (_,state)
   if parte3 == true then
    if state == "down" then
	 if isCursorOnElement (x*870, y*325, x*80, y*30) then
	 playSound( "gfx/button.mp3")
		if freio == "#FF0000OFF" then
	   freio = "#00FF00ON"
	   triggerServerEvent ("l4", localPlayer)
	   elseif freio == "#00FF00ON" then
	   freio = "#FF0000OFF"
	   triggerServerEvent ("l3", localPlayer)
                 end
            end
        end
    end
end
addEventHandler ("onClientClick", root, clickcb4)

function painelClickPartes(botao, state)
	if parte1 == true and parte2 == false and botao == "left" and state == "down" then
		if isCursorOnElement(x*1273, y*160, x*60, y*50) then		
			parte1 = true
			parte2 = true
			parte3 = false
			parte4 = false
			parte5 = false
			parte6 = false
			playSound( "gfx/button.mp3")

			addEventHandler ("onClientRender", root, part2)
			removeEventHandler ("onClientRender", root, part3)
			removeEventHandler ("onClientRender", root, part4)
			removeEventHandler ("onClientRender", root, part5)
			removeEventHandler ("onClientRender", root, part6)
		end
	end
	if parte1 == true and parte3 == false and botao == "left" and state == "down" then
		if isCursorOnElement(x*1273, y*230, x*60, y*50) then		
			parte1 = true
			parte2 = false
			parte3 = true
			parte4 = false
			parte5 = false
			parte6 = false
			playSound( "gfx/button.mp3")

			addEventHandler ("onClientRender", root, part3)
			removeEventHandler ("onClientRender", root, part2)
			removeEventHandler ("onClientRender", root, part4)
			removeEventHandler ("onClientRender", root, part5)
			removeEventHandler ("onClientRender", root, part6)
		end
	end		
	if parte1 == true and parte4 == false and botao == "left" and state == "down" then
		if isCursorOnElement(x*1275, y*307, x*60, y*50) then		
			parte1 = true
			parte2 = false
			parte3 = false
			parte4 = true
			parte5 = false
			parte6 = false
			playSound( "gfx/button.mp3")

			addEventHandler ("onClientRender", root, part4)
			removeEventHandler ("onClientRender", root, part2)
			removeEventHandler ("onClientRender", root, part3)
			removeEventHandler ("onClientRender", root, part5)
			removeEventHandler ("onClientRender", root, part6)
		end
	end	
	if parte1 == true and parte5 == false and botao == "left" and state == "down" then
		if isCursorOnElement(x*1274, y*387, x*60, y*50) then		
			parte1 = true
			parte2 = false
			parte3 = false
			parte4 = false
			parte5 = true
			parte6 = false
			playSound( "gfx/button.mp3")
			

			addEventHandler ("onClientRender", root, part5)
			removeEventHandler ("onClientRender", root, part2)
			removeEventHandler ("onClientRender", root, part3)
			removeEventHandler ("onClientRender", root, part4)
			removeEventHandler ("onClientRender", root, part6)
		end
	end	
	if parte1 == true and parte6 == false and botao == "left" and state == "down" then
		if isCursorOnElement(x*1275, y*460, x*60, y*50) then		
			parte1 = true
			parte2 = false
			parte3 = false
			parte4 = false
			parte5 = false
			parte6 = true
			playSound( "gfx/button.mp3")

			addEventHandler ("onClientRender", root, part6)
			removeEventHandler ("onClientRender", root, part2)
			removeEventHandler ("onClientRender", root, part3)
			removeEventHandler ("onClientRender", root, part4)
			removeEventHandler ("onClientRender", root, part5)
		end
	end		
end
addEventHandler("onClientClick", getRootElement(), painelClickPartes)

function dxPainelAbrir()
if parte1 == false then
if not fontScale then fontScale = screenW/40 end
addEventHandler ("onClientRender", root, part1)
tick1 = getTickCount()
setElementData(localPlayer, "shaderVIP", true)
playSound( "gfx/painel.mp3")
parte1 = true 
showCursor (true)
else
colorPicker.closeSelect()
removeEventHandler ("onClientRender", root, part1)
removeEventHandler ("onClientRender", root, part2)
removeEventHandler ("onClientRender", root, part3)
removeEventHandler ("onClientRender", root, part4)
removeEventHandler ("onClientRender", root, part5)
removeEventHandler ("onClientRender", root, part6)
setElementData(localPlayer, "shaderVIP", false)
playSound( "gfx/painel.mp3")
parte1 = false
parte2 = false
parte3 = false
parte4 = false
parte5 = false
parte6 = false
showCursor (false) 
end
end
bindKey("F5", "down", dxPainelAbrir)

local x,y = guiGetScreenSize()

function dxDrawEmptyRec(absX, absY, sizeX, sizeY, color, ancho)
	dxDrawRectangle(absX, absY, sizeX, ancho, color)
	dxDrawRectangle(absX, absY + ancho, ancho, sizeY - ancho, color)
	dxDrawRectangle(absX + ancho, absY + sizeY - ancho, sizeX - ancho, ancho, color)
	dxDrawRectangle(absX + sizeX - ancho, absY + ancho, ancho, sizeY - ancho * 2, color)
end
 
function isCursorOnElement(x,y,w,h)
 local mx,my = getCursorPosition ()
 local fullx,fully = guiGetScreenSize()
 cursorx,cursory = mx*fullx,my*fully
 if cursorx > x and cursorx < x + w and cursory > y and cursory < y + h then
  return true
 else
  return false
 end
end

if fileExists("s.lua") then fileDelete("s.lua") end

local alphaState = true

function alphaFunction()
	if alphaState == true then
		alpha = alpha + 90
	if alpha >= 255 then
		alphaState = false
	end
	end
	if alphaState == false then
		alpha = alpha - 80
	if alpha <= 155 then
		alphaState = true
		end
	end
end
addEventHandler("onClientRender", getRootElement(), alphaFunction)

local alphaState1 = true

function alphaFunction1()
	if alphaState1 == true then
		alpha1 = alpha1 + 30
	if alpha1 >= 255 then
		alphaState1 = false
	end
	end
	if alphaState1 == false then
		alpha1 = alpha1 - 30
	if alpha1 <= 0 then
		alphaState1 = true
		end
	end
end
addEventHandler("onClientRender", getRootElement(), alphaFunction1)

function isMousePosition(x,y,w,h)
	if (not isCursorShowing()) then
		return false
	end
	local mx,my = getCursorPosition ()
	local fullx,fully = guiGetScreenSize()
	cursorx,cursory = mx*fullx,my*fully
	if cursorx > x and cursorx < x + w and cursory > y and cursory < y + h then
		return true
	else
		return false
	end
end

function isMouseInPosition(x,y,width,height)
    local cx, cy = getCursorPosition()
    local cx, cy = (cx*sx), (cy*sy)
    if (cx >= x and cx <= x + width) and (cy >= y and cy <= y + height) then
        return true
    else
        return false
    end
end

function cursorPosition(x, y, w, h)
	if (not isCursorShowing()) then
		return false
	end
	local mx, my = getCursorPosition()
	local fullx, fully = guiGetScreenSize()
	cursorx, cursory = mx*fullx, my*fully
	if cursorx > x and cursorx < x + w and cursory > y and cursory < y + h then
		return true
	else
		return false
	end
end

function replaceTXD() 
txd = engineLoadTXD ( "models/MatTextures.txd" )
engineImportTXD ( txd, idModel[1] )
engineImportTXD ( txd, idModel[2] )
engineImportTXD ( txd, idModel[3] )
engineImportTXD ( txd, idModel[4] )
engineImportTXD ( txd, idModel[5] )
engineImportTXD ( txd, idModel[6] )

col = engineLoadCOL("models/RedNeonTube1.col")
engineReplaceCOL(col, idModel[1])
col = engineLoadCOL("models/BlueNeonTube1.col")
engineReplaceCOL(col, idModel[2])
col = engineLoadCOL("models/GreenNeonTube1.col")
engineReplaceCOL(col, idModel[3])
col = engineLoadCOL("models/YellowNeonTube1.col")
engineReplaceCOL(col, idModel[4])
col = engineLoadCOL("models/PinkNeonTube1.col")
engineReplaceCOL(col, idModel[5])
col = engineLoadCOL("models/WhiteNeonTube1.col")
engineReplaceCOL(col, idModel[6])

dff = engineLoadDFF ( "models/RedNeonTube1.dff", idModel[1] )
engineReplaceModel ( dff, idModel[1] ) 
dff = engineLoadDFF ( "models/BlueNeonTube1.dff", idModel[2] )
engineReplaceModel ( dff, idModel[2] ) 
dff = engineLoadDFF ( "models/GreenNeonTube1.dff", idModel[3] )
engineReplaceModel ( dff, idModel[3] ) 
dff = engineLoadDFF ( "models/YellowNeonTube1.dff", idModel[4] )
engineReplaceModel ( dff, idModel[4] ) 
dff = engineLoadDFF ( "models/PinkNeonTube1.dff", idModel[5] )
engineReplaceModel ( dff, idModel[5] ) 
dff = engineLoadDFF ( "models/WhiteNeonTube1.dff", idModel[6] )
engineReplaceModel ( dff, idModel[6] ) 
end
addEventHandler ( "onClientResourceStart", getResourceRootElement(getThisResource()), replaceTXD)

function openTOP() 
local theVeh = getPedOccupiedVehicle(localPlayer) 
local getComponent = getVehicleComponents(theVeh) 
if (theVeh) then 
for wheel_rf_dummy in pairs (getComponent) do 
local x, y, z = getVehicleComponentPosition(theVeh, "wheel_rf_dummy")  
setVehicleComponentPosition(theVeh, "wheel_rf_dummy", x+0.001, y, z)  ----aumetar
removeEventHandler("onClientRender", getRootElement(), openTOP)
end 
end 
end



function openTOPp() 
local theVeh = getPedOccupiedVehicle(localPlayer) 
local getComponent = getVehicleComponents(theVeh) 
if (theVeh) then 
for wheel_rf_dummy in pairs (getComponent) do 
local x, y, z = getVehicleComponentPosition(theVeh, "wheel_rf_dummy")   --- diminuir
setVehicleComponentPosition(theVeh, "wheel_rf_dummy", x-0.001, y, z)
removeEventHandler("onClientRender", getRootElement(), openTOPp)
end 
end 
end

--------------------------------------------

function openTOPpp() 
local theVeh = getPedOccupiedVehicle(localPlayer) 
local getComponent = getVehicleComponents(theVeh) 
if (theVeh) then 
for wheel_lf_dummy in pairs (getComponent) do 
local x, y, z = getVehicleComponentPosition(theVeh, "wheel_lf_dummy") 
setVehicleComponentPosition(theVeh, "wheel_lf_dummy", x+0.001, y, z)
removeEventHandler("onClientRender", getRootElement(), openTOPpp) 
end 
end 
end


function openTOPppp() 
local theVeh = getPedOccupiedVehicle(localPlayer) 
local getComponent = getVehicleComponents(theVeh) 
if (theVeh) then 
for wheel_lf_dummy in pairs (getComponent) do 
local x, y, z = getVehicleComponentPosition(theVeh, "wheel_lf_dummy") 
setVehicleComponentPosition(theVeh, "wheel_lf_dummy", x-0.001, y, z)
removeEventHandler("onClientRender", getRootElement(), openTOPppp) 
end 
end 
end
----------------------------------


function openTOPpppp() 
local theVeh = getPedOccupiedVehicle(localPlayer) 
local getComponent = getVehicleComponents(theVeh) 
if (theVeh) then 
for wheel_rb_dummy in pairs (getComponent) do 
local x, y, z = getVehicleComponentPosition(theVeh, "wheel_rb_dummy") 
setVehicleComponentPosition(theVeh, "wheel_rb_dummy", x+0.001, y, z) 
removeEventHandler("onClientRender", getRootElement(), openTOPpppp)
end 
end 
end

function openTOPppppp() 
local theVeh = getPedOccupiedVehicle(localPlayer) 
local getComponent = getVehicleComponents(theVeh) 
if (theVeh) then 
for wheel_rb_dummy in pairs (getComponent) do 
local x, y, z = getVehicleComponentPosition(theVeh, "wheel_rb_dummy") 
setVehicleComponentPosition(theVeh, "wheel_rb_dummy", x-0.001, y, z)
removeEventHandler("onClientRender", getRootElement(), openTOPppppp) 
end 
end 
end

------------------

function openTOPpppppp() 
local theVeh = getPedOccupiedVehicle(localPlayer) 
local getComponent = getVehicleComponents(theVeh) 
if (theVeh) then 
for wheel_lb_dummy in pairs (getComponent) do 
local x, y, z = getVehicleComponentPosition(theVeh, "wheel_lb_dummy") 
setVehicleComponentPosition(theVeh, "wheel_lb_dummy", x+0.001, y, z)
removeEventHandler("onClientRender", getRootElement(), openTOPpppppp)  
end 
end 
end



function openTOPppppppp() 
local theVeh = getPedOccupiedVehicle(localPlayer) 
local getComponent = getVehicleComponents(theVeh) 
if (theVeh) then 
for wheel_lb_dummy in pairs (getComponent) do 
local x, y, z = getVehicleComponentPosition(theVeh, "wheel_lb_dummy") 
setVehicleComponentPosition(theVeh, "wheel_lb_dummy", x-0.001, y, z)
removeEventHandler("onClientRender", getRootElement(), openTOPppppppp) 
end 
end 
end

------------

-- //#Mensages

mensages = {}
messagetick = 0

function servermessages(message, type)
	table.insert(mensages, {message, type or "confirm", getTickCount(), dxGetTextWidth(message, fontScale*0.06, font_Menu) + screenH*0.01, 0, 0, 0})
	messagetick = getTickCount()
end
addEvent("servermessages", true)
addEventHandler("servermessages", getRootElement(), servermessages)


function renderMensages()
	local msgd = mensages
	if #msgd ~= 0 then
		local startY = screenW*0.3
		local i = 1
		repeat
			mData = msgd[i]
			local drawThis = true
			if i~= 1 then
				startY = startY + screenW*0.0425
			end
			if mData[5] == 0 and mData[6] == 0 then
				mData[5] = - mData[4] - screenH*0.015
				mData[6] = startY
				mData[7] = startY
			end
			local tick = getTickCount() - mData[3]
			local posX, posY, alpha
			if tick < 1000 then
				local progress = math.min(tick/1000,1)
				mData[5] = interpolateBetween(mData[5], 0, 0, 0, 0, 0, progress, "Linear")
			elseif tick >= 1000  and tick <= 7000 then
				mData[5] = 0
			elseif tick > 7000 then
				local progress = math.min((tick - 7000)/1000,1)
				mData[5] = interpolateBetween(mData[5], 0, 0, - mData[4] - mData[4] - screenH*0.015, 0, 0, progress, "Linear")
				if progress >= 1 then
					table.remove(msgd, i)
					drawThis = false
					messagetick = getTickCount()
				end
			end
			local globalTick = getTickCount() - messagetick
			if drawThis then
				mData[7] = startY
				mData[6] = interpolateBetween(mData[6], 0, 0, mData[7], 0, 0, math.min(globalTick/1000,1), "Linear")
				posX = mData[5]
				posY = mData[6]
				alpha = 255
				dxDrawRectangle(posX, posY, mData[4], screenW*0.04, tocolor(0, 0, 0, alpha*0.75), true)
				local r, g, b = 0, 255, 0
				if mData[2] == "warning" then
					r, g, b = 255, 0, 0
				end
				dxDrawRectangle(posX + mData[4], posY, screenH*0.010, screenW*0.04, tocolor(r, g, b, alpha*0.85), true)
				dxDrawText(mData[1], posX, posY, posX + mData[4], posY + screenW*0.04, tocolor(255, 255, 255, alpha), fontScale*0.05, "normal-sans", "center", "center", false, false, true, false, false)
			end
			i = i + 1
		until i > #msgd
		mensages = msgd
	end
end
addEventHandler("onClientRender", getRootElement(), renderMensages)

function openColorPicker()
	veiculo = getPedOccupiedVehicle(getLocalPlayer())
	if (veiculo) then
		colorPicker.openSelect(colors)
		playSound( "gfx/button.mp3")
	end
end

function closedColorPicker()
	local r1, g1, b1, r2, g2, b2 = getVehicleColor(veiculo, true)
	local r, g, b = getVehicleHeadLightColor(veiculo)
	triggerServerEvent("cor1", getLocalPlayer(), r1, g1, b1, r2, g2, b2, veiculo)
	triggerServerEvent("cor2", getLocalPlayer(), r ,g, b, veiculo)
	setVehicleHeadLightColor(veiculo, r, g, b)
	veiculo = nil
end

function updateColor()
	if (not colorPicker.isSelectOpen) then return end
	local r, g, b = colorPicker.updateTempColors()
	if (veiculo and isElement(veiculo)) then
		local r1, g1, b1, r2, g2, b2 = getVehicleColor(veiculo, true)
		if (guiCheckBoxGetSelected(checkColor1)) then
			r1, g1, b1 = r, g, b
		end
		if (guiCheckBoxGetSelected(checkColor2)) then
			r2, g2, b2 = r, g, b
		end
		if (guiCheckBoxGetSelected(checkColor3)) then
			setVehicleHeadLightColor(veiculo, r, g, b)
		end
		setVehicleColor(veiculo, r1, g1, b1, r2, g2, b2)
	end
end
addEventHandler("onClientRender", getRootElement(), updateColor)