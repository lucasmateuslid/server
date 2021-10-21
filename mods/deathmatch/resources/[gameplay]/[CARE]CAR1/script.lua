-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function ()
txd = engineLoadTXD( 'copcarru.txd' )
engineImportTXD( txd, 596 )
dff = engineLoadDFF('copcarru.dff', 596)
engineReplaceModel( dff, 596 )
end)
