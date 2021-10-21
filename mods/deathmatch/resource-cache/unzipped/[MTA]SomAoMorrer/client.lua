local screenW,screenH = guiGetScreenSize()
local resW,resH = 1280,720
local sW,sH =  (screenW/resW), (screenH/resH)
	
addEventHandler( "onClientPlayerWasted", getLocalPlayer(),
    function()
        addEventHandler("onClientRender", root, drawPlayerWastedScreen)
		removeScreen()
        showChat( true )		
        playSound("audio/wasted.mp3")	
	end)	
  
function removeScreen()
	setTimer ( function()
        removeEventHandler("onClientRender", root, drawPlayerWastedScreen)		
	end, 5000, 1 )
end	

addEventHandler( "onClientPlayerSpawn", getLocalPlayer(),
	function()
        showChat( true )
    end)