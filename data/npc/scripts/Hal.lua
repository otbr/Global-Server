local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

 
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	
	
	if(msgcontains(msg, "report")) then
		if(getPlayerStorageValue(cid, 30) == 8 or getPlayerStorageValue(cid, 30) == 12) then
			npcHandler:say("Hicks! I... I... <he is obviously drunk and his report more than confusing>. ", cid)
			setPlayerStorageValue(cid, 30, getPlayerStorageValue(cid, 30) + 1)
			Player(cid):setStorageValue(12013, Player(cid):getStorageValue(12013) + 1) -- StorageValue for Questlog "Mission 02: Watching the Watchmen"
			npcHandler.topic[cid] = 0
		end
	elseif(msgcontains(msg, "pass")) then
		npcHandler:say("You can {pass} either to the {Arena Quarter} or {Alchemist Quarter}. Which one will it be?", cid)
		npcHandler.topic[cid] = 1
	elseif(msgcontains(msg, "arena")) then
		if(npcHandler.topic[cid] == 1) then
			doTeleportThing(cid, {x=32688, y=31193, z=7})
			doSendMagicEffect({x=32688, y=31193, z=7}, CONST_ME_TELEPORT)
			npcHandler.topic[cid] = 0
		end
	elseif(msgcontains(msg, "alchemist")) then
		if(npcHandler.topic[cid] == 1) then
			doTeleportThing(cid, {x=32688, y=31188, z=7})
			doSendMagicEffect({x=32688, y=31188, z=7}, CONST_ME_TELEPORT)
			npcHandler.topic[cid] = 0
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())