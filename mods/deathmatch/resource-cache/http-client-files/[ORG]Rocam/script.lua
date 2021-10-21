-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'Rocam.txd' ) 
engineImportTXD( txd, 523 ) 
dff = engineLoadDFF('Rocam.dff', 523) 
engineReplaceModel( dff, 523 )
end)
