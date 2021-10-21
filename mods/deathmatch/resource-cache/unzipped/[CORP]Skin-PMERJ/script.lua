-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'BySobs.txd' ) 
engineImportTXD( txd, 286 ) 
dff = engineLoadDFF('BySobs.dff', 286) 
engineReplaceModel( dff, 286 )
end)
