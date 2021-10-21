-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( '490.txd' ) 
engineImportTXD( txd, 427 ) 
dff = engineLoadDFF('490.dff', 427) 
engineReplaceModel( dff, 427 )
end)
