--== Script feito por:
--== ● Caio ●
--== Discord: Caio#8888
--===================================================
--== Qualquer problema procure pelo meu discord.
--===================================================

function isPlayerAccess (player)
    if not isGuestAccount(getPlayerAccount(player)) then
        for _, group in ipairs(config.acl_gerar) do
            if isObjectInACLGroup('user.'..getAccountName(getPlayerAccount(player)), aclGetGroup(group)) then
                return true
            end
        end
    end
    return false
end

function registerEvent (event, ...)
    addEvent(event, true)
    addEventHandler(event, ...)
end

function gerarKey()
    letters = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'R', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z','a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'r', 'q', 'r', 's', 't', 'y', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'}
    key = ''
    for i = 1, 25 do
        key = key .. letters[math.random(1, #letters)]
    end
    return key
end

function removeHex (s)
    if type (s) == "string" then
        while (s ~= s:gsub ("#%x%x%x%x%x%x", "")) do
            s = s:gsub ("#%x%x%x%x%x%x", "")
        end
    end
    return s or false
end

addCommandHandler(config.command_gerar,
    function(player)
        if isPlayerAccess(player) then
            triggerClientEvent(player, 'Caio.onPanelGerenciador', player)
        end
    end
)

addCommandHandler(config.command_usar,
    function(player)
        triggerClientEvent(player, 'Caio.onPanelAtivador', player)
    end
)

--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--

addEventHandler('onResourceStart', getResourceRootElement(getThisResource()),
    function()
        if isObjectInACLGroup('resource.'..getResourceName(getThisResource()), aclGetGroup('Admin')) then
            connection = dbConnect('sqlite', 'keys.db')
            if (connection) then
                dbExec(connection, 'create table if not exists key (Key, Vip, Dias)')
                dbExec(connection, 'create table if not exists vipsAtivo (Login, Vip, TempoC, TempoR)')
                print('[SQLite] Conectado com sucesso')
            end
        else
            print('Adicione \''..'resource.'..getResourceName(getThisResource())..'\' na acl ADMIN.')
            cancelEvent()
        end
    end
)

setTimer(function ( )
    local logins = dbPoll(dbQuery(connection, 'SELECT * FROM vipsAtivo'), - 1)
    if (#logins ~= 0) then
        for _, result in ipairs(logins) do
            if (result['TempoR'] < 15000) then
                aclGroupRemoveObject(aclGetGroup(result['Vip']), 'user.'..result['Login'])
                dbExec(connection, 'delete from vipsAtivo where Login = ? and Vip = ?', result['Login'], result['Vip'])
            else
                dbExec(connection, 'update vipsAtivo set TempoR = ? where Login = ? and Vip = ?', (tonumber(result['TempoR']) - 10000), result['Login'], result['Vip'])
            end
        end
    end
end, 10000, 0)

registerEvent('Caio.onCreateKey', root,
    function(player, vip, dias)
        if (vip) and (dias) and tonumber(dias) then
            for _, name in ipairs(config.vips) do
                if (vip == tostring(name)) then
                    local chave = gerarKey()
                    local key = dbPoll(dbQuery(connection, 'SELECT * FROM key WHERE Key = ?', chave), - 1)
                    if (#key == 0) then
                        dbExec(connection, 'INSERT INTO key (Key, Vip, Dias) VALUES(?, ?, ?)', tostring(chave), tostring(vip), tonumber(dias))
                        outputChatBox('#FFFF00[KEY VIP] #FFFFFFFoi criada  com sucesso (Key: '..chave..' vip: '..vip..' dias: '..dias..')\n(OBS: Utilize \'CTRL + V\' para colar)', player, 255, 255, 255, true)
                        triggerClientEvent(player, 'Caio.onCopyKey', player, tostring(chave))
                    else
                        exports['dxmessages']:addBox(player, 'Falha ao gerar a key, tente novamente.', 'error')
                    end
                    break
                end
            end
        end
    end
)

vipMoney = {
    ['Ruby'] = 500000,
    ['Esmerald'] = 200000,
    ['Diamond'] = 100000,
    ['Gold'] = 70000,
}

registerEvent('Caio.onUseKey', root,
    function(player, key)
        if (key) and tostring(key) then
            local chave = dbPoll(dbQuery(connection, 'select * from key where Key = ?', tostring(key)), - 1)
            if (#chave ~= 0) then
                exports['dxmessages']:addBox(player, 'Você ativou uma key VIP e recebeu '..chave[1]['Dias']..' de vip '..chave[1]['Vip'], 'success')
                local tempoVip = (tonumber(chave[1]['Dias']) * 86400000)
                local dados = dbPoll(dbQuery(connection, 'SELECT * FROM vipsAtivo WHERE Login = ? AND Vip = ?', getAccountName(getPlayerAccount(player)), chave[1]['Vip']), - 1)
                if (#dados ~= 0) then
                    local newTime = tempoVip + tonumber(dados[1]['TempoR'])
                    dbExec(connection, 'UPDATE vipsAtivo SET TempoR = ? WHERE Login = ? AND VIP = ?', newTime, getAccountName(getPlayerAccount(player)), chave[1]['Vip'])
                else
                    dbExec(connection, 'INSERT INTO vipsAtivo (Login, Vip, TempoC, TempoR) VALUES(?, ?, ?, ?)', getAccountName(getPlayerAccount(player)), chave[1]['Vip'], chave[1]['Dias'], tempoVip)
                    aclGroupAddObject(aclGetGroup(chave[1]['Vip']), 'user.'..getAccountName(getPlayerAccount(player)))
                end
                triggerClientEvent(player, 'Caio.onPanelAtivador', player)
                for _, v in ipairs(getElementsByType('player')) do
                    triggerClientEvent(v, 'Caio.onVipAtivadoTela', v, removeHex(getPlayerName(player)), chave[1]['Vip'])
                end
                givePlayerMoney(player, (vipMoney[chave[1]['Vip']] or 70000))
                dbExec(connection, 'DELETE FROM key WHERE Key = ?', tostring(key))
            else
                exports['dxmessages']:addBox(player, 'Esta key não existe.', 'warning')
            end
        end
    end
)

addCommandHandler('tempovip',
    function(player, _, vip)
        if (vip) then
            for _, name in ipairs(config.vips) do
                if (vip == tostring(name)) then
                    local dados = dbPoll(dbQuery(connection, 'select * from vipsAtivo where Login = ? and Vip = ?', getAccountName(getPlayerAccount(player)), vip), - 1)
                    if (#dados ~= 0) then
                        local dias = math.floor(dados[1]['TempoR'] / 86400000)
                        exports['dxmessages']:addBox(player, 'Você tem ' .. dias .. ' dias restante do vip ' .. vip, 'success')
                    else
                        exports['dxmessages']:addBox(player, 'Você não possui este vip.', 'warning')
                    end
                    break
                end
            end
        else
            exports['dxmessages']:addBox(player, 'Digite corretamente. \'/tempovip [Vip]\'', 'warning')
        end
    end
)