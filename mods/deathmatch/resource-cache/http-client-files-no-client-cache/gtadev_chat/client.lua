Chatbox = { };

cLocal = { };
cTwitter = { };
cOlx = { };
cAnonymous = { };

addEventHandler( "onClientResourceStart", resourceRoot,
	function( )

		local showC = showChat( false )

		if showC == true then

			showChat( false )
			addEventHandler( "onClientRender", root, chatbox )

		end

		Animationtick = getTickCount( )
		pagechat = 'local'
		selectchat = pagechat

		digit = guiCreateEdit( chatPosition[ 1 ], chatPosition[ 2 ] + 28 * 10, 344, 26, "dsadasd", false )
		guiSetAlpha( digit, 0 )
		guiSetVisible( digit, false )
		guiEditSetMaxLength( digit, 35 )

	end
)

function chatbox( )

	dxDrawRectangle( chatPosition[ 1 ], chatPosition[ 2 ], 344, 36, tocolor( 0, 0, 0, 120 ), false )

	if showdigit then

		if isElement( digit ) then

			dxDrawTextDigit( guiGetText( digit ), chatPosition[ 1 ], chatPosition[ 2 ] + 28 * 10, 344, 26, tocolor( 0, 0, 0, 120 ), roboto )

		end

	end

	for i, v in ipairs( chat ) do

		if export:cursorOnElement( chatPosition[ 1 ] + i * 86 - 86, chatPosition[ 2 ], 86, 36 ) or selectchat == v then

			dxDrawRectangle( chatPosition[ 1 ] + i * 86 - 86, chatPosition[ 2 ], 86, 36, tocolor( 0, 0, 0, 50 ), false )
			dxDrawRectangle( chatPosition[ 1 ] + i * 86 - 86, chatPosition[ 2 ] + 6 * 6 , 86, 2, tocolor( 255, 68, 47, 255 ), false )

		end

		dxDrawImage( chatPosition[ 1 ] + i * 86 - 86, chatPosition[ 2 ], 86, 36, "assets/icons/"..v..".png", 0, 0, 0, tocolor( 255, 255, 255, 255 ), false )

	end

	if pagechat == 'local' then

		for iloc, loc in ipairs( cLocal ) do

			if iloc > 12 then

				table.remove( cLocal, 1 )

			end

			if loc.visible then

				loc.alpha = loc.alpha + 10

				if loc.alpha > 255 then

					loc.alpha = 255

				end

			end

			dxDrawTextCenter( loc.message, chatPosition[ 1 ], chatPosition[ 2 ] + iloc * 20 + 20, 344, 20, { 2, 251, 251, loc.alpha }, { 255, 255, 255, loc.alpha }, roboto )

		end

	elseif pagechat == 'twitter' then

		for itw, twi in ipairs( cTwitter ) do

			if twi.visible then

				twi.alpha = twi.alpha + 10

				if twi.alpha > 255 then

					twi.alpha = 255

				end

			end

			if itw > 12 then

				table.remove( cTwitter, 1 )

			end

			dxDrawTextCenter( twi.message, chatPosition[ 1 ], chatPosition[ 2 ] + itw * 20 + 20, 344, 20, { 30, 161, 242, twi.alpha }, { 255, 255, 255, twi.alpha }, roboto )

		end

	elseif pagechat == 'olx' then

		for iol, vol in ipairs( cOlx ) do

			if vol.visible then

				vol.alpha = vol.alpha + 10

				if vol.alpha > 255 then

					vol.alpha = 255

				end

			end

			if iol > 12 then

				table.remove( cOlx, 1 )

			end

			dxDrawTextCenter( vol.message, chatPosition[ 1 ], chatPosition[ 2 ] + iol * 20 + 20, 344, 20, { 113, 11, 214, vol.alpha }, { 255, 255, 255, vol.alpha }, roboto )

		end

	elseif pagechat == 'anonymous' then

		for iav, van in ipairs( cAnonymous ) do

			if van.visible then

				van.alpha = van.alpha + 10

				if van.alpha > 255 then

					van.alpha = 255

				end

			end

			if iav > 12 then

				table.remove( cAnonymous, 1 )

			end

			dxDrawTextCenter( van.message, chatPosition[ 1 ], chatPosition[ 2 ] + iav * 20 + 20, 344, 20, { 255, 60, 60, van.alpha }, { 255, 255, 255, van.alpha }, roboto )

		end

	end

end

addEventHandler( "onClientClick", root,
	function( button, state )

		if ( button == "left" and state == "down" ) then

			for i, v in ipairs( chat ) do

				if export:cursorOnElement( chatPosition[ 1 ] + i * 86 - 86, chatPosition[ 2 ], 86, 36 ) then

					selectchat = v
					pagechat = selectchat

				end

			end

		end

	end
)

addEventHandler( "onClientKey", root,
	function( key, press )

		if key == "y" then

			if showdigit == false then

				showdigit = true
				guiSetVisible( digit, true )
				guiFocus( digit )
				setTimer( function( ) guiSetText( digit, "" ) end, 4, 1 )
				showCursor( true )

			end

		elseif key == "enter" then

			if pagechat then

				if showdigit == true then

					local text = guiGetText(digit)
					if text ~= "" then
						if (string.sub(text,1,1) == "t") then
							text = text:sub(2, #text)

							if (text:gsub("%s", "") == "")then
								return
							end

							local command = text:split(" ")
							local args = ""
							for i=2, #command do
								args = args.." "..command[i]
							end

							executeCommandHandler(command[1], args)
							triggerServerEvent("executePlayerCommand", resourceRoot, command[1], args)
						else
							while (text:find("@@@@@@@@@@")) do
								text = msg:gsub("@@@@@@@@@@", "@@@")
							end

							triggerServerEvent( "getChatMessage", resourceRoot, guiGetText( digit ), pagechat )

						end

					end

					showdigit = false
					guiSetVisible( digit, false )
					showCursor( false )

				end

			end

		end

	end
)

function setChatMessage( message, page )

	if message and page then

		local self = setmetatable( {

			message = message,
			pagechat = page,
			color = { },
			alpha = 0,
			visible = true,

		}, Chatbox )

		if self then

			if self.pagechat == 'local'then

				table.insert( cLocal, self )

			elseif self.pagechat == 'twitter' then

				table.insert( cTwitter, self )

			elseif self.pagechat == 'olx' then

				table.insert( cOlx, self )

			elseif self.pagechat == 'anonymous' then

				table.insert( cAnonymous, self )

			end

		end

	end

	return self;
end
addEvent( "setChatMessage", true )
addEventHandler( "setChatMessage", resourceRoot, setChatMessage )