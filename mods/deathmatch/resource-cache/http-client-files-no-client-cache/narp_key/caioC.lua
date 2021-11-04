--== Script feito por:
--== ● Caio ●
--== Discord: Caio#8888
--===================================================
--== Qualquer problema procure pelo meu discord.
--===================================================

local screen = {guiGetScreenSize()} local x, y = (screen[1]/1366), (screen[2]/768)

edit = {
    guiCreateEdit(screen[1] - 1000, screen[2] - 1000, 0, 0, '', false),
    guiCreateEdit(screen[1] - 1000, screen[2] - 1000, 0, 0, '', false),
}

for i = 1, #edit do
    guiSetVisible(edit[i], false)
end

function drawGerenciador ( )
    local alpha = interpolateBetween(0, 0, 0, 255, 0, 0, ((getTickCount() - tick) / 800), 'Linear')
    dxDrawImage(x * 563, y * 303, x * 240, y * 180, 'files/gerador.png', 0, 0, 0, tocolor(255, 255, 255, alpha), false)
    dxDrawText((editSelect == 1 and guiGetText(edit[1])..'|' or guiGetText(edit[1])), x * 586, y * 361, x * 771, y * 388, tocolor(20, 20, 20, 255), 1.00, 'clear', 'right', 'center', false, false, false, false, false)
    dxDrawText((editSelect == 2 and guiGetText(edit[2])..'|' or guiGetText(edit[2])), x * 586, y * 400, x * 771, y * 425, tocolor(20, 20, 20, 255), 1.00, 'clear', 'right', 'center', false, false, false, false, false)
end

addEvent('Caio.onPanelGerenciador', true)
addEventHandler('Caio.onPanelGerenciador', root,
    function()
        if not isEventHandlerAdded('onClientRender', root, drawGerenciador) then
            if (editSelect ~= 0) then
                editSelect = 0
            end
            addEventHandler('onClientRender', root, drawGerenciador)
            showCursor(true)
            tick = getTickCount()
            for i = 1, #edit do
                guiSetVisible(edit[i], true)
                guiSetText(edit[i], '')
            end
        else
            removeEventHandler('onClientRender', root, drawGerenciador)
            showCursor(false)
            for i = 1, #edit do
                guiSetVisible(edit[i], false)
            end
        end
    end
)

function drawAtivador ( )
    local alpha = interpolateBetween(0, 0, 0, 255, 0, 0, ((getTickCount() - tick) / 800), 'Linear')
    dxDrawImage(x * 563, y * 303, x * 240, y * 161, 'files/ativador.png', 0, 0, 0, tocolor(255, 255, 255, alpha), false)
    dxDrawText((editSelect == 1 and guiGetText(edit[1])..'|' or guiGetText(edit[1])), x * 586, y * 370, x * 771, y * 397, tocolor(20, 20, 20, 255), 1.00, 'clear', 'right', 'center', false, false, false, false, false)
end

addEvent('Caio.onPanelAtivador', true)
addEventHandler('Caio.onPanelAtivador', root,
    function()
        if not isEventHandlerAdded('onClientRender', root, drawAtivador) then
            if (editSelect ~= 0) then
                editSelect = 0
            end
            addEventHandler('onClientRender', root, drawAtivador)
            showCursor(true)
            tick = getTickCount()
            guiSetVisible(edit[1], true)
            guiSetText(edit[1], '')
        else
            removeEventHandler('onClientRender', root, drawAtivador)
            showCursor(false)
            guiSetVisible(edit[1], false)
        end
    end
)

addEventHandler('onClientClick', root,
    function(b, s)
        if (b == 'left') and (s == 'down') then
            if isEventHandlerAdded('onClientRender', root, drawGerenciador) then
                if isMouseInPosition(x * 587, y * 361, x * 191, y * 27) then
                    if guiEditSetCaretIndex(edit[1], string.len(guiGetText(edit[1]))) then
                        editSelect = 1
                        guiBringToFront(edit[1])
                        guiSetInputMode('no_binds_when_editing')
                    end
                elseif isMouseInPosition(x * 587, y * 400, x * 191, y * 27) then
                    if guiEditSetCaretIndex(edit[2], string.len(guiGetText(edit[2]))) then
                        editSelect = 2
                        guiBringToFront(edit[2])
                        guiSetInputMode('no_binds_when_editing')
                    end
                else
                    if (editSelect ~= 0) then
                        editSelect = 0
                    end
                end
            elseif isEventHandlerAdded('onClientRender', root, drawAtivador) then
                if isMouseInPosition(x * 587, y * 370, x * 191, y * 27) then
                    if guiEditSetCaretIndex(edit[1], string.len(guiGetText(edit[1]))) then
                        editSelect = 1
                        guiBringToFront(edit[1])
                        guiSetInputMode('no_binds_when_editing')
                    end
                else
                    if (editSelect ~= 0) then
                        editSelect = 0
                    end
                end
            end
        end
    end
)

bindKey('enter', 'down',
    function()
        if isEventHandlerAdded('onClientRender', root, drawGerenciador) then
            if (editSelect == 0) then
                if (guiGetText(edit[1]) ~= '') and (guiGetText(edit[2]) ~= '') then
                    if tonumber(guiGetText(edit[2])) then
                        triggerServerEvent('Caio.onCreateKey', localPlayer, localPlayer, guiGetText(edit[1]), guiGetText(edit[2]))
                    else
                        exports['dxmessages']:addBox('Os dias precisa ser algum número.', 'warning')
                    end
                else
                    exports['dxmessages']:addBox('Insira algum tipo de vip ou dias.', 'warning')
                end
            end
        elseif isEventHandlerAdded('onClientRender', root, drawAtivador) then
            if (editSelect == 0) then
                if (guiGetText(edit[1]) ~= '') then
                    triggerServerEvent('Caio.onUseKey', localPlayer, localPlayer, guiGetText(edit[1]))
                else
                    exports['dxmessages']:addBox('Insira alguma key.', 'warning')
                end
            end
        end
    end
)

local font = dxCreateFont("font.ttf", x*22)

function drawName ()
    dxDrawText('O(A) Jogador(a) '..jogador..'\nAtivou um Plano VIP '..vipAtived..' com Sucesso!', x*0 + 1, y*0 + 1, x*1366 + 1, y*768 + 1, tocolor(255, 255, 255, 255), x*1.00, font, 'center', 'center', false, false, false, true, false)
end

addEvent('Caio.onVipAtivadoTela', true)
addEventHandler('Caio.onVipAtivadoTela', root,
    function(name, vip)
        if (name) and (vip) then
            if not isEventHandlerAdded('onClientRender', root, drawName) then
                addEventHandler('onClientRender', root, drawName)
                sound = playSound('files/'..vip..'.mp3')
                jogador     = name
                vipAtived   = vip
                setTimer(function()
                    if isElement(sound) then
                        stopSound(sound)
                    end
                    if isEventHandlerAdded('onClientRender', root, drawName) then
                        removeEventHandler('onClientRender', root, drawName)
                    end
                end, 12000, 1)
            else
                jogador     = name
                vipAtived   = vip
            end
        end
    end
)

addEvent('Caio.onCopyKey', true)
addEventHandler('Caio.onCopyKey', root,
    function(key)
        if (key) then
            setClipboard(key)
        end
    end
)

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