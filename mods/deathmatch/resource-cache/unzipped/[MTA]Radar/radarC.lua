local sw = {guiGetScreenSize()}
local sx,sy = guiGetScreenSize()
local newfont = dxCreateFont("files/font.ttf", 16, false, "cleartype")
local radarPos = {sw[1]*20/1440+5, sw[2]-(200+50)+25, ((318-14)),(185-13)}
local minVel = 1.3 
local minDist = 180
local maxVel = 20 
local maxDist = 360
local minZoom = 6
local maxZoom = 20
local zoom = 11
local zoomPlus="num_add"
local zoomMinus="num_sub" 
local mapSize=1536 
local size=(0.7*(1440))/2
local size2=size*2
local x,y=size*1.7,(900)-size*1.5
local screenSizeCompensate=(900)/500
local blipDimension=16*screenSizeCompensate 
local ratio = (maxDist-minDist)/(maxVel-minVel)
local dmgTab={}
local renderData={}
local blipimages={}
local zoomticks=getTickCount()
local frames,lastsec=0,0
local madeByHUD={}

renderData.radarState = true
renderData.F11State = false

local m = {}
local moving = false

addEventHandler("onClientResourceStart", resourceRoot, function()
	receiveOnStart()
end)

addEventHandler("onClientResourceStop", resourceRoot, function()
	saveConfigFile()
end)

local config = {}
function createConfigFile()
	local RootNode = xmlCreateFile("config.xml","ngaming")
	local Newcode = xmlCreateChild(RootNode, "data")
	xmlNodeSetAttribute(Newcode, "pos1", sw[1]*20/1440+5)
	xmlNodeSetAttribute(Newcode, "pos2", sw[2]-(200+50)+25)
	xmlSaveFile(RootNode)
end

function saveConfigFile()
	local RootNode = xmlCreateFile("config.xml","ngaming")
	local Newcode = xmlCreateChild(RootNode, "data")
	xmlNodeSetAttribute(Newcode, "pos1", math.round(radarPos[1]))
	xmlNodeSetAttribute(Newcode, "pos2", math.round(radarPos[2]))
	xmlSaveFile(RootNode)
end

function receiveOnStart()
	local file = xmlLoadFile ( "config.xml" )
	local data = xmlFindChild ( file, "data", 0 )
	if file then
		if data then
			local wtf = xmlNodeGetAttributes ( data )
			radarPos[1] = tonumber(wtf.pos1)
			radarPos[2] = tonumber(wtf.pos2)
		end
	else
		createConfigFile()
		receiveOnStart()
	end
end


function onStart()
	getBlips()
	blipTimer=setTimer(getBlips,100,0)
	hudrendertarg=dxCreateRenderTarget(256,300,true)
	weptarg=dxCreateRenderTarget(256,256,true)
	texture=dxCreateTexture("files/radar.png")
	dxSetTextureEdge( texture, "clamp" )
	renderImage=dxCreateRenderTarget(size2,size2,false)
	newtarg=dxCreateRenderTarget(size*3,size*3,false)
	addEventHandler("onClientRender",getRootElement(),renderFrame)
	setPlayerHudComponentVisible("radar", false)
end

function getRadarRadius ()
	return minDist
end

function getRot()
	local camRot
	local cameraTarget = getCameraTarget()
	if not cameraTarget then
		local px,py,_,lx,ly = getCameraMatrix()
		camRot = getVectorRotation(px,py,lx,ly)
	else
		if getPedControlState("look_behind") then
			camRot = -math.rad(getPedRotation(localPlayer))
		else
			local px,py,_,lx,ly = getCameraMatrix()
			camRot = getVectorRotation(px,py,lx,ly)
		end
	end
	return camRot
end

function getVectorRotation(px,py,lx,ly)
	local rotz=6.2831853071796-math.atan2(lx-px,ly-py)%6.2831853071796
	return -rotz
end

function ultilizeDamageScreen(attacker,weapon,_,loss)
	local slot = attacker and getElementType(attacker) == "player" and getPedWeaponSlot(attacker) and getPedWeaponSlot(attacker) or false
	if attacker and attacker~=source and not (slot==8 or (slot==7 and weapon~=38)) then
		local px1,py1=getElementPosition(source)
		local px2,py2=getElementPosition(attacker)
		dmgTab[#dmgTab+1]={getTickCount(),0,math.min(25.5*loss,255)}
	else
		dmgTab[#dmgTab+1]={getTickCount(),0,math.min(35*loss,255)}
	end
	if #dmgTab>18 then
		repeat
			table.remove(dmgTab,1)
		until #dmgTab<18
	end
end

function renderFrame()
	if isPlayerMapVisible() then
		return
	end
		if renderData.radarState and not renderData.F11State then
			local px,py,pz=getElementPosition(localPlayer)
			vehicle=getPedOccupiedVehicle(localPlayer)
				local prz=getPedRotation(localPlayer)
				local nx,ny=(3000+px)/6000*mapSize,(3000-py)/6000*mapSize
				local radius=getRadarRadius()
				local maprad=radius/6000*mapSize*zoom
				local preRot=-getRot()
				local rot=math.deg(preRot)
				local mx,my,mw,mh=nx-maprad,ny-maprad,maprad*2,maprad*2
				local scx,scy,scw,sch=0,0,size2,size2
				local absx,absy=math.abs(px),math.abs(py)
				if absx+radius*zoom>3000 then
					if absx-radius*zoom>3000 then
						dontDrawSc=true
					elseif px<0 then
						mw=mx+mw
						mx=0
						scw=scw*(mw/(maprad*2))
						scx=size2-scw
					else
						mw=mw-(mx+mw-mapSize)
						scw=scw*(mw/(maprad*2))
					end
				end
				if absy+radius*zoom>3000 then
					if absy-radius*zoom>3000 then
						dontDrawSc=true
					elseif py>0 then
						mh=my+mh
						my=0
						sch=sch*(mh/(maprad*2))
						scy=size2-sch
					else
						mh=mh-(my+mh-mapSize)
						sch=sch*(mh/(maprad*2))
					end
				end
				prepareBlips(px,py,pz,preRot,(radius)*zoom)
				dxSetRenderTarget(renderImage,true)
				dxDrawRectangle(0,0,size2-20,size2-20,tocolor(19,19,19))
				dxDrawImageSection(scx,scy,scw,sch,mx,my,mw,mh,texture,0,0,0,tocolor(255,255,255,255))
				dxSetRenderTarget(newtarg,true)
				dxDrawImage(size/2,size/2,size2,size2,renderImage,rot,0,0,tocolor(255,255,255,255),false)
				for _,v in ipairs(blipimages) do
					local bx, by = size*1.5+v[1]-x,size*1.5+v[2]-y
					local alpha = 255
					local kepKX, kepKY = radarPos[1]+(radarPos[3]/2), radarPos[2]+(radarPos[4]/2)
					local kepX, kepY = (kepKX-(v[3]/2))+(bx-(size*1.5)+(v[3]/2)), ((kepKY-(v[4]/2))+(by-(size*1.5)+(v[4]/2)))
					local kiegPos = 0
					if(v[5] ~= "blips/0.png" and v[5] ~= "blips/0-up.png") then
						kiegPos = 0
					end
					if(kepX < radarPos[1]) then
						bx = bx+(radarPos[1]-kepX)
						alpha = 0
					end
					if(kepX > radarPos[1]+radarPos[3]-(v[3]+kiegPos)/2-50) then
						bx = bx+((radarPos[1]+radarPos[3]-(v[3]+kiegPos)/2)-kepX)
						alpha = 0
					end
					if(kepY < radarPos[2]) then
						by = by+(radarPos[2]-kepY+1)
						alpha = 0
					end
					if(kepY > radarPos[2]+radarPos[4]-v[4]) then
						by = by+((radarPos[2]+radarPos[4]-v[4])-kepY+12)
						alpha = 0
					end
					dxDrawImage(bx,by,v[3],v[4],v[5],v[6],0,0,tocolor(255,255,255,255))
				end
					dxDrawImage(size*1.5-(blipDimension*0.75)/2,size*1.5-(blipDimension*0.75)/2,20,20,"files/arrow.png",rot-prz,0,0,tocolor(255,255,255,255),false)
				
				dxSetRenderTarget()
				blipimages = {}
				dxDrawImageSection(radarPos[1]-12, radarPos[2]+65, radarPos[3]-25, radarPos[4]-25, size/2+(size2/2)-(radarPos[3]/2),size/2+(size2/2)-(radarPos[4]/2), 318, 185,newtarg, 0, -90, 0, tocolor(255,255,255,255))
				dxDrawImage(radarPos[1]-31.1, radarPos[2]-5, 387, 284 ,"files/mapbg.png",0,0,0,tocolor(255,255,255,255))
				local x,y,z = getElementPosition(localPlayer)
				local location = getZoneName(x,y,z)
				for k,v in ipairs(dmgTab) do
					v[3]=v[3]-(getTickCount()-v[1])/800 
					if v[3]<=0 then
						table.remove(dmgTab,k)
					else
						dxDrawImage(radarPos[1]-12, radarPos[2]+65, radarPos[3]-25, radarPos[4]-25,"files/damage.png",0,0,0,tocolor(255,255,255,v[3]))
					end
				end
				if getElementInterior(localPlayer) > 0 then
			    dxDrawImage(radarPos[1]-31, radarPos[2]-5, 387, 284 ,"files/gpsnotfound.png",0,0,0,tocolor(255,255,255,255))
			    end
				local keyIn=getKeyState(zoomPlus)
				local keyOut=getKeyState(zoomMinus)
				if keyIn or keyOut then
					local progress=(getTickCount()-zoomticks)/100
					zoom=math.max(minZoom,math.min(maxZoom,zoom+((keyIn and -1 or 1)*progress)))
				end	
		end
	zoomticks=getTickCount()
	frames=frames+1
end

function prepareBlips(px,py,pz,rot,radiusR)
	for _,blip in ipairs(blips) do
		if isElement(blip) then
			local target=renderData[blip][4]
			local targetType=isElement(target) and getElementType(target) or false
			local bx,by,bz=getElementPosition(blip)
			local a=renderData[blip][3][4]
			if not (localPlayer==occupant and airMode)
			and not (madeByHUD[blip] and (doSkip or occupant))
			and (localPlayer ~= target and a ~= 0 and ((madeByHUD[blip] and radiusR*0.9 or (getBlipVisibleDistance(blip)*1.3))>getDistanceBetweenPoints3D(px,py,pz,bx,by,bz) )) then
				local r,g,b=renderData[blip][3][1],renderData[blip][3][2],renderData[blip][3][3]
				local dist=getDistanceBetweenPoints2D(bx,by,px,py)
				local blipPointRot=0
				local id = renderData[blip][5]
				local bSize = renderData[blip][6]
				local path = renderData[blip][7]
				local blipRot = math.deg(-getVectorRotation(px,py,bx,by)-rot)-180
				local customBlipPath = renderData[blip][2]
				local text = renderData[blip][1]
				local textcolor
				if id == 0 then
					if pz < bz-3 then
						path = "blips/"..id.."-up.png"
					elseif pz > bz+3 then
						path = "blips/"..id.."-up.png"
						blipPointRot = 180
					end
					bSize = bSize/2
				end
				local maxSize = size*0.9
				local sRad = math.min((dist/radiusR)*size,maxSize)
				local dx,dy = getPointFromDistanceRotation(x,y,sRad,blipRot)

				blipimages[#blipimages+1]={dx-bSize/2,dy-bSize/2,22,22,path,blipPointRot,tocolor(255,255,255,255)}
			end
		end
	end
end

function getBlips()
	blips = getElementsByType("blip")
	table.sort(blips,function(b1,b2)
		return getBlipOrdering(b1) < getBlipOrdering(b2)
	end)
	for _,v in pairs(blips) do
		if not renderData[v] then
			renderData[v]={}
		end
		renderData[v][3] = {getBlipColor(v)}
		renderData[v][4] = getElementAttachedTo(v)
		renderData[v][5] = getBlipIcon(v)
		renderData[v][6] = math.min(getBlipSize(v),4)/2*blipDimension
		renderData[v][7] = "blips/"..renderData[v][5]..".png"
	end
end

function getPointFromDistanceRotation(x,y,dist,angle)
	local a = math.rad(90-angle)
	local dx = math.cos(a)*dist
	local dy = math.sin(a)*dist
	return x+dx,y+dy
end

addEventHandler("onClientResourceStart",getResourceRootElement(),onStart)
addEventHandler("onClientPlayerDamage",localPlayer,ultilizeDamageScreen)

screenWidth, screenHeight = guiGetScreenSize()
width = (325 / 1920) * screenWidth
height = (200 / 1080) * screenHeight

map_image = dxCreateTexture( "files/radar.png" )
dxSetTextureEdge( map_image, "clamp" )

function drawCustomRadar()
		if renderData.F11State then
			local _, _, c_Rot = getElementRotation( getCamera());
			local _, _, p_Rot = getElementRotation( localPlayer )	
			local image_size = 1536
			local world_size = 6000
			local image_unit = image_size/world_size
			local x = 40
			local y = screenHeight-height-40
			local draw_radius = 180	
			local player_x, player_y, player_z = getElementPosition( localPlayer )
			local u = (((world_size/2)+player_x)*image_unit)-width/2
			local v = (((world_size/2)-player_y)*image_unit)-height/2
			if ( getElementInterior(localPlayer) == 0 ) then
				dxDrawRectangle( 32, y-9, width+24, height+14, tocolor(0,0,0,170) )
				dxDrawImageSection( x-3, y-4, width+14, height+4, u, v, width, height, map_image, 0, 0, 0, tocolor(255,255,255,190) )
				local zero_x = x+width/2
				local zero_y = y+height/2
				local blips = getElementsByType( "blip" )
				for i in pairs(blips) do
					blip = blips[i]
					local blip_x, blip_y, blip_z = getElementPosition( blip )
					local blip_dist = getDistanceBetweenPoints2D( player_x, player_y, blip_x, blip_y )
						if getBlipVisibleDistance(blip) then
							width = (1800 / 1920) * screenWidth
							height = (980 / 1080) * screenHeight
							local draw_x, draw_y = zero_x, zero_y

							if blip_x > player_x then
								if blip_x > player_x+((width/2)/image_unit) then
									draw_x = draw_x + width/2
								else
									draw_x = draw_x + ((blip_x-player_x)*image_unit)
								end
							elseif blip_x < player_x then
								if blip_x < player_x-((width/2)/image_unit) then
									draw_x = draw_x - width/2
								else
									draw_x = draw_x - ((player_x-blip_x)*image_unit)
								end
							end

							if blip_y > player_y then
								if blip_y > player_y+((height/2)/image_unit) then
									draw_y = draw_y - height/2
								else
									draw_y = draw_y - ((blip_y-player_y)*image_unit)
								end
							elseif blip_y < player_y then
								if blip_y < player_y-((height/2)/image_unit) then
									draw_y = draw_y + height/2 
								else
									draw_y = draw_y + ((player_y-blip_y)*image_unit)
								end
							end

							local icon = getBlipIcon(blip)
							local scale = getBlipSize(blip)
							if inbox(draw_x-20/2, draw_y-20/2, 20, 20) then
								createToolTip(draw_x-20/2 + 5, draw_y-20/2, getBlipName(icon))
							end
							if icon == 0 then
								scale = scale*6.15
								if blip_z > player_z+10 then
									dxDrawImage( draw_x-20/2, draw_y-20/2, 20, 20, "blips/"..icon.."-up.png", 0, 0, 0, tocolor(getBlipColor(blip)) )
								elseif blip_z < player_z-10 then
								else
									dxDrawImage( draw_x-20/2, draw_y-20/2, 20, 20, "blips/"..icon..".png", 0, 0, 0, tocolor(getBlipColor(blip)) )
								end
							else
								scale = scale*11.5
								dxDrawImage( draw_x-20/2, draw_y-20/2, 20, 20, "blips/"..icon..".png" )
							end
						end
				local player_rx, player_ry, player_rz = getElementRotation( localPlayer )
				dxDrawImage( zero_x-10, zero_y-10, 20, 21, "files/arrow.png", 360-player_rz )
				end
			end
		end
end

local blipNames = {
	{5, "Areo Porto"},	
	{6, "Loja de Armas"},	
	{7, "Gasolina"},	
	{8, "Radio Musica"},	
	{10, "Auto Escola"},	
	{11, "Constuição"},	
	{12, "Pedreiro"},	
	{13, "Loja em Desconto"},	
	{14, "Loja de Armas - Segura"},
	{15, "Copa"},
	{16, "Fabrica"},
	{17, "Mercadinho"},
	{18, "Hospital"},
	{19, "Pescaria"},
	{20, "Incedio - Roubo"},
	{21, "Delegacia"},
	{22, "Socorre - Paciente"},
	{23, "Fabrica de Armas"},
	{24, "Turnagem"},
	{25, "Taxistas"},
	{26, "Banco"},
	{27, "Mecanico - Paciente"},
	{28, "Marcado"},
	{30, "Procurado"},
	{31, "Casa - Venda"},
	{33, "Casa"},
	{34, "Roubo - Roubado"},
	{35, "Prefeitura"},
	{36, "Lenhador - Casinha"},
	{37, "Pescador - Barco"},
	{38, "Super Mercado"},
	{39, "Tatuagens"},
	{40, "Marcado"},
	{41, "Banco"},
	{42, "Trabalho"},
	{43, "Posto - Fechado"},
	{44, "Posto - Aberto"},
	{45, "Caixa Eletronica - Roubo"},
	{46, "Correio"},
	{47, "Loja de Roupas"},
	{48, "Radio Musica"},
	{49, "Lanchonete"},
	{50, "Burger King"},
	{51, "Caminhoneiro - Carga"},
	{52, "Caixa Eletronica"},
	{53, "Barbearia"},
	{54, "Academia"},
	{55, "Meu Veiculo"},
	{56, "Barreira"},
	{57, "Final"},
	{58, "Minerador"},
	{59, "Ponto de Onibus"},
	{60, "Carregador"},
}

function getBlipName(icon_id)
	for k, v in ipairs(blipNames) do
		if v[1] == icon_id then
			return v[2]
		end
	end
	return "Desconhecido"
end

addEventHandler("onClientKey", getRootElement(), function(key,state) 
	if state and key == "" then
		cancelEvent()
		renderData.F11State = not renderData.F11State
		if renderData.F11State then
			addEventHandler( "onClientRender", getRootElement(), drawCustomRadar )
			showChat(false)
			showCursor(true)
		else
			removeEventHandler( "onClientRender", getRootElement(), drawCustomRadar )
			showChat(true)
			showCursor(false)
		end
	end
end)



addEventHandler("onClientClick", root, moveRadar)

function resetRadar()
if not moving then
	radarPos[1] = sw[1]*20/1440+5
	radarPos[2] = sw[2]-(200+50)+25
	end
end
addCommandHandler("resetradar", resetRadar)

function math.round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end

function inbox(ax, ay, bx, by)
	if not isCursorShowing() then return false end
	local mx, my = getCursorPosition()
	mx, my = mx*sx, my*sy
	bx = ax+bx
	by = ay+by
	return ax <= mx and bx >= mx and ay <= my and by >= my
end

function createToolTip(x, y, text)
	local textWidth = dxGetTextWidth(text, 1, "default")
	dxDrawRectangle(x + 18, y, textWidth + 10, 20, tocolor(0, 0, 0, 160))
	dxDrawText(text, x + 18 + 5, y + 4, textWidth + 10, 20, tocolor(159, 159, 159, 255 ), 0.5, newfont)
end