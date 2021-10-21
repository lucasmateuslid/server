function remover_colete(player, cmd)
    if "rv" then
    setPedArmor(player, 0)
    end
end
addCommandHandler("rv", remover_colete)