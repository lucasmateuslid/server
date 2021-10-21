function onJoin()
    setPedArmor(source, 100)
    local playerName = getPlayerName(source)
    local ID = getElementData(localPlayer, "ID") or 0
    exports["infobox"]:addBox(source, "success", "Bem Vindo ao servidor ".. playerName .."", source, 255, 255, 255)
end
addEventHandler("onPlayerJoin", root, onJoin)