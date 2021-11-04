addEvent("N3xT.onRequestNewVip", true)

addCommandHandler(comando,
    function(source)
        for _, v in ipairs(grupos) do
            if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(source)), aclGetGroup(v)) then
                triggerClientEvent(source, "N3xT.onManagerVip", source)
                break
            end
        end
    end
)

local restante = {}
addEventHandler("N3xT.onRequestNewVip", root,
    function(conta, vip, data, tempo, time)
        if isObjectInACLGroup("resource."..getResourceName(getThisResource()), aclGetGroup("Admin")) then
            if not isObjectInACLGroup("user."..conta, aclGetGroup(vip)) then
                if getAccount(conta) then
                    setAccountData(getAccount(conta), "tempvip", time)
                    restante[conta] = setTimer(setAccountData, time, 1, getAccount(conta), "tempvip", nil)
                    aclGroupAddObject(aclGetGroup(vip), "user."..conta)
                    triggerClientEvent(source, "N3xT.setStartVip", source)
                    triggerClientEvent(source, "N3xT.dxNotification", root, "Você adicionou "..tempo.." "..data.." VIP "..vip.." a conta "..conta, "success")
                else
                    triggerClientEvent(source, "N3xT.dxNotification", root, "Essa conta não existe!", "error")
                end
            else
                triggerClientEvent(source, "N3xT.dxNotification", root, "Essa conta já está na ACL "..vip, "error")
            end
        else
            outputChatBox("Adicione o script na ACL 'Admin', ex: resource."..getResourceName(getThisResource()), source, 255,0,0)
        end
    end
)

addCommandHandler(comando2,
    function(source, _, conta)
        for _, v in ipairs(grupos) do
            if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(source)), aclGetGroup(v)) then
                if (conta) then
                    if (restante[conta]) then
                        outputChatBox("Tempo VIP restante para a conta - #ffffff"..getTimeLeft(restante[conta]), source, 0,255,0, true)
                    else
                        outputChatBox("Conta não encontrada!", source, 255,0,0)
                    end
                else
                    outputChatBox("Informe a conta!", source, 255,0,0)
                end
            end
        end
    end
)

addCommandHandler(comando3,
	function(source)
		local conta = getAccountName(getPlayerAccount(source))
		if (restante[conta]) then
			outputChatBox("Tempo VIP restante para a sua conta - #ffffff"..getTimeLeft(restante[conta]), source, 0,255,0, true)
		else
			outputChatBox("Você não é um jogador VIP!", source, 255,0,0)
		end
	end
)

function managerVip()
    for _, acc in ipairs(getAccounts()) do
        if not getAccountData(acc, "tempvip") then
            for _, v in ipairs(acl) do
                local name = getAccountName(acc)
                if isObjectInACLGroup("user."..name, aclGetGroup(v)) then
                    aclGroupRemoveObject(aclGetGroup(v), "user."..name)
                end
            end
        end
    end
end
setTimer(managerVip, 100, 0)

addEventHandler("onResourceStop", resourceRoot,
    function()
        for _, v in ipairs(getAccounts()) do
            setAccountData(v, "tempvip", nil)
        end
    end
)

function getTimeLeft(timer)
	if (timer) then
        local results = {}
        local value = getTimerDetails(timer)
        local seconds = (value / 1000)
		local sec = (seconds %60)
		local min = math.floor((seconds % 3600) / 60)
		local hou = math.floor((seconds % 86400) / 3600)
		local day = math.floor(seconds /86400)
		
		if (day > 0) then table.insert(results, day..(day == 1 and " dia" or " dias")) end
		if (hou > 0) then table.insert(results, hou..(hou == 1 and " hora" or " horas")) end
		if (min > 0) then table.insert(results, min..(min == 1 and " minuto" or " minutos")) end
		if (sec > 0) then table.insert(results, math.floor(sec)..(sec == 1 and " segundo." or " segundos.")) end
		
		return string.reverse(table.concat(results, ", "):reverse():gsub(" ,", " e ", 1))
	end
	return "--:--"
end