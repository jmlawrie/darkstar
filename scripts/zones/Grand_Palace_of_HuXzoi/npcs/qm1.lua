-----------------------------------
-- Area: Grand Palace of Hu'Xzoi
-- NPC:  ??? (Spawn Ix'Aern MNK)
-----------------------------------

require("scripts/zones/Grand_Palace_of_HuXzoi/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    -- Making sure Aern isn't alive
    if (GetMobAction( 16916815 ) == 0) then
        -- Confirming all traded items are the correct
        if (trade:hasItemQty( 1900, 1 ) and trade:getItemCount() == 1) then
            -- Complete the trade..
            player:tradeComplete();
            
            -- Spawn Ix'aern MNK
            local mob = SpawnMob( 16916815, 100 );
            mob:setExtraVar( 0 );
            mob:updateEnmity( player );
        end    
    end
end;

