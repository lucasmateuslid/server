-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'BRISAMODS.txd' ) 
engineImportTXD( txd, 283 ) 
dff = engineLoadDFF('BRISAMODS.dff', 283) 
engineReplaceModel( dff, 283 )
end)
