-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function ()
txd = engineLoadTXD( 'car.txd' )
engineImportTXD( txd, 490 )
dff = engineLoadDFF('car.dff', 490)
engineReplaceModel( dff, 490 )
end)
