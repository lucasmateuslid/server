--╭━━━╮╭━━╮╭╮╱╱╱╭╮╱╱╭╮╭━━━╮╭━━╮╭━━━╮╭━━━╮
--┃╭━╮┃╰┫┣╯┃┃╱╱╱┃╰╮╭╯┃┃╭━━╯╰┫┣╯┃╭━╮┃┃╭━╮┃
--┃╰━━╮╱┃┃╱┃┃╱╱╱╰╮┃┃╭╯┃╰━━╮╱┃┃╱┃╰━╯┃┃┃╱┃┃
--╰━━╮┃╱┃┃╱┃┃╱╭╮╱┃╰╯┃╱┃╭━━╯╱┃┃╱┃╭╮╭╯┃╰━╯┃
--┃╰━╯┃╭┫┣╮┃╰━╯┃╱╰╮╭╯╱┃╰━━╮╭┫┣╮┃┃┃╰╮┃╭━╮┃
--╰━━━╯╰━━╯╰━━━╯╱╱╰╯╱╱╰━━━╯╰━━╯╰╯╰━╯╰╯╱╰╯
--╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱
--╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱
--╔══╗╔══╗╔═╗  ╔══╗╔══╗╔═╗╔═╗╔═╗
--╚╗╔╝╚╗╔╝║╔╝  ║══╣╚╗╔╝║║║║╬║║╦╝
--─║║──║║─║╚╗  ╠══║─║║─║║║║╗╣║╩╗
--─╚╝──╚╝─╚═╝  ╚══╝─╚╝─╚═╝╚╩╝╚═╝


local screenW, screenH = guiGetScreenSize()
local x, y = (screenW/1366), (screenH/768)

local exibindo_painel = false

function PainelInfoSilveira()
    
    dxDrawImage(screenW * 0.1896, screenH * 0.1901, screenW * 0.6208, screenH * 0.6211, "Files/Background.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    
    --Lista de Informações
    dxDrawText("1º DISCORD: http://discord.gg/seuinvite", screenW * 0.2094, screenH * 0.4167, screenW * 0.4473, screenH * 0.4466, tocolor(255, 255, 255, 255), 1.40, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawText("2º IP CONEXÃO: mtasa://endereço:porta", screenW * 0.2094, screenH * 0.4518, screenW * 0.4473, screenH * 0.4818, tocolor(255, 255, 255, 255), 1.40, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawText("3º Complemento", screenW * 0.2094, screenH * 0.4896, screenW * 0.4473, screenH * 0.5195, tocolor(255, 255, 255, 255), 1.40, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawText("4º Complemento", screenW * 0.2094, screenH * 0.5247, screenW * 0.4473, screenH * 0.5547, tocolor(255, 255, 255, 255), 1.40, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawText("5º Complemento", screenW * 0.2094, screenH * 0.5599, screenW * 0.4473, screenH * 0.5898, tocolor(255, 255, 255, 255), 1.40, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawText("6º Complemento", screenW * 0.2094, screenH * 0.5951, screenW * 0.4473, screenH * 0.6250, tocolor(255, 255, 255, 255), 1.40, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawText("7º Complemento", screenW * 0.2094, screenH * 0.6302, screenW * 0.4473, screenH * 0.6602, tocolor(255, 255, 255, 255), 1.40, "default-bold", "left", "top", false, false, false, false, false)
    
    --Lista de Comandos
    dxDrawText("/COMANDO1", screenW * 0.6340, screenH * 0.4167, screenW * 0.8719, screenH * 0.4466, tocolor(255, 255, 255, 255), 1.40, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawText("/COMANDO2", screenW * 0.6340, screenH * 0.4518, screenW * 0.8719, screenH * 0.4818, tocolor(255, 255, 255, 255), 1.40, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawText("/COMANDO3", screenW * 0.6340, screenH * 0.4870, screenW * 0.8719, screenH * 0.5169, tocolor(255, 255, 255, 255), 1.40, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawText("/COMANDO4", screenW * 0.6340, screenH * 0.5221, screenW * 0.8719, screenH * 0.5521, tocolor(255, 255, 255, 255), 1.40, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawText("/COMANDO5", screenW * 0.6340, screenH * 0.5586, screenW * 0.8719, screenH * 0.5885, tocolor(255, 255, 255, 255), 1.40, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawText("/COMANDO6", screenW * 0.6340, screenH * 0.5885, screenW * 0.8719, screenH * 0.6185, tocolor(255, 255, 255, 255), 1.40, "default-bold", "left", "top", false, false, false, false, false)
    dxDrawText("/COMANDO7", screenW * 0.6340, screenH * 0.6185, screenW * 0.8719, screenH * 0.6484, tocolor(255, 255, 255, 255), 1.40, "default-bold", "left", "top", false, false, false, false, false)
    
    dxDrawText("MENTALIZE '/einfo' PARA FECHAR O PAINEL", 450, 590, 775, 613, tocolor(255, 255, 255, 255), 1.50, "default-bold", "left", "top", false, false, false, false, false)
end

addCommandHandler("einfo", function()
    if exibindo_painel == false then
        addEventHandler("onClientRender", getRootElement(), PainelInfoSilveira)
        exibindo_painel = true
    else
        removeEventHandler("onClientRender", getRootElement(), PainelInfoSilveira)
        exibindo_painel = false
    end
end)