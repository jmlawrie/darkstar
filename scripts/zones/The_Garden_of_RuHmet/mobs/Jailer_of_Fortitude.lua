-----------------------------------
-- Area: The Garden of Ru'Hmet
-- NPC:  Jailer of Fortitude
-----------------------------------

require("scripts/globals/missions");
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:hideName(false);
    mob:untargetable(false);
    mob:AnimationSub(5);
    --mob:addMod(MOD_UDMGMAGIC, -64)
    mob:addMod(MOD_UDMGPHYS, -74)
    mob:SetMobAbilityEnabled(false);
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob, killer)
    mob:hideName(false);
    mob:untargetable(false);
    mob:AnimationSub(5);
    mob:SetMobAbilityEnabled(false);
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobFight(mob, target)
local chance = math.random(2,4);
local delay = mob:getLocalVar("delay");
    local LastCast = mob:getLocalVar("LAST_CAST");
    local spell = mob:getLocalVar("COPY_SPELL");
    if (mob:AnimationSub() == 1) then
        if (mob:getBattleTime() - LastCast > 30) then
            mob:setLocalVar("COPY_SPELL", 0);
            mob:setLocalVar("delay", 0);
            mob:AnimationSub(0);
        end

        if (spell > 0 and mob:hasStatusEffect(EFFECT_SILENCE) == false) then
            if (delay >= 3) then
                mob:castSpell(spell);
                mob:setLocalVar("COPY_SPELL", 0);
                mob:setLocalVar("delay", 0);
                mob:AnimationSub(0);
            else
                mob:setLocalVar("delay", delay+1);
            end
        end
    end


    if (mob:getHPP() <= 10) then
    chance = math.random(1,3);

    elseif (mob:getHPP() <= 33) then
    chance = math.random(2,3);

    end

    if (mob:getTP() >= 10) then
        if chance == 2 then
        mob:useMobAbility(687);
        mob:setTP(0);
        elseif ((chance >= 3) and (chance <= 4))  then
        mob:useMobAbility(1185);
        mob:setTP(0);
        
		
        end
    end
end;
   



-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer, npc)

	local npc = GetNPCByID(16921027);
    local qm1p = math.random(1,5); -- random for next @pos.
         -- print(qm1p)
	            if (qm1p == 1) then
                        npc:setPos(-420,0.00,755); -- spawn point 1 "Hume"
						--printf("Qm1 is at pos 1");
                elseif (qm1p == 2) then
                        npc:setPos(-43,0.00,460); -- spawn point 2 "Elvaan"
						--printf("Qm1 is at pos 2");
                elseif (qm1p == 3) then
                        npc:setPos(-260,0.00,44.821); -- spawn point 3 "Galka"
						--printf("Qm1 is at pos 3");
                elseif (qm1p == 4) then
                        npc:setPos(-580,0.00,43); -- spawn point 4 "Taru"
						--printf("Qm1 is at pos 4");
                elseif (qm1p == 5) then
                        npc:setPos(-796,0.00,460); -- spawn point 5 "Mithra"
						--printf("Qm1 is at pos 5");
				end
end;
-----------------------------------
-- onGameHour
-----------------------------------

function onGameHour(npc, mob, player)


end;
