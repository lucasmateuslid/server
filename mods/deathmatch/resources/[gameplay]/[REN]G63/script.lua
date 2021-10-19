-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function ()
txd = engineLoadTXD( 'car.txd' )
engineImportTXD( txd, 579 )
dff = engineLoadDFF('car.dff', 579)
engineReplaceModel( dff, 579 )
end)
