addEvent('Drops.onSetVoice', true)
addEventHandler('Drops.onSetVoice', root,
    function(player, state)
        if (state == true) then
            setPlayerVoiceIgnoreFrom(player, root)
        else
            setPlayerVoiceIgnoreFrom(player, nil)
        end
    end
)   