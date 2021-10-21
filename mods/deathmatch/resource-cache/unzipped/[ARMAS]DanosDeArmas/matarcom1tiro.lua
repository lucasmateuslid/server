addEventHandler("onPlayerDamage", getRootElement(),
	function (attacker, weapon, bodypart, loss)
		if bodypart == 9 then
			local result = triggerEvent("", source, attacker, weapon, loss)
			if result == true then
				killPed(source, attacker, weapon, bodypart)
			end
		end
	end
)

local weapons = {20, 40, 31, 30, 29, 24, 22, 27, 23}

function onClientPedDamage(_, weapon)
    if(getElementType(source) == "player") then
       if(weapons[weapon]) then
           return killPed(source)
       end
    end
end
addEventHandler("onClientPedDamage", getRootElement(), onClientPedDamage)

for _, v in ipairs ( { "pro", "std", "poor" } ) do
    setWeaponProperty ( "sniper", v, "damage", 300 )
    setWeaponProperty ( "m4", v, "damage", 70 )
    setWeaponProperty ( "ak47", v, "damage", 70 )
    setWeaponProperty ( "mp5", v, "damage", 30 )
    setWeaponProperty ( "deagle", v, "damage", 45 )
    setWeaponProperty ( "colt45", v, "damage", 20 )
    setWeaponProperty ( "combatshotgun", v, "damage", 120 )
    setWeaponProperty ( "uzi", v, "damage", 25 )
    setWeaponProperty ( "tec-9", v, "damage", 35 )
	setWeaponProperty ( "silenced", v, "damage", 60)
	setWeaponProperty("m4", "pro", "weapon_range", 1000.0)

end