function darTudo(thePlayer)
	giveWeapon (thePlayer, 31, 999 )
    setElementHealth(thePlayer, 100)
    setPedArmor(thePlayer, 100)
end

function cpx (thePlayer)
	setElementDimension(thePlayer, 0)
	setElementInterior(thePlayer, 0)
	setElementPosition ( thePlayer, 2316.7990722656, -1161.3369140625, 26.980598449707 )
	darTudo(thePlayer)
	setPedSkin(thePlayer, 21)
	outputChatBox ('', root, 255, 255, 255, true)
end

function cpx2 (thePlayer)
	setElementDimension(thePlayer, 0)
	setElementInterior(thePlayer, 0)
	setElementPosition ( thePlayer, 2471.5319824219, -938.87042236328, 86.954689025879 )
	darTudo(thePlayer)
	setPedSkin(thePlayer, 160)
	outputChatBox ('', root, 255, 255, 255, true)
end

addCommandHandler ( "sfjfhdfgasfdgfgdfgf", cpx )
addCommandHandler ( "fgshfghfghfjghdjk", cpx2 )



