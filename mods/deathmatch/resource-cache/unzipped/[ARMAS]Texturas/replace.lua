function replaceModel() 
  txd = engineLoadTXD("ak47.txd", 355 )
  engineImportTXD(txd, 355)
  dff = engineLoadDFF("ak47.dff", 355 )
  engineReplaceModel(dff, 355)

  txd = engineLoadTXD("desert_eagle.txd", 348 )
  engineImportTXD(txd, 348)
  dff = engineLoadDFF("desert_eagle.dff", 348 )
  engineReplaceModel(dff, 348)


  txd = engineLoadTXD("m4.txd", 356 )
  engineImportTXD(txd, 356)
  dff = engineLoadDFF("m4.dff", 356 )
  engineReplaceModel(dff, 356)

  txd = engineLoadTXD("mp5lng.txd", 353 )
  engineImportTXD(txd, 353)
  dff = engineLoadDFF("mp5lng.dff", 353 )
  engineReplaceModel(dff, 353)
  
    txd = engineLoadTXD("micro_uzi.txd", 352 )
  engineImportTXD(txd, 352)
  dff = engineLoadDFF("micro_uzi.dff", 352 )
  engineReplaceModel(dff, 352)

  txd = engineLoadTXD("sniper.txd", 358 )
  engineImportTXD(txd, 358)
  dff = engineLoadDFF("sniper.dff", 358 )
  engineReplaceModel(dff, 358)

  txd = engineLoadTXD("shotgspa.txd", 349 )
  engineImportTXD(txd, 349)
  dff = engineLoadDFF("shotgspa.dff", 349 )
  engineReplaceModel(dff, 349)

end
addEventHandler ( "onClientResourceStart", getResourceRootElement(getThisResource()), replaceModel)