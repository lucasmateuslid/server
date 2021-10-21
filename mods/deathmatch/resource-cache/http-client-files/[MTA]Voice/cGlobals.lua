SETTINGS_REFRESH = 2000 -- Interval in which team channels are refreshed, in MS.
bShowChatIcons = true

voicePlayers = {}
globalMuted = {}

local range = 40 
  
addEventHandler ( "onClientPlayerVoiceStart", root, 
function() 
    if (source and isElement(source) and getElementType(source) == "player") and localPlayer ~= source then
    	
    	local l = getElementData(localPlayer, "emChamada")
    	local s = getElementData(source, "emChamada")

		if l and type(l) == "table" and isElement(l[1]) and getElementType(l[1]) == "player" then
			if s and type(s) == "table" and isElement(s[1]) and getElementType(s[1]) == "player" then
				if l[1] == source and s[1] == localPlayer and l[3] == true and s[3] == true then
    				voicePlayers[source] = true
					return
				end
			end
    	end

    	if not s then
        	local sX, sY, sZ = getElementPosition(localPlayer) 
        	local rX, rY, rZ = getElementPosition(source) 
        	local distance = getDistanceBetweenPoints3D(sX, sY, sZ, rX, rY, rZ) 
        	
        	if distance <= range then 
            	voicePlayers[source] = true 
        	else 
            	cancelEvent()
        	end
        else
        	cancelEvent()
        end 
    end 
end 
)

addEventHandler ( "onClientPlayerVoiceStop", root,
	function()
		voicePlayers[source] = nil
	end
)

addEventHandler ( "onClientPlayerQuit", root,
	function()
		voicePlayers[source] = nil
	end
)
---

function checkValidPlayer ( player )
	if not isElement(player) or getElementType(player) ~= "player" then
		outputDebugString ( "is/setPlayerVoiceMuted: Bad 'player' argument", 2 )
		return false
	end
	return true
end

---

setTimer ( 
	function()
		bShowChatIcons = getElementData ( resourceRoot, "show_chat_icon", show_chat_icon )
	end,
SETTINGS_REFRESH, 0 )