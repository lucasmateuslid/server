antiSpam = {} 
function antiChatSpam() 
	if isTimer(antiSpam[source]) then
		cancelEvent()  
		outputChatBox("#FFFFFF"..getPlayerName(source).." #ff6600Foi mutado por Flood no Chat! (60 segundos)", getRootElement(), 255, 255, 0,true) 
		setPlayerMuted(source, true)
		setTimer ( autoUnmute, 60000, 1, source)
	else
		antiSpam[source] = setTimer(function(source) antiSpam[source] = nil end, 1000, 1, source) 
	end
end
addEventHandler("onPlayerChat", root, antiChatSpam)


function autoUnmute ( player )
	if ( isElement ( player ) and isPlayerMuted ( player ) ) then
		setPlayerMuted ( player, false )
		outputChatBox ("#FFFFFF"..getPlayerName ( player ).." #80FF00Foi desmutado!",getRootElement(), 255, 255, 0,true )
	end
end