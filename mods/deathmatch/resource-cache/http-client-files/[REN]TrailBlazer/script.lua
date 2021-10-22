-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function ()
txd = engineLoadTXD( 'copcarru.txd' )
engineImportTXD( txd, 598 )
dff = engineLoadDFF('copcarru.dff', 598)
engineReplaceModel( dff, 598 )
end)
