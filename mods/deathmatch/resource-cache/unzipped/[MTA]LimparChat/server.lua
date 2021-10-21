function limpar_chat(source)
    if ( hasObjectPermissionTo ( source, "command.mute", true ) ) then
    triggerClientEvent(root, "LimpouChat", root, getPlayerName( source ) )
	for i = 1,40 do
    i = outputChatBox(" ")
    end
    end
end
addCommandHandler("chat", limpar_chat)