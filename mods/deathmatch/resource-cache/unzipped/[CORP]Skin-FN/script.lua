-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'SkinFNOperacional.txd' ) 
engineImportTXD( txd, 288 ) 
dff = engineLoadDFF('SkinFNOperacional.dff', 288) 
engineReplaceModel( dff, 288 )
end)
