--== Script feito por:
--== ● Caio ●
--== Discord: Caio#8888
--===================================================
--== Qualquer problema procure pelo meu discord.
--===================================================

veh = {}
timerVeh = {}

function registerEvent (event, ...)
    addEvent(event, true)
    addEventHandler(event, ...)
end

function cancelTimer (player)
    if isElement(player) then
        if isTimer(timerVeh[player]) then
            killTimer(timerVeh[player])
        end
    end
end

function isPlayerVip (player)
    if not isGuestAccount(getPlayerAccount(player)) then
        for _, group in ipairs(nameVip) do
            if aclGetGroup(group) then
                if isObjectInACLGroup('user.'..getAccountName(getPlayerAccount(player)), aclGetGroup(group)) then
                    return true
                end
            end
        end
    end
    return false
end

function openPanel (player)
    if isPlayerVip(player) then
        triggerClientEvent(player, 'Caio.onPanelVip', player)
    end
end

addEventHandler('onPlayerLogin', root,
    function()
        bindKey(source, 'F2', 'down', openPanel)
    end
)

addEventHandler('onResourceStart', getResourceRootElement(getThisResource()),
    function()
        for i, v in ipairs(getElementsByType('player')) do
            bindKey(v, 'F2', 'down', openPanel)
        end
    end
)

addEventHandler('onResourceStop', getResourceRootElement(getThisResource()),
    function()
        for i, v in ipairs(getElementsByType('player')) do
            unbindKey(v, 'F2', 'down', openPanel)
        end
    end
)

registerEvent('Caio.onCreateVehicle', root,
    function(player, vip, id)
        if (vip) and (id) then
            if isObjectInACLGroup('user.'..getAccountName(getPlayerAccount(player)), aclGetGroup(vip)) then
                if not isElement(veh[player]) then
                    if not isTimer(timerVeh[player]) then
                        local pos = {getElementPosition(player)}
                        local rot = {getElementRotation(player)}
                        veh[player] = createVehicle(tonumber(id), pos[1], pos[2], pos[3], rot[1], rot[2], rot[3])
                        timerVeh[player] = setTimer(cancelTimer, 2 * 60000, 1, player)
                        warpPedIntoVehicle(player, veh[player])
                        exports['dxmessages']:addBox(player, 'Você spawnou um veículo.', 'success')
                    else
                        exports['dxmessages']:addBox(player, 'Você spawnou um veículo recentemente.', 'warning')
                    end
                else
                    exports['dxmessages']:addBox(player, 'Você já possui um veículo spawnado.', 'warning')
                    exports['dxmessages']:addBox(player, 'Utilize /desveh para destruí-lo.', 'info')
                end
            else
                exports['dxmessages']:addBox(player, 'Você não possui este vip, adquira agora em discord.gg/hmAekD7ybT', 'warning')
            end
        end
    end
)

registerEvent('Caio.onPegarSkin', root,
    function(player, vip, id)
        if (vip) and (id) then
            if isObjectInACLGroup('user.'..getAccountName(getPlayerAccount(player)), aclGetGroup(vip)) then
                if (getElementModel(player) ~= tonumber(id)) then
                    setElementModel(player, tonumber(id))
                    exports['dxmessages']:addBox(player, 'Você pegou a skin.', 'success')
                else
                    exports['dxmessages']:addBox(player, 'Você já está com esta skin.', 'error')
                end
            else
                exports['dxmessages']:addBox(player, 'Você não possui este vip, adquira agora em discord.gg/hmAekD7ybT', 'warning')
            end
        else
            print('a')
        end
    end
)

addCommandHandler('desveh',
    function(player)
        if isElement(veh[player]) then
            destroyElement(veh[player])
            exports['dxmessages']:addBox(player, 'Você removeu seu veículo vip.', 'success')
        end
    end
)

function desVeh ()
    if isElement(veh[source]) then
        destroyElement(veh[source])
    end
end
addEventHandler('onPlayerQuit', root, desVeh)
addEventHandler('onPlayerWasted', root, desVeh)

addEventHandler('onPlayerVehicleExit', root,
	function(_, seat)
		if (seat == 0) then
			if isElement(veh[source]) then
				destroyElement(veh[source])
			end
		end
	end
)