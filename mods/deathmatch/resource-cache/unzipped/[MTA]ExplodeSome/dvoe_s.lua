-- 1 seg = 1000
local tiempoparadesaparecer = 5000
-- Function
function desaparecer()
	setTimer(destroyElement, tiempoparadesaparecer, 1, source)
end
-- Event
addEventHandler("onVehicleExplode", getRootElement(), desaparecer)
