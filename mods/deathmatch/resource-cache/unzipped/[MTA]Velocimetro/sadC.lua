--[[


                ██████╗ ███████╗
                ██╔══██╗██╔════╝
                ██║  ██║███████╗
                ██║  ██║╚════██║
                ██████╔╝███████║
                ╚═════╝ ╚══════╝
           Copyright 2021 | d1ogo#0001
           
--]]

local screen = {guiGetScreenSize( )}
local x, y = (screen[1]/1366), (screen[2]/768)

local font1 = dxCreateFont("files/fonts/font_medium.ttf", 13)
local font2 = dxCreateFont("files/fonts/font_light.ttf", 11)

function dxDrawRender ( )
    local veh = getPedOccupiedVehicle(getLocalPlayer( ) )
    if veh then
    local fuel = getElementData(veh, "Gasolina") or 0
    local dano = (getElementHealth(veh) /10)
    local actualspeed = getVehicleSpeed( )
    local kmh = (actualspeed)
    local kmhmax = kmh/config["Options"]["MaxVelocity"]
    if kmh < config["Options"]["MaxVelocity"] then
        hou_circle(x * 1280, y * 668, x * 150, y * 146, tocolor(25, 25, 25, 251), 310, 280, 11)
        hou_circle(x * 1280, y * 668, x * 150, y * 146, tocolor(config["Design"][1][1], config["Design"][1][2], config["Design"][1][3]), 310, 280 *kmhmax, 11)
    else
        hou_circle(x * 1280, y * 668, x * 150, y * 146, tocolor(config["Design"][1][1], config["Design"][1][2], config["Design"][1][3]), 310, 280, 11)
    end
        dxDrawRectangleBorde(x * 1006, y * 673, x * 207, y * 35, tocolor(25, 25, 25, 255))
        dxDrawRectangleBorde(x * 1006, y * 633, x * 207, y * 35, tocolor(25, 25, 25, 255))
        dxDrawRectangleBorde(x * 1045, y * 633, x * 167, y * 35, tocolor(50, 50, 50, 255))

        dxDrawRectangleBorde(x * 1045, y * 634, x * 168 / 101 * fuel, y * 33, tocolor(50, 50, 50, 255))
        dxDrawRectangleBorde(x * 1045, y * 674, x * 168 / 101 * dano, y * 33, tocolor(50, 50, 50, 255))

        dxDrawImage(x * 1016, y * 640, x * 19, y * 19, "files/gfx/fuel.png")
        dxDrawImage(x * 1015, y * 679, x * 20, y * 20, "files/gfx/car.png")

        dxDrawText(math.floor(kmh), x * 1858, y * 635, x * 710, y * 680, tocolor(255, 255, 255, 255), 1.75, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText("km/h", x * 1860, y * 685, x * 710, y * 680, tocolor(255, 255, 255, 255), 1.10, "default-bold", "center", "center", false, false, false, false, false)
    end
end
addEventHandler("onClientRender", getRootElement( ), dxDrawRender)

function getVehicleSpeed ( )
    if isPedInVehicle(getLocalPlayer( ) ) then
	    local vehicle = getPedOccupiedVehicle (getLocalPlayer( ) )
        local vx, vy, vz = getElementVelocity (vehicle)
        return math.sqrt(vx^2 + vy^2 + vz^2) * 165
    end
    return 0
end

function dxDrawRectangleBorde(left, top, width, height, color, postgui)
    if not postgui then
        postgui = false;
    end

    left, top = left + 1, top + 1;
    width, height = width - 2, height - 2;

    dxDrawRectangle(left - 1.5, top, 1.5, height, color, postgui);
    dxDrawRectangle(left + width, top, 1.5, height, color, postgui);
    dxDrawRectangle(left, top - 1.5, width, 1.5, color, postgui);
    dxDrawRectangle(left, top + height, width, 1.5, color, postgui);

    dxDrawRectangle(left - 1, top - 1, 1, 1, color, postgui);
    dxDrawRectangle(left + width, top - 1, 1, 1, color, postgui);
    dxDrawRectangle(left - 1, top + height, 1, 1, color, postgui);
    dxDrawRectangle(left + width, top + height, 1, 1, color, postgui);

    dxDrawRectangle(left, top, width, height, color, postgui);
end