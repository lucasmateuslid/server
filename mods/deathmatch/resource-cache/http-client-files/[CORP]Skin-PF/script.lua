-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'byScoobiy.txd' ) 
engineImportTXD( txd, 285 ) 
dff = engineLoadDFF('byScoobiy.dff', 285) 
engineReplaceModel( dff, 285 )
end)
