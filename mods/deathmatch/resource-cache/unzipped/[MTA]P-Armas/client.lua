local screenW,screenH = guiGetScreenSize()
local resW, resH = 1280,1024
local x, y =  (screenW/resW), (screenH/resH)


painel = false
function painelbase ()
        
        dxDrawRectangle(screenW * 0.5992, screenH * 0.2080, screenW * 0.2117, screenH * 0.5020, tocolor(24, 24, 24, 255), false) -- QUADRADO BASE PRETO	
        dxDrawRectangle(screenW * 0.5992, screenH * 0.2080, screenW * 0.2117, screenH * 0.0049, tocolor(192, 15, 185, 255), false) -- LINHA ROSA

        dxDrawRectangle(screenW * 0.6109, screenH * 0.3076, screenW * 0.1883, screenH * 0.0391, tocolor(43, 43, 43, 255), false) --
        dxDrawRectangle(screenW * 0.6109, screenH * 0.3467, screenW * 0.1883, screenH * 0.0391, tocolor(31, 31, 31, 255), false) --                                
        dxDrawRectangle(screenW * 0.6109, screenH * 0.3857, screenW * 0.1883, screenH * 0.0391, tocolor(43, 43, 43, 255), false) --                 
        dxDrawRectangle(screenW * 0.6109, screenH * 0.4248, screenW * 0.1883, screenH * 0.0391, tocolor(31, 31, 31, 255), false) --                 
        dxDrawRectangle(screenW * 0.6109, screenH * 0.4629, screenW * 0.1883, screenH * 0.0391, tocolor(43, 43, 43, 255), false) --               
        dxDrawRectangle(screenW * 0.6109, screenH * 0.5020, screenW * 0.1883, screenH * 0.0391, tocolor(31, 31, 31, 255), false) --                  
        dxDrawRectangle(screenW * 0.6109, screenH * 0.5410, screenW * 0.1883, screenH * 0.0391, tocolor(43, 43, 43, 255), false) --                  
        dxDrawRectangle(screenW * 0.6109, screenH * 0.5801, screenW * 0.1883, screenH * 0.0391, tocolor(31, 31, 31, 255), false) --                  
        dxDrawRectangle(screenW * 0.6109, screenH * 0.6191, screenW * 0.1883, screenH * 0.0391, tocolor(43, 43, 43, 255), false) --                  
        dxDrawRectangle(screenW * 0.6109, screenH * 0.6572, screenW * 0.1883, screenH * 0.0391, tocolor(31, 31, 31, 255), false) --

        dxDrawText(" Painel de Armas", screenW * 0.6109, screenH * 0.2227, screenW * 0.7992, screenH * 0.2471, tocolor(255, 255, 255, 200), 0.80, "default-bold", "left", "center", false, false, false, false, false) 
        dxDrawText("      Arma", screenW * 0.6219, screenH * 0.2822, screenW * 0.6805, screenH * 0.2979, tocolor(255, 255, 255, 255), 0.82, "default-bold", "left", "top", false, false, false, false, false)
        dxDrawText("Munição", screenW * 0.7672, screenH * 0.2822, screenW * 0.8258, screenH * 0.2979, tocolor(255, 255, 255, 255), 0.82, "default-bold", "left", "top", false, false, false, false, false)
        dxDrawText("Soco Inglês                                                    1", screenW * 0.6188, screenH * 0.3076, screenW * 0.8070, screenH * 0.3467, tocolor(255, 255, 255, 200), 1.00, "default-bold", "left", "center", false, false, false, false, false)
        dxDrawText("       Flor                                                            1", screenW * 0.6188, screenH * 0.3467, screenW * 0.8070, screenH * 0.3857, tocolor(255, 255, 255, 200), 1.00, "default-bold", "left", "center", false, false, false, false, false)
        dxDrawText("    Deagle                                                     9999", screenW * 0.6188, screenH * 0.4639, screenW * 0.8070, screenH * 0.5029, tocolor(255, 255, 255, 200), 1.00, "default-bold", "left", "center", false, false, false, false, false)
        dxDrawText("Paraquedas                                                   1", screenW * 0.6188, screenH * 0.4248, screenW * 0.8070, screenH * 0.4639, tocolor(255, 255, 255, 200), 1.00, "default-bold", "left", "center", false, false, false, false, false)
        dxDrawText("    Teaser                                                         1", screenW * 0.6188, screenH * 0.3857, screenW * 0.8070, screenH * 0.4248, tocolor(255, 255, 255, 200), 1.00, "default-bold", "left", "center", false, false, false, false, false)
        dxDrawText("      MP5                                                        9999", screenW * 0.6188, screenH * 0.5029, screenW * 0.8070, screenH * 0.5420, tocolor(255, 255, 255, 200), 1.00, "default-bold", "left", "center", false, false, false, false, false)
        dxDrawText("     AK-47                                                      9999", screenW * 0.6188, screenH * 0.5420, screenW * 0.8070, screenH * 0.5811, tocolor(255, 255, 255, 200), 1.00, "default-bold", "left", "center", false, false, false, false, false)
        dxDrawText("        M4                                                         9999", screenW * 0.6188, screenH * 0.5811, screenW * 0.8070, screenH * 0.6201, tocolor(255, 255, 255, 200), 1.00, "default-bold", "left", "center", false, false, false, false, false)
        dxDrawText("     Sniper                                                     9999", screenW * 0.6188, screenH * 0.6201, screenW * 0.8070, screenH * 0.6592, tocolor(255, 255, 255, 200), 1.00, "default-bold", "left", "center", false, false, false, false, false)
        dxDrawText("Colete E Vida", screenW * 0.6102, screenH * 0.6582, screenW * 0.7992, screenH * 0.6963, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)

---------------------------------------------------REMOVER ARMAS--------------------------------------------------------------------------------------------------------------------------------------------------
dxDrawLine((screenW * 0.6578) - 1, (screenH * 0.7139) - 1, (screenW * 0.6578) - 1, screenH * 0.7666, tocolor(16, 16, 16, 250), 1, false)
dxDrawLine(screenW * 0.7555, (screenH * 0.7139) - 1, (screenW * 0.6578) - 1, (screenH * 0.7139) - 1, tocolor(16, 16, 16, 250), 1, false)
dxDrawLine((screenW * 0.6578) - 1, screenH * 0.7666, screenW * 0.7555, screenH * 0.7666, tocolor(16, 16, 16, 250), 1, false)
dxDrawLine(screenW * 0.7555, screenH * 0.7666, screenW * 0.7555, (screenH * 0.7139) - 1, tocolor(16, 16, 16, 250), 1, false)

dxDrawRectangle(screenW * 0.6578, screenH * 0.7139, screenW * 0.0977, screenH * 0.0527, tocolor(24, 24, 24, 255), false)
dxDrawText("Remover Armas", screenW * 0.6578, screenH * 0.7139, screenW * 0.7555, screenH * 0.7676, tocolor(255, 255, 255, 255), 0.95, "default-bold", "center", "center", false, false, false, false, false)
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

        

		
--[ MOUSE EMCIMA FICAR OUTRA COR ]		
	if isCursorOnElement ( screenW * 0.6109, screenH * 0.3076, screenW * 0.1883, screenH * 0.0391 ) then ---- Farda 01
        dxDrawRectangle(screenW * 0.6109, screenH * 0.3076, screenW * 0.1883, screenH * 0.0391, tocolor(187, 13, 197, 255), false)
        dxDrawText("Soco Inglês                                                    1", screenW * 0.6188, screenH * 0.3076, screenW * 0.8070, screenH * 0.3467, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "center", false, false, false, false, false)
	end	
	
	if isCursorOnElement ( screenW * 0.6109, screenH * 0.3467, screenW * 0.1883, screenH * 0.0391 ) then ---- MP5
        dxDrawRectangle(screenW * 0.6109, screenH * 0.3467, screenW * 0.1883, screenH * 0.0391, tocolor(187, 13, 197, 255), false)
        dxDrawText("       Flor                                                            1", screenW * 0.6188, screenH * 0.3467, screenW * 0.8070, screenH * 0.3857, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "center", false, false, false, false, false)
	end	
	
	if isCursorOnElement ( screenW * 0.6109, screenH * 0.3857, screenW * 0.1883, screenH * 0.0391 ) then ---- Farda 03
        dxDrawRectangle(screenW * 0.6109, screenH * 0.3857, screenW * 0.1883, screenH * 0.0391, tocolor(187, 13, 197, 255), false)
        dxDrawText("    Teaser                                                         1", screenW * 0.6188, screenH * 0.3857, screenW * 0.8070, screenH * 0.4248, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "center", false, false, false, false, false)
	end
	
	if isCursorOnElement ( screenW * 0.6109, screenH * 0.4248, screenW * 0.1883, screenH * 0.0391 ) then ---- MP5
        dxDrawRectangle(screenW * 0.6109, screenH * 0.4248, screenW * 0.1883, screenH * 0.0391, tocolor(187, 13, 197, 255), false)
        dxDrawText("Paraquedas                                                   1", screenW * 0.6188, screenH * 0.4248, screenW * 0.8070, screenH * 0.4639, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "center", false, false, false, false, false)
	end
	
    if isCursorOnElement ( screenW * 0.6109, screenH * 0.4629, screenW * 0.1883, screenH * 0.0391 ) then ---- M4A1
        dxDrawRectangle(screenW * 0.6109, screenH * 0.4629, screenW * 0.1883, screenH * 0.0391, tocolor(187, 13, 197, 255), false)
        dxDrawText("    Deagle                                                     9999", screenW * 0.6188, screenH * 0.4639, screenW * 0.8070, screenH * 0.5029, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "center", false, false, false, false, false)
	end
	
	 if isCursorOnElement ( screenW * 0.6109, screenH * 0.5020, screenW * 0.1883, screenH * 0.0391 ) then ---- GLOCK
        dxDrawRectangle(screenW * 0.6109, screenH * 0.5020, screenW * 0.1883, screenH * 0.0391, tocolor(187, 13, 197, 255), false)
        dxDrawText("      MP5                                                        9999", screenW * 0.6188, screenH * 0.5029, screenW * 0.8070, screenH * 0.5420, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "center", false, false, false, false, false)
	end
	
    if isCursorOnElement ( screenW * 0.6109, screenH * 0.5410, screenW * 0.1883, screenH * 0.0391 ) then ---- TEASER
        dxDrawRectangle(screenW * 0.6109, screenH * 0.5410, screenW * 0.1883, screenH * 0.0391, tocolor(187, 13, 197, 255), false)
        dxDrawText("     AK-47                                                      9999", screenW * 0.6188, screenH * 0.5420, screenW * 0.8070, screenH * 0.5811, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "center", false, false, false, false, false)
	end
	
    if isCursorOnElement ( screenW * 0.6109, screenH * 0.5801, screenW * 0.1883, screenH * 0.0391 ) then ---- COLETE E VIDA
        dxDrawRectangle(screenW * 0.6109, screenH * 0.5801, screenW * 0.1883, screenH * 0.0391, tocolor(187, 13, 197, 255), false)
        dxDrawText("        M4                                                         9999", screenW * 0.6188, screenH * 0.5811, screenW * 0.8070, screenH * 0.6201, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "center", false, false, false, false, false)
	end

    if isCursorOnElement ( screenW * 0.6109, screenH * 0.6191, screenW * 0.1883, screenH * 0.0391 ) then ---- COLETE E VIDA
        dxDrawRectangle(screenW * 0.6109, screenH * 0.6191, screenW * 0.1883, screenH * 0.0391, tocolor(187, 13, 197, 255), false)
        dxDrawText("     Sniper                                                     9999", screenW * 0.6188, screenH * 0.6201, screenW * 0.8070, screenH * 0.6592, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "center", false, false, false, false, false)
	end
    
    if isCursorOnElement ( screenW * 0.6109, screenH * 0.6572, screenW * 0.1883, screenH * 0.0391 ) then ---- COLETE E VIDA
        dxDrawRectangle(screenW * 0.6109, screenH * 0.6572, screenW * 0.1883, screenH * 0.0391, tocolor(187, 13, 197, 255), false)
        dxDrawText("Colete E Vida", screenW * 0.6102, screenH * 0.6582, screenW * 0.7992, screenH * 0.6963, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
	end    

	
    end

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
local sound = playSound("blip.wav")
setSoundVolume(sound, 0.5)
end
end
end
end
addEventHandler ("onClientClick", root, fecharpainel)



------------ Fardas ------------------------------

function Farda01F (_,state)
if painel == true then
if  state == "down"  then
if  isCursorOnElement( screenW * 0.6109, screenH * 0.3076, screenW * 0.1883, screenH * 0.0391 ) then
triggerServerEvent ("EventFarda01", localPlayer)
        
end
end
end
end
addEventHandler ("onClientClick", root, Farda01F)



function Farda02F (_,state)
if painel == true then
if  state == "down"  then
if  isCursorOnElement( screenW * 0.6109, screenH * 0.3467, screenW * 0.1883, screenH * 0.0391 ) then
triggerServerEvent ("EventFarda02", localPlayer)
        
end
end
end
end
addEventHandler ("onClientClick", root, Farda02F)



function Farda03F (_,state)
if painel == true then
if  state == "down"  then
if  isCursorOnElement( screenW * 0.6109, screenH * 0.3857, screenW * 0.1883, screenH * 0.0391 ) then
triggerServerEvent ("EventFarda03", localPlayer)
        
end
end
end
end
addEventHandler ("onClientClick", root, Farda03F)



function Farda04F (_,state)
if painel == true then
if  state == "down"  then
if  isCursorOnElement( screenW * 0.6109, screenH * 0.4248, screenW * 0.1883, screenH * 0.0391 ) then
triggerServerEvent ("EventFarda04", localPlayer)
        
end
end
end
end
addEventHandler ("onClientClick", root, Farda04F)



function Farda05F (_,state)
if painel == true then
if  state == "down"  then
if  isCursorOnElement( screenW * 0.6109, screenH * 0.4629, screenW * 0.1883, screenH * 0.0391 ) then
triggerServerEvent ("EventFarda05", localPlayer)
        
end
end
end
end
addEventHandler ("onClientClick", root, Farda05F)



function Farda06F (_,state)
if painel == true then
if  state == "down"  then
if  isCursorOnElement( screenW * 0.6109, screenH * 0.5020, screenW * 0.1883, screenH * 0.0391 ) then
triggerServerEvent ("EventFarda06", localPlayer)
        
end
end
end
end
addEventHandler ("onClientClick", root, Farda06F)



function Farda07F (_,state)
if painel == true then
if  state == "down"  then
if  isCursorOnElement( screenW * 0.6109, screenH * 0.5410, screenW * 0.1883, screenH * 0.0391 ) then
triggerServerEvent ("EventFarda07", localPlayer)
        
end
end
end
end
addEventHandler ("onClientClick", root, Farda07F)



function Farda08F (_,state)
if painel == true then
if  state == "down"  then
if  isCursorOnElement( screenW * 0.6109, screenH * 0.5801, screenW * 0.1883, screenH * 0.0391 ) then
triggerServerEvent ("EventFarda08", localPlayer)
        
end
end
end
end
addEventHandler ("onClientClick", root, Farda08F)



function Farda09F (_,state)
if painel == true then
if  state == "down"  then
if  isCursorOnElement( screenW * 0.6109, screenH * 0.6191, screenW * 0.1883, screenH * 0.0391 ) then
triggerServerEvent ("EventFarda09", localPlayer)
        
end
end
end
end
addEventHandler ("onClientClick", root, Farda09F)



function Farda010F (_,state)
if painel == true then
if  state == "down"  then
if  isCursorOnElement( screenW * 0.6109, screenH * 0.6572, screenW * 0.1883, screenH * 0.0391 ) then
triggerServerEvent ("EventFarda010", localPlayer)
        
end
end
end
end
addEventHandler ("onClientClick", root, Farda010F)
-------------------------------------------------------------------------------------------------------

function RemoverArmasF (_,state)
if painel == true then
if  state == "down"  then
if  isCursorOnElement( screenW * 0.6578, screenH * 0.7139, screenW * 0.0977, screenH * 0.0527 ) then
triggerServerEvent ("RemoverArmas", localPlayer)
        
end
end
end
end
addEventHandler ("onClientClick", root, RemoverArmasF)








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