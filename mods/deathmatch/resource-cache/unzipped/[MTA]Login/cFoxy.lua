--[[


                  ███████╗███████╗        
                  ██╔════╝██╔════╝        
                  █████╗  ███████╗        
                  ██╔══╝  ╚════██║        
                  ██║     ███████║
                  ╚═╝     ╚══════╝
              Copyright - 2020 | 2021       
                                       

--]]


--[[
    ><><><><><><><><><><><><><><><><><><><><
    ><               Codigo               ><
    ><><><><><><><><><><><><><><><><><><><><
--]]


local BACKGROUND_COLOR = 0xFF151515
local screenSize = Vector2(guiGetScreenSize())

local screenW, screenH = guiGetScreenSize()
local x, y = (screenW/1366), (screenH/768)

local PainelLogin = false
local PainelRegister = false

local fontP = dxCreateFont("assets/Roboto-Regular.ttf", y*10, false, "proof")
local font = dxCreateFont("assets/font.ttf", y*100, false, "proof")
local font2 = dxCreateFont("assets/font.ttf", y*10, false, "proof")



local Usuario = createElement("EditBoxAccount")
local Senha = createElement("EditBoxAccount")
--
local UsuarioR = createElement("EditBoxAccount")
local SenhaR = createElement("EditBoxAccount")
local Senha2R = createElement("EditBoxAccount")

--[[
cameraPosition = {
    {-135.68249511719, -1579.8795166016, 17.614200592041, -49.705600738525, -1577.8850097656, 17.614200592041, -48.71134185791, -1577.8619384766, 17.509704589844,40000},
    {-51.687099456787, -1130.0406494141, 17.556999206543,-194.48579406738, -1117.4056396484, 17.614200592041, -195.47859191895, -1117.4642333984, 17.509704589844, 40000},
    {1605.7762451172, -1364.2154541016, 21.499799728394, 1606.82421875, -1301.3582763672, 21.442499160767, 1606.8292236328, -1300.3598632812, 21.38705825805, 40000},
    {1479.1708984375, -907.7998046875, 157.27688598633, 1308.4365234375, -787.44921875, 101.86915588379, 153.45703125, -1725.8759765625, 200.7652130127, 530.95703125, -1193.9462890625, 69.442398071289, 40000},
    {878.455078125, -1545.142578125, 79.936729431152, 725.533203125, -1481.2529296875, 10.100814819336, 435.046875, -1927.6533203125, 56.113700866699, 722.794921875, -1934.84375, 5.0585250854492, 40000},
    {1564.96875, -1305.927734375, 400.03671264648, 1493.982421875, -1691.9453125, 26.627010345459, 1233.90234375, -1488.73828125, 140.12214660645, 898.9267578125, -1710.4404296875, 25.806222915649, 40000}
}
]]

setTimer (function ()
    local username, password = loadLoginFromXML()
        setElementData(Usuario, "text", tostring(username))
        setElementData(Senha, "text", tostring(password))
end, 1000, 1)


function loginMenu()
    dxDrawRectangle(0, 0, screenSize, BACKGROUND_COLOR)
    dxDrawImage(0, 0, screenSize, "assets/fundo.png",0,0,0,tocolor(255,255,255,10))
    --dxDrawRectangleBorde(x*519, y*175, x*327, y*400, tocolor(30, 30, 30,235))
    --dxDrawRectangleBorde(x*519, y*175, x*327, y*30, tocolor(35, 35, 35,235))
    
    local fftMul = 0
    if isElement(musicaPainel) then
        local FFT = getSoundFFTData(musicaPainel, 2048, 0)
        
        if FFT then
            FFT[1] = math.sqrt(FFT[1]) * 2

            if FFT[1] < 0 then
                FFT[1] = 0
            elseif FFT[1] > 1 then
                FFT[1] = 1
            end

            fftMul = FFT[1]

            dxDrawImage(0, 0, screenW, screenH, "assets/lights.png", 0, 0, 0, tocolor(0, 255, 0,20 * FFT[1]))
        end
    end




    if cursorPosition(x*557, y*440, x*252, y*36) then
        dxDrawRectangleBorde(x*557, y*440, x*252, y*36, tocolor(54, 184, 145,225))
    else
        dxDrawRectangleBorde(x*557, y*440, x*252, y*36, tocolor(54, 179, 130))
    end

    if cursorPosition(x*620, y*490, x*120, y*10) then 
        dxDrawText("Não tem uma conta?", x*556, y*470, x*808, y*523, tocolor(255, 255, 255, 255), 1.00, fontP, "center", "center", false, false, false, false, false)
        dxDrawText("_____________________", x*556, y*475, x*808, y*523, tocolor(255, 255, 255, 255), 1.00, fontP, "center", "center", false, false, false, false, false)
    else
        dxDrawText("Não tem uma conta?", x*556, y*470, x*808, y*523, tocolor(255, 255, 255, 255), 1.00, fontP, "center", "center", false, false, false, false, false)
    end

    if(isSoundPaused(musicaPainel)) then
        dxDrawImage(x*10, y*10, x*30, y*30, "assets/mute.png")
    else
        dxDrawImage(x*10, y*10, x*30, y*30, "assets/sound.png")
    end

    dxDrawRectangleBorde(x*557, y*335, x*252, y*36, tocolor(25, 25, 25,225))
    dxDrawEditBox("Usúario", x*557, y*335, x*252, y*36, false, 15, Usuario)

    dxDrawRectangleBorde(x*557, y*383, x*252, y*36, tocolor(25, 25, 25,225))
    dxDrawEditBox("Senha", x*557, y*383, x*252, y*36, true, 15, Senha)

    dxDrawText("Não tem uma conta?", x*556, y*470, x*808, y*523, tocolor(255, 255, 255, 255), 1.00, fontP, "center", "center", false, false, false, false, false)
    --dxDrawText("Autenticação - Login", x*642, y*170, x*723, y*211, tocolor(255, 255, 255, 255), 1.00, fontP, "center", "center", false, false, false, false, false)
    dxDrawImage(x*520, y*100, x*300, y*300, "assets/logo.png", 0, 0, 0, tocolor(255,255,255,255))
    dxDrawText("Logar-se", x*556, y*394, x*808, y*523, tocolor(255, 255, 255, 255), 1, fontP, "center", "center", false, false, false, false, false)
    --dxDrawText("ROYAL", x*642, y*310, x*723, y*211, tocolor(255, 255, 255, 200), 1, font, "center", "center", false, false, false, false, false)
end

function registerMenu()
    dxDrawRectangle(0, 0, screenSize, BACKGROUND_COLOR)
    dxDrawImage(0, 0, screenSize, "assets/fundo.png",0,0,0,tocolor(255,255,255,10))
    --dxDrawRectangleBorde(x*519, y*175, x*327, y*400, tocolor(30, 30, 30,235))
    --dxDrawRectangleBorde(x*519, y*175, x*327, y*30, tocolor(35, 35, 35,235))
    
    local fftMul = 0
    if isElement(musicaPainel) then
        local FFT = getSoundFFTData(musicaPainel, 2048, 0)
        
        if FFT then
            FFT[1] = math.sqrt(FFT[1]) * 2

            if FFT[1] < 0 then
                FFT[1] = 0
            elseif FFT[1] > 1 then
                FFT[1] = 1
            end

            fftMul = FFT[1]

            dxDrawImage(0, 0, screenW, screenH, "assets/lights.png", 0, 0, 0, tocolor(0, 255, 0,20 * FFT[1]))
        end
    end




    if cursorPosition(x*557, y*480, x*252, y*36) then
        dxDrawRectangleBorde(x*557, y*480, x*252, y*36, tocolor(54, 184, 145,225))
    else
        dxDrawRectangleBorde(x*557, y*480, x*252, y*36, tocolor(54, 179, 130))
    end


    if cursorPosition(x*620, y*527, x*120, y*10) then 
        dxDrawText("Ja possui uma conta?", x*556, y*540, x*808, y*523, tocolor(255, 255, 255, 255), 1.00, fontP, "center", "center", false, false, false, false, false)   
        dxDrawText("_____________________", x*556, y*545, x*808, y*523, tocolor(255, 255, 255, 255), 1.00, fontP, "center", "center", false, false, false, false, false)
    else
        dxDrawText("Ja possui uma conta?", x*556, y*540, x*808, y*523, tocolor(255, 255, 255, 255), 1.00, fontP, "center", "center", false, false, false, false, false)
    end

    if(isSoundPaused(musicaPainel)) then
        dxDrawImage(x*10, y*10, x*30, y*30, "assets/mute.png")
    else
        dxDrawImage(x*10, y*10, x*30, y*30, "assets/sound.png")
    end

    dxDrawRectangleBorde(x*557, y*335, x*252, y*36, tocolor(25, 25, 25,225))
    dxDrawRectangleBorde(x*557, y*383, x*252, y*36, tocolor(25, 25, 25,225))
    dxDrawRectangleBorde(x*557, y*431, x*252, y*36, tocolor(25, 25, 25,225))

    dxDrawEditBox("Usúario", x*557, y*335, x*252, y*36, false, 15, UsuarioR)
    dxDrawEditBox("Senha", x*557, y*383, x*252, y*36, true, 15, SenhaR)
    dxDrawEditBox("Confirme a Senha", x*557, y*431, x*252, y*36, true, 15, Senha2R)

    --dxDrawText("Autenticação - Login", x*642, y*170, x*723, y*211, tocolor(255, 255, 255, 255), 1.00, fontP, "center", "center", false, false, false, false, false)
    dxDrawImage(x*520, y*100, x*300, y*300, "assets/logo.png", 0, 0, 0, tocolor(255,255,255,255))
    dxDrawText("Registrar-se", x*556, y*475, x*808, y*523, tocolor(255, 255, 255, 255), 1, fontP, "center", "center", false, false, false, false, false)
    --dxDrawText("ROYAL", x*642, y*310, x*723, y*211, tocolor(255, 255, 255, 200), 1, font, "center", "center", false, false, false, false, false)
end

--[[
local i = 1
local dx = 0.0


function renderCamera()
    if dx < 1 or dx < 1 then
        dx = dx+0.001
        local _x, _y, _z = interpolateBetween ( cameraPosition[i][1], cameraPosition[i][2], cameraPosition[i][3], cameraPosition[i][4], cameraPosition[i][5], cameraPosition[i][6], dx, "SineCurve")
        setCameraMatrix ( _x, _y, _z, cameraPosition[i][7], cameraPosition[i][8], cameraPosition[i][9])
    elseif dx > 0 then
        _x, _y, _z = nil, nil, nil
        dx = 0.0
        i = i + 1
        if ( i >= 7) then
            i = 1
            dx = 0.0
        end 
    end
end
]]

function onLoginStart()
    PainelLogin = true
    addEventHandler("onClientRender", getRootElement(), loginMenu)
    --addEventHandler("onClientRender", getRootElement(), renderCamera)
    showCursor(true)
    showChat(false)
    musicaPainel = playSound("assets/musica.mp3", true)
    setSoundVolume(musicaPainel, 2)
end
addEventHandler("onPlayerJoin", getRootElement(), onLoginStart)
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), onLoginStart)

addEvent("removeLogin", true)
addEventHandler("removeLogin", getRootElement(), 
    function()
        if PainelLogin == true then
            setCameraTarget(localPlayer, localPlayer)
            removeEventHandler("onClientRender", getRootElement(), loginMenu)
            --removeEventHandler("onClientRender", getRootElement(), renderCamera)
            removeEventHandler("onClientRender", getRootElement(), registerMenu)
            showChat(true)
            showCursor(false)
            PainelLogin = false
            PainelRegister = false
            stopSound(musicaPainel)
            saveLoginToXML()
            --setElementPosition(getAccountData(x,y,z))
        end
    end
)


function toggleRemember (button, state, absoluteX, absoluteY, wx, wy, wz, clickedElement)
    if state == "down" and PainelLogin == true then
        if cursorPosition(x*1000, y*500, x*100, y*100) then
            rememberMe = not rememberMe
        end
    end
end
addEventHandler ("onClientClick", getRootElement(), toggleRemember)

addEventHandler("onClientClick", getRootElement(),
    function(b, s)
        if PainelLogin == true or PainelRegister == true then
            if (b == "left") and (s == "down") then
                if cursorPosition(x*10, y*10, x*30, y*30) then
    if(isSoundPaused(musicaPainel)) then
        setSoundPaused(musicaPainel, false)
    else
        setSoundPaused(musicaPainel, true)
    end
                end
            end
        end
    end
)

addEventHandler("onClientClick", getRootElement(),
    function(b, s)
        if PainelLogin == true then
            if (b == "left") and (s == "down") then
                if cursorPosition(x*620, y*490, x*120, y*10) then
                    setTimer(function()
                    PainelRegister = true
                    PainelLogin = false
                    end, 500, 1)
                    addEventHandler("onClientRender", getRootElement(), registerMenu)
                    removeEventHandler("onClientRender", getRootElement(), loginMenu)
                end
            end
        end
    end
)

addEventHandler("onClientClick", getRootElement(),
    function(b, s)
        if PainelRegister == true then
            if (b == "left") and (s == "down") then
                if cursorPosition(x*620, y*527, x*120, y*10) then
                    PainelLogin = true
                    PainelRegister = false
                    removeEventHandler("onClientRender", getRootElement(), registerMenu)
                    addEventHandler("onClientRender", getRootElement(), loginMenu)
                end
            end
        end
    end
)


addEventHandler("onClientClick", getRootElement(),
    function(b, s)
        if PainelLogin == true then
            if (b == "left") and (s == "down") then
                if cursorPosition(x*557, y*440, x*252, y*36) then
                    local username = getElementData(Usuario, "text")
                    local password = getElementData(Senha, "text")
                    local remember2 = remember
                    triggerServerEvent("hasClickLogin", localPlayer, username, password, remember2)
                end
            end
        end
    end
)

addEventHandler("onClientClick", getRootElement(),
    function(b, s)
        if PainelRegister == true then
            if (b == "left") and (s == "down") then
                if cursorPosition(x*557, y*480, x*252, y*36) then
                    local username = getElementData(UsuarioR, "text")
                    local password = getElementData(SenhaR, "text")
                    local pass2 = getElementData(Senha2R, "text")
                    triggerServerEvent("hasClickRegister", localPlayer, username, password, pass2)
                end
            end
        end
    end
)

    function dxDrawRectangleBorde(left, top, width, height, color, postgui)
    if not postgui then
        postgui = false;
    end

    left, top = left + 2, top + 2;
    width, height = width - 4, height - 4;

    dxDrawRectangle(left - 2, top, 2, height, color, postgui);
    dxDrawRectangle(left + width, top, 2, height, color, postgui);
    dxDrawRectangle(left, top - 2, width, 2, color, postgui);
    dxDrawRectangle(left, top + height, width, 2, color, postgui);

    dxDrawRectangle(left - 1, top - 1, 1, 1, color, postgui);
    dxDrawRectangle(left + width, top - 1, 1, 1, color, postgui);
    dxDrawRectangle(left - 1, top + height, 1, 1, color, postgui);
    dxDrawRectangle(left + width, top + height, 1, 1, color, postgui);

    dxDrawRectangle(left, top, width, height, color, postgui);
end

function cursorPosition(x, y, width, height)
    if(not isCursorShowing()) then
        return false
    end
    local sx, sy = guiGetScreenSize()
    local cx, cy = getCursorPosition()
    local cx, cy =(cx*sx),(cy*sy)
    if (cx >= x and cx <= x + width) and (cy >= y and cy <= y + height) then
        return true
    else
        return false
    end
end

function loadLoginFromXML()
    local xml_save_log_File = xmlLoadFile ("files/xml/userdata.xml")
    if not xml_save_log_File then
        xml_save_log_File = xmlCreateFile("files/xml/userdata.xml", "login")
    end
    local usernameNode = xmlFindChild (xml_save_log_File, "username", 0)
    local passwordNode = xmlFindChild (xml_save_log_File, "password", 0)
    if usernameNode and passwordNode then
        return xmlNodeGetValue(usernameNode), xmlNodeGetValue(passwordNode)
    else
        return "", ""
    end
    xmlUnloadFile ( xml_save_log_File )
end
 
 
function saveLoginToXML(username, password)
                    local username = getElementData(Usuario, "text")
                    local password = getElementData(Senha, "text")
    local xml_save_log_File = xmlLoadFile ("files/xml/userdata.xml")
    if not xml_save_log_File then
        xml_save_log_File = xmlCreateFile("files/xml/userdata.xml", "login")
    end
    if (username ~= "") then
        local usernameNode = xmlFindChild (xml_save_log_File, "username", 0)
        if not usernameNode then
            usernameNode = xmlCreateChild(xml_save_log_File, "username")
        end
        xmlNodeSetValue (usernameNode, tostring(username))
    end
    if (password ~= "") then
        local passwordNode = xmlFindChild (xml_save_log_File, "password", 0)
        if not passwordNode then
            passwordNode = xmlCreateChild(xml_save_log_File, "password")
        end     
        xmlNodeSetValue (passwordNode, tostring(password))
    end
    xmlSaveFile(xml_save_log_File)
    xmlUnloadFile (xml_save_log_File)
end
addEvent("saveLoginToXML", true)
addEventHandler("saveLoginToXML", getRootElement(), saveLoginToXML)