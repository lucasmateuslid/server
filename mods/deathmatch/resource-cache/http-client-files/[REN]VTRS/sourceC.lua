local LOAD = {
	{txd = "497.txd", dff = "497.dff", id = 497},
	{txd = "523.txd", dff = "523.dff", id = 523},
	{txd = "596.txd", dff = "596.dff", id = 596},
	{txd = "597.txd", dff = "597.dff", id = 597},
	{txd = "598.txd", dff = "598.dff", id = 598}
}

addEventHandler("onClientResourceStart", resourceRoot, 
	function()
		for _, v in ipairs(LOAD) do		
			if v.txd then
				engineImportTXD(engineLoadTXD(v.txd), v.id)
			end
			if v.dff then
				engineReplaceModel(engineLoadDFF(v.dff), v.id)
			end
		end
	end
)
