local screenW2,screenH2 = guiGetScreenSize()
local resW2, resH2 = 1366,768
local x, y =  (screenW2/resW2), (screenH2/resH2)

local font_Menu = dxCreateFont("files/font/font.ttf", 15)
local movertexto = 0
local parte1 = false

cor = {}

local idModel = {
[1] = 14399,
[2] = 14400,
[3] = 14401,
[4] = 14402,
[5] = 14403,
[6] = 14404
}

function part1()
	
		movertexto = movertexto + 0.999*3
		local movertexto1, movertexto2 = interpolateBetween (x*1000, y*1060, 0, x*1710, y*1060, 0, movertexto, "SineCurve")
		dxDrawText("", movertexto1, movertexto2, x, y, tocolor(255, 255, 255, 255), x*0.68, font_Menu, "center", "center", false, false, true, true, true)
		
		
        dxDrawRectangle(x*350, y*165, x*655, y*380, tocolor(24, 24, 24, 255), false)
        dxDrawRectangle(x*350, y*165, x*655, y*35, tocolor(0, 0, 0, 197), false)
        dxDrawEmptyRec(x*350, y*165, x*655, y*380, tocolor(0, 0, 0, 255), 2)		
		dxDrawRectangle(x*840, y*165, x*35, y*30, tocolor(0, 0, 0, 0), false)
		dxDrawText("PAINEL VEICULO", x*640, y*13, x*715, y*350, tocolor(255, 255, 255, 255), x*1.0, font_Menu, "center", "center", false, false, false, false, false)


		dxDrawImage(x*390, y*240, x*140, y*140, 'gfx/arrow.png')
		
		dxDrawImage(x*445, y*203, x*30, y*30, "gfx/seta.png", 0, 0, 0, tocolor(255,255,255,255))
		dxDrawImage(x*445, y*389, x*30, y*30, "gfx/seta.png", 180, 0, 0, tocolor(255,255,255,255))	
	
		dxDrawImage(x*365, y*265, x*30, y*30, "gfx/seta.png", 270, 0, 0, tocolor(255,255,255,255))
		dxDrawImage(x*365, y*325, x*30, y*30, "gfx/seta.png", 270, 0, 0, tocolor(255,255,255,255))

		dxDrawImage(x*525, y*265, x*30, y*30, "gfx/seta.png", 90, 0, 0, tocolor(255,255,255,255))
		dxDrawImage(x*525, y*325, x*30, y*30, "gfx/seta.png", 90, 0, 0, tocolor(255,255,255,255))					

		dxDrawText("SUSPENÇÃO", x*1030, y*130, x*715, y*350, tocolor(255, 255, 255, 255), x*1.0, font_Menu, "center", "center", false, false, false, false, false)		
		
		dxDrawImage(x*775, y*242, x*200, y*120, "gfx/car.png", 0, 0, 0, tocolor(255,255,255,255))
		dxDrawImage(x*810, y*333, x*30, y*30, "gfx/seta.png", 0, 0, 0, tocolor(255,255,255,255))
		dxDrawImage(x*922, y*333, x*30, y*30, "gfx/seta.png", 180, 0, 0, tocolor(255,255,255,255))	


		dxDrawImage(x*550, y*423, x*70, y*60, "gfx/motor.png", 0, 0, 0, tocolor(255,255,255,255))	
		dxDrawImage(x*750, y*423, x*70, y*60, "gfx/lanterna.png", 0, 0, 0, tocolor(255,255,255,255))

        dxDrawRectangle(x*520, y*485, x*60, y*25, tocolor(54, 54, 54), false)	
        dxDrawRectangle(x*590, y*485, x*60, y*25, tocolor(54, 54, 54), false)

        dxDrawRectangle(x*720, y*485, x*60, y*25, tocolor(54, 54, 54), false)	
        dxDrawRectangle(x*790, y*485, x*60, y*25, tocolor(54, 54, 54), false)

		dxDrawText("ON", x*386, y*645, x*715, y*350, tocolor(255, 255, 255, 255), x*1.0, font_Menu, "center", "center", false, false, false, false, false)
		dxDrawText("OFF", x*529, y*645, x*715, y*350, tocolor(255, 255, 255, 255), x*1.0, font_Menu, "center", "center", false, false, false, false, false)

		dxDrawText("ON", x*786, y*645, x*715, y*350, tocolor(255, 255, 255, 255), x*1.0, font_Menu, "center", "center", false, false, false, false, false)
		dxDrawText("OFF", x*929, y*645, x*715, y*350, tocolor(255, 255, 255, 255), x*1.0, font_Menu, "center", "center", false, false, false, false, false)		
		
end	
addEventHandler ("onClientClick", root, neon)

function luzon (_,state)
if parte1 == true then
if state == "down" then
if isMousePosition (x*720, y*485, x*60, y*25) then
triggerServerEvent ("l1", getLocalPlayer())
end
end
end
end
addEventHandler ("onClientClick", root, luzon)

function luzoff (_,state)
if parte1 == true then
if state == "down" then
if isMousePosition (x*790, y*485, x*60, y*25) then
triggerServerEvent ("l2", getLocalPlayer())
end
end
end
end
addEventHandler ("onClientClick", root, luzoff)

function motoron (_,state)
if parte1 == true then
if state == "down" then
if isMousePosition (x*520, y*485, x*60, y*25) then
local ligou = playSound("gfx/padrao.mp3")
setSoundVolume(ligou,10)
triggerServerEvent ("m1", getLocalPlayer())
end
end
end
end
addEventHandler ("onClientClick", root, motoron)

function motoroff (_,state)
if parte1 == true then
if state == "down" then
if isMousePosition (x*590, y*485, x*60, y*25) then
triggerServerEvent ("m2", getLocalPlayer())
end
end
end
end
addEventHandler ("onClientClick", root, motoroff)

function subir (_,state)
if parte1 == true then
if state == "down" then
if isCursorOnElement (x*810, y*333, x*30, y*30) then
triggerServerEvent ("subir", getLocalPlayer())
playSound('gfx/subir.mp3')
end
end
end
end
addEventHandler ("onClientClick", root, subir)

function descer (_,state)
if parte1 == true then
if state == "down" then
if isCursorOnElement (x*922, y*333, x*30, y*30) then
triggerServerEvent ("descer", getLocalPlayer())
playSound('gfx/decer.mp3')
end
end
end
end
addEventHandler ("onClientClick", root, descer)

function porta1 (_,state)
if parte1 == true then
if state == "down" then
if isCursorOnElement (x*445, y*203, x*30, y*30) then
triggerServerEvent ("porta1", getLocalPlayer())
end
end
end
end
addEventHandler ("onClientClick", root, porta1)

function porta2 (_,state)
if parte1 == true then
if state == "down" then
if isCursorOnElement (x*365, y*265, x*30, y*30) then
triggerServerEvent ("porta2", getLocalPlayer())
end
end
end
end
addEventHandler ("onClientClick", root, porta2)

function porta3 (_,state)
if parte1 == true then
if state == "down" then
if isCursorOnElement (x*525, y*265, x*30, y*30) then
triggerServerEvent ("porta3", getLocalPlayer())
end
end
end
end
addEventHandler ("onClientClick", root, porta3)

function porta4 (_,state)
if parte1 == true then
if state == "down" then
if isCursorOnElement (x*525, y*325, x*30, y*30) then
triggerServerEvent ("porta4", getLocalPlayer())
end
end
end
end
addEventHandler ("onClientClick", root, porta4)

function porta5 (_,state)
if parte1 == true then
if state == "down" then
if isCursorOnElement (x*365, y*325, x*30, y*30) then
triggerServerEvent ("porta5", getLocalPlayer())
end
end
end
end
addEventHandler ("onClientClick", root, porta5)

function porta6 (_,state)
if parte1 == true then
if state == "down" then
if isCursorOnElement (x*445, y*389, x*30, y*30) then
triggerServerEvent ("porta6", getLocalPlayer())
end
end
end
end
addEventHandler ("onClientClick", root, porta6)	


function dxPainelAbrir()
if parte1 == false then
addEventHandler ("onClientRender", root, part1)
parte1 = true 
showCursor (true)
else
removeEventHandler ("onClientRender", root, part1)
parte1 = false
showCursor (false) 
end
end
bindKey("F4", "down", dxPainelAbrir)

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

addEventHandler ( "onClientResourceStart", getResourceRootElement(getThisResource()), replaceTXD)