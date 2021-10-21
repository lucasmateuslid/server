-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'ByHoffFT-BGR.txd' ) 
engineImportTXD( txd, 287 ) 
dff = engineLoadDFF('ByHoffFT-BGR.dff', 287) 
engineReplaceModel( dff, 287 )
end)
