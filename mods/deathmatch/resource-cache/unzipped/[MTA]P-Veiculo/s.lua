addEventHandler ( "onPlayerQuit", getRootElement ( ), onPlayerQuit )

function onPlayerLogin (_, playeraccount )
      if ( playeraccount ) then
          local getNeonTypeAccData = getAccountData ( playeraccount, "neon" )
             if ( getNeonTypeAccData ~= 0 ) then
                   setElementData(source, "neon", getNeonTypeAccData)
             end
      end
end
addEventHandler ( "onPlayerLogin", getRootElement ( ), onPlayerLogin )

function motoron ()
local theVehicle = getPedOccupiedVehicle(source)
if ( getVehicleEngineState ( theVehicle ) == false ) then
setVehicleEngineState ( theVehicle, true )
outputChatBox("",source,0,255,0,true) 
end
end
addEvent("m1", true)
addEventHandler("m1", root, motoron)

function motoroff ()
local theVehicle = getPedOccupiedVehicle(source)
if ( getVehicleEngineState ( theVehicle ) == true ) then
setVehicleEngineState ( theVehicle, false )
outputChatBox("",source,0,255,0,true)  	
end
end
addEvent("m2", true)
addEventHandler("m2", root, motoroff)

function luzeson ()
	local theVehicle1 = getPedOccupiedVehicle(source) 
	setVehicleOverrideLights ( theVehicle1, 2 )
	outputChatBox("",source,0,255,0,true) 	
end
addEvent("l1", true)
addEventHandler("l1", root, luzeson)

function luzesoff ()
	local theVehicle1 = getPedOccupiedVehicle(source) 
	setVehicleOverrideLights ( theVehicle1, 1 )
	outputChatBox("",source,0,255,0,true)  
end
addEvent("l2", true)
addEventHandler("l2", root, luzesoff)

function descer(player)
local veh = getPedOccupiedVehicle(source)
if not veh then return end
local suspensao = (getVehicleHandling(veh)['suspensionLowerLimit'])
if limitsuspension == "true" then
if suspensao == math.abs(suspensao) then
else
setVehicleHandling(veh, "suspensionLowerLimit", suspensao + 0.1)
end
else
setVehicleHandling(veh, "suspensionLowerLimit", suspensao + 0.1)
end
end
addEvent("descer", true)
addEventHandler("descer", getRootElement(), descer)

function subir(player)
local veh = getPedOccupiedVehicle(source)
if not veh then return end
local altura_original = (getVehicleHandling(veh)["suspensionUpperLimit"]*-1)
local suspensao = (getVehicleHandling(veh)['suspensionLowerLimit'])
if limitsuspension == "true" then
if (suspensao < altura_original - 0.2) then
else
setVehicleHandling(veh, "suspensionLowerLimit", suspensao - 0.1)
end
else
setVehicleHandling(veh, "suspensionLowerLimit", suspensao - 0.1)
end
end
addEvent("subir", true)
addEventHandler("subir", getRootElement(), subir)

function porta1()
local vehicle = getPedOccupiedVehicle(source)
if not vehicle then return end
    if getVehicleDoorOpenRatio ( vehicle, 0 ) == 0 then
        setVehicleDoorOpenRatio(vehicle, 0, 1, 2500)
    else
        setVehicleDoorOpenRatio(vehicle, 0, 0, 2500)
    end
end
addEvent("porta1", true)
addEventHandler("porta1", root, porta1)

function porta6()
local vehicle = getPedOccupiedVehicle(source)
if not vehicle then return end
    if getVehicleDoorOpenRatio ( vehicle, 1 ) == 0 then
        setVehicleDoorOpenRatio(vehicle, 1, 1, 2500)
    else
        setVehicleDoorOpenRatio(vehicle, 1, 0, 2500)
    end
end
addEvent("porta6", true)
addEventHandler("porta6", root, porta6)

function porta2()
local vehicle = getPedOccupiedVehicle(source)
if not vehicle then return end
    if getVehicleDoorOpenRatio ( vehicle, 2 ) == 0 then
        setVehicleDoorOpenRatio(vehicle, 2, 1, 2500)
    else
        setVehicleDoorOpenRatio(vehicle, 2, 0, 2500)
    end
end
addEvent("porta2", true)
addEventHandler("porta2", root, porta2)

function porta3()
local vehicle = getPedOccupiedVehicle(source)
if not vehicle then return end
    if getVehicleDoorOpenRatio ( vehicle, 3 ) == 0 then
        setVehicleDoorOpenRatio(vehicle, 3, 1, 2500)
    else
        setVehicleDoorOpenRatio(vehicle, 3, 0, 2500)
    end
end
addEvent("porta3", true)
addEventHandler("porta3", root, porta3)

function porta4()
local vehicle = getPedOccupiedVehicle(source)
if not vehicle then return end
    if getVehicleDoorOpenRatio ( vehicle, 5 ) == 0 then
        setVehicleDoorOpenRatio(vehicle, 5, 1, 2500)
    else
        setVehicleDoorOpenRatio(vehicle, 5, 0, 2500)
    end
end
addEvent("porta4", true)
addEventHandler("porta4", root, porta4)

function porta5()
local vehicle = getPedOccupiedVehicle(source)
if not vehicle then return end
    if getVehicleDoorOpenRatio ( vehicle, 4 ) == 0 then
        setVehicleDoorOpenRatio(vehicle, 4, 1, 2500)
    else
        setVehicleDoorOpenRatio(vehicle, 4, 0, 2500)
    end
end
addEvent("porta5", true)
addEventHandler("porta5", root, porta5)