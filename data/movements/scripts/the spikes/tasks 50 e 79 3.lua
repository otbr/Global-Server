function onStepIn(cid, item, position, fromPosition)
    local newPosition = {x=32243, y=32618, z=13}
	local noPosition = {x=32237, y=32605, z=13}
        if (getPlayerLevel(cid) >= 50) and (getPlayerLevel(cid) <= 79) then
		    	doTeleportThing(cid, newPosition, TRUE)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
		else
			doTeleportThing(cid, noPosition, TRUE)
			doPlayerSendTextMessage(cid,19,'This area is not suitable for your skills.')
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	end
end








