
local screenW,screenH = guiGetScreenSize()
local resW,resH = 1360,768
local x,y =  (screenW/resW), (screenH/resH)

local dxfont0_arista = dxCreateFont("font.ttf", 10)
function speedo ()
	local vehicle = getPedOccupiedVehicle( getLocalPlayer() )
	    if not( vehicle ) then return end
			local speedX, speedY, speedZ = getElementVelocity ( vehicle  )
		    local actualSpeed = (speedX^2 + speedY^2 + speedZ^2)^(0.5) 
		    local KMH = math.floor(actualSpeed*180)	
			if ( getElementHealth( vehicle ) >= 1000 ) then
		        vehiclehealth = 1000
		    else
		        vehiclehealth = math.floor(getElementHealth ( vehicle ))
		    end
			local h,m,j = getElementPosition (localPlayer)
	    dxDrawImage(screenW * 0.4539, screenH * 0.8464, screenW * 0.0791, screenH * 0.1341, "imgs/Marcador.png", 0, 0, 0, tocolor(0, 0, 0, 141), false)
		dxDrawText(""..KMH.."", screenW * 0.4700, screenH * 0.8815, screenW * 0.5176, screenH * 0.9258, tocolor(30, 183, 0, 255), x*2.00, dxfont0_arista, "center", "center", false, false, false, false, false)
        dxDrawText("#8EE53FK#FFFFFFM#8EE53FH", screenW * 0.4649, screenH * 0.9219, screenW * 0.5220, screenH * 0.9518, tocolor(255, 255, 255, 255), x*1.4, dxfont0_arista, "center", "center", false, false, false, true, false)
        dxDrawText(""..vehiclehealth.."%#bebebe", screenW * 0.5307, screenH * 0.9648, screenW * 0.5586, screenH * 0.9870, tocolor(255, 255, 255, 255), x*1.00, dxfont0_arista, "center", "center", false, false, false, true, false)
        dxDrawImage(screenW * 0.5307, screenH * 0.9323, screenW * 0.0183, screenH * 0.0326, "imgs/vd.png", 0, 0, 0, tocolor(174, 254, 0, 101), false)
        dxDrawImage(screenW * 0.5344, screenH * 0.9375, screenW * 0.0110, screenH * 0.0208, "imgs/mec.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    end

addEventHandler("onClientRender", root,speedo)
