g_Root = getRootElement()
g_client = getLocalPlayer()
g_thisRes = getThisResource()
g_mapEnabled = false

g_blipIndex = 0
g_blip = { }
g_blipAIndex = 0
g_blipA = { }

g_screenWidth, g_screenHeight = guiGetScreenSize ( )

g_mapA = 128
g_mapW = g_screenHeight
g_mapH = g_screenHeight
g_mapX = g_screenWidth/2 - g_mapW/2
g_mapY = g_screenHeight/2 - g_mapH/2

g_Adj = g_mapW/6000

theImage = dxCreateTexture( "map.jpg" )

g_blipList = {
	[0] = dxCreateTexture( "blips/0.png" ),
	[1] = dxCreateTexture( "blips/1.png" ),
	[2] = dxCreateTexture( "blips/2.png" ),
	[3] = dxCreateTexture( "blips/3.png" ),
	[4] = dxCreateTexture( "blips/4.png" ),
	[5] = dxCreateTexture( "blips/5.png" ),
	[6] = dxCreateTexture( "blips/6.png" ),
	[7] = dxCreateTexture( "blips/7.png" ),
	[8] = dxCreateTexture( "blips/8.png" ),
	[9] = dxCreateTexture( "blips/9.png" ),
	[10] = dxCreateTexture( "blips/10.png" ),
	[11] = dxCreateTexture( "blips/11.png" ),
	[12] = dxCreateTexture( "blips/12.png" ),
	[13] = dxCreateTexture( "blips/13.png" ),
	[14] = dxCreateTexture( "blips/14.png" ),
	[15] = dxCreateTexture( "blips/15.png" ),
	[16] = dxCreateTexture( "blips/16.png" ),
	[17] = dxCreateTexture( "blips/17.png" ),
	[18] = dxCreateTexture( "blips/18.png" ),
	[19] = dxCreateTexture( "blips/19.png" ),
	[20] = dxCreateTexture( "blips/20.png" ),
	[21] = dxCreateTexture( "blips/21.png" ),
	[22] = dxCreateTexture( "blips/22.png" ),
	[23] = dxCreateTexture( "blips/23.png" ),
	[24] = dxCreateTexture( "blips/24.png" ),
	[25] = dxCreateTexture( "blips/25.png" ),
	[26] = dxCreateTexture( "blips/26.png" ),
	[27] = dxCreateTexture( "blips/27.png" ),
	[28] = dxCreateTexture( "blips/28.png" ),
	[29] = dxCreateTexture( "blips/29.png" ),
	[30] = dxCreateTexture( "blips/30.png" ),
	[31] = dxCreateTexture( "blips/31.png" ),
	[32] = dxCreateTexture( "blips/32.png" ),
	[33] = dxCreateTexture( "blips/33.png" ),
	[34] = dxCreateTexture( "blips/34.png" ),
	[35] = dxCreateTexture( "blips/35.png" ),
	[36] = dxCreateTexture( "blips/36.png" ),
	[37] = dxCreateTexture( "blips/37.png" ),
	[38] = dxCreateTexture( "blips/38.png" ),
	[39] = dxCreateTexture( "blips/39.png" ),
	[40] = dxCreateTexture( "blips/40.png" ),
	[41] = dxCreateTexture( "blips/41.png" ),
	[42] = dxCreateTexture( "blips/42.png" ),
	[43] = dxCreateTexture( "blips/43.png" ),
	[44] = dxCreateTexture( "blips/44.png" ),
	[45] = dxCreateTexture( "blips/45.png" ),
	[46] = dxCreateTexture( "blips/46.png" ),
	[47] = dxCreateTexture( "blips/47.png" ),
	[48] = dxCreateTexture( "blips/48.png" ),
	[49] = dxCreateTexture( "blips/49.png" ),
	[50] = dxCreateTexture( "blips/50.png" ),
	[51] = dxCreateTexture( "blips/51.png" ),
	[52] = dxCreateTexture( "blips/52.png" ),
	[53] = dxCreateTexture( "blips/53.png" ),
	[54] = dxCreateTexture( "blips/54.png" ),
	[55] = dxCreateTexture( "blips/55.png" ),
	[56] = dxCreateTexture( "blips/56.png" ),
	[57] = dxCreateTexture( "blips/57.png" ),
	[58] = dxCreateTexture( "blips/58.png" ),
	[59] = dxCreateTexture( "blips/59.png" ),
	[60] = dxCreateTexture( "blips/60.png" ),
	[61] = dxCreateTexture( "blips/61.png" ),
	[62] = dxCreateTexture( "blips/62.png" ),
	[63] = dxCreateTexture( "blips/63.png" ),
	[67] = dxCreateTexture( "blips/67.png" ),
	[318] = dxCreateTexture( "blips/64.png" ),

}

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

function getCameraRotation ()
    local px, py, pz, lx, ly, lz = getCameraMatrix()
    local rotz = 6.2831853071796 - math.atan2 ( ( lx - px ), ( ly - py ) ) % 6.2831853071796
    local rotx = math.atan2 ( lz - pz, getDistanceBetweenPoints2D ( lx, ly, px, py ) )
    --Convert to degrees
    rotx = math.deg(rotx)
    rotz = -math.deg(rotz)	
    return rotx, 180, rotz
end

function startResource( theRes )
	if theRes == g_thisRes then
		setPlayerHudComponentVisible( "radar", false )
		toggleControl ( "radar", false )
	end
end
addEventHandler ( "onClientResourceStart", g_Root, startResource)

function endResource( theRes )
	if theRes == g_thisRes then
		setPlayerHudComponentVisible( "radar", true )
		toggleControl ( "radar", true )
		for i,v in ipairs(getElementsByType("dxBlip")) do
			destroyElement (v)
		end
		for i,v in ipairs(getElementsByType("dxBlipA")) do
			destroyElement (v)
		end
	end
end
addEventHandler ( "onClientResourceStop", g_Root, endResource)




function createMap( cmd )
	dxDrawImage(g_mapX,g_mapY,g_mapW,g_mapH, theImage,0,0,0,tocolor(255,255,255,g_mapA))
	for i,v in ipairs(getElementsByType("dxBlip")) do
		local icon = getElementData ( v, "icon" )
		local width = getElementData ( v, "width" )
		local height = getElementData ( v, "height" )
		local color = getElementData ( v, "color" )
		local x,y,z = getElementPosition ( v )
		local rotation = getElementData ( v, "rotZ" )

		dxDrawImage(
			x*g_Adj + g_screenWidth/2 - width/2,
			-y*g_Adj + g_screenHeight/2 - height/2,
			width, height, icon, 360-rotation,0,0, color
		)
	end
	for i,v in ipairs(getElementsByType("dxBlipA")) do
		local elemAttachedTo = getElementData ( v, "elemTo" )
		local icon = getElementData ( v, "icon" )
		local width = getElementData ( v, "width" )
		local height = getElementData ( v, "height" )
		local color = getElementData ( v, "color" )
		local x,y,z = getElementPosition(elemAttachedTo)
		local rx,ry,rotation = getElementRotation(elemAttachedTo)

		dxDrawImage(
			x*g_Adj + g_screenWidth/2 - width/2,
			-y*g_Adj + g_screenHeight/2 - height/2,
			width, height, icon, 360-rotation,0,0, color
		)

	end
	for i,v in ipairs(getElementsByType("blip")) do
		local x,y,z = getElementPosition(v)
		dxDrawImage(x*g_Adj + g_screenWidth/2 -8,-y*g_Adj + g_screenHeight/2 -8,16,16,g_blipList[getBlipIcon(v)],0,0,0,tocolor(255,255,255,255))
	end
end

function toggleMap( cmd )
	if g_mapEnabled then
		removeEventHandler( "onClientRender", g_Root, createMap )
	else
		addEventHandler ( "onClientRender", g_Root, createMap )
	end
	g_mapEnabled = not g_mapEnabled
end
--bindKey ( "/", "both", toggleMap )
bindKey ( "F11", "down", toggleMap )
addCommandHandler("map",toggleMap)

function dxCreateBlip( x,y,z, rotation, icon, width, height, color, visibleDistance )

	local newBlip = createElement( "dxBlip" )

	if rotation == nil then rotation=0 end
	if icon == nil then icon = 0 end
	if width == nil then width = 16 end
	if height == nil then height = 16 end
	if color == nil then color = tocolor(255,255,255,255) end
	if visibleDistance == nil then visibleDistance = 16000 end 

	setElementPosition(newBlip, x,y,z )
	setElementData ( newBlip, "rotZ", rotation )
	setElementData ( newBlip, "icon", g_blipList[icon] )
	setElementData ( newBlip, "width", width )
	setElementData ( newBlip, "height", height )
	setElementData ( newBlip, "color", color )
	setElementData ( newBlip, "visibleDistance", visibleDistance )
	return newBlip
end

function dxCreateBlipAttachedTo( elemAttachedTo, icon, width, height, color, visibleDistance )

	local newBlip = createElement( "dxBlipA" )

	if elemAttachedTo == nil then return false end
	if icon == nil then icon = 0 end
	if width == nil then width = 16 end
	if height == nil then height = 16 end
	if color == nil then color = tocolor(255,255,255,255) end
	if visibleDistance == nil then visibleDistance = 16000 end

	setElementData ( newBlip, "elemTo", elemAttachedTo )
	setElementData ( newBlip, "icon", g_blipList[icon] )
	setElementData ( newBlip, "width", width )
	setElementData ( newBlip, "height", height )
	setElementData ( newBlip, "color", color )
	setElementData ( newBlip, "visibleDistance", visibleDistance )

	return newBlip
end
