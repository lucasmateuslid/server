function godCommand(player)
	if hasObjectPermissionTo(player, "command.kick") then
	if getElementData(player,"onProt") then
	setElementData(player,"onProt",false)
	outputChatBox("",player,255,255,0,true)
	else
	setElementData(player,"onProt",true)
	outputChatBox("",player,255,255,0,true)
	end
	end
end
addCommandHandler("pro",godCommand)