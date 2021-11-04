screenSize = { guiGetScreenSize( ) };

export = exports[ "gtadev_assets" ]
pagechat = nil
Animationtick = getTickCount( )

selectchat = nil
showdigit = false

roboto = export:getCreateFont( "gtadevFont", 9, false )
chatPosition = { ( screenSize[ 1 ] / 2 - screenSize[ 1 ] / 2 + ( 20 ) ), ( screenSize[ 2 ] / 2 - screenSize[ 2 ] / 2 + ( 6 * 4 ) ) };

chat = {

	"local", 
	"twitter", 
	"olx", 
	"anonymous",

}

function dxDrawTextCenter( text, x, y, w, h, color, colortext, font )

	dxDrawImage( x, y + 6, 8, 8, "assets/icons/circle.png", 0, 0, 0, tocolor( color[ 1 ], color[ 2 ], color[ 3 ], color[ 4 ] ), false )
	dxDrawText( text or "", x + 10, y, w, h + y, tocolor( colortext[ 1 ], colortext[ 2 ], colortext[ 3 ], colortext[ 4 ] ), 1, font or "defalt", "left", "center" )

end

function dxDrawTextDigit( text, x, y, w, h, color, font )

	dxDrawText( text or "", x + 4, y, w, h + y, tocolor( 255, 255, 255, 255 ), 1, font or "defalt", "left", "center" )

end

function string:split(sep)
	local sep, fields = sep or ":", {}
	local pattern = string.format("([^%s]+)", sep)
	self:gsub(pattern, function(c)
		fields[#fields+1] = c
	end)
	return fields
end