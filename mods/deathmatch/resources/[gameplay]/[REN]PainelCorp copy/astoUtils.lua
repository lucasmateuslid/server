function isEventHandlerAdded(sEventName, pElementAttachedTo, func)
    if type(sEventName) == 'string' and isElement(pElementAttachedTo) and type(func) == 'function' then
        local aAttachedFunctions = getEventHandlers(sEventName, pElementAttachedTo)
        if type(aAttachedFunctions) == 'table' and #aAttachedFunctions > 0 then
            for i, v in ipairs(aAttachedFunctions) do
                if v == func then
                    return true
                end
            end
        end
    end
    return false
end

function cursorPosition(x, y, width, height)
    if(not isCursorShowing()) then
        return false
    end
    local sx, sy = guiGetScreenSize()
    local cx, cy = getCursorPosition()
    local cx, cy =(cx*sx),(cy*sy)
    if (cx >= x and cx <= x + width) and (cy >= y and cy <= y + height) then
        return true
    else
        return false
    end
end

function drawBorde(x, y, w, h, borderColor, bgColor, postGUI)
	if (x and y and w and h) then
		if (not borderColor) then
			borderColor = tocolor(0, 0, 0, 200)
		end
		
		if (not bgColor) then
			bgColor = borderColor
		end		

		dxDrawRectangle(x, y, w, h, bgColor, postGUI)

		dxDrawRectangle(x + 2, y - 1, w - 4, 1, borderColor, postGUI) -- top
		dxDrawRectangle(x + 2, y + h, w - 4, 1, borderColor, postGUI) -- bottom
		dxDrawRectangle(x - 1, y + 2, 1, h - 4, borderColor, postGUI) -- left
		dxDrawRectangle(x + w, y + 2, 1, h - 4, borderColor, postGUI) -- right
	end
end