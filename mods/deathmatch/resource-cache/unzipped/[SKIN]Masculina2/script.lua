txd = engineLoadTXD( 'ByPimentinha.txd' )
engineImportTXD( txd, 292 )
dff = engineLoadDFF('ByPimentinha.dff', 292)
engineReplaceModel( dff, 292 )