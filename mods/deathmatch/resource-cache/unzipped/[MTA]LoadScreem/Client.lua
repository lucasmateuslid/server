--[[
 ><><><><><><><><><><><><><><><><><><><><
 ><               LoadScreem
 ><><><><><><><><><><><><><><><><><><><><
--]]

local screen = {guiGetScreenSize()} local x, y = (screen[1]/1366), (screen[2]/768) local musica = 'Pause' 

function dxDraw()
   posBar = interpolateBetween(287, 0, 0, 968, 0, 0, ((getTickCount() - tick) / 4000), 'SineCurve')

    dxDrawImage(0, 0, x*1366, y*768, 'Files/Fundo.png', 0, 0, 0, tocolor(255, 255, 255, 255), true)
    dxDrawImage(x * 20, y * 10, x * 50, y * 50, 'Files/'..musica..'.png', 0, 0, 0, (isMouseInPosition(x * 20, y * 10, x * 50, y * 50) and tocolor(255, 0, 252, 255) or tocolor(255, 255, 255, 255)), true)
    dxDrawImage(x * posBar, y*688, x*127, y*35, 'Files/Quadrado.png', 0, 0, 0, tocolor(255, 255, 255, 255), true)
end


function startLoad()
    if not isEventHandlerAdded('onClientRender', root, dxDraw) then
       sound = playSound('Files/musica.mp3', true)
       tick = getTickCount()
       addEventHandler('onClientRender', root, dxDraw)
       showCursor(true)
       showChat(false)
       triggerServerEvent('Drops.onSetVoice', localPlayer, localPlayer, true)
    end
end
addEventHandler('onClientResourceStart', getResourceRootElement(getThisResource()), startLoad)

function checkLoad ()    
    if (isTransferBoxActive() == true) then
        setTimer(checkLoad, 2000, 1)
    else 
        if isEventHandlerAdded('onClientRender', root, dxDraw) then
            removeEventHandler('onClientRender', root, dxDraw)
            showCursor(false)
            showChat(true)
            triggerServerEvent('Drops.onSetVoice', localPlayer, localPlayer, false)
            if isElement(sound) then
                stopSound(sound)
            end
        end
    end
end
setTimer(checkLoad, 2000, 1)

addEventHandler('onClientClick', root, 
    function (button, state)
        if (button == 'left') and (state == 'down') then 
            if isEventHandlerAdded('onClientRender', root, dxDraw) then
                if isMouseInPosition(x * 543, y * 542, x  * 65, y * 74) then 
                    setClipboard('')
                    exports['dxmessages']:addBox('', 'success')
                elseif isMouseInPosition(x * 758, y * 542, x * 65, y * 64.25) then 
                    setClipboard('')
                    exports['dxmessages']:addBox('', 'success')
                elseif isMouseInPosition(x * 20, y * 10, x * 50, y * 50) then 
                    if musica == 'Pause' then 
                        musica = 'Play'
                        if isElement(sound) then 
                            setSoundPaused(sound, true)
                        end
                    elseif musica == 'Play' then 
                        musica = 'Pause'
                        if isElement(sound) then 
                            setSoundPaused(sound, false)
                        end
                    end
                end
            end
        end
    end
)


function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
    if type( sEventName ) == 'string' and isElement( pElementAttachedTo ) and type( func ) == 'function' then
        local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo )
        if type( aAttachedFunctions ) == 'table' and #aAttachedFunctions > 0 then
            for i, v in ipairs( aAttachedFunctions ) do
                if v == func then
                    return true
                end
            end
        end
    end
    return false
end

function isMouseInPosition(x,y,w,h)
	if isCursorShowing() then
		local sx,sy = guiGetScreenSize()
		local cx,cy = getCursorPosition()
		local cx,cy = (cx*sx),(cy*sy)
		if (cx >= x and cx <= x+w) and (cy >= y and cy <= y+h) then
			return true
		end
	end
end

