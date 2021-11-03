function spawnOnJoin ( )    
givePlayerMoney ( source, 0 )

end

function setMoneyOnWasted ( )    
givePlayerMoney ( source, -500 )

end

function rewardOnWasted ( ammo, killer, killerweapon, bodypart )

	if ( killer ) and ( killer ~= source ) then
		givePlayerMoney ( killer, 1000 )
    end
end
addEventHandler ( "onPlayerWasted", getRootElement(), rewardOnWasted )
addEventHandler ( "onPlayerWasted", getRootElement(), setMoneyOnWasted )
addEventHandler ( "onPlayerJoin", getRootElement(), spawnOnJoin )