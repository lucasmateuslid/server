function addBox(sourceElement, type, msg)
    if sourceElement.type ~= "player" then
        if isElement(sourceElement:getData("inventory.open2")) or isElement(sourceElement:getData("inventory.open")) then
            sourceElement = sourceElement:getData("inventory.open2") or sourceElement:getData("inventory.open")
        end
    end
    
    triggerClientEvent(sourceElement, "addBox", sourceElement, type, msg)
end
addEvent("addBox", true)
addEventHandler("addBox", root, addBox)

addCommandHandler("a", function(source)
	exports["infobox"]:addBox(source, "success", "Voçê pegou um(a) ParaFal (x1)!")
end)

addCommandHandler("b", function(source)
	exports["infobox"]:addBox(source, "error", "sla eu so to testando aq mrm, entendeu?")
end)

addCommandHandler("c", function(source)
	exports["infobox"]:addBox(source, "info", "sla eu so to testando aq mrm, entendeu?")
end)

addCommandHandler("fulano", function(source)
	exports["infobox"]:addBox(source, "success", "so um texto grande p krl pra eu testat aq a info boxx fulano nao sabe fzr ´pha nenhuma mn ate eu q comecei agr literalemnto to melhor n fode fulano obeso")
end)

addCommandHandler("peq", function(source)
	exports["infobox"]:addBox(source, "success", "a                                                      ")
end)