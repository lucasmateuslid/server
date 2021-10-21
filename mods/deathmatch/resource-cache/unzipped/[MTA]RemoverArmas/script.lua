
 function RemoverArmas (source)
    takeAllWeapons (source)
    exports["infobox"]:addBox(source, "success", "Armas Removidas")
end
addCommandHandler("rv", RemoverArmas)