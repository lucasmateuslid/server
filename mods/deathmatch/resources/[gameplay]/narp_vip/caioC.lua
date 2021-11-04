--== Script feito por:
--== ● Caio ●
--== Discord: Caio#8888
--===================================================
--== Qualquer problema procure pelo meu discord.
--===================================================

local screen = {guiGetScreenSize()} local x, y = (screen[1]/1366), (screen[2]/768)

abaVip = 1
index = 0
maxLinhas = 12
proximaPagina = 0

function drawPanel ()
    local alpha = interpolateBetween(0, 0, 0, 255, 0, 0, ((getTickCount() - tick) / 800), 'Linear')
    dxDrawImage(x * 527, y * 155, x * 311, y * 458, 'files/fundo.png', 0, 0, 0, tocolor(255, 255, 255, alpha), false)
    dxDrawImage(x * 582, y * 564, x * 202, y * 39, 'files/pegar.png', 0, 0, 0, tocolor(255, 255, 255, alpha), false)
    dxDrawImage(x * 492, y * 372, x * 23, y * 23, 'files/seta.png', 90, 0, 0,  (isMouseInPosition(x * 492, y * 372, x * 23, y * 23) and tocolor(10, 62, 255, alpha) or tocolor(255, 255, 255, alpha)), false)
    dxDrawImage(x * 850, y * 372, x * 23, y * 23, 'files/seta.png', -90, 0, 0, (isMouseInPosition(x * 850, y * 372, x * 23, y * 23) and tocolor(10, 62, 255, alpha) or tocolor(255, 255, 255, alpha)), false)
    dxDrawText('Painel Vip ('..nameVip[abaVip]..')', x * 526, y * 154, x * 837, y * 187, tocolor(255, 255, 255, alpha), 1.50, 'clear', "center", "center", false, false, false, false, false)
    linha = 0
    for i, v in ipairs(vips[nameVip[abaVip]]) do
        if (i > proximaPagina and linha < maxLinhas) then
            linha = linha + 1
            if (index == i) then
                dxDrawImage(x * 543, y * 183 + linha * 28, x * 279, y * 22, 'files/barra.png', 0, 0, 0, tocolor(27, 27, 27, alpha), false)
            else
                dxDrawImage(x * 543, y * 183 + linha * 28, x * 279, y * 22, 'files/barra.png', 0, 0, 0, tocolor(33, 33, 33, alpha), false)
            end
            dxDrawText(v[1], x * 543, y * 150 + linha * 56, x * 820, y * 234, tocolor(255, 255, 255, 255), 1.00, 'clear', 'center', 'center', false, false, false, false, false)
        end
    end
end

addEvent('Caio.onPanelVip', true)
addEventHandler('Caio.onPanelVip', root,
    function()
        if not isEventHandlerAdded('onClientRender', root, drawPanel) then
            addEventHandler('onClientRender', root, drawPanel)
            tick = getTickCount()
            if not isCursorShowing() then
                showCursor(true)
            end
        else
            removeEventHandler('onClientRender', root, drawPanel)
            if isCursorShowing() then
                showCursor(false)
            end
        end
    end
)

addEventHandler('onClientClick', root, 
    function(b, s)
        if (b == 'left') and (s == 'down') then
            if isEventHandlerAdded('onClientRender', root, drawPanel) then
                if isMouseInPosition(x * 492, y * 372, x * 23, y * 23) then
                    if abaVip > 1 then
                        abaVip = abaVip - 1
                        proximaPagina = 0
                        index = 0
                    end
                elseif isMouseInPosition(x * 850, y * 372, x * 23, y * 23) then
                    if abaVip < #nameVip then
                        abaVip = abaVip + 1
                        proximaPagina = 0
                        index = 0
                    end
                elseif isMouseInPosition(x * 582, y * 564, x * 202, y * 39) then
                    if index ~= 0 then
                        triggerServerEvent(vips[nameVip[abaVip]][index][2], localPlayer, localPlayer, nameVip[abaVip], vips[nameVip[abaVip]][index][3])
                    end
                else
                    linha = 0
                    for i, v in ipairs(vips[nameVip[abaVip]]) do
                        if (i > proximaPagina and linha < maxLinhas) then
                            linha = linha + 1
                            if isMouseInPosition(x * 543, y * 183 + linha * 28, x * 279, y * 22) then
                                index = i
                                return
                            end
                        end
                    end
                    index = 0
                end
            end
        end
    end
)

function UpDown (b)
    if isEventHandlerAdded('onClientRender', root, drawPanel) then
        if isMouseInPosition(x * 543, y * 200, x * 279, y * 354) then
            if b == 'mouse_wheel_down' then
                proximaPagina = proximaPagina + 1
                if (proximaPagina > #vips[nameVip[abaVip]] - maxLinhas) then
                    proximaPagina = #vips[nameVip[abaVip]] - maxLinhas
                end
            elseif b == 'mouse_wheel_up'  then
                if (proximaPagina > 0) then
                    proximaPagina = proximaPagina - 1
                end
            end
        end
    end
end
bindKey('mouse_wheel_up', 'down', UpDown)
bindKey('mouse_wheel_down', 'down', UpDown)

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