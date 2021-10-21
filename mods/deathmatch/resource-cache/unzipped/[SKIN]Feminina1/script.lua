-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) Ygao

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'Ygao.txd' ) 
engineImportTXD( txd, 293 ) 
dff = engineLoadDFF('Ygao.dff', 293) 
engineReplaceModel( dff, 293 )
end)
