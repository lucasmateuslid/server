-----------------------------------------------
--                                            --
--                                            --
--   Mod Feito Por: Pedro Ribeiro Dos Santos  --
--                                            --
--                                            --
--    Favor não tirar os creditos             --
--                                            --
--                                            --
--                                            --
--                                            --
--                                            --
--                                            --
-------------------------------------------------









function getPlayerID(player)
return  getElementData(player,"ID")
end

function getPlayerIDG(thePlayer)
return  getElementData(thePlayer,"ID")
end


function MensagemTwitter(source, cmd, ...) 
    local MessagemT = table.concat ( { ... }, " " )
    local name = getPlayerName(source); 
for _,v in ipairs(getElementsByType("player")) do 
    outputChatBox("#4682B4▪  [ChatGeral]  ▪  #FFFFFF"..name.." ["..getPlayerID(source).."] #FFFFFF: "..MessagemT,v, 255, 255, 255, true) --efeito no chat
    end 
end 
addCommandHandler("ChatGeral",  MensagemTwitter)
  

addEventHandler("onPlayerJoin", getRootElement(),  
function() 
  bindKey(source, "y", "down", "chatbox", "ChatGeral") --bind
end 
) 

addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), function() 
  for index,player in pairs(getElementsByType("player")) do 
        bindKey(player,"y", "down", "chatbox", "ChatGeral") --bind
  end 
end 
) 