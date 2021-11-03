-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function ()
txd = engineLoadTXD( 'BySampaio.txd' )
engineImportTXD( txd, 222 )
dff = engineLoadDFF('BySampaio.dff', 222)
engineReplaceModel( dff, 222 )
end)
