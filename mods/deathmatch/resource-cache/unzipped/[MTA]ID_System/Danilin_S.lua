--[[
/\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\/
										            Curta a Minha Página <3									        
 									     	https://www.facebook.com/danilinmtascr/		
								   
                        :::::::::      :::     ::::    ::: ::::::::::: :::        ::::::::::: ::::    ::: 
                        :+:    :+:   :+: :+:   :+:+:   :+:     :+:     :+:            :+:     :+:+:   :+: 
                        +:+    +:+  +:+   +:+  :+:+:+  +:+     +:+     +:+            +:+     :+:+:+  +:+ 
                        +#+    +:+ +#++:++#++: +#+ +:+ +#+     +#+     +#+            +#+     +#+ +:+ +#+ 
                        +#+    +#+ +#+     +#+ +#+  +#+#+#     +#+     +#+            +#+     +#+  +#+#+# 
                        #+#    #+# #+#     #+# #+#   #+#+#     #+#     #+#            #+#     #+#   #+#+# 
                        #########  ###     ### ###    #### ########### ########## ########### ###    #### 
                                        						
/\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\//\\/
--]]
function Start_Id ( _, acc )
	if eventName == "onPlayerLogin" then
		setElementData ( source, "ID", getAccountID(acc) or "N/A" )
		outputChatBox ( "", root, 255,255,255,true)
	elseif eventName == "onPlayerLogout" then
		removeElementData( source, "ID" )
		outputChatBox ( "", root, 255,255,255,true)
	elseif eventName == "onResourceStart" then
		for _, player in pairs(getElementsByType("player")) do
			local acc = getPlayerAccount(player)
			if not isGuestAccount(acc) then
				setElementData( source, "ID", getAccountID(acc) or "N/A" )
			end
		end
	end
end
addEventHandler("onResourceStart", resourceRoot, Start_Id)
addEventHandler("onPlayerLogout", root, Start_Id)
addEventHandler("onPlayerLogin", root, Start_Id)

function getPlayerID(id)
	v = false
	for i, player in ipairs (getElementsByType("player")) do
		if getElementData(player, "ID") == id then
			v = player
			break
		end
	end
	return v
end
--============================================================================================================================--
                                   --=============================--
                                   ----------- ID PLAYER ------------
                                   --=============================--
function getnick(player, command, id, ...)
    if(id) then
        local playerID = tonumber(id)
		if(playerID) then
			local Player2 = getPlayerID(playerID)
			if(Player2) then	
				outputChatBox ( "#FFFFFF[ID] - " .. getPlayerName(Player2) .."", player, 255,255,255,true)
			else
				outputChatBox ( "", player, 255,255,255,true)
			end 
		else
			outputChatBox ( "", player, 255,255,255,true)
		end
	else
		outputChatBox ( "", player, 255,255,255,true)
	end
end
addCommandHandler("id", getnick)