local roundTexture = dxCreateTexture("icons/round.png", "argb", true, "clamp")

function cursorOnElement( posX, posY, width, height )
	if isCursorShowing( ) then
		local mouseX, mouseY = getCursorPosition( )
		local clientW, clientH = guiGetScreenSize( )
		local mouseX, mouseY = mouseX * clientW, mouseY * clientH
		if ( mouseX > posX and mouseX < ( posX + width ) and mouseY > posY and mouseY < ( posY + height ) ) then
			return true
		end
	end
	return false
end

function isCursorClient(dX, dY, dSZ, dM, eX, eY)
	if(eX >= dX and eX <= dX+dSZ and eY >= dY and eY <= dY+dM) then
		return true
	else
		return false
	end
end

function isInSlot(xS,yS,wS,hS)
	if(isCursorShowing()) then
		XY = {guiGetScreenSize()}
		local cursorX, cursorY = getCursorPosition()
		cursorX, cursorY = cursorX*XY[1], cursorY*XY[2]
		if(isCursorClient(xS,yS,wS,hS, cursorX, cursorY)) then
			return true
		else
			return false
		end
	end	
end

function dxDrawRoundedRectangle(x, y, w, h, color, radius, subPixelPositioning)
	radius = radius or 10
	color = color or tocolor(0, 0, 0, 200)
	
	dxDrawImage(x, y, radius, radius, roundTexture, 0, 0, 0, color, false)
	dxDrawImage(x, y + h - radius, radius, radius, roundTexture, 270, 0, 0, color, false)
	dxDrawImage(x + w - radius, y, radius, radius, roundTexture, 90, 0, 0, color, false)
	dxDrawImage(x + w - radius, y + h - radius, radius, radius, roundTexture, 180, 0, 0, color, false)
	
	dxDrawRectangle(x, y + radius, radius, h - radius * 2, color, false, subPixelPositioning)
	dxDrawRectangle(x + radius, y, w - radius * 2, h, color, false, subPixelPositioning)
	dxDrawRectangle(x + w - radius, y + radius, radius, h - radius * 2, color, false, subPixelPositioning)
end

function dxDrawRectangleRounded( x, y, w, h, tipo, borderColor, postGUI )
	dxDrawRectangle(x, y, w, h, borderColor, postGUI)
 	if tipo == "1" then
		dxDrawRectangle(x + 1, y - 1, w - 2, 1, borderColor, postGUI)
		dxDrawRectangle(x + 1, y + h, w - 2, 1, borderColor, postGUI)
		dxDrawRectangle(x - 1, y + 1, 1, h - 2, borderColor, postGUI)
		dxDrawRectangle(x + w, y + 1, 1, h - 2, borderColor, postGUI)
	elseif tipo == "2" then
		dxDrawRectangle(x + 1, y - 1, w - 2, 1, borderColor, postGUI)
	elseif tipo == "3" then
		dxDrawRectangle(x + 2, y - 1, w - 4, 1, borderColor, postGUI)
		dxDrawRectangle(x + 2, y + h, w - 4, 1, borderColor, postGUI)
		dxDrawRectangle(x - 1, y + 2, 1, h - 4, borderColor, postGUI)
		dxDrawRectangle(x + w, y + 2, 1, h - 4, borderColor, postGUI)
	end
end

function dxDrawRoundedRectangle(x, y, w, h, color, radius)
    w = w - radius * 2
    h = h - radius * 2
    x = x + radius
    y = y + radius

    if (w >= 0) and (h >= 0) then
        dxDrawRectangle(x, y, w, h, color)
        dxDrawRectangle(x, y - radius, w, radius, color)
        dxDrawRectangle(x, y + h, w, radius, color)
        dxDrawRectangle(x - radius, y, radius, h, color)
        dxDrawRectangle(x + w, y, radius, h, color)

        dxDrawCircle(x, y, radius, 180, 270, color, color, 7)
        dxDrawCircle(x + w, y, radius, 270, 360, color, color, 7)
        dxDrawCircle(x + w, y + h, radius, 0, 90, color, color, 7)
        dxDrawCircle(x, y + h, radius, 90, 180, color, color, 7)
    end
end

function dxDrawCircle( posX, posY, radius, width, angleAmount, startAngle, stopAngle, color, postGUI ) 
    if ( type( posX ) ~= "number" ) or ( type( posY ) ~= "number" ) then 
        return false 
    end 
  
    local function clamp( val, lower, upper ) 
        if ( lower > upper ) then lower, upper = upper, lower end 
        return math.max( lower, math.min( upper, val ) ) 
    end 
  
    radius = type( radius ) == "number" and radius or 50 
    width = type( width ) == "number" and width or 5 
    angleAmount = type( angleAmount ) == "number" and angleAmount or 1 
    startAngle = clamp( type( startAngle ) == "number" and startAngle or 0, 0, 360 ) 
    stopAngle = clamp( type( stopAngle ) == "number" and stopAngle or 360, 0, 360 ) 
    color = color or tocolor( 255, 255, 255, 200 ) 
    postGUI = type( postGUI ) == "boolean" and postGUI or false 
  
    if ( stopAngle < startAngle ) then 
        local tempAngle = stopAngle 
        stopAngle = startAngle 
        startAngle = tempAngle 
    end 
  
    for i = startAngle, stopAngle, angleAmount do 
        local startX = math.cos( math.rad( i ) ) * ( radius - width ) 
        local startY = math.sin( math.rad( i ) ) * ( radius - width ) 
        local endX = math.cos( math.rad( i ) ) * ( radius + width ) 
        local endY = math.sin( math.rad( i ) ) * ( radius + width ) 
  
        dxDrawLine( startX + posX, startY + posY, endX + posX, endY + posY, color, width, postGUI ) 
    end 
  
    return true 
end 

function dxDrawCircleHou( x, y, width, height, color, angleStart, angleSweep, borderWidth )
	height = height or width
	color = color or tocolor(255,255,255)
	borderWidth = borderWidth or 1e9
	angleStart = angleStart or 0
	angleSweep = angleSweep or 360 - angleStart
	if ( angleSweep < 360 ) then
		angleEnd = math.fmod( angleStart + angleSweep, 360 ) + 0
	else
		angleStart = 0
		angleEnd = 360
	end
	x = x - width / 2
	y = y - height / 2
	if not circleShader then
		circleShader = dxCreateShader ( "shaders/circle.fx" )
	end
	dxSetShaderValue ( circleShader, "sCircleWidthInPixel", width );
	dxSetShaderValue ( circleShader, "sCircleHeightInPixel", height );
	dxSetShaderValue ( circleShader, "sBorderWidthInPixel", borderWidth );
	dxSetShaderValue ( circleShader, "sAngleStart", math.rad( angleStart ) - math.pi );
	dxSetShaderValue ( circleShader, "sAngleEnd", math.rad( angleEnd ) - math.pi );
	dxDrawImage( x, y, width, height, circleShader, 0, 0, 0, color )
end

local fonts = {}
local fontsSource = {

	--["fontName"] = "source"

	["gtadevFont"] = "fonts/gtadevFont.ttf",

}

function getCreateFont( font, size, bold, quality )
	if not font then return end
	if not size then return end

	if string.lower(font) == "gtadevFont" then 

		font = "gtadevFont" 

	end
	if string.lower(font) == "gtadevFont" then 

		font = "gtadevFont" 

	end
	if string.lower(font) == "gtadevFont" then 

		font = "gtadevFont" 

	end

	local fontE = false
	local _font = font
	
	if bold then

	    font = font .. "-bold"

	end
	
	if quality then

	    font = font .. "-" .. quality 

	end
	
	if font and size then

	    local subText = font .. size
	    local value = fonts[subText]

	    if value then

		    fontE = value

		end

	end
	
	if not fontE then

	    local v = fontsSource[_font]
	    fontE = dxCreateFont( v, size, bold, quality )
	    local subText = font .. size
	    fonts[ subText ] = fontE
	    outputDebugString("Font:" ..font.. ", Size: "..size.." created!", 0, 255, 255, 255)

	end
	
	return fontE
end