local monitorMeret = {guiGetScreenSize()}
local serulesEffekt = {}

local mappanev = "rectangleradar"

kisterkep = {}
kisterkep.lathato = true

addEventHandler("onClientRender", getRootElement(),
	function()
		if getElementData(getLocalPlayer(), "minimap.Visible") == true and kisterkep.lathato == true and dxGetStatus()["VideoMemoryFreeForMTA"] >= 8 then
			kisterkep.jatekosX, kisterkep.jatekosY = elementPozicio(localPlayer)
		
			local nagyitas, kicsinyites = getKeyState("num_add"), getKeyState("num_sub")
			
			if nagyitas then
				kisterkep.zoomSzint = math.max(1.5, math.min(4, kisterkep.zoomSzint + ((nagyitas and -0.05))))
			elseif kicsinyites then
				kisterkep.zoomSzint = math.max(1.5, math.min(4, kisterkep.zoomSzint + ((kicsinyites and 0.05))))
			end
			
			kisterkep.latotavolsagX = kisterkep.terkepSzelesseg / 2 * kisterkep.zoomSzint 
			kisterkep.latotavolsagFeleX = kisterkep.latotavolsagX / 2
			kisterkep.latotavolsagY = kisterkep.terkepMagassag / 2 * kisterkep.zoomSzint
			kisterkep.latotavolsagFeleY = kisterkep.latotavolsagY / 2
			
			local jatekosForgasa = {getElementRotation(localPlayer)}
			dobozRajzolasPeremmel(kisterkep.hatterX, kisterkep.hatterY, kisterkep.hatterSzelesseg, kisterkep.hatterMagassag, tocolor(60, 60, 60, 0), tocolor(20, 20, 20, 0))
			
			dxDrawImage(kisterkep.terkepX, kisterkep.terkepY, kisterkep.terkepSzelesseg, kisterkep.terkepMagassag, kisterkep.vizKep)
			dxDrawImageSection(kisterkep.terkepX, kisterkep.terkepY, kisterkep.terkepSzelesseg, kisterkep.terkepMagassag, kisterkep.jatekosX - kisterkep.latotavolsagFeleX, kisterkep.jatekosY - kisterkep.latotavolsagFeleY, kisterkep.latotavolsagX, kisterkep.latotavolsagY, kisterkep.renderelesiCelpont)
		
			local terkepPoziciok = {kisterkep.jatekosX - kisterkep.latotavolsagFeleX, kisterkep.jatekosX + kisterkep.latotavolsagFeleX, kisterkep.jatekosY - kisterkep.latotavolsagFeleY, kisterkep.jatekosY + kisterkep.latotavolsagFeleY}
			local blipKeretFele = kisterkep.blipHossza / 2
			
			for index, blip in pairs(kisterkep.blipek[kisterkep.dimenzio]) do
				if (getDistanceBetweenPoints2D(blip.x, blip.y, kisterkep.jatekosX, kisterkep.jatekosY) <= blip.latoTavolsag) then
					local terkepBeallitasok = {kisterkep.latotavolsagX, kisterkep.latotavolsagY, kisterkep.terkepX, kisterkep.terkepY, blip.x - terkepPoziciok[1], blip.y - terkepPoziciok[3]}
					local blipX, blipY, rajzolas = 0, 0, false
					
					if (blip.x >= terkepPoziciok[1]) and (blip.x <= terkepPoziciok[2]) and (blip.y >= terkepPoziciok[3]) and (blip.y <= terkepPoziciok[4]) then
						blipX = terkepBeallitasok[3] - kisterkep.blipHossza * blip.meret / 2 + terkepBeallitasok[5] * 2 / kisterkep.zoomSzint
						blipY = terkepBeallitasok[4] - kisterkep.blipHossza * blip.meret / 2 + terkepBeallitasok[6] * 2 / kisterkep.zoomSzint
						
						dxDrawImage(blipX, blipY, kisterkep.blipHossza * blip.meret, kisterkep.blipHossza * blip.meret, kisterkep.blipKep .. blip.ikon .. ".png")
					else
						if (blip.x >= terkepPoziciok[1]) and (blip.x <= terkepPoziciok[2]) and (blip.y > terkepPoziciok[4]) then
							blipX = terkepBeallitasok[3] - kisterkep.blipHossza / 2 + terkepBeallitasok[5] * 2 / kisterkep.zoomSzint
							blipY = terkepBeallitasok[4] + kisterkep.terkepMagassag - blipKeretFele
							rajzolas = true
						elseif (blip.x >= terkepPoziciok[1]) and (blip.x <= terkepPoziciok[2]) and (blip.y < terkepPoziciok[3]) then
							blipX = terkepBeallitasok[3] - kisterkep.blipHossza / 2 + terkepBeallitasok[5] * 2 / kisterkep.zoomSzint
							blipY = terkepBeallitasok[4] - blipKeretFele
							rajzolas = true
						elseif (blip.x < terkepPoziciok[1]) and (blip.y >= terkepPoziciok[3]) and (blip.y <= terkepPoziciok[4]) then
							blipX = terkepBeallitasok[3] - blipKeretFele
							blipY = terkepBeallitasok[4] - kisterkep.blipHossza / 2 + terkepBeallitasok[6] * 2 / kisterkep.zoomSzint
							rajzolas = true
						elseif (blip.x > terkepPoziciok[1]) and (blip.y >= terkepPoziciok[3]) and (blip.y <= terkepPoziciok[4]) then
							blipX = terkepBeallitasok[3] + kisterkep.terkepSzelesseg - blipKeretFele
							blipY = terkepBeallitasok[4] - kisterkep.blipHossza / 2 + terkepBeallitasok[6] * 2 / kisterkep.zoomSzint
							rajzolas = true
						end
						
						if (rajzolas) then
							dxDrawImage(blipX, blipY, kisterkep.blipHossza, kisterkep.blipHossza, kisterkep.blipKep .. blip.ikon .. ".png")
						end
					end
				end
			end
			
			dxDrawImage(kisterkep.terkepX + kisterkep.terkepSzelesseg / 2 - kisterkep.blipHossza / 2, kisterkep.terkepY + kisterkep.terkepMagassag / 2 - kisterkep.blipHossza / 2, kisterkep.blipHossza, kisterkep.blipHossza, "fajlok/kepek/blipek/pozicionk" .. ".png", jatekosForgasa[3] * -1)
			
			for melyik, ertek in ipairs(serulesEffekt) do
				ertek[3] = ertek[3] - (getTickCount() - ertek[1]) / 800 
				if ertek[3] <= 0 then
					table.remove(serulesEffekt, melyik)
				else
					dxDrawImage(kisterkep.terkepX, kisterkep.terkepY, kisterkep.terkepSzelesseg, kisterkep.terkepMagassag, "fajlok/kepek/serules.png", 0, 0, 0, tocolor(255, 255, 255, ertek[3]))
				end
			end
		end
	end
)

addEventHandler("onClientPlayerDamage", localPlayer,
	function(tamado, fegyver, _, sebzes)
		local hely = tamado and getElementType(tamado) == "player" and getPedWeaponSlot(tamado) and getPedWeaponSlot(tamado) or false
		
		if tamado and tamado ~= source and not (hely == 8 or (hely == 7 and fegyver ~= 38)) then
			serulesEffekt[#serulesEffekt + 1] = {getTickCount(), 0, math.min(25.5 * sebzes, 255)}
		else
			serulesEffekt[#serulesEffekt + 1] = {getTickCount(), 0, math.min(35 * sebzes, 255)}
		end
		if #serulesEffekt > 18 then
			repeat
				table.remove(serulesEffekt, 1)
			until #serulesEffekt < 18
		end
	end
)

addCommandHandler("togradar",
	function()
		if getElementData(getLocalPlayer(), "minimap.Visible") == false then
			setElementData(getLocalPlayer(), "minimap.Visible", true)
		else
			setElementData(getLocalPlayer(), "minimap.Visible", false)
		end
	end
)

addEventHandler("onClientResourceStart", getRootElement(),
	function(startedResource)
		if (getResourceName(startedResource) == mappanev) then
			if dxGetStatus()["VideoMemoryFreeForMTA"] <= 8 then
				showPlayerHudComponent("radar", true)
				showPlayerHudComponent("ammo", false)
				showPlayerHudComponent("armour", false)
				showPlayerHudComponent("breath", false)
				showPlayerHudComponent("clock", false)
				showPlayerHudComponent("health", false)
				showPlayerHudComponent("money", false)
				showPlayerHudComponent("weapon", false)
				showPlayerHudComponent("wanted", false)
				showPlayerHudComponent("vehicle_name", false)
				showPlayerHudComponent("area_name", false)
				return
			else
				showPlayerHudComponent("radar", false)
				showPlayerHudComponent("ammo", false)
				showPlayerHudComponent("armour", false)
				showPlayerHudComponent("breath", false)
				showPlayerHudComponent("clock", false)
				showPlayerHudComponent("health", false)
				showPlayerHudComponent("money", false)
				showPlayerHudComponent("weapon", false)
				showPlayerHudComponent("wanted", false)
				showPlayerHudComponent("vehicle_name", false)
				showPlayerHudComponent("area_name", false)
			
				setElementData(getLocalPlayer(), "minimap.Visible", true)
				setElementData(getLocalPlayer(), "bigmap.Visible", false)
				
				kisterkepBeallitasa("balalul")
				nagyterkepBeallitasa()
				
				--blipKeszites(1934.9487304688, -1775.8989257813, 12.901104927063, 55, 1, 1, 1, 1, 1, 1, 9999)
				--blipKeszites(997.45013427734, -917.34509277344, 41.697856903076, 55, 1, 1, 1, 1, 1, 1, 9999)
				--blipKeszites(385.12783813477, -2085.5532226563, 7.3542628288269, 9, 1, 1, 1, 1, 1, 1, 9999) 
			end
			
			bindKey("m", "down", function()
				showCursor(not isCursorShowing())
			end)
		end
	end
)

addEventHandler("onClientRestore", getRootElement(),
	function()
		kisterkepBeallitasa("balalul")
		nagyterkepBeallitasa()
	end
)

addEventHandler("onClientResourceStop", getRootElement(),
	function()
		showPlayerHudComponent("radar", true)
		showPlayerHudComponent("ammo", true)
		showPlayerHudComponent("armour", true)
		showPlayerHudComponent("breath", true)
		showPlayerHudComponent("clock", true)
		showPlayerHudComponent("health", true)
		showPlayerHudComponent("money", true)
		showPlayerHudComponent("weapon", true)
		showPlayerHudComponent("wanted", true)
		showPlayerHudComponent("vehicle_name", true)
		showPlayerHudComponent("area_name", true)
		
		setElementData(getLocalPlayer(), "bigmap.Visible", false)
		setElementData(getLocalPlayer(), "minimap.Visible", false)
	end
)

---------------------------------------------------------------------
----------------------------- FUNKCIÓK -----------------------------
---------------------------------------------------------------------
function kisterkepBeallitasa(hova)
	if dxGetStatus()["VideoMemoryFreeForMTA"] >= 8 then
		kisterkep.dimenzio = 0
		kisterkep.blipek = {[0] = {}}
		
		kisterkep.terkepKep = "fajlok/kepek/terkep.png"
		kisterkep.vizKep = "fajlok/kepek/viz.png"
		kisterkep.blipKep = "fajlok/kepek/blipek/"
		
		kisterkep.blipHossza = 20
		
		kisterkep.kepernyoHatterTores = kisterkep.blipHossza / 2
		kisterkep.hatterTores = 5
		
		kisterkep.zoomSzint = 2
		kisterkep.terkepMeret = 1536
		
		kisterkep.hatterSzelesseg = 360
		kisterkep.hatterMagassag = 230
		
		kisterkep.terkepSzelesseg = kisterkep.hatterSzelesseg - kisterkep.hatterTores * 2
		kisterkep.terkepMagassag = kisterkep.hatterMagassag - kisterkep.hatterTores * 2
		
		hova = hova or "balalul"
		
		if (hova == "balalul") then
			kisterkep.hatterX = kisterkep.kepernyoHatterTores
			kisterkep.hatterY = monitorMeret[2] - kisterkep.kepernyoHatterTores - kisterkep.hatterMagassag
			kisterkep.terkepX = kisterkep.hatterX + kisterkep.hatterTores
			kisterkep.terkepY = kisterkep.hatterY + kisterkep.hatterTores
		elseif (hova == "jobbalul") then
			kisterkep.hatterX = monitorMeret[1] - kisterkep.kepernyoHatterTores - kisterkep.hatterSzelesseg
			kisterkep.hatterY = monitorMeret[2] - kisterkep.kepernyoHatterTores - kisterkep.hatterMagassag
			kisterkep.terkepX = kisterkep.hatterX + kisterkep.hatterTores
			kisterkep.terkepY = kisterkep.hatterY + kisterkep.hatterTores
		elseif (hova == "jobbfelul") then
			kisterkep.hatterX = kisterkep.kepernyoHatterTores
			kisterkep.hatterY = kisterkep.kepernyoHatterTores
			kisterkep.terkepX = kisterkep.hatterX + kisterkep.hatterTores
			kisterkep.terkepY = kisterkep.hatterY + kisterkep.hatterTores	
		elseif (hova == "balfelul") then
			kisterkep.hatterX = monitorMeret[1] - kisterkep.hatterSzelesseg - kisterkep.kepernyoHatterTores
			kisterkep.hatterY = kisterkep.kepernyoHatterTores
			kisterkep.terkepX = kisterkep.hatterX + kisterkep.hatterTores
			kisterkep.terkepY = kisterkep.hatterY + kisterkep.hatterTores
		end
		
		kisterkep.latotavolsagX = kisterkep.terkepSzelesseg / 2
		kisterkep.latotavolsagY = kisterkep.terkepMagassag / 2
		
		kisterkep.renderelesiCelpont = dxCreateRenderTarget(kisterkep.terkepMeret, kisterkep.terkepMeret, false)
		dxSetRenderTarget(kisterkep.renderelesiCelpont, true)
		dxDrawImage(0, 0, kisterkep.terkepMeret, kisterkep.terkepMeret, kisterkep.terkepKep)
		dxSetRenderTarget()
		dxSetTextureEdge(kisterkep.renderelesiCelpont, "border", tocolor(0, 0, 0, 0))
	end
end

function elementPozicio(element)
	local pozicio = {getElementPosition(element)}
	return pozicio[1] / (6000 / kisterkep.terkepMeret) + kisterkep.terkepMeret / 2, pozicio[2] / (-6000 / kisterkep.terkepMeret) + kisterkep.terkepMeret / 2
end

function ujBlip(blip, x, y, z, ikon, meret, voros, zold, kek, atlatszosag, ordering, latoTavolsag)
	local index = tostring(blip)
	local blipPozicio = {elementPozicio(blip)}
	
	kisterkep.blipek[0][index] = {x = blipPozicio[1], y = blipPozicio[2], z = z, ikon = ikon, meret = meret, voros = voros, zold = zold, kek = kek, atlatszosag = atlatszosag, ordering = ordering, latoTavolsag = kisterkep.terkepMeret / 6000 * latoTavolsag}
	nagyterkep.blipek[0][index] = {x = blipPozicio[1], y = blipPozicio[2], z = z, ikon = ikon, meret = meret, voros = voros, zold = zold, kek = kek, atlatszosag = atlatszosag, ordering = ordering, latoTavolsag = nagyterkep.terkepMeret / 6000 * latoTavolsag}
end

function blipKeszites(...)
	local blip = createBlip(...)
	
	if (blip) then
		ujBlip(blip, ...)
	end
	
	return blip
end

function elementSebessege(element, egyseg)
	if (egyseg == nil) then egyseg = 0 end
	if (isElement(element)) then
		local sebesseg = {getElementVelocity(element)}
		if (egyseg == "mph" or egyseg == 1 or egyseg == '1') then
			return (sebesseg[1] ^ 2 + sebesseg[2] ^ 2 + sebesseg[3] ^ 2) ^ 0.5 * 100
		else
			return (sebesseg[1] ^ 2 + sebesseg[2] ^ 2 + sebesseg[3] ^ 2) ^ 0.5 * 1.8 * 100
		end
	else
		return false
	end
end

function dobozRajzolasPeremmel(x, y, sz, m, peremSzin, dobozSzin, eloterben)
	local peremMagassag = 1
	local peremVastagsag = 1

	dxDrawRectangle(x, y, sz, m, dobozSzin, eloterben) -- háttér
	dxDrawRectangle(x + peremMagassag, y - peremVastagsag, sz - (peremMagassag * 2), peremVastagsag, peremSzin, eloterben) -- felső
	dxDrawRectangle(x + peremMagassag, y + m, sz - (peremMagassag * 2), peremVastagsag, peremSzin, eloterben) -- alsó
	dxDrawRectangle(x - peremMagassag, y + peremMagassag, peremVastagsag, m - (peremMagassag * 2), peremSzin, eloterben) -- bal
	dxDrawRectangle(x + sz, y + peremMagassag, peremVastagsag, m - (peremMagassag * 2), peremSzin, eloterben) -- jobb
end