local monitorMeret = {guiGetScreenSize()}

nagyterkep = {}
nagyterkep.lathato = false

addEventHandler("onClientRender", getRootElement(),
	function()
		if getElementData(getLocalPlayer(), "bigmap.Visible") == true and nagyterkep.lathato == true then
			nagyterkep.jatekosX, nagyterkep.jatekosY = elementPozicio(localPlayer)
		
			local nagyitas, kicsinyites = getKeyState("num_add"), getKeyState("num_sub")
			
			if nagyitas then
				nagyterkep.zoomSzint = math.max(1.5, math.min(2.5, nagyterkep.zoomSzint + ((nagyitas and -0.05))))
			elseif kicsinyites then
				nagyterkep.zoomSzint = math.max(1.5, math.min(2.5, nagyterkep.zoomSzint + ((kicsinyites and 0.05))))
			end
			
			nagyterkep.latotavolsagX = nagyterkep.terkepSzelesseg / 2 * nagyterkep.zoomSzint 
			nagyterkep.latotavolsagFeleX = nagyterkep.latotavolsagX / 2
			nagyterkep.latotavolsagY = nagyterkep.terkepMagassag / 2 * nagyterkep.zoomSzint
			nagyterkep.latotavolsagFeleY = nagyterkep.latotavolsagY / 2
			
			local jatekosForgasa = {getElementRotation(localPlayer)}
			dobozRajzolasPeremmel(nagyterkep.hatterX, nagyterkep.hatterY, nagyterkep.hatterSzelesseg, nagyterkep.hatterMagassag, tocolor(60, 60, 60, 0), tocolor(20, 20, 20, 0))
			
			dxDrawImage(nagyterkep.terkepX, nagyterkep.terkepY, nagyterkep.terkepSzelesseg, nagyterkep.terkepMagassag, nagyterkep.vizKep)
			dxDrawImageSection(nagyterkep.terkepX, nagyterkep.terkepY, nagyterkep.terkepSzelesseg, nagyterkep.terkepMagassag, nagyterkep.jatekosX - nagyterkep.latotavolsagFeleX, nagyterkep.jatekosY - nagyterkep.latotavolsagFeleY, nagyterkep.latotavolsagX, nagyterkep.latotavolsagY, nagyterkep.renderelesiCelpont)
		
			local terkepPoziciok = {nagyterkep.jatekosX - nagyterkep.latotavolsagFeleX, nagyterkep.jatekosX + nagyterkep.latotavolsagFeleX, nagyterkep.jatekosY - nagyterkep.latotavolsagFeleY, nagyterkep.jatekosY + nagyterkep.latotavolsagFeleY}
			local blipKeretFele = nagyterkep.blipHossza / 2
			
			for index, blip in pairs(nagyterkep.blipek[nagyterkep.dimenzio]) do
				if (getDistanceBetweenPoints2D(blip.x, blip.y, nagyterkep.jatekosX, nagyterkep.jatekosY) <= blip.latoTavolsag) then
					local terkepBeallitasok = {nagyterkep.latotavolsagX, nagyterkep.latotavolsagY, nagyterkep.terkepX, nagyterkep.terkepY, blip.x - terkepPoziciok[1], blip.y - terkepPoziciok[3]}
					local blipX, blipY, rajzolas = 0, 0, false
					
					if (blip.x >= terkepPoziciok[1]) and (blip.x <= terkepPoziciok[2]) and (blip.y >= terkepPoziciok[3]) and (blip.y <= terkepPoziciok[4]) then
						blipX = terkepBeallitasok[3] - nagyterkep.blipHossza * blip.meret / 2 + terkepBeallitasok[5] * 2 / nagyterkep.zoomSzint
						blipY = terkepBeallitasok[4] - nagyterkep.blipHossza * blip.meret / 2 + terkepBeallitasok[6] * 2 / nagyterkep.zoomSzint
						
						dxDrawImage(blipX, blipY, nagyterkep.blipHossza * blip.meret, nagyterkep.blipHossza * blip.meret, nagyterkep.blipKep .. blip.ikon .. ".png")
					else
						if (blip.x >= terkepPoziciok[1]) and (blip.x <= terkepPoziciok[2]) and (blip.y > terkepPoziciok[4]) then
							blipX = terkepBeallitasok[3] - nagyterkep.blipHossza / 2 + terkepBeallitasok[5] * 2 / nagyterkep.zoomSzint
							blipY = terkepBeallitasok[4] + nagyterkep.terkepMagassag - blipKeretFele
							rajzolas = true
						elseif (blip.x >= terkepPoziciok[1]) and (blip.x <= terkepPoziciok[2]) and (blip.y < terkepPoziciok[3]) then
							blipX = terkepBeallitasok[3] - nagyterkep.blipHossza / 2 + terkepBeallitasok[5] * 2 / nagyterkep.zoomSzint
							blipY = terkepBeallitasok[4] - blipKeretFele
							rajzolas = true
						elseif (blip.x < terkepPoziciok[1]) and (blip.y >= terkepPoziciok[3]) and (blip.y <= terkepPoziciok[4]) then
							blipX = terkepBeallitasok[3] - blipKeretFele
							blipY = terkepBeallitasok[4] - nagyterkep.blipHossza / 2 + terkepBeallitasok[6] * 2 / nagyterkep.zoomSzint
							rajzolas = true
						elseif (blip.x > terkepPoziciok[1]) and (blip.y >= terkepPoziciok[3]) and (blip.y <= terkepPoziciok[4]) then
							blipX = terkepBeallitasok[3] + nagyterkep.terkepSzelesseg - blipKeretFele
							blipY = terkepBeallitasok[4] - nagyterkep.blipHossza / 2 + terkepBeallitasok[6] * 2 / nagyterkep.zoomSzint
							rajzolas = true
						end
						
						if (rajzolas) then
							dxDrawImage(blipX, blipY, nagyterkep.blipHossza, nagyterkep.blipHossza, nagyterkep.blipKep .. blip.ikon .. ".png")
						end
					end
				end
			end
			
			dxDrawImage(nagyterkep.terkepX + nagyterkep.terkepSzelesseg / 2 - nagyterkep.blipHossza / 2, nagyterkep.terkepY + nagyterkep.terkepMagassag / 2 - nagyterkep.blipHossza / 2, nagyterkep.blipHossza, nagyterkep.blipHossza, "fajlok/kepek/blipek/pozicionk" .. ".png", jatekosForgasa[3] * -1)
		
			-- ** GPS
			dobozRajzolasPeremmel(nagyterkep.terkepX, nagyterkep.terkepY + nagyterkep.terkepMagassag - 35, nagyterkep.terkepSzelesseg, 35, tocolor(60, 60, 60, 0), tocolor(20, 20, 20, 0))
			dxDrawText("GPS Pozíciód: " .. getZoneName(getElementPosition(localPlayer)), nagyterkep.terkepX + 11, nagyterkep.terkepY + nagyterkep.terkepMagassag - 14, nagyterkep.terkepX + 11 + nagyterkep.terkepSzelesseg - 20, nagyterkep.terkepY + nagyterkep.terkepMagassag - 14, tocolor(0, 0, 0, 255), 1.10, "default-bold", "left", "center", false, false, true, true, false) -- szöveg árnyék
			dxDrawText("#c1c1c1GPS Pozíciód: #4da9ff" .. getZoneName(getElementPosition(localPlayer)), nagyterkep.terkepX + 10, nagyterkep.terkepY + nagyterkep.terkepMagassag - 15, nagyterkep.terkepX + 10 + nagyterkep.terkepSzelesseg - 20, nagyterkep.terkepY + nagyterkep.terkepMagassag - 15, tocolor(255, 255, 255, 255), 1.10, "default-bold", "left", "center", false, false, true, true, true) -- szöveg
		end
	end
)

addEventHandler("onClientKey", getRootElement(),
	function(key, state) 
		if state and key == "F11" then
			cancelEvent()
			if getElementData(getLocalPlayer(), "bigmap.Visible") == false then
				setElementData(getLocalPlayer(), "bigmap.Visible", true)
				nagyterkep.lathato = true
				kisterkep.lathato = false
				setElementData(getLocalPlayer(), "hud.Visible", false)
				showChat(false)
			else
				setElementData(getLocalPlayer(), "bigmap.Visible", false)
				kisterkep.lathato = true
				nagyterkep.lathato = false
				setElementData(getLocalPlayer(), "hud.Visible", true)
				showChat(true)
			end
		end
	end
)

---------------------------------------------------------------------
----------------------------- FUNKCIÓK -----------------------------
---------------------------------------------------------------------
function nagyterkepBeallitasa()
	local hatterMeretek = {monitorMeret[1] / 2 + 400, monitorMeret[2] / 2 + 300}
	local hatterPoziciok = {monitorMeret[1] / 2 - (hatterMeretek[1] / 2), monitorMeret[2] / 2 - (hatterMeretek[2] / 2)}

	nagyterkep.dimenzio = 0
	nagyterkep.blipek = {[0] = {}}
	
	nagyterkep.terkepKep = "fajlok/kepek/terkep.png"
	nagyterkep.vizKep = "fajlok/kepek/viz.png"
	nagyterkep.blipKep = "fajlok/kepek/blipek/"
	
	nagyterkep.blipHossza = 20
	
	nagyterkep.kepernyoHatterTores = nagyterkep.blipHossza / 2
	nagyterkep.hatterTores = 5
	
	nagyterkep.zoomSzint = 2
	nagyterkep.terkepMeret = 1536
	
	nagyterkep.hatterSzelesseg = hatterMeretek[1]
	nagyterkep.hatterMagassag = hatterMeretek[2]
	
	nagyterkep.terkepSzelesseg = nagyterkep.hatterSzelesseg - nagyterkep.hatterTores * 2
	nagyterkep.terkepMagassag = nagyterkep.hatterMagassag - nagyterkep.hatterTores * 2
	
	nagyterkep.hatterX = hatterPoziciok[1]
	nagyterkep.hatterY = hatterPoziciok[2]
	nagyterkep.terkepX = nagyterkep.hatterX + nagyterkep.hatterTores
	nagyterkep.terkepY = nagyterkep.hatterY + nagyterkep.hatterTores
	
	nagyterkep.latotavolsagX = nagyterkep.terkepSzelesseg / 2
	nagyterkep.latotavolsagY = nagyterkep.terkepMagassag / 2
	
	nagyterkep.renderelesiCelpont = dxCreateRenderTarget(nagyterkep.terkepMeret, nagyterkep.terkepMeret, false)
	dxSetRenderTarget(nagyterkep.renderelesiCelpont)
	dxDrawImage(0, 0, nagyterkep.terkepMeret, nagyterkep.terkepMeret, nagyterkep.terkepKep)
	dxSetRenderTarget()
	dxSetTextureEdge(nagyterkep.renderelesiCelpont, "border", tocolor(0, 0, 0, 0))
end