﻿---- Developed by SiiLVa
---- Please, don't remove the credits.

local screenW, screenH = guiGetScreenSize() 

local cp1, cp2 = (screenW - 1024)/2, (screenH - 768) /2
local tex1, tex2 = (screenW-1024), (screenH-768)

local ax1, ax2 =  cp1, cp2
local te1, te2 = tex1, tex2

bindAbrir = "b"
bindColocar = "n"
comandoAtivar = "blitz"


tabela = {

{"Barreira_1", "barrier.png", 659, 604, 50, 50,    1228},
{"Barreira_2", "barrier2.png", 721, 600, 50, 50,   1427},
{"Cone", "cone.png", 850, 600, 50, 50,             1238},
{"Cone_Grande_2", "conao.png", 785, 600, 50, 50,   1237},
{"Fura_Pneus", "stinger.png", 910, 600, 50, 50,    2899},

}

function returnName (requestName)
	for i,item in ipairs(tabela) do
		if ( requestName == tostring(item[1]) ) then
			return tostring(item[2])
		end
	end
	return false
end

function returnID (requestName)
	for i,item in ipairs(tabela) do
		if ( requestName == tostring(item[1]) ) then
			return tostring(item[7])
		end
	end
	return false
end

cor = {}
function dxBlitz_ ()
		dxDrawRectangle(cp1+639, cp2+557, 339, 145, tocolor(80, 80, 80, 255), false)
        dxDrawRectangle(cp1+639, cp2+557, 339, 24, tocolor(125, 125, 125, 255), false)
		dxDrawText("Brasil Gaming Realista / EB-ROTA", 657+tex1, 558+tex2, 955, 579, tocolor(67, 67, 67, 255), 1.00, "clear", "center", "center", false, false, false, false, false)
        dxDrawText("Para colocar a blitz pressione a tecla 'N'.", 666+tex1/2, 659+tex2, 951, 684, tocolor(254, 254, 254, 254), 1.00, "clear", "left", "center", false, false, false, true, false)
		for i=1, #tabela do
			if  tabela[i][1] ~= "Fura_Pneus" then
				cor[1] = tocolor(255, 255, 255, 255)
			else
				cor[1] = tocolor(255, 255, 255, 42)
			end
		if isCursorOnElement(cp1+tabela[i][3],cp2+tabela[i][4],tabela[i][5],tabela[i][6]) and tabela[i][1] ~= "Fura_Pneus" then
			cor[1] = tocolor(94, 124, 236, 254)
		end
			if getElementData(localPlayer, "element_blitz") == tabela[i][1] then
				cor[1] = tocolor(94, 124, 236, 254)
			end
			dxDrawImage(cp1+tabela[i][3],cp2+tabela[i][4],tabela[i][5],tabela[i][6], "images/"..tabela[i][2], 0, 0, 0, cor[1], false)
		
		end		
	if getElementData(localPlayer, "element_blitz") ~= "" then
		local retornar = returnName(getElementData(localPlayer, "element_blitz"))
		dxDrawRectangle(cp1+459, cp2+557, 179, 145, tocolor(80, 80, 80, 255), false)
        dxDrawRectangle(cp1+459, cp2+557, 179, 24, tocolor(125, 125, 125, 255), false)
        dxDrawImage(cp1+521, cp2+598, 50, 50, "images/"..retornar, 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawText(""..getElementData(localPlayer, "element_blitz"), 476+tex1, 663+tex2, 622, 680, tocolor(254, 254, 254, 254), 1.00, "default", "center", "center", false, false, false, false, false)
	end
end

function moveBlitz()
	if getKeyState("mouse1") and isCursorShowing() then
		local mx,my = getCursorPosition ()
		local fullx,fully = guiGetScreenSize()
		cursorx,cursory = mx*fullx,my*fully
		x = cursorx
		y = cursory
		cp1, cp2 = x-810, y-565
		tex1, tex2 = cp1*2, cp2*2
	else
		removeEventHandler("onClientRender", root, moveBlitz)
		movingblitz = false
	end
end

function moveBlitzStart(b, s)
		if b == "left" and s == "down" then
			if inBoxS(cp1+639, cp2+557, 339, 24) then
				addEventHandler("onClientRender", root, moveBlitz)
			end
		elseif b == "right" and s == "down" then
		if inBoxS(cp1+639, cp2+557, 339, 24) then
			if not movingblitz then
				cp1, cp2 = ax1, ax2
				tex1, tex2 = te1, te2
			end
		end
	end
end
addEventHandler("onClientClick", root, moveBlitzStart)

function inBoxS(sx, sy, bx, by)
	if not isCursorShowing() then return false end
	local mx, my = getCursorPosition()
	mx, my = mx*screenW, my*screenH
	bx = sx+bx
	by = sy+by
	return sx <= mx and bx >= mx and sy <= my and by >= my
end

bindKey(bindAbrir, "down",  
function()
	if getElementData(localPlayer, "modo_blitz") then
		triggerServerEvent("checkACL_blitz", localPlayer)
	else
		outputChatBox("")
	end
end
)

bindKey(bindColocar, "down",  
function()
	if not isEventHandlerAdded("onClientRender", root, dxBlitz_) then
		if getElementData(localPlayer, "modo_blitz") then
			if getElementData(localPlayer, "element_blitz") ~= "" then
				triggerServerEvent("putObjectBlitz", localPlayer, getElementData(localPlayer, "element_blitz"), returnID(getElementData(localPlayer, "element_blitz")))
			else
				outputChatBox("")
			end
		else
			outputChatBox("")
		end
	else
		outputChatBox("")
	end
end
)

addCommandHandler(comandoAtivar,
function()
	if not getElementData(localPlayer, "modo_blitz") then
		setElementData(localPlayer, "modo_blitz", true)
		outputChatBox("Modo blitz ativado!, aperte 'X'")
		setElementData(localPlayer, "element_blitz", "")
	else
		setElementData(localPlayer, "modo_blitz", false)
		setElementData(localPlayer, "element_blitz", "")
		if isEventHandlerAdded("onClientRender", root, dxBlitz_) then
			removeEventHandler("onClientRender", root, dxBlitz_)
			showCursor(false)
		end
		outputChatBox("")
	end
end
)

addEvent("openBlitzDx", true)
addEventHandler("openBlitzDx", root, 
function()
	if not isEventHandlerAdded("onClientRender", root, dxBlitz_) then
		showCursor(true)
		addEventHandler("onClientRender", root, dxBlitz_)
	else
		removeEventHandler("onClientRender", root, dxBlitz_)
		showCursor(false)
	end
end)

addEventHandler("onClientClick", root, 
function(_, state)
	if isEventHandlerAdded("onClientRender", root, dxBlitz_) then
		if state == "down" then
			for i=1, #tabela do
				if isCursorOnElement(cp1+tabela[i][3],cp2+tabela[i][4],tabela[i][5],tabela[i][6]) then
					if getElementData(localPlayer, "element_blitz") == tabela[i][1] then
							setElementData(localPlayer, "element_blitz", "")
						return
					end
					if getElementData(localPlayer, "element_blitz") ~= tabela[i][1] and tabela[i][1] ~= "Fura_Pneus" then
							setElementData(localPlayer, "element_blitz", tabela[i][1]) 
							--outputChatBox(tabela[i][1])
						return
					end
				end
			end
		end
	end
end	
)

addEventHandler ( "onClientClick", root,
function (_,state,_,_,_,_,_,objectOnRange)
	if state == "down" then
		if ( objectOnRange ) then
			if ( getElementType ( objectOnRange ) == "object" ) then	
			local cx, cy, cz = getElementPosition ( objectOnRange )
			local px, py, pz = getElementPosition ( localPlayer )
			local distance	= getDistanceBetweenPoints3D ( cx, cy, cz, px, py, pz )
				if ( distance <= 5 ) then
					if getElementData(localPlayer, "modo_blitz") then 
						if getElementData(objectOnRange, "elementFromBlitz") then
							triggerServerEvent ( "deleteObjectBlitz", localPlayer, objectOnRange )
						end
					end
				end
			end
		end
	end
end 
)

function tag(source)
  local px, py, pz, tx, ty, tz, dist
  px, py, pz = getCameraMatrix( )
  for _, v in ipairs( getElementsByType 'player' ) do
    tx, ty, tz = getElementPosition( v )
    dist = math.sqrt( ( px - tx ) ^ 2 + ( py - ty ) ^ 2 + ( pz - tz ) ^ 2 )
    if dist < 50.0 then
      if isLineOfSightClear( px, py, pz, tx, ty, tz, true, false, false, true, false, false, false,localPlayer ) then
        local sx, sy, sz = getPedBonePosition( v, 5 )
        local x,y = getScreenFromWorldPosition( sx, sy, sz + 0.3 )
        if x then
          if getElementData(localPlayer, "modo_blitz") then
           dxDrawImage(x - 10, y - 75, 40, 40, "images/blitzmode.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
          end
        end
      end
    end
  end
end
addEventHandler("onClientRender", root, tag)


addEventHandler("onClientRender", getRootElement(),
function()
	if getElementData(localPlayer, "modo_blitz") then
		for _, v in ipairs (getElementsByType("object")) do
		local cx, cy, cz = getElementPosition ( v )
		local px, py, pz = getElementPosition ( localPlayer )
			if  getDistanceBetweenPoints3D ( cx, cy, cz, px, py, pz ) <= 3 then 
				local sx, sy = getScreenFromWorldPosition (cx, cy, cz)
				if sx then
					if not isCursorShowing() then return end
					if getElementData(v, "elementFromBlitz") then
						dxDrawText("Clique no objeto para deleta-lo.",sx - 50,sy-40 ,screenW, screenH,tocolor ( 0, 0, 0, 230 ), 1,"default-bold", "left", "top", false, false, false, false, false)
						dxDrawText("Clique no objeto para deleta-lo.",sx - 51,sy-41 ,screenW, screenH,tocolor ( 255, 255, 255, 230 ), 1,"default-bold", "left", "top", false, false, false, true, false)
					end
				end
			end
		end
	end
end
)

function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
	if 
		type( sEventName ) == 'string' and 
		isElement( pElementAttachedTo ) and 
		type( func ) == 'function' 
	then
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

function isCursorOnElement( posX, posY, width, height )
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