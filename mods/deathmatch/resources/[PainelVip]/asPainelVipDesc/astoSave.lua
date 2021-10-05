function saveDataAvatar(conta)
    if conta then
        local source = getAccountPlayer(conta)
        if isElement(source) then
            local avatar = getElementData(source,"avatar") or 0
            setAccountData(conta, "avatarData",tonumber(avatar))
        end
    end 
end

function loadDataAvatar(conta)
    if not (isGuestAccount (conta)) then
        if (conta) then 
            local source = getAccountPlayer(conta)  
            if isElement(source) then
                local avatar = getAccountData(conta,"avatarData")
                if type(avatar) == "boolean" or "avatar" == nil then
                    avatar = 0
                end
                setElementData(source, "avatar", tonumber(avatar)) 
                --outputDebugString("Carregando Avatar: "..avatar)
            end
        end
    end 
end

addEventHandler("onPlayerLogin", root, function(_, acc)
    setTimer(loadDataAvatar,1000,1,acc)
end)

function saveOnStartScriptAvatar(res)
    if res == getThisResource() then
        for i, player in ipairs(getElementsByType("player")) do
            local acc = getPlayerAccount(player)
            if not isGuestAccount(acc) then
                loadDataAvatar(acc)           
            end
        end
    end
end
addEventHandler("onResourceStart", getRootElement(), saveOnStartScriptAvatar)

function saveOnStopScriptAvatar(res)
    if res == getThisResource() then
        for i, player in ipairs(getElementsByType("player")) do
            local acc = getPlayerAccount(player)
            if not isGuestAccount(acc) then
                saveDataAvatar(acc)   
            end
        end
    end
end 
addEventHandler("onResourceStop", getRootElement(), saveOnStopScriptAvatar)

function saveOnQuitAvatar(quitType)
    local acc = getPlayerAccount(source)
    if not (isGuestAccount(acc)) then
        if acc then
            saveDataAvatar(acc)
        end
    end
end
addEventHandler("onPlayerQuit", getRootElement(), saveOnQuitAvatar)