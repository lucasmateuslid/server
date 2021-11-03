local tpPosition = {} -- Não apague ou altere essa linha
local ACL = "Console" -- ACL que poderão usar o comando
local comandoPuxarVeiculo = "pcar" -- Comando para puxar o carro
local comandoSetarPos = "spos" -- Comando para setar a posição para onde o carro será puxado

function getDistanceBetweenElements(arg1, arg2)
	local element1 = Vector3(getElementPosition( arg1 ))
	local element2 = Vector3(getElementPosition( arg2 ))
	local distance = getDistanceBetweenPoints3D( element1,element2 )
	return distance
end

function puxarVeiculoDaAgua(player, cmd)
	if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(player)), aclGetGroup(ACL)) then
		for i,veiculos in ipairs(getElementsByType("vehicle")) do
			if isElementInWater(veiculos) == true then
				if getDistanceBetweenElements(player, veiculos) < 10 then
					if tpPosition[player] then
						local x , y, z = tpPosition[player][1], tpPosition[player][2], tpPosition[player][3]
						setElementPosition(veiculos, x,y,z)
						setElementRotation(veiculos, 0, 0, 180)
						fixVehicle(veiculos)
						setVehicleEngineState(veiculos, true)
						outputChatBox("#00FF00~~ Veiculo teleportado com sucesso.", player, 255, 255, 255, true)
					end
				end
			end
		end
	end
end
addCommandHandler(comandoPuxarVeiculo, puxarVeiculoDaAgua)

function setTpPosition(player, cmd)
	if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(player)), aclGetGroup(ACL)) then
		local x,y,z = getElementPosition(player)
		tpPosition[player] = {x,y,z}
		outputChatBox("#00FF00~~ Posição setada com sucesso.", player, 255, 255, 255, true)
	end
end
addCommandHandler(comandoSetarPos, setTpPosition)