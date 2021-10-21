--[[



 ################################################
 #                                              #
 #              Script Criado Por               #
 #           FACEBOOK.COM/AIRNEWSCR             #
 #  @editado por FaikPlays (Sistema De Binds)   #
 #                                              #
 #                                              #
 ################################################



--]]

function getPlayerID(player)
return  getElementData(player,"ID")
end

function getPlayerIDG(thePlayer)
return  getElementData(thePlayer,"ID")
end

--------------------------------------------------------------------------------------------

DistanciaDoChatLocal = 80 -- Metros

ComandoDoChatGlobal =                "rp" -- Ex /g Mensagem
ComandoDoChatGlobal2 =                "twitter" -- Ex /g Mensagem
ComandoDoChatGlobal3 =                "olx" -- Ex /g Mensagem
ComandoDoChatGlobal4 =                "anonimo" -- Ex /g Mensagem
ValorDoChatGlobal = 0 -- Dinheiro

--------------------------------------------------------------------------------------------

-- Config do Chat Local

addEventHandler("onPlayerChat", root, function(tresc, msgtype)
if (msgtype == 0) then
    cancelEvent()
	local x,y,z = getElementPosition(source)
	for key, gracze in ipairs(getElementsByType("player")) do
	local x2,y2,z2 = getElementPosition(gracze)

	if getElementData (source, "ChatLocal:Delay", true) then
	outputChatBox ( MensagemFalandoRapidoDemaisLocal, source, 255, 255, 255, true ) return end

	if ( getDistanceBetweenPoints3D ( x, y, z, x2, y2, z2 ) < DistanciaDoChatLocal ) then
	local int = getElementInterior   ( source )
	local dim = getElementDimension  ( source )
	local int2 = getElementInterior  ( gracze )
	local dim2 = getElementDimension ( gracze )
	if ( int == int2 and dim == dim2 ) then

	conta = getAccountName ( getPlayerAccount ( source ) )

	if isObjectInACLGroup ("user."..conta, aclGetGroup ( "Console" ) ) then
	outputChatBox("#FFFF00▪  [Local]  ▪  #FFFFFFSupremo  #FFFF00▪  "..getPlayerName(source).. " ["..getPlayerID(source).."]:  #ffffff"..tresc, gracze, 255, 255, 255, true)

	elseif isObjectInACLGroup ("user."..conta, aclGetGroup ( "FT" ) ) then
	outputChatBox("#FFFF00▪  [Local]  ▪  #ff0000Força Tática  #FFFF00▪  "..getPlayerName(source).. " ["..getPlayerID(source).."]:  #ffffff"..tresc, gracze, 255, 255, 255, true)

	elseif isObjectInACLGroup ("user."..conta, aclGetGroup ( "ROTA" ) ) then
	outputChatBox("#FFFF00▪  [Local]  ▪  #696969ROTA  #FFFF00▪  "..getPlayerName(source).. " ["..getPlayerID(source).."]:  #ffffff"..tresc, gracze, 255, 255, 255, true)

    elseif isObjectInACLGroup ("user."..conta, aclGetGroup ( "BAEP" ) ) then
	outputChatBox("#FFFF00▪  [Local]  ▪  #A9A9A9BAEP  #FFFF00▪  "..getPlayerName(source).. " ["..getPlayerID(source).."]:  #ffffff"..tresc, gracze, 255, 255, 255, true)

	elseif isObjectInACLGroup ("user."..conta, aclGetGroup ( "EB" ) ) then
	outputChatBox("#FFFF00▪  [Local]  ▪  #008000Exército  #FFFF00▪  "..getPlayerName(source).. " ["..getPlayerID(source).."]:  #ffffff"..tresc, gracze, 255, 255, 255, true)

	elseif isObjectInACLGroup ("user."..conta, aclGetGroup ( "FN" ) ) then
	outputChatBox("#FFFF00▪  [Local]  ▪  #00FF00Força Nacional  #FFFF00▪  "..getPlayerName(source).. " ["..getPlayerID(source).."]:  #ffffff"..tresc, gracze, 255, 255, 255, true)

	elseif isObjectInACLGroup ("user."..conta, aclGetGroup ( "PF" ) ) then
	outputChatBox("#FFFF00▪  [Local]  ▪  #FFD700Polícia Federal  #FFFF00▪  "..getPlayerName(source).. " ["..getPlayerID(source).."]:  #ffffff"..tresc, gracze, 255, 255, 255, true)		

	elseif isObjectInACLGroup ("user."..conta, aclGetGroup ( "PMBA" ) ) then
	outputChatBox("#FFFF00▪  [Local]  ▪  #1E90FFPolícia Militar RJ  #FFFF00▪  "..getPlayerName(source).. " ["..getPlayerID(source).."]:  #ffffff"..tresc, gracze, 255, 255, 255, true)		
	
	elseif isObjectInACLGroup ("user."..conta, aclGetGroup ( "Everyone" ) ) then
	outputChatBox("#FFFF00▪  [Local]  ▪  #9400D3Cidadão BGR  #FFFF00▪  "..getPlayerName(source).. " ["..getPlayerID(source).."]:  #ffffff"..tresc, gracze, 255, 255, 255, true)


	end
	end
	end
	end
	end
    setElementData (source, "ChatLocal:Delay",true)
	setTimer (setElementData, 100, 1, source, "ChatLocal:Delay", false)
end)

function isPlayerOnGroup ( thePlayer )
    local account = getPlayerAccount ( thePlayer )
    local inGroup = false
    for _, group in ipairs ( { "Everyone" } ) do  
    if isObjectInACLGroup ( "user.".. getAccountName ( account ), aclGetGroup ( group ) )   then
    inGroup = true
    break
    end
    end
    return inGroup
end