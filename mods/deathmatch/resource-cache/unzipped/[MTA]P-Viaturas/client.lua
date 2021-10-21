
 
local screenW,screenH = guiGetScreenSize()
local resW, resH = 1280,1024
local x, y =  (screenW/resW), (screenH/resH)


painel = false
function painelbase ()


-----------------------------------------------------------------BASE-------------------------------------------------------------
dxDrawRectangle(screenW * 0.1453, screenH * 0.2080, screenW * 0.2156, screenH * 0.5029, tocolor(25, 25, 25, 255), false) -- QUADRADO BASE
        dxDrawRectangle(screenW * 0.1453, screenH * 0.2080, screenW * 0.2156, screenH * 0.0059, tocolor(192, 15, 185, 255), false) -- LINHA ROXA
----------------------------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------QUADRADO VTR-----------------------------------------------------------------------------------
        dxDrawRectangle(screenW * 0.1594, screenH * 0.2773, screenW * 0.1898, screenH * 0.0332, tocolor(43, 43, 43, 255), false)
        dxDrawRectangle(screenW * 0.1594, screenH * 0.3105, screenW * 0.1898, screenH * 0.0332, tocolor(31, 31, 31, 255), false)
        dxDrawRectangle(screenW * 0.1594, screenH * 0.3438, screenW * 0.1898, screenH * 0.0332, tocolor(43, 43, 43, 255), false)
        dxDrawRectangle(screenW * 0.1594, screenH * 0.3770, screenW * 0.1898, screenH * 0.0332, tocolor(31, 31, 31, 255), false)
        dxDrawRectangle(screenW * 0.1594, screenH * 0.4102, screenW * 0.1898, screenH * 0.0332, tocolor(43, 43, 43, 255), false)
        dxDrawRectangle(screenW * 0.1594, screenH * 0.4434, screenW * 0.1898, screenH * 0.0332, tocolor(31, 31, 31, 255), false)
        dxDrawRectangle(screenW * 0.1594, screenH * 0.4766, screenW * 0.1898, screenH * 0.0332, tocolor(43, 43, 43, 255), false)   
-------------------------------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------TEXTOS------------------------------------------------------------------------------------------------
dxDrawText("Viatura", screenW * 0.1578, screenH * 0.2773, screenW * 0.3492, screenH * 0.3105, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText("Rocam", screenW * 0.1578, screenH * 0.3105, screenW * 0.3492, screenH * 0.3438, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText("Z1000", screenW * 0.1578, screenH * 0.3438, screenW * 0.3492, screenH * 0.3770, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText("Lamborghini", screenW * 0.1578, screenH * 0.3770, screenW * 0.3492, screenH * 0.4102, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText("Blindado", screenW * 0.1578, screenH * 0.4102, screenW * 0.3492, screenH * 0.4434, tocolor(255, 255, 255, 255), 1.10, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText("Helicoptero 01", screenW * 0.1578, screenH * 0.4434, screenW * 0.3492, screenH * 0.4766, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText("Helicoptero 02", screenW * 0.1578, screenH * 0.4766, screenW * 0.3492, screenH * 0.5098, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText("Blindar", screenW * 0.2039, screenH * 0.7158, screenW * 0.3016, screenH * 0.7705, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)

--------------------------------------------------------------TEXTO BASE--------------------------------------------------------------------------------------------
dxDrawText("Painel Viaturas", screenW * 0.1594, screenH * 0.2236, screenW * 0.2164, screenH * 0.2520, tocolor(255, 255, 255, 255), 0.80, "default-bold", "left", "top", false, false, false, false, false)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------QUADRADO DE BAIXO-----------------------------------------------------------------------------------------------------------
        dxDrawRectangle(screenW * 0.1578, screenH * 0.5400, screenW * 0.1914, screenH * 0.0449, tocolor(28, 28, 28, 255), false)
        dxDrawRectangle(screenW * 0.1578, screenH * 0.5947, screenW * 0.1914, screenH * 0.0459, tocolor(28, 28, 28, 255), false)
        dxDrawRectangle(screenW * 0.1578, screenH * 0.6504, screenW * 0.1914, screenH * 0.0459, tocolor(28, 28, 28, 255), false)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------TEXTOS DE BAIXO-----------------------------------------------------------------------------------------------------------------------------------------------
        dxDrawText(" Destruir", screenW * 0.1789, screenH * 0.5400, screenW * 0.3250, screenH * 0.5850, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText(" Reparar", screenW * 0.1789, screenH * 0.5957, screenW * 0.3250, screenH * 0.6406, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText(" Desvirar", screenW * 0.1789, screenH * 0.6504, screenW * 0.3250, screenH * 0.6953, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------QUADRADO BLINDAR--------------------------------------------------------------------------------------------------------------------------------
        dxDrawLine((screenW * 0.2039) - 1, (screenH * 0.7158) - 1, (screenW * 0.2039) - 1, screenH * 0.7705, tocolor(11, 11, 11, 197), 1, false)
        dxDrawLine(screenW * 0.3016, (screenH * 0.7158) - 1, (screenW * 0.2039) - 1, (screenH * 0.7158) - 1, tocolor(11, 11, 11, 197), 1, false)
        dxDrawLine((screenW * 0.2039) - 1, screenH * 0.7705, screenW * 0.3016, screenH * 0.7705, tocolor(11, 11, 11, 197), 1, false)
        dxDrawLine(screenW * 0.3016, screenH * 0.7705, screenW * 0.3016, (screenH * 0.7158) - 1, tocolor(11, 11, 11, 197), 1, false)
        dxDrawRectangle(screenW * 0.2039, screenH * 0.7158, screenW * 0.0977, screenH * 0.0547, tocolor(25, 25, 25, 255), false)
        dxDrawText("Blindar", screenW * 0.2039, screenH * 0.7158, screenW * 0.3016, screenH * 0.7705, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	if isCursorOnElement ( screenW * 0.1594, screenH * 0.2773, screenW * 0.1898, screenH * 0.0332 ) then ---- Farda 01
        dxDrawRectangle(screenW * 0.1594, screenH * 0.2773, screenW * 0.1898, screenH * 0.0332, tocolor(187, 13, 197, 255), false)
        dxDrawText("Viatura", screenW * 0.1578, screenH * 0.2773, screenW * 0.3492, screenH * 0.3105, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
	end	

    if isCursorOnElement ( screenW * 0.1594, screenH * 0.3105, screenW * 0.1898, screenH * 0.0332 ) then ---- Farda 01
        dxDrawRectangle(screenW * 0.1594, screenH * 0.3105, screenW * 0.1898, screenH * 0.0332, tocolor(187, 13, 197, 255), false)
        dxDrawText("Rocam", screenW * 0.1578, screenH * 0.3105, screenW * 0.3492, screenH * 0.3438, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
	end	

    if isCursorOnElement ( screenW * 0.1594, screenH * 0.3438, screenW * 0.1898, screenH * 0.0332 ) then ---- Farda 01
        dxDrawRectangle(screenW * 0.1594, screenH * 0.3438, screenW * 0.1898, screenH * 0.0332, tocolor(187, 13, 197, 255), false)
        dxDrawText("Z1000", screenW * 0.1578, screenH * 0.3438, screenW * 0.3492, screenH * 0.3770, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
	end	

    if isCursorOnElement ( screenW * 0.1594, screenH * 0.3770, screenW * 0.1898, screenH * 0.0332 ) then ---- Farda 01
        dxDrawRectangle(screenW * 0.1594, screenH * 0.3770, screenW * 0.1898, screenH * 0.0332, tocolor(187, 13, 197, 255), false)
        dxDrawText("Lamborghini", screenW * 0.1578, screenH * 0.3770, screenW * 0.3492, screenH * 0.4102, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
	end	

    if isCursorOnElement ( screenW * 0.1594, screenH * 0.4102, screenW * 0.1898, screenH * 0.0332 ) then ---- Farda 01
        dxDrawRectangle(screenW * 0.1594, screenH * 0.4102, screenW * 0.1898, screenH * 0.0332, tocolor(187, 13, 197, 255), false)
        dxDrawText("Blindado", screenW * 0.1578, screenH * 0.4102, screenW * 0.3492, screenH * 0.4434, tocolor(255, 255, 255, 255), 1.10, "default-bold", "center", "center", false, false, false, false, false)
	end	

    if isCursorOnElement ( screenW * 0.1594, screenH * 0.4434, screenW * 0.1898, screenH * 0.0332 ) then ---- Farda 01
        dxDrawRectangle(screenW * 0.1594, screenH * 0.4434, screenW * 0.1898, screenH * 0.0332, tocolor(187, 13, 197, 255), false)
        dxDrawText("Helicoptero 01", screenW * 0.1578, screenH * 0.4434, screenW * 0.3492, screenH * 0.4766, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
	end	

    if isCursorOnElement ( screenW * 0.1594, screenH * 0.4766, screenW * 0.1898, screenH * 0.0332 ) then ---- Farda 01
        dxDrawRectangle(screenW * 0.1594, screenH * 0.4766, screenW * 0.1898, screenH * 0.0332, tocolor(187, 13, 197, 255), false)
        dxDrawText("Helicoptero 02", screenW * 0.1578, screenH * 0.4766, screenW * 0.3492, screenH * 0.5098, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
	end	

    if isCursorOnElement ( screenW * 0.1578, screenH * 0.5400, screenW * 0.1914, screenH * 0.0449 ) then ---- Farda 01
        dxDrawRectangle(screenW * 0.1578, screenH * 0.5400, screenW * 0.1914, screenH * 0.0449, tocolor(187, 13, 197, 255), false)
        dxDrawText(" Destruir", screenW * 0.1789, screenH * 0.5400, screenW * 0.3250, screenH * 0.5850, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
	end	

    if isCursorOnElement ( screenW * 0.1578, screenH * 0.5947, screenW * 0.1914, screenH * 0.0459 ) then ---- Farda 01
        dxDrawRectangle(screenW * 0.1578, screenH * 0.5947, screenW * 0.1914, screenH * 0.0459, tocolor(187, 13, 197, 255), false)
        dxDrawText(" Reparar", screenW * 0.1789, screenH * 0.5957, screenW * 0.3250, screenH * 0.6406, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
	end	

    if isCursorOnElement ( screenW * 0.1578, screenH * 0.6504, screenW * 0.1914, screenH * 0.0459 ) then ---- Farda 01
        dxDrawRectangle(screenW * 0.1578, screenH * 0.6504, screenW * 0.1914, screenH * 0.0459, tocolor(187, 13, 197, 255), false)
        dxDrawText(" Desvirar", screenW * 0.1789, screenH * 0.6504, screenW * 0.3250, screenH * 0.6953, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
	end	


    end

    bindKey("F5", "down", function()
        if painel == false then
        addEventHandler("onClientRender", getRootElement(), painelbase)
        painel = true
        showCursor(true)
        else
        removeEventHandler("onClientRender", getRootElement(), painelbase)
        painel = false
        showCursor(false)
        end
end)

function fecharpainel (_,state)
if painel == true then
if state == "down" then
if isCursorOnElement (screenW * 0.4297, screenH * 0.7148, screenW * 0.1016, screenH * 0.0537) then
removeEventHandler ("onClientRender", root, painelbase)
showCursor (false)
painel = false
end
end
end
end
addEventHandler ("onClientClick", root, fecharpainel)


function veiculo1 (_,state)
if painel == true then
if  state == "down"  then
if  isCursorOnElement(screenW * 0.1594, screenH * 0.2773, screenW * 0.1898, screenH * 0.0332) then
triggerServerEvent ("carrop1", localPlayer)
end
end
end
end
addEventHandler ("onClientClick", root, veiculo1)

-----------------------------------------------------------------------

function veiculo2 (_,state)
if painel == true then
if  state == "down"  then
if  isCursorOnElement(screenW * 0.1594, screenH * 0.3105, screenW * 0.1898, screenH * 0.0332) then
triggerServerEvent ("carrop2", localPlayer)
end
end
end
end
addEventHandler ("onClientClick", root, veiculo2)


---------------------------------------------------------------------------------------------------------------

function veiculo3 (_,state)
if painel == true then
if  state == "down"  then
if  isCursorOnElement(screenW * 0.1594, screenH * 0.3438, screenW * 0.1898, screenH * 0.0332) then
triggerServerEvent ("carrop3", localPlayer)
end
end
end
end
addEventHandler ("onClientClick", root, veiculo3)

-------------------------------------------------------------------------------------------------------------------------------

function veiculo4 (_,state)
if painel == true then
if  state == "down"  then
if  isCursorOnElement(screenW * 0.1594, screenH * 0.3770, screenW * 0.1898, screenH * 0.0332) then
triggerServerEvent ("carrop4", localPlayer)
end
end
end
end
addEventHandler ("onClientClick", root, veiculo4)

--------------------------------------------------------------------------------------------------------------------------------------------------------

function veiculo5 (_,state)
if painel == true then
if  state == "down"  then
if  isCursorOnElement(screenW * 0.1594, screenH * 0.4102, screenW * 0.1898, screenH * 0.0332) then
triggerServerEvent ("carrop5", localPlayer)
end
end
end
end
addEventHandler ("onClientClick", root, veiculo5)

---------------------------------------------------------------------------------------------------------------------------------------------------

function veiculo6 (_,state)
if painel == true then
if  state == "down"  then
if  isCursorOnElement(screenW * 0.1594, screenH * 0.4434, screenW * 0.1898, screenH * 0.0332) then
triggerServerEvent ("carrop6", localPlayer)
end
end
end
end
addEventHandler ("onClientClick", root, veiculo6)

-------------------------------------------------------------------------------------------------------------------------------------------

function veiculo7 (_,state)
if painel == true then
if  state == "down"  then
if  isCursorOnElement(screenW * 0.1594, screenH * 0.4766, screenW * 0.1898, screenH * 0.0332) then
triggerServerEvent ("carrop7", localPlayer)
end
end
end
end
addEventHandler ("onClientClick", root, veiculo7)

--------------------------------------------------------------------------------------------------------------------------------------------------

function destrui (_,state)
if painel == true then
if  state == "down"  then
if  isCursorOnElement(screenW * 0.1578, screenH * 0.5400, screenW * 0.1914, screenH * 0.0449) then
triggerServerEvent ("destroi", localPlayer)
end
end
end
end
addEventHandler ("onClientClick", root, destrui)

---------------------------------------------------------------------------------------------------------------------------------------------------

function reparar (_,state)
if painel == true then
if  state == "down"  then
if  isCursorOnElement(screenW * 0.1578, screenH * 0.5947, screenW * 0.1914, screenH * 0.0459) then
triggerServerEvent ("reparar", localPlayer)
end
end
end
end
addEventHandler ("onClientClick", root, reparar)

-----------------------------------------------------------------------

function blinda (_,state)
if painel == true then
if  state == "down"  then
if  isCursorOnElement(screenW * 0.2039, screenH * 0.7158, screenW * 0.0977, screenH * 0.0547) then
triggerServerEvent ("blinda", localPlayer)
end
end
end
end
addEventHandler ("onClientClick", root, blinda)

-----------------------------------------------------------------------

function desvirar (_,state)
if painel == true then
if  state == "down"  then
if  isCursorOnElement(screenW * 0.1578, screenH * 0.6504, screenW * 0.1914, screenH * 0.0459) then
triggerServerEvent ("desvirar", localPlayer)
end
end
end
end
addEventHandler ("onClientClick", root, desvirar)

local x,y = guiGetScreenSize()

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





			 