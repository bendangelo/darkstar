-----------------------------------
--  Area: Northern San d'Oria
--  NPC:  Amarefice
--  Type: Woodworking Synthesis Image Support
--  @pos -181.506 10.15 259.905 231
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Northern_San_dOria/TextIDs");
require("scripts/globals/status");
require("scripts/globals/crafting");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	local guildMember = isGuildMember(player,9);
    local SkillCap = getCraftSkillCap(player,512);
    local SkillLevel = player:getSkillLevel(512);
    
    if (guildMember == 1) then
        if (player:hasStatusEffect(EFFECT_WOODWORKING_IMAGERY) == false) then
			player:startEvent(0x0270,SkillCap,SkillLevel,1,207,player:getGil(),0,4095,0);
	    else
            player:startEvent(0x0270,SkillCap,SkillLevel,1,207,player:getGil(),7127,4095,0);
	    end
	else
        player:startEvent(0x0270,SkillCap,SkillLevel,1,201,player:getGil(),0,0,0); -- Standard Dialogue
	end
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

    if (csid == 0x0270 and option == 1) then
        player:messageSpecial(IMAGE_SUPPORT,0,1,1);
		player:addStatusEffect(EFFECT_WOODWORKING_IMAGERY,1,0,120);
    end
end;




