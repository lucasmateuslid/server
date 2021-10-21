-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'eb.txd' ) 
engineImportTXD( txd, 281 ) 
dff = engineLoadDFF('eb.dff', 281) 
engineReplaceModel( dff, 281 )
end)
