txd = engineLoadTXD("rota.txd")
engineImportTXD(txd, 284) 
dff = engineLoadDFF("rota.dff",284)
engineReplaceModel(dff, 284)



