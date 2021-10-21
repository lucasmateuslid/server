local VOICECHAT_DISTANCE = 25
local VOICECHAT_MINDISTANCE = 5
local voicePlayers = {}

local streamedOut = {}

addEventHandler("onClientPreRender", root,
	function ()
        local players = getElementsByType("player", root, true)

        for k, v in ipairs(players) do    
            local vecSoundPos = position
            local vecCamPos = position
            local fDistance = (vecSoundPos - vecCamPos).length
            local fMaxVol = 9
            local fMinDistance = VOICECHAT_MINDISTANCE
            local fMaxDistance = VOICECHAT_DISTANCE

            local fPanSharpness = 1.0
            if (fMinDistance ~= fMinDistance * 2) then
                fPanSharpness = math.max(0, math.min(1, (fDistance - fMinDistance) / ((fMinDistance * 2) - fMinDistance)))
            end

            local fPanLimit = (0.65 * fPanSharpness + 0.35)

            local vecLook = Camera.matrix.forward.normalized
            local vecSound = (vecSoundPos - vecCamPos).normalized
            local cross = vecLook:cross(vecSound)
            local fPan = math.max(-fPanLimit, math.min(-cross.z, fPanLimit))

            local fDistDiff = fMaxDistance - fMinDistance;

            local fVolume
            if (fDistance <= fMinDistance) then
                fVolume = fMaxVol
            elseif (fDistance >= fMaxDistance) then
                fVolume = 0.0
            else
                fVolume = math.exp(-(fDistance - fMinDistance) * (5.0 / fDistDiff)) * fMaxVol
            end
            setSoundPan(v, fPan)

            if isLineOfSightClear(localPlayer.position, vecSoundPos, true, true, false, true, false, true, true, localPlayer) then
                setSoundVolume(v, fVolume)
                setSoundEffectEnabled(v, "compressor", false)
            else
                local fVolume = fVolume * 0.5
                local fVolume = fVolume < 0.01 and 0 or fVolume
                setSoundVolume(v, fVolume)
                setSoundEffectEnabled(v, "compressor", true)
            end
        end
    end
, false)

addEventHandler("onClientElementStreamIn", root,
    function ()
        if source:getType() == "player" then
            triggerServerEvent("proximity-voice::broadcastUpdate", localPlayer, getElementsByType("player", root, true))
        end
    end
)

addEventHandler("onClientElementStreamOut", root,
    function ()
        if source:getType() == "player" then
            triggerServerEvent("proximity-voice::broadcastUpdate", localPlayer, getElementsByType("player", root, true))
            setSoundPan(source, 0)
            setSoundVolume(source, 0)
        end
    end
)

addEventHandler("onClientResourceStart", resourceRoot,
    function ()
        triggerServerEvent("proximity-voice::broadcastUpdate", localPlayer, getElementsByType("player", root, true))
    end
, false)


addEventHandler("onClientRender", root,
	function()
		local index = 0
		for player in pairs(voicePlayers) do
			local x,y,z = getElementPosition(localPlayer)
			local x2, y2, z2 = getElementPosition(player)
			local dist = getDistanceBetweenPoints3D(x,y,z,x2,y2,z2)
            local fMaxDistance = VOICECHAT_DISTANCE
			if dist <= VOICECHAT_DISTANCE then
				local color = tocolor(255, 255, 255, 255)
				dxDrawVoiceLabel ( player, index, color )
				index = index + 1
			end
		end
	end
)

function dxDrawVoiceLabel ( player, index, color )
	local sx, sy = guiGetScreenSize ()
	local scale = sy / 800
	local spacing = ( 20 * scale )
	local px, py = sx - 200, sy * 0.7 + spacing * index

	px = px + spacing
	ID = getElementData (player, "ID") or "N/C"

	dxDrawText ( "["..ID.."] "..getPlayerName ( player ), px, py, px, py, tocolor(255, 255, 255, 195), 1.00, "default-bold", "left", "top", false, false, false, true, false)
end

addEventHandler("onClientPlayerVoiceStart", root,
	function()
		voicePlayers[source] = true
	end
)

addEventHandler("onClientPlayerVoiceStop", root,
	function()
		voicePlayers[source] = nil
	end
)

addEventHandler("onClientPlayerQuit", root,
	function()
		voicePlayers[source] = nil
	end
)
