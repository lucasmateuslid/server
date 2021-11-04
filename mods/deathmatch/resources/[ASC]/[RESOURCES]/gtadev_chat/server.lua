function getChatMessage( message, page )

	if message then

		if page == "anonymous" then

			triggerClientEvent( root, "setChatMessage", resourceRoot, "Usuario Anonimo: " .. message, page )

		else

			triggerClientEvent( root, "setChatMessage", resourceRoot, getPlayerName( client ) .. ": " .. message, page )

		end

	end

end
addEvent( "getChatMessage", true )
addEventHandler( "getChatMessage", resourceRoot, getChatMessage )

addEvent("executePlayerCommand", true)
addEventHandler("executePlayerCommand", resourceRoot,
	function(command, args)
		if (hasObjectPermissionTo(client, "command."..command, true)) then
			executeCommandHandler(command, client, args)
		end
	end
)