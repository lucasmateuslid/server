config = {

    tecla = {'f1', 'down'}, -- // Tecla and State.
    wallpapers = 4, -- // Quantidade máxima de wallpapers.

    notify_server = function (player, message, type)
        exports.YM_DxMessages:addBox(player, message, type)
    end,

    notify_client = function (message, type)
		exports.YM_DxMessages:addBox(message, type)
    end,

    blipLocID = 41, -- // Id do blip de localização.
    tempoLoc = 60000, -- // Tempo que a localização ficara no mapa.
    maxContatos = 25, -- // Máximo de contatos permitido por conta.

    planos = {
        [1] = {50, 100}, -- // crédito que iria receber, preço
        [2] = {100, 150},
        [3] = {200, 250 }
    },

    convertNumber = function (number)
        local money = number
        for i = 1, tostring(money):len()/3 do
            money = string.gsub(money, "^(-?%d+)(%d%d%d)", "%1.%2")
        end
        return money
    end
}

function getPlayerFromID (id)
	for _, player in ipairs(getElementsByType('player')) do
		if getElementData(player, 'ID') and (getElementData(player, 'ID') == id) then
			return player
		end
	end
	return false
end