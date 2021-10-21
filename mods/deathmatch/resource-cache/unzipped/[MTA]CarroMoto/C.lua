local Veiculos = {560} -- IDs dos Veículos.
Tulio = {}

function CreateVehicle (source)
if getElementData (source, "Pegou", true) then outputChatBox ('#ffffffAguarde #42424210 #ffffffsegundos para pegar novamente.',source,255,255,255,true) return end
if isElement(Tulio[source]) then destroyElement (Tulio[source]) 
Tulio[source] = nil
end
local x,y,z = getElementPosition (source)
local Cars = Veiculos[math.random(#Veiculos)]
Tulio[source] = createVehicle (Cars,x,y,z)
warpPedIntoVehicle (source,Tulio[source])
outputChatBox ('#424242|| #FFFFFF'..getPlayerName(source)..' #ffffffPegou um Carro digitando #424242(/carro)', root, 255, 255, 255, true)
setElementData (source, "Pegou",true)
setTimer (setElementData, 10000, 1, source, "Pegou", false)
end
addCommandHandler ("carro", CreateVehicle)

function DestroyVeiculo ()
destroyElement (Tulio[source])
end
addEventHandler ("onPlayerLogout", root, DestroyVeiculo)
addEventHandler ("onPlayerQuit", root, DestroyVeiculo)
addEventHandler ("onPlayerWasted", root, DestroyVeiculo)




