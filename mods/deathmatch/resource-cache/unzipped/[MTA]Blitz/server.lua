---- Developed by SiiLVa
---- Please, don't remove the credits.


aclRegistred = "Policial"

addEvent("checkACL_blitz", true)
addEventHandler("checkACL_blitz", root, 
function()
	local pAccount = getAccountName(getPlayerAccount(source)) 
	if isObjectInACLGroup("user."..pAccount, aclGetGroup(aclRegistred)) then
		triggerClientEvent(source, "openBlitzDx", source)
	else
		outputChatBox("ACL: "..aclRegistred, source, 255,255,255, true)
	end
end
)

addEvent("putObjectBlitz", true)
addEventHandler("putObjectBlitz", root, 
function(objeto, idobject)
	local posx, posy, posz = getElementPosition(source)
	local rotx, roty, rotz = getElementRotation(source)
	if objeto == "Barreira_1" or objeto == "Barreira_2" or objeto == "Cone" then
		variavel = 0.6
	--elseif objeto == "Fura_Pneus" then
		--variavel = 0.9
	elseif objeto == "Cone_Grande_2" then
		variavel = 1.2	
	else
		variavel = 0
	end
	if objeto == "Barreira_2" then
		variavelrotation = 0
	else
		variavelrotation = 90
	end
	objetoBlitz = createObject(idobject, posx, posy, posz - variavel, rotx, roty, rotz + variavelrotation)
	--outputChatBox("Você colocou: "..objeto, source, 255,255,255, true)
	setElementData(objetoBlitz, "elementFromBlitz", true)
end)

addEvent("deleteObjectBlitz", true)
addEventHandler("deleteObjectBlitz", root, 
function(objeto)
	if objeto then
		destroyElement(objeto)
		outputChatBox("")
	end
end)

