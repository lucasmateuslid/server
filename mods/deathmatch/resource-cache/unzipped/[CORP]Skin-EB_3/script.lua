--[[
© Creditos do script: #Mods MTA:SA

© Creditos da pagina postadora: DropMTA

© Discord DropMTA: https://discord.gg/GZ8DzrmxUV

Acesse nosso site de mods: https://dropmta.blogspot.com/

]]--

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'pqd.txd' ) 
engineImportTXD( txd, 282 ) 
dff = engineLoadDFF('pqd.dff', 282) 
engineReplaceModel( dff, 282 )
end)
