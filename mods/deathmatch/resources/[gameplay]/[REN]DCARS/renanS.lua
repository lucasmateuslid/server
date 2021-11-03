
function destroyCars()
    for _, carro in ipairs(getElementsByType("vehicle")) do
        local jogadores = getVehicleOccupant(carro)
        if not jogadores then
            destroyElement(carro)
            --exports["a__infobox"]:addBox(root, "info", "Todos os carros desocupados Foram Removidos.")
            restartResource(getThisResource())
            outputDebugString ( "O resource de Deletas carros vazios foi reiniciado Automaticamente para evitar bugs." )
        end
    end
addCommandHandler("dcars", root, destroyCars )
