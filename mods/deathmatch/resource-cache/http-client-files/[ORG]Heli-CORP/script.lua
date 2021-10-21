-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'maverick.txd' ) 
engineImportTXD( txd, 425 ) 
dff = engineLoadDFF('maverick.dff', 425) 
engineReplaceModel( dff, 425 )
end)
