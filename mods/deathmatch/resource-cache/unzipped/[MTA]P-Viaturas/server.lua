

function showPanel(thePlayer)
  accountname = getAccountName(getPlayerAccount(thePlayer))
  if isObjectInACLGroup("user." .. accountname, aclGetGroup("Everyone")) then -------- ACL DA SUA CORP
    triggerClientEvent(thePlayer, "PAINELCORPOUGANG", getRootElement())
   else
  end
end
function onResStart()
  for index, player in ipairs(getElementsByType("player")) do
    bindKey(player, "f5", "down", showPanel)
  end
end
addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), onResStart)
function onPlayerJoin()
  bindKey(source, "f5", "down", showPanel)
end
addEventHandler("onPlayerJoin", getRootElement(), onPlayerJoin)
function cleanAll(player)
  for index, player in ipairs(getElementsByType("player")) do
    unbindKey(player, "f5", "down", showPanel)
  end
end
addEventHandler("onResourceStop", getResourceRootElement(getThisResource()), cleanAll)




-------------------------------------------------------------------------------------------------

veh = {}
function criarxx()
  exports["infobox"]:addBox(source, "success", "Você pegou uma Viatura          ")
    if veh[source] and isElement( veh[source] ) then destroyElement( veh[source] ) 
 veh[source] = nil 
 end
    local x,y,z = getElementPosition(source)
    veh[source] = createVehicle(596, x,y,z + 2)
 warpPedIntoVehicle (source,veh[source])
end
addEvent("carrop1",true)
addEventHandler("carrop1",root,criarxx)


---------------------------------------------------------------------------------------
veh = {}
function criarxx()
  exports["infobox"]:addBox(source, "success", "Você pegou uma Rocam          ")
    if veh[source] and isElement( veh[source] ) then destroyElement( veh[source] ) 
 veh[source] = nil 
 end
    local x,y,z = getElementPosition(source)
    veh[source] = createVehicle(523, x,y,z + 2)
 warpPedIntoVehicle (source,veh[source])
end
addEvent("carrop2",true)
addEventHandler("carrop2",root,criarxx)

--------------------------------------------------------------------------------------------------------------

veh = {}
function criarxx()
  exports["infobox"]:addBox(source, "success", "Você pegou uma Z1000          ")
    if veh[source] and isElement( veh[source] ) then destroyElement( veh[source] ) 
 veh[source] = nil 
 end
    local x,y,z = getElementPosition(source)
    veh[source] = createVehicle(522, x,y,z + 2)
 warpPedIntoVehicle (source,veh[source])
end
addEvent("carrop3",true)
addEventHandler("carrop3",root,criarxx)

-----------------------------------------------------------------------------------------------------------------------
veh = {}
function criarxx()
  exports["infobox"]:addBox(source, "success", "Você pegou uma Lamborghini          ")
    if veh[source] and isElement( veh[source] ) then destroyElement( veh[source] ) 
 veh[source] = nil 
 end
    local x,y,z = getElementPosition(source)
    veh[source] = createVehicle(560, x,y,z + 2)
 warpPedIntoVehicle (source,veh[source])
end
addEvent("carrop4",true)
addEventHandler("carrop4",root,criarxx)

--------------------------------------------------------------------------------------------------------------------------------------
veh = {}
function criarxx()
  exports["infobox"]:addBox(source, "success", "Você pegou um Blindado          ")
    if veh[source] and isElement( veh[source] ) then destroyElement( veh[source] ) 
 veh[source] = nil 
 end
    local x,y,z = getElementPosition(source)
    veh[source] = createVehicle(427, x,y,z + 2)
 warpPedIntoVehicle (source,veh[source])
end
addEvent("carrop5",true)
addEventHandler("carrop5",root,criarxx)

------------------------------------------------------------------------------------------------------------------------
veh = {}
function criarxx()
  exports["infobox"]:addBox(source, "success", "Você pegou o Helicoptero 01          ")
    if veh[source] and isElement( veh[source] ) then destroyElement( veh[source] ) 
 veh[source] = nil 
 end
    local x,y,z = getElementPosition(source)
    veh[source] = createVehicle(425, x,y,z + 2)
 warpPedIntoVehicle (source,veh[source])
end
addEvent("carrop6",true)
addEventHandler("carrop6",root,criarxx)

--------------------------------------------------------------------------------------------------------------------------------

veh = {}
function criarxx()
  exports["infobox"]:addBox(source, "success", "Você pegou o Helicoptero 02          ")
    if veh[source] and isElement( veh[source] ) then destroyElement( veh[source] ) 
 veh[source] = nil 
 end
    local x,y,z = getElementPosition(source)
    veh[source] = createVehicle(487, x,y,z + 2)
 warpPedIntoVehicle (source,veh[source])
end
addEvent("carrop7",true)
addEventHandler("carrop7",root,criarxx)


--------------------------------------------------------------------------------------------------------


function destrui ()
destroyElement ( veh[source] )
exports["infobox"]:addBox(source, "info", "Você destruiu o veiculo               ")
end
addEvent ("destroi", true)
addEventHandler ("destroi", getRootElement(), destrui)


---------------------------------------------------------------------------------------

function reparar ()
fixVehicle( veh[source] )
exports["infobox"]:addBox(source, "info", "Veiculo Reparado                         ")
  end
  addEvent ("reparar", true)
  addEventHandler ("reparar", getRootElement(), reparar)

----------------------------------------------------------------------------------------------------------

function blinda ()
  setVehicleDamageProof(getPedOccupiedVehicle(source),true)
  exports["infobox"]:addBox(source, "info", "Veiculo Blindado                          ")
  end
  addEvent ("blinda", true)
  addEventHandler ("blinda", getRootElement(), blinda)

  ---------------------------------------------------------------------------------------------------------------------

  function desvirar ()
    local veh = getPedOccupiedVehicle(source)
    if veh then
      local rX, rY, rZ = getElementRotation(veh)
      setElementRotation(veh, 0, 0, (rX > 90 and rX < 270) and (rZ + 180) or rZ)
      exports["infobox"]:addBox(source, "info", "Veiculo Virado                               ")
    end
  end
  addEvent ("desvirar", true)
  addEventHandler ("desvirar", getRootElement(), desvirar)


