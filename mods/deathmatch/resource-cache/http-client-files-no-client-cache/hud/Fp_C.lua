-----------Foxx----------


local screenW,screenH = guiGetScreenSize()
local resW, resH = 800,800
local x, y = (screenW/resW), (screenH/resH)
local components = { "area_name", "radio", "vehicle_name" }

function FpHud ( ... )
    if (not isPlayerMapVisible()) then

        local Dinheiro = getPlayerMoney(localPlayer)
        local weapon = getPedWeapon(getLocalPlayer())
	    local weaponClip = getPedAmmoInClip(getLocalPlayer(), getPedWeaponSlot(getLocalPlayer()))
	    local weaponAmmo = getPedTotalAmmo(getLocalPlayer()) - getPedAmmoInClip(getLocalPlayer())
        local vida = math.floor(getElementHealth(getLocalPlayer()))
        local colete = math.floor(getPedArmor(getLocalPlayer()))
        local ID = getElementData(getLocalPlayer(), "ID") or 0
        local Arma = getPedWeapon(localPlayer)
        local weaponAmmo = getPedTotalAmmo(getLocalPlayer()) - getPedAmmoInClip(getLocalPlayer())
        local weaponClip = getPedAmmoInClip(getLocalPlayer(), getPedWeaponSlot(getLocalPlayer()))
        
         
        
        dxDrawRectangle(screenW * 0.8711, screenH * 0.0098, screenW * 0.0352, screenH * 0.0693, tocolor(26, 103, 157, 255), false) -- colete vazio
        dxDrawRectangle(screenW * 0.8359, screenH * 0.0098, screenW * 0.0352, screenH * 0.0693, tocolor(143, 0, 0, 255), false) -- vida vazia 
        dxDrawRectangle(screenW * 0.9078, screenH * 0.0098, screenW * 0.0875, screenH * 0.0684, tocolor(25, 25, 25, 255), false)-- quadrado arma
        dxDrawImage(screenW * 0.919, screenH * 0.03, screenW * 0.0700, screenH * 0.03, "Files/Icones/"..Arma..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)-- Arma
        dxDrawRectangle(screenW * 0.8359, screenH * 0.0098, screenW * 0.0352/100*vida, screenH * 0.0693, tocolor(226, 54, 54, 255), false)-- vida cheia
        dxDrawRectangle(screenW * 0.8711, screenH * 0.0098, screenW * 0.0352/100*colete, screenH * 0.0693, tocolor(58, 154, 210, 255), false)-- colete cheio
        dxDrawImage(screenW * 0.8430, screenH * 0.0381, screenW * 0.0203, screenH * 0.0215, ":hud/files/Icons/Coracao.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)-- png vida
        dxDrawImage(screenW * 0.8789, screenH * 0.0400, screenW * 0.0172, screenH * 0.0156, ":hud/files/Icons/Colete.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)-- png colete
        dxDrawRectangle(screenW * 0.7805, screenH * 0.0098, screenW * 0.0539, screenH * 0.0400, tocolor(25, 25, 25, 255), false)-- quadrado dinheiro
        dxDrawText("$"..Dinheiro, screenW * 0.7828, screenH * 0.0234, screenW * 0.8320, screenH * 0.0400, tocolor(255, 255, 255, 255), 0.90, "default-bold", "center", "center", false, false, false, false, false)-- dinheiro
        dxDrawRectangle(screenW * 0.7805, screenH * 0.0508, screenW * 0.0539, screenH * 0.0283, tocolor(25, 25, 25, 255), false)-- quadrado ID
        dxDrawText("ID:"..ID, screenW * 0.7828, screenH * 0.0605, screenW * 0.8281, screenH * 0.0791, tocolor(255, 255, 255, 255), 0.90, "default-bold", "center", "top", false, false, false, false, false)-- ID
        dxDrawText(""..weaponAmmo.." / "..weaponClip, screenW * 0.9301, screenH * 0.0608, screenW * 0.9563, screenH * 0.0635, tocolor(255, 255, 255, 255), 0.90, "default-bold", "left", "top", false, false, false, false, false)


    end
end



function setHud()
    addEventHandler("onClientRender", getRootElement(), FpHud)
    setPlayerHudComponentVisible("armour", false)
    setPlayerHudComponentVisible("wanted", false)
    setPlayerHudComponentVisible("weapon", false)
    setPlayerHudComponentVisible("money", false)
    setPlayerHudComponentVisible("health", false)
    setPlayerHudComponentVisible("clock", false)
    setPlayerHudComponentVisible("breath", false)
    setPlayerHudComponentVisible("ammo", false)

    for _, component in ipairs( components ) do
        setPlayerHudComponentVisible( component, false )
    end
end
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), setHud)

function removeHud()
    setPlayerHudComponentVisible("armour", true)
    setPlayerHudComponentVisible("wanted", true)
    setPlayerHudComponentVisible("weapon", true)
    setPlayerHudComponentVisible("money", true)
    setPlayerHudComponentVisible("health", true)
    setPlayerHudComponentVisible("clock", true)
    setPlayerHudComponentVisible("breath", true)
    setPlayerHudComponentVisible("ammo", true)
end
addEventHandler("onClientResourceStop", getResourceRootElement(getThisResource()), removeHud)