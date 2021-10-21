local armaEvento = nil
local eventoTrancado = true
local eventoIniciado = false
local rd = 5
local congelado = false
local carrosEvento = {}
local prefix = LANGUAGE[1]

function isStaff(player)
    for _, group in ipairs ({"Admin", "SuperModerator", "Moderator", "Console"}) do
        local playerAccount = getPlayerAccount(player)
        if (not playerAccount) then return end
        local accountName = getAccountName(playerAccount)
        if isObjectInACLGroup ( "user.".. accountName, aclGetGroup ( group ) ) then
            return true
        end
    end
    return false
end

function emEvento(jogador)
    if (getElementData(jogador, "emEvento") == true) then
        return true
    end
    if (getAccountData(getPlayerAccount(jogador), "emEvento") == true) then
        return true
    end
    return false
end

function respPlayer(source)
    if emEvento(source) == true then
        local x, y, z = getElementData(source, "eventoPosX"), getElementData(source, "eventoPosY"), getElementData(source, "eventoPosZ")
        local int = getElementData(source, "eventoInt")
        local dim = getElementData(source, "eventoDim")
        toggleAllControls(source, true, true, false)
        takeAllWeapons(source)
        setTimer(function() takeAllWeapons(source) end, 1500, 1)
        if x and y and z then setElementPosition(source, x, y, z) else setElementPosition(source, 0+math.random(0, 50), 0+math.random(0, 50), 4) end
        if int then setElementInterior(source, int) else setElementInterior(source, 0) end
        if dim then setElementDimension(source, dim) else setElementDimension(source, 0) end
        setElementData(source, "emEvento", false)
        setAccountData(getPlayerAccount(source), "emEvento", false)
    end
end

function distribuirArma()
    local players = getElementsByType("player")
    for _,pl in pairs(players) do
        if (emEvento(pl) == true) then
            takeAllWeapons(pl)
            if armaEvento == nil then
                outputChatBox(prefix..LANGUAGE[2], pl, 255, 255, 255, true)
            else
                giveWeapon(pl, armaEvento, 5000, true)
                outputChatBox(prefix..LANGUAGE[3], pl, 255, 255, 255, true)
            end
        end
    end
end

function cor(jogador)
    local r, g, b = getPlayerNametagColor(jogador)
	return string.format("#%.2X%.2X%.2X", r,g,b)
end

function fimEvento()
    armaEvento = nil
    eventoTrancado = true
    eventoIniciado = false
    rd = 5
    congelado = false
    local players = getElementsByType("player")
    for _,v in pairs(players) do
        if emEvento(v) == true then
            respPlayer(v)
        end
    end
    for k, v in pairs(carrosEvento) do
        if isElement(v) then destroyElement(v) end
        carrosEvento[k] = nil
    end
end

addEvent("sincVars",true)
function sincVars()
    triggerClientEvent("sincVars", getRootElement(),eventoTrancado or false,congelado or false)
end
addEventHandler("sincVars", getRootElement(), sincVars)

addCommandHandler("evento", function(source,cmd)
    if (isStaff(source)) then
        triggerClientEvent("showGUI", source)
    end
end)

addEvent("criarEvento", true)
function evento(player, int, dim)
    if (eventoIniciado == true) then outputChatBox(LANGUAGE[4], player, 255,255,0) return end
    eventoIniciado = true
    local x,y,z = getElementPosition(player)
    theMarker = createMarker ( x, y, z+1, "arrow", 2, 255, 100, 50, 100 )
    setElementInterior(theMarker, int, x, y, z)
    setElementDimension(theMarker, dim)
    local nombre = getPlayerName(player)
    outputChatBox(prefix..cor(player)..nombre..LANGUAGE[5], getRootElement(), 255, 255, 255, true)
    entrarEvento(player)
    trancarEvento(player,eventoTrancado)
    addCommandHandler("eir", eventowarp)
end
addEventHandler("criarEvento", getRootElement(), evento)

addEvent("destruirEvento",true)
function destruirEvento(player)
    if (eventoIniciado == false) then outputChatBox(LANGUAGE[6], player, 255,255,0) return end
    if (isElement(theMarker)) then destroyElement(theMarker) end
    local nombre2 = getPlayerName(player)
    outputChatBox(prefix..LANGUAGE[7]..cor(player)..nombre2.."", getRootElement(), 255, 255, 255, true)
    removeCommandHandler("irevento")
    fimEvento()
end
addEventHandler("destruirEvento", getRootElement(), destruirEvento)

function eventowarp(thePlayer)
    if (emEvento(thePlayer) == false) then
        if (eventoTrancado == false) then
            if isElement(theMarker) then
                local elem = getPedOccupiedVehicle(thePlayer)
                local dimensao = getElementDimension(theMarker)
                local x, y, z = getElementPosition(theMarker)
                local interior = getElementInterior(theMarker)
                fadeCamera ( thePlayer, false, 1.0, 0, 0, 0 )
                local x2, y2, z2 = getElementPosition(thePlayer)
                local int = getElementInterior(thePlayer)
                local dim = getElementDimension(thePlayer)
                takeAllWeapons(thePlayer)
                setElementData(thePlayer, "emEvento", true)
                setElementData(thePlayer, "eventoPosX", x2)
                setElementData(thePlayer, "eventoPosY", y2)
                setElementData(thePlayer, "eventoPosZ", z2)
                setElementData(thePlayer, "eventoInt", int)
                setElementData(thePlayer, "eventoDim", dim)
                setAccountData(getPlayerAccount(thePlayer), "emEvento", true)
                setTimer(fadeCamera, 500, 1, thePlayer, true, 1.0)
                outputChatBox(prefix..cor(thePlayer)..getPlayerName(thePlayer)..LANGUAGE[8], getRootElement(), 255, 255, 255, true)
                if armaEvento then
                    giveWeapon(thePlayer, armaEvento, 5000, true)
                    outputChatBox(prefix..LANGUAGE[9].." ( #a8a8a8"..getWeaponNameFromID(armaEvento).." #00FFFF)",thePlayer, 255, 255, 255, true)
                else
                    giveWeapon(thePlayer, 14, 1, true)
                end
                if isPedInVehicle(thePlayer) then
                    destroyElement(elem)
                    setTimer(setElementPosition, 500, 1, thePlayer, x+math.random(0, rd), y+math.random(0, rd), z)
                    setTimer(setElementInterior, 500, 1, thePlayer, interior, x, y, z)
                    setTimer(setElementDimension, 500, 1, thePlayer, dimensao, x, y, z)
                else
                    setTimer(setElementPosition, 500, 1, thePlayer, x+math.random(0, rd), y+math.random(0, rd), z)
                    setTimer(setElementInterior, 500, 1, thePlayer, interior, x, y, z)
                    setTimer(setElementDimension, 500, 1, thePlayer, dimensao, x, y, z)
                end
                if (congelado == true) then
                    setTimer(toggleAllControls, 500, 1, thePlayer, not congelado,true,false)
                end
            end
        else
            outputChatBox(prefix..LANGUAGE[10], thePlayer, 255, 255, 255, true)
        end
    end
end

addEvent("entrarEvento",true)
function entrarEvento(player)
    if (eventoIniciado == false) or not(isElement(theMarker)) then outputChatBox(LANGUAGE[6], player, 255,255,0) return end
    if (emEvento(player)) then return end
    local elem = getPedOccupiedVehicle(player)
    local dimensao = getElementDimension(theMarker)
    local x, y, z = getElementPosition(theMarker)
    local interior = getElementInterior(theMarker)
    fadeCamera ( player, false, 1.0, 0, 0, 0 )
    local x2, y2, z2 = getElementPosition(player)
    local int = getElementInterior(player)
    local dim = getElementDimension(player)
    takeAllWeapons(player)
    setElementData(player, "emEvento", true)
    setElementData(player, "eventoPosX", x2)
    setElementData(player, "eventoPosY", y2)
    setElementData(player, "eventoPosZ", z2)
    setElementData(player, "eventoInt", int)
    setElementData(player, "eventoDim", dim)
    setAccountData(getPlayerAccount(player), "emEvento", true)
    setTimer(fadeCamera, 500, 1, player, true, 1.0)
    if isPedInVehicle(player) then
        destroyElement(elem)
        setTimer(setElementPosition, 500, 1, player, x+math.random(0, rd), y+math.random(0, rd), z)
        setTimer(setElementInterior, 500, 1, player, interior, x, y, z)
        setTimer(setElementDimension, 500, 1, player, dimensao, x, y, z)
    else
        setTimer(setElementPosition, 500, 1, player, x+math.random(0, rd), y+math.random(0, rd), z)
        setTimer(setElementInterior, 500, 1, player, interior, x, y, z)
        setTimer(setElementDimension, 500, 1, player, dimensao, x, y, z)
    end
end
addEventHandler("entrarEvento", getRootElement(), entrarEvento)

function blockCmds(cmd)
    cmd = split(cmd, " ")
    if (cmd[1] ~= "say") then
        if (emEvento(source) == true) then
            for _,v in pairs(_CMDs) do
                if (cmd[1] == v) then
                    cancelEvent()
                    return
                end
            end
        end
    end
end
addEventHandler("onPlayerCommand", getRootElement(), blockCmds)

addEvent("darArma",true)
function darArma(player,arma)
    if (eventoIniciado == false) then outputChatBox(LANGUAGE[6], player, 255,255,0) return end
    if arma == "0" then
        armaEvento = nil
        distribuirArma()
        return
    end
    if getWeaponNameFromID(tonumber(arma)) then
        armaEvento = arma
        distribuirArma()
    else
        outputChatBox(prefix..LANGUAGE[11], player, 255, 255, 0, true)
    end
end
addEventHandler("darArma", getRootElement(), darArma)

addEvent("darVida",true)
function darVida(player, qnt)
    if (eventoIniciado == false) then outputChatBox(LANGUAGE[6], player, 255,255,0) return end
    qnt = tonumber(qnt)
    if (qnt) and (qnt ~= 0) then
        local players = getElementsByType("player")
        for _,v in pairs(players) do
            if emEvento(v) == true then
                if setElementHealth(v, qnt) then
                    outputChatBox(prefix..cor(player)..getPlayerName(player)..LANGUAGE[12]..qnt, v, 255, 255, 255, true)
                end
            end
        end
    end
end
addEventHandler("darVida", getRootElement(), darVida)

addEvent("darColete",true)
function darColete(player, qnt)
    if (eventoIniciado == false) then outputChatBox(LANGUAGE[6], player, 255,255,0) return end
    qnt = tonumber(qnt)
    if (qnt) then
        local players = getElementsByType("player")
        for _,v in pairs(players) do
            if emEvento(v) == true then
                if setPedArmor(v, qnt) then
                    outputChatBox(prefix..cor(player)..getPlayerName(player)..LANGUAGE[13]..qnt, v, 255, 255, 255, true)
                end
            end
        end
    end
end
addEventHandler("darColete", getRootElement(), darColete)

addEvent("trancarEvento",true)
function trancarEvento(player,state)
    eventoTrancado = state
    if eventoIniciado then
        if not eventoTrancado then
            outputChatBox(prefix..cor(player)..getPlayerName(player)..LANGUAGE[14], getRootElement(), 255, 255, 255, true)
        else
            outputChatBox(prefix..cor(player)..getPlayerName(player)..LANGUAGE[15], getRootElement(), 255, 255, 255, true)
        end
    end
end
addEventHandler("trancarEvento", getRootElement(), trancarEvento)

addEvent("congelarTodos",true)
function congelar(player,state)
    if eventoIniciado then
        local players = getElementsByType("player")
        congelado = state
        for _,v in pairs(players) do
            if emEvento(v) == true then
                if toggleAllControls(v, not congelado, true, false) then
                    if (congelado) then
                        local veh = getPedOccupiedVehicle ( v )
                        if (isElement(veh)) then
                            setElementVelocity(veh,0,0,0)
                        end
                    end
                    if congelado then
                        outputChatBox(prefix..cor(player)..getPlayerName(player)..LANGUAGE[16], v, 255, 255, 255, true)
                    else
                        outputChatBox(prefix..cor(player)..getPlayerName(player)..LANGUAGE[17], v, 255, 255, 255, true)
                    end
                end
            end
        end
    end
end
addEventHandler("congelarTodos", getRootElement(), congelar)

addEvent("darVeiculo",true)
function eventoCarro(player, carro)
    if (eventoIniciado == false) then outputChatBox(LANGUAGE[6], player, 255,255,0) return end
    if not (getVehicleModelFromName(carro)) then outputChatBox(LANGUAGE[18],player,255,255,0) return end
    local players = getElementsByType("player")
    for _,v in pairs(players) do
        if emEvento(v) == true then
            toggleControl(v, "enter_exit", true)
            local veiculoID = getVehicleModelFromName(carro)
            local veh = getPedOccupiedVehicle ( v )
            if (isElement(veh)) then
                destroyElement(veh)
            end
            local x, y, z = getElementPosition(v)
            local dim = getElementDimension(v)
            local int = getElementInterior(v)
            local pcar = createVehicle ( tonumber(veiculoID), x, y, z + 2 )
            if (pcar) then
                setElementDimension(pcar, dim)
                setElementInterior(pcar, int)
                warpPedIntoVehicle(v, pcar, 0)
                setVehicleColor(pcar, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255)
                setElementData(pcar, "evento", true)
                toggleControl(v, "enter_exit", false)
                table.insert(carrosEvento, pcar)
                outputChatBox(prefix..cor(player)..getPlayerName(player)..LANGUAGE[19], v, 255, 255, 255, true)
            end
        end
    end
end
addEventHandler("darVeiculo", getRootElement(), eventoCarro)

addEvent("destruirVeiculos",true)
function destruirVeiculos(player)
    if (eventoIniciado == false) then outputChatBox(LANGUAGE[6], player, 255,255,0) return end
    
    for k,v in pairs(carrosEvento) do
        if (isElement(v)) then
            destroyElement(v)
            carrosEvento[k] = nil
        end
    end
    
    local players = getElementsByType("player")
    for _,v in pairs(players) do
        if emEvento(v) == true then
            toggleControl(v, "enter_exit", true)
            outputChatBox(prefix..cor(player)..getPlayerName(player)..LANGUAGE[20], v, 255, 255, 255, true)
        end
    end
end
addEventHandler("destruirVeiculos", getRootElement(), destruirVeiculos)

addEvent("repararVeiculos",true)
function repararVeiculos(player)
    if (eventoIniciado == false) then outputChatBox(LANGUAGE[6], player, 255,255,0) return end
    local players = getElementsByType("player")
    for _,v in pairs(players) do
        if emEvento(v) == true then
            local veh = getPedOccupiedVehicle ( v )
            if (isElement(veh)) then
                local rX, rY, rZ = getElementRotation(veh)
                setElementRotation ( veh, 0, 0, (rX > 90 and rX < 270) and (rZ + 180) or rZ)
                fixVehicle(veh)
                outputChatBox(prefix..cor(player)..getPlayerName(player)..LANGUAGE[21], v, 255, 255, 255, true)
            end
        end
    end
end
addEventHandler("repararVeiculos", getRootElement(), repararVeiculos)

----------
function player_Spawn ( posX, posY, posZ, spawnRotation, theTeam, theSkin, theInterior, theDimension )
    respPlayer(source)
end
addEventHandler ( "onPlayerSpawn", getRootElement(), player_Spawn )

addEventHandler ( "onResourceStop", root, 
    function ( resource )
        if resource == getThisResource() then
            if eventoIniciado == true then
                fimEvento()
                outputChatBox(prefix..LANGUAGE[22], getRootElement(), 255, 255, 255, true)
            end
        end
   end 
)