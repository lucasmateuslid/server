local screenW,screenH = guiGetScreenSize()
local resW, resH = 1280,1024
local x, y =  (screenW/resW), (screenH/resH)


painel = false
function painelbase ()
        
-------------------------------------------------------------BASE--------------------------------------------------------------
        dxDrawRectangle(screenW * 0.3734, screenH * 0.2080, screenW * 0.2141, screenH * 0.5020, tocolor(25, 25, 25, 255), false) -- QUADRADO PRETO BASE
        dxDrawRectangle(screenW * 0.3734, screenH * 0.2080, screenW * 0.2141, screenH * 0.0059, tocolor(192, 15, 185, 255), false) -- LINHA ROXA
-------------------------------------------------------------------------------------------------------------------------------      

--------------------------------------------------BOTAO FECHAR--------------------------------------------------------------------
dxDrawLine((screenW * 0.4297) - 1, (screenH * 0.7148) - 1, (screenW * 0.4297) - 1, screenH * 0.7686, tocolor(16, 16, 16, 255), 1, false)
dxDrawLine(screenW * 0.5312, (screenH * 0.7148) - 1, (screenW * 0.4297) - 1, (screenH * 0.7148) - 1, tocolor(16, 16, 16, 255), 1, false)
dxDrawLine((screenW * 0.4297) - 1, screenH * 0.7686, screenW * 0.5312, screenH * 0.7686, tocolor(16, 16, 16, 255), 1, false)
dxDrawLine(screenW * 0.5312, screenH * 0.7686, screenW * 0.5312, (screenH * 0.7148) - 1, tocolor(16, 16, 16, 255), 1, false)
dxDrawRectangle(screenW * 0.4297, screenH * 0.7148, screenW * 0.1016, screenH * 0.0537, tocolor(25, 25, 25, 255), false)
dxDrawText(" Fechar", screenW * 0.3859, screenH * 0.7236, screenW * 0.5766, screenH * 0.7588, tocolor(255, 255, 255, 255), 1.10, "default-bold", "center", "center", false, false, false, false, false)
---------------------------------------------------------------------------------------------------------------------








------------------------------------------------------------QUADRADO FARDAS-----------------------------------------------------
        dxDrawRectangle(screenW * 0.3859, screenH * 0.2773, screenW * 0.1906, screenH * 0.0342, tocolor(43, 43, 43, 255), false)  -- QUADRADOS FARDAS
        dxDrawRectangle(screenW * 0.3859, screenH * 0.3115, screenW * 0.1906, screenH * 0.0342, tocolor(31, 31, 31, 255), false)  --
        dxDrawRectangle(screenW * 0.3859, screenH * 0.3457, screenW * 0.1906, screenH * 0.0342, tocolor(43, 43, 43, 255), false)  --
        dxDrawRectangle(screenW * 0.3859, screenH * 0.3799, screenW * 0.1906, screenH * 0.0342, tocolor(31, 31, 31, 255), false)  --
        dxDrawRectangle(screenW * 0.3859, screenH * 0.4141, screenW * 0.1906, screenH * 0.0342, tocolor(43, 43, 43, 255), false)  --
        dxDrawRectangle(screenW * 0.3859, screenH * 0.4482, screenW * 0.1906, screenH * 0.0342, tocolor(31, 31, 31, 255), false)  --
        dxDrawRectangle(screenW * 0.3859, screenH * 0.4824, screenW * 0.1906, screenH * 0.0342, tocolor(43, 43, 43, 255), false)  --
        dxDrawRectangle(screenW * 0.3859, screenH * 0.5166, screenW * 0.1906, screenH * 0.0342, tocolor(31, 31, 31, 255), false)  --
        dxDrawRectangle(screenW * 0.3859, screenH * 0.5508, screenW * 0.1906, screenH * 0.0342, tocolor(43, 43, 43, 255), false)  --
        dxDrawRectangle(screenW * 0.3859, screenH * 0.5850, screenW * 0.1906, screenH * 0.0342, tocolor(31, 31, 31, 255), false)  -- 
        dxDrawRectangle(screenW * 0.3859, screenH * 0.6191, screenW * 0.1906, screenH * 0.0342, tocolor(43, 43, 43, 255), false)  --
        dxDrawRectangle(screenW * 0.3859, screenH * 0.6533, screenW * 0.1906, screenH * 0.0342, tocolor(31, 31, 31, 255), false)  -- QUADRADO FARDAS
--------------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------TEXTO BASE-------------------------------------------------------------

dxDrawText("Painel Fardas", screenW * 0.4359, screenH * 0.2139, screenW * 0.5305, screenH * 0.2393, tocolor(255, 255, 255, 255), 0.85, "default-bold", "center", "center", false, false, false, false, false)
--------------------------------------------------------------------------------------------------------------------------------




---------------------------------------------------------TEXTOS QUADRADOS FARDAS------------------------------------------------
dxDrawText(" Farda 1", screenW * 0.3859, screenH * 0.2764, screenW * 0.5766, screenH * 0.3115, tocolor(255, 255, 255, 255), 1.10, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText(" Farda 2", screenW * 0.3859, screenH * 0.3105, screenW * 0.5766, screenH * 0.3457, tocolor(255, 255, 255, 255), 1.10, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText(" Farda 3", screenW * 0.3859, screenH * 0.3457, screenW * 0.5766, screenH * 0.3809, tocolor(255, 255, 255, 255), 1.10, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText(" Farda 4", screenW * 0.3859, screenH * 0.3809, screenW * 0.5766, screenH * 0.4160, tocolor(255, 255, 255, 255), 1.10, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText(" Farda 5", screenW * 0.3859, screenH * 0.4141, screenW * 0.5766, screenH * 0.4492, tocolor(255, 255, 255, 255), 1.10, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText(" Farda 6", screenW * 0.3859, screenH * 0.4482, screenW * 0.5766, screenH * 0.4834, tocolor(255, 255, 255, 255), 1.10, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText(" Farda 7", screenW * 0.3859, screenH * 0.4824, screenW * 0.5766, screenH * 0.5176, tocolor(255, 255, 255, 255), 1.10, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText(" Farda 8", screenW * 0.3859, screenH * 0.5166, screenW * 0.5766, screenH * 0.5518, tocolor(255, 255, 255, 255), 1.10, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText(" Peladinho", screenW * 0.3859, screenH * 0.5498, screenW * 0.5766, screenH * 0.5850, tocolor(255, 255, 255, 255), 1.10, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText(" Feminina 01", screenW * 0.3859, screenH * 0.5840, screenW * 0.5766, screenH * 0.6191, tocolor(255, 255, 255, 255), 1.10, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText(" Defensores 01", screenW * 0.3859, screenH * 0.6191, screenW * 0.5766, screenH * 0.6543, tocolor(255, 255, 255, 255), 1.10, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText(" Defensores 02", screenW * 0.3859, screenH * 0.6523, screenW * 0.5766, screenH * 0.6875, tocolor(255, 255, 255, 255), 1.10, "default-bold", "center", "center", false, false, false, false, false)
----------------------------------------------------------------------------------------------------------------------------------
	


-----------------------------------------------------------MOUSE CIMA MUDA COR----------------------------------------------------------------
	if isCursorOnElement ( screenW * 0.3859, screenH * 0.2773, screenW * 0.1906, screenH * 0.0342 ) then ---- Farda 01
        dxDrawRectangle(screenW * 0.3859, screenH * 0.2773, screenW * 0.1906, screenH * 0.0342, tocolor(187, 13, 197, 255), false)
        dxDrawText(" Farda 1", screenW * 0.3859, screenH * 0.2764, screenW * 0.5766, screenH * 0.3115, tocolor(255, 255, 255, 255), 1.10, "default-bold", "center", "center", false, false, false, false, false)
	end	
	
	if isCursorOnElement ( screenW * 0.3859, screenH * 0.3115, screenW * 0.1906, screenH * 0.0342 ) then ---- Farda 02
        dxDrawRectangle(screenW * 0.3859, screenH * 0.3115, screenW * 0.1906, screenH * 0.0342, tocolor(187, 13, 197, 255), false)
        dxDrawText(" Farda 2", screenW * 0.3859, screenH * 0.3105, screenW * 0.5766, screenH * 0.3457, tocolor(255, 255, 255, 255), 1.10, "default-bold", "center", "center", false, false, false, false, false)
	end	
	
	if isCursorOnElement ( screenW * 0.3859, screenH * 0.3457, screenW * 0.1906, screenH * 0.0342 ) then ---- Farda 03
        dxDrawRectangle(screenW * 0.3859, screenH * 0.3457, screenW * 0.1906, screenH * 0.0342, tocolor(187, 13, 197, 255), false)
        dxDrawText(" Farda 3", screenW * 0.3859, screenH * 0.3457, screenW * 0.5766, screenH * 0.3809, tocolor(255, 255, 255, 255), 1.10, "default-bold", "center", "center", false, false, false, false, false)
	end
	
	if isCursorOnElement ( screenW * 0.3859, screenH * 0.3799, screenW * 0.1906, screenH * 0.0342 ) then ---- Farda 04
        dxDrawRectangle(screenW * 0.3859, screenH * 0.3799, screenW * 0.1906, screenH * 0.0342, tocolor(187, 13, 197, 255), false)
        dxDrawText(" Farda 4", screenW * 0.3859, screenH * 0.3809, screenW * 0.5766, screenH * 0.4160, tocolor(255, 255, 255, 255), 1.10, "default-bold", "center", "center", false, false, false, false, false)
	end
	
    if isCursorOnElement ( screenW * 0.3859, screenH * 0.4141, screenW * 0.1906, screenH * 0.0342 ) then ---- Farda 05
        dxDrawRectangle(screenW * 0.3859, screenH * 0.4141, screenW * 0.1906, screenH * 0.0342, tocolor(187, 13, 197, 255), false)
        dxDrawText(" Farda 5", screenW * 0.3859, screenH * 0.4141, screenW * 0.5766, screenH * 0.4492, tocolor(255, 255, 255, 255), 1.10, "default-bold", "center", "center", false, false, false, false, false)
	end
	
	 if isCursorOnElement ( screenW * 0.3859, screenH * 0.4482, screenW * 0.1906, screenH * 0.0342 ) then ---- Farda 06
        dxDrawRectangle(screenW * 0.3859, screenH * 0.4482, screenW * 0.1906, screenH * 0.0342, tocolor(187, 13, 197, 255), false)
        dxDrawText(" Farda 6", screenW * 0.3859, screenH * 0.4482, screenW * 0.5766, screenH * 0.4834, tocolor(255, 255, 255, 255), 1.10, "default-bold", "center", "center", false, false, false, false, false)
	end
	
    if isCursorOnElement ( screenW * 0.3859, screenH * 0.4824, screenW * 0.1906, screenH * 0.0342 ) then ---- Farda 07
        dxDrawRectangle(screenW * 0.3859, screenH * 0.4824, screenW * 0.1906, screenH * 0.0342, tocolor(187, 13, 197, 255), false)
        dxDrawText(" Farda 7", screenW * 0.3859, screenH * 0.4824, screenW * 0.5766, screenH * 0.5176, tocolor(255, 255, 255, 255), 1.10, "default-bold", "center", "center", false, false, false, false, false)
	end
	
    if isCursorOnElement ( screenW * 0.3859, screenH * 0.5166, screenW * 0.1906, screenH * 0.0342 ) then ---- Farda 08
        dxDrawRectangle(screenW * 0.3859, screenH * 0.5166, screenW * 0.1906, screenH * 0.0342, tocolor(187, 13, 197, 255), false)
        dxDrawText(" Farda 8", screenW * 0.3859, screenH * 0.5166, screenW * 0.5766, screenH * 0.5518, tocolor(255, 255, 255, 255), 1.10, "default-bold", "center", "center", false, false, false, false, false)
	end
		
    if isCursorOnElement ( screenW * 0.3859, screenH * 0.5508, screenW * 0.1906, screenH * 0.0342 ) then ---- Fechar 
        dxDrawRectangle(screenW * 0.3859, screenH * 0.5508, screenW * 0.1906, screenH * 0.0342, tocolor(187, 13, 197, 255), false)
        dxDrawText(" Peladinho", screenW * 0.3859, screenH * 0.5498, screenW * 0.5766, screenH * 0.5850, tocolor(255, 255, 255, 255), 1.10, "default-bold", "center", "center", false, false, false, false, false)
	else
	end

    if isCursorOnElement ( screenW * 0.3859, screenH * 0.5850, screenW * 0.1906, screenH * 0.0342 ) then ---- Fechar 
        dxDrawRectangle(screenW * 0.3859, screenH * 0.5850, screenW * 0.1906, screenH * 0.0342, tocolor(187, 13, 197, 255), false)
        dxDrawText(" Feminina 01", screenW * 0.3859, screenH * 0.5840, screenW * 0.5766, screenH * 0.6191, tocolor(255, 255, 255, 255), 1.10, "default-bold", "center", "center", false, false, false, false, false)
        else
        end

    
    if isCursorOnElement ( screenW * 0.3859, screenH * 0.6191, screenW * 0.1906, screenH * 0.0342 ) then ---- Fechar 
        dxDrawRectangle(screenW * 0.3859, screenH * 0.6191, screenW * 0.1906, screenH * 0.0342, tocolor(187, 13, 197, 255), false)
        dxDrawText(" Defensores 01", screenW * 0.3859, screenH * 0.6191, screenW * 0.5766, screenH * 0.6543, tocolor(255, 255, 255, 255), 1.10, "default-bold", "center", "center", false, false, false, false, false)
        else
        end  
        
        
    if isCursorOnElement ( screenW * 0.3859, screenH * 0.6533, screenW * 0.1906, screenH * 0.0342 ) then ---- Fechar 
        dxDrawRectangle(screenW * 0.3859, screenH * 0.6533, screenW * 0.1906, screenH * 0.0342, tocolor(187, 13, 197, 255), false)
        dxDrawText(" Defensores 02", screenW * 0.3859, screenH * 0.6523, screenW * 0.5766, screenH * 0.6875, tocolor(255, 255, 255, 255), 1.10, "default-bold", "center", "center", false, false, false, false, false)
        else
        end
        
    end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------


------------ [ ABRIR E FECHAR ]---------------------

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


------------ Skins ------------------------------

function Skin01F (_,state)
if painel == true then
if  state == "down"  then
if  isCursorOnElement(screenW * 0.3859, screenH * 0.2773, screenW * 0.1906, screenH * 0.0342 ) then
triggerServerEvent ("EventSkin01", localPlayer)

end
end
end
end
addEventHandler ("onClientClick", root, Skin01F)

function Skin02F (_,state)
if painel == true then
if  state == "down"  then
if  isCursorOnElement(screenW * 0.3859, screenH * 0.3115, screenW * 0.1906, screenH * 0.0342 ) then
triggerServerEvent ("EventSkin02", localPlayer)

end
end
end
end
addEventHandler ("onClientClick", root, Skin02F)

function Skin03F (_,state)
if painel == true then
if  state == "down"  then
if  isCursorOnElement(screenW * 0.3859, screenH * 0.3457, screenW * 0.1906, screenH * 0.0342 ) then
triggerServerEvent ("EventSkin03", localPlayer)

end
end
end
end
addEventHandler ("onClientClick", root, Skin03F)

function Skin04F (_,state)
if painel == true then
if  state == "down"  then
if  isCursorOnElement(screenW * 0.3859, screenH * 0.3799, screenW * 0.1906, screenH * 0.0342 ) then
triggerServerEvent ("EventSkin04", localPlayer)

end
end
end
end
addEventHandler ("onClientClick", root, Skin04F)

function Skin05F (_,state)
if painel == true then
if  state == "down"  then
if  isCursorOnElement( screenW * 0.3859, screenH * 0.4141, screenW * 0.1906, screenH * 0.0342 ) then
triggerServerEvent ("EventSkin05", localPlayer)

end
end
end
end
addEventHandler ("onClientClick", root, Skin05F)

function Skin06F (_,state)
if painel == true then
if  state == "down"  then
if  isCursorOnElement( screenW * 0.3859, screenH * 0.4482, screenW * 0.1906, screenH * 0.0342 ) then
triggerServerEvent ("EventSkin06", localPlayer)

end
end
end
end
addEventHandler ("onClientClick", root, Skin06F)

function Skin07F (_,state)
if painel == true then
if  state == "down"  then
if  isCursorOnElement( screenW * 0.3859, screenH * 0.4824, screenW * 0.1906, screenH * 0.0342 ) then
triggerServerEvent ("EventSkin07", localPlayer)

end
end
end
end
addEventHandler ("onClientClick", root, Skin07F)

function Skin08F (_,state)
if painel == true then
if  state == "down"  then
if  isCursorOnElement( screenW * 0.3859, screenH * 0.5166, screenW * 0.1906, screenH * 0.0342 ) then
triggerServerEvent ("EventSkin08", localPlayer)

end
end
end
end
addEventHandler ("onClientClick", root, Skin08F)

function Skin09F (_,state)
if painel == true then
if  state == "down"  then
if  isCursorOnElement( screenW * 0.3859, screenH * 0.5508, screenW * 0.1906, screenH * 0.0342 ) then
triggerServerEvent ("EventSkin09", localPlayer)

end
end
end
end
addEventHandler ("onClientClick", root, Skin09F)

function Skin010F (_,state)
if painel == true then
if  state == "down"  then
if  isCursorOnElement( screenW * 0.3859, screenH * 0.5850, screenW * 0.1906, screenH * 0.0342 ) then
triggerServerEvent ("EventSkin010", localPlayer)

end
end
end
end
addEventHandler ("onClientClick", root, Skin010F)

function Skin011F (_,state)
if painel == true then
if  state == "down"  then
if  isCursorOnElement( screenW * 0.3859, screenH * 0.6191, screenW * 0.1906, screenH * 0.0342 ) then
triggerServerEvent ("EventSkin011", localPlayer)

end
end
end
end
addEventHandler ("onClientClick", root, Skin011F)

function Skin012F (_,state)
if painel == true then
if  state == "down"  then
if  isCursorOnElement( screenW * 0.3859, screenH * 0.6533, screenW * 0.1906, screenH * 0.0342 ) then
triggerServerEvent ("EventSkin012", localPlayer)

end
end
end
end
addEventHandler ("onClientClick", root, Skin012F)
------------------------------------------------------------

--- Ignora


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