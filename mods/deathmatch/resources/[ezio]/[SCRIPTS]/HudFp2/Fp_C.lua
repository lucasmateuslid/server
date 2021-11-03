-----------Foxx----------


local screenW,screenH = guiGetScreenSize()
local resW, resH = 1366,768
local x, y = (screenW/resW), (screenH/resH)
local components = { "area_name", "radio", "vehicle_name" }

local bold = dxCreateFont("fonts/bold.ttf", 8, false, "antialiased")
local icons = dxCreateFont("fonts/icons.otf", 8, false, "antialiased")
local icons2 = dxCreateFont("fonts/icons2.otf", 10, false, "antialiased")
local regular = dxCreateFont("fonts/regular.ttf", 9, false, "antialiased")
local regular2 = dxCreateFont("fonts/regular.ttf", 10, false, "antialiased")

function FpHud ( ... )
    if (not isPlayerMapVisible()) then

        local Dinheiro = convertNumber(getPlayerMoney(localPlayer))
        local weapon = getPedWeapon(getLocalPlayer())
	    local weaponClip = getPedAmmoInClip(getLocalPlayer(), getPedWeaponSlot(getLocalPlayer()))
	    local weaponAmmo = getPedTotalAmmo(getLocalPlayer()) - getPedAmmoInClip(getLocalPlayer())
        local vida = math.floor(getElementHealth(getLocalPlayer()))
        local colete = math.floor(getPedArmor(getLocalPlayer()))
        local ID = getElementData(getLocalPlayer(), "ID") or 0
        local Arma = getPedWeapon(localPlayer)
        local weaponAmmo = getPedTotalAmmo(getLocalPlayer()) - getPedAmmoInClip(getLocalPlayer())
        local weaponClip = getPedAmmoInClip(getLocalPlayer(), getPedWeaponSlot(getLocalPlayer()))
        local banco = convertNumber(0)

        dxDrawImage(screenW * 0.7375, screenH * 0.0098, screenW * 0.2586, screenH * 0.1426, ":HudFp2/img/hud.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.8313, screenH * 0.0098, screenW * 0.0336*vida/100, screenH * 0.0830, ":HudFp2/img/vida.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.8656, screenH * 0.0098, screenW * 0.0352*colete/100, screenH * 0.0830, ":HudFp2/img/colete.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.8391, screenH * 0.0400, screenW * 0.0180, screenH * 0.0225, ":HudFp2/img/coracao.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawImage(screenW * 0.8727, screenH * 0.0400, screenW * 0.0203, screenH * 0.0215, ":HudFp2/img/escudo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawText(""..ID, screenW * 0.7367, screenH * 0.1016, screenW * 0.7719, screenH * 0.1523, tocolor(255, 255, 255, 255), 1.07, regular, "center", "center", false, false, false, false, false)
        dxDrawText("$ "..Dinheiro, screenW * 0.7547, screenH * 0.0303, screenW * 0.8217, screenH * 0.0488, tocolor(255, 255, 255, 255), 1.00, regular, "center", "top", false, false, false, false, false)
        dxDrawText("$ "..banco, screenW * 0.7517, screenH * 0.0517, screenW * 0.84174, screenH * 0.0801, tocolor(255, 255, 255, 255), 1.00, regular, "center", "center", false, false, false, false, false)
        dxDrawImage(screenW * 0.9110, screenH * 0.03, screenW * 0.0700, screenH * 0.03, "Icones/"..Arma..".png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawText(""..weaponAmmo.. " / "..weaponClip, screenW * 0.9031, screenH * 0.0674, screenW * 0.9922, screenH * 0.0898, tocolor(255, 255, 255, 255), 1.00, regular, "center", "center", false, false, false, false, false)
        dxDrawText("Servidor de Treino - Corporações Aliadas", screenW * 0.7758, screenH * 0.1006, screenW * 0.9953, screenH * 0.1514, tocolor(255, 255, 255, 255), 0.90, regular2, "center", "center", false, true, false, false, false)

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

function convertNumber ( number )
    local formatted = number
    while true do
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
        if ( k==0 ) then
            break
        end
    end
    return formatted
end