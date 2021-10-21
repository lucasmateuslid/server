local acc

function openPanelManager(source)
	if isPlayerStaff(source) then
		triggerClientEvent(source, "onClientOpenPanel", resourceRoot)
	end
end
addCommandHandler("tag", openPanelManager)

function fPlayerManagerTag(type, id, group)
	local target = getPlayerFromID(id)
	
	if target then
		acc = getPlayerAccount(target)
	else
		acc = getAccountByID(id)
	end

	if not acc then
		exports.infobox:addNotification(client, "Esta conta é inexistente!", "error")
		triggerClientEvent(client, "setGroupsText", resourceRoot, "N/A", "N/A", "N/A")
		return
	end

	if type == "add" then
		if target then
			if not isObjectInACLGroup("user."..getAccountName(acc), aclGetGroup(group)) then
				aclGroupAddObject(aclGetGroup(group), "user."..getAccountName(acc))
				exports.infoxbox:addBox(client, "O jogador "..getPlayerNameString(target).." agora faz parte do(a): "..group, "success")
				exports.infoxbox:addBox(target, "Você agora faz parte do(a): "..group, "success")
				triggerClientEvent(client, "setGroupsText", resourceRoot, table.concat(table.reverse(aclGetAccountGroups(acc)), ", "), getAccountName(acc), "Online")
			else
				exports.infoxbox:addBox(client, "Este jogador já faz parte do(a): "..group, "error")
			end
		else
			if not isObjectInACLGroup("user."..getAccountName(acc), aclGetGroup(group)) then
				aclGroupAddObject(aclGetGroup(group), "user."..getAccountName(acc))
				exports.infoxbox:addBox(client, "A conta "..getAccountName(acc).." agora faz parte do(a): "..group, "success")
				triggerClientEvent(client, "setGroupsText", resourceRoot, table.concat(table.reverse(aclGetAccountGroups(acc)), ", "), getAccountName(acc), "Offline")
			else
				exports.infoxbox:addBox(client, "A conta já faz parte do(a): "..group, "error")
			end
		end
	elseif type == "remove" then
		if target then
			if isObjectInACLGroup("user."..getAccountName(acc), aclGetGroup(group)) then
				aclGroupRemoveObject(aclGetGroup(group), "user."..getAccountName(acc))
				exports.infoxbox:addBox(client, "O jogador "..getPlayerNameString(target).." agora não faz parte da do(a): "..group, "success")
				exports.infoxbox:addBox(target, "Você não faz mais parte da do(a): "..group, "success")
				triggerClientEvent(client, "setGroupsText", resourceRoot, table.concat(table.reverse(aclGetAccountGroups(acc)), ", "), getAccountName(acc), "Online")
			else
				exports.infoxbox:addBox(client, "Este jogador não faz parte da do(a): "..group, "error")
			end
		else
			if isObjectInACLGroup("user."..getAccountName(acc), aclGetGroup(group)) then
				aclGroupRemoveObject(aclGetGroup(group), "user."..getAccountName(acc))
				exports.infoxbox:addBox(client, "A conta "..getAccountName(acc).." agora não faz parte da do(a): "..group, "success")
				triggerClientEvent(client, "setGroupsText", resourceRoot, table.concat(table.reverse(aclGetAccountGroups(acc)), ", "), getAccountName(acc), "Offline")
			else
				exports.infoxbox:addBox(client, "A conta não faz parte do(a): "..group, "error")
			end
		end
	elseif type == "check" then
		local groups = aclGetAccountGroups(acc)
		if #groups <= 0 then
			triggerClientEvent(client, "setGroupsText", resourceRoot, "Nenhum", getAccountName(acc), (target and "Online" or "Offline"))
		else
			triggerClientEvent(client, "setGroupsText", resourceRoot, table.concat(table.reverse(groups), ", "), getAccountName(acc), (target and "Online" or "Offline"))
		end
	end
end
addEvent("onPlayerManagerTag", true)
addEventHandler("onPlayerManagerTag", resourceRoot, fPlayerManagerTag)

function aclGetAccountGroups(account) 
    local acc = getAccountName(account) 
	if not acc then 
		return false 
	end 
    local res = {} 
    acc = "user."..acc 
    local all = "user.*"
    for _, group in ipairs(aclGroupList()) do 
        for _, object in ipairs(aclGroupListObjects(group)) do 
            if acc == object or all == object then 
                table.insert(res, aclGroupGetName(group)) 
                break 
            end 
        end 
    end 
    return res 
end

function table.reverse(t)
	local newt = {}
	for idx,item in ipairs(t) do
		newt[#t - idx + 1] = item
	end
	return newt
end

function getPlayerNameString(player)
	local name = getPlayerName(player)
	while name:find("#%x%x%x%x%x%x") do
		name = name:gsub("#%x%x%x%x%x%x","")
	end
	return name
end

function getPlayerFromID(id)
	for _, player in pairs(getElementsByType("player")) do
		if getElementData(player, "ID") == tonumber(id) then
			return player
		end
	end
	return false
end



function isPlayerStaff(p)
	if isElement(p) and getElementType(p) == "player" and not isGuestAccount(getPlayerAccount(p)) then
		local object = getAccountName(getPlayerAccount(p))

		for _, group in ipairs(staffACLs) do
			if isObjectInACLGroup("user." .. object, aclGetGroup(group)) then
				return true
			end
		end
	end
	return false
end