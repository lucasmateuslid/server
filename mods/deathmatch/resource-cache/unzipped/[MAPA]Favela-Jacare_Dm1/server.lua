function darTudo(thePlayer)
	giveWeapon (thePlayer, 31, 999 )
    setElementHealth(thePlayer, 100)
    setPedArmor(thePlayer, 100)
end

function cpx (thePlayer)
	setElementDimension(thePlayer, 0)
	setElementInterior(thePlayer, 0)
	setElementPosition ( thePlayer, 1428.1968994141, -1871.7386474609, 14.08869934082 )
	darTudo(thePlayer)
	setPedSkin(thePlayer, 21)
	outputChatBox ('', root, 255, 255, 255, true)
end

function cpx2 (thePlayer)
	setElementDimension(thePlayer, 0)
	setElementInterior(thePlayer, 0)
	setElementPosition ( thePlayer, 1124.0460205078, -2036.1717529297, 69.885719299316 )
	darTudo(thePlayer)
	setPedSkin(thePlayer, 160)
	outputChatBox ('', root, 255, 255, 255, true)
end

addCommandHandler ( "safgagdfhgdhg", cpx )
addCommandHandler ( "ahgdhgfhfgdhfgh", cpx2 )



