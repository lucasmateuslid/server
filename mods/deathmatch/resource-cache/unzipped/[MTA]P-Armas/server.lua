








function Farda01F()
   giveWeapon ( source, 1, 1 )   
   exports["infobox"]:addBox(source, "success", "Voce pegou um Soco Inglês!    ") 
end
addEvent("EventFarda01",true)
addEventHandler ( "EventFarda01", getRootElement(),Farda01F)






function Farda02F()
   giveWeapon ( source, 14, 1 )
   exports["infobox"]:addBox(source, "success", "Voce pegou uma Flor!")     
end
addEvent("EventFarda02",true)
addEventHandler ( "EventFarda02", getRootElement(),Farda02F)




function Farda03F()
   giveWeapon ( source, 23, 1 )
   exports["infobox"]:addBox(source, "success", "Você pegou um Tasear!  ")     
end
addEvent("EventFarda03",true)
addEventHandler ( "EventFarda03", getRootElement(),Farda03F)





function Farda04F()
   giveWeapon ( source, 46, 1 )   
   exports["infobox"]:addBox(source, "success", "Você pegou um Paraquedas!") 
end
addEvent("EventFarda04",true)
addEventHandler ( "EventFarda04", getRootElement(),Farda04F)




function Farda05F()
   giveWeapon ( source, 24, 9999 )
   exports["infobox"]:addBox(source, "success", "Você pegou uma Deagle!     ")    
end
addEvent("EventFarda05",true)
addEventHandler ( "EventFarda05", getRootElement(),Farda05F)


--------MP5
function Farda06F()
   giveWeapon ( source, 29, 9999 )   
   exports["infobox"]:addBox(source, "success", "Você pegou uma MP5!")
end
addEvent("EventFarda06",true)
addEventHandler ( "EventFarda06", getRootElement(),Farda06F)

--------------------------------------------------------
--------M4
function Farda07F()
   giveWeapon ( source, 30, 9999 )  
   exports["infobox"]:addBox(source, "success", "Você pegou uma AK-47! ") 
end
addEvent("EventFarda07",true)
addEventHandler ( "EventFarda07", getRootElement(),Farda07F)

--------------------------------------------------------
-------GLOCK
function Farda08F()
   giveWeapon ( source, 31, 9999 )   
   exports["infobox"]:addBox(source, "success", "Você pegou uma M4!       ")
end
addEvent("EventFarda08",true)
addEventHandler ( "EventFarda08", getRootElement(),Farda08F)

--------------------------------------------------------
--------TEASER
function Farda09F()
   giveWeapon ( source, 34, 9999 )
   exports["infobox"]:addBox(source, "success", "VoCê pegou uma Sniper!    ") 
end
addEvent("EventFarda09",true)
addEventHandler ( "EventFarda09", getRootElement(),Farda09F)

--------------------------------------------------------
--------COLETE E VIDA
function Farda010F()

	setPedArmor(source, 100)
    setElementHealth(source, 100)
    exports["infobox"]:addBox(source, "success", "Voce Pegou Vida e Colete")
end
addEvent("EventFarda010",true)
addEventHandler ( "EventFarda010", getRootElement(),Farda010F)

--------------------------------------------------------
function RemoverArmasF()
   takeAllWeapons (source)
   setPedArmor(source, 0)
   exports["infobox"]:addBox(source, "success", "Armas e Colete Removidos") 
end
addEvent("RemoverArmas",true)
addEventHandler ( "RemoverArmas", getRootElement(),RemoverArmasF)