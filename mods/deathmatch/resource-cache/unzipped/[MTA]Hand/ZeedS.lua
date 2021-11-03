-- Ensinamento by: NaZe Edit's

function loadHandling(v)


if getElementModel(v) == 596 then 		-- frontier
			setVehicleHandling(v, "maxVelocity", 400) -------------------/ VELOCIDADE MÀXIMA
			setVehicleHandling(v, "engineAcceleration", 30) -------------------/ FORÇA DE ACELERAÇÃO
			setVehicleHandling(v, "driveType", "awd") -------------------/ TIPO DE TRAÇÃO
			setVehicleHandling(v, "brakeDeceleration", 15) --Força do freio
		end	

if getElementModel(v) == 597 then 		-- frontier
			setVehicleHandling(v, "maxVelocity", 400) -------------------/ VELOCIDADE MÀXIMA
			setVehicleHandling(v, "engineAcceleration", 30) -------------------/ FORÇA DE ACELERAÇÃO
			setVehicleHandling(v, "driveType", "awd") -------------------/ TIPO DE TRAÇÃO
			setVehicleHandling(v, "brakeDeceleration", 15) --Força do freio
		end

if getElementModel(v) == 598 then 		-- trailbrazer
			setVehicleHandling(v, "maxVelocity", 400) -------------------/ VELOCIDADE MÀXIMA
			setVehicleHandling(v, "engineAcceleration", 30) -------------------/ FORÇA DE ACELERAÇÃO
			setVehicleHandling(v, "driveType", "awd") -------------------/ TIPO DE TRAÇÃO
			setVehicleHandling(v, "brakeDeceleration", 15) --Força do freio
		end		
		
if getElementModel(v) == 523 then --rocam
			setVehicleHandling(v, "mass", 5999) --Massa do veículo no caso 5999
			setVehicleHandling(v, "turnMass", 5999)
			setVehicleHandling(v, "maxVelocity", 400) --Velocidade Máxima
			setVehicleHandling(v, "engineAcceleration", 30) -- Aceleração do Veículo
			setVehicleHandling(v, "engineInertia", 5.0)
			setVehicleHandling(v, "engineType", "petrol")
			setVehicleHandling(v, "brakeDeceleration", 25) --Força do freio
			setVehicleHandling(v, "driveType", "fwd")
			setVehicleHandling(v, "steeringLock", 25.0)
			setVehicleHandling(v, "tractionMultiplier", 2.5)
			setVehicleHandling(v, "tractionLoss", 2.0)
			setVehicleHandling(v, "tractionBias", 0.5)
			setVehicleHandling(v, "centerOfMass", { 0, 0.01, -0.5 } )
			setVehicleHandling(v, "dragCoeff",0.0)
		end
		
if getElementModel(v) == 522 then --xj6
			setVehicleHandling(v, "mass", 5999) --Massa do veículo no caso 5999
			setVehicleHandling(v, "turnMass", 5999)
			setVehicleHandling(v, "maxVelocity", 250) --Velocidade Máxima
			setVehicleHandling(v, "engineAcceleration", 30) -- Aceleração do Veículo
			setVehicleHandling(v, "engineInertia", 5.0)
			setVehicleHandling(v, "engineType", "petrol")
			setVehicleHandling(v, "brakeDeceleration", 25) --Força do freio
			setVehicleHandling(v, "driveType", "fwd")
			setVehicleHandling(v, "steeringLock", 25.0)
			setVehicleHandling(v, "tractionMultiplier", 2.3)
			setVehicleHandling(v, "tractionLoss", 2.0)
			setVehicleHandling(v, "tractionBias", 0.5)
			setVehicleHandling(v, "centerOfMass", { 0, 0.01, -0.5 } )
			setVehicleHandling(v, "dragCoeff",0.0)
		end
end 
		
	
	
	
	-- NÃO MEXER ||

function loadHandlings()
	for k, v in ipairs(getElementsByType("vehicle")) do
		loadHandling(v)
	end
end
addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), loadHandlings)

function vehicleEnter()
	loadHandling(source)
end
addEventHandler("onVehicleEnter", getRootElement(), vehicleEnter)