-----------------------------------
-- Area: The Garden of Ru'Hmet
-- NPC:  Ix'aern (DRK)
-----------------------------------


-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    local reraise = math.random(1,3)
    local drops = math.random(1,5)
    if(reraise ~= 1) then
            printf("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
            printf("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
        SetServerVariable("IxAernRR",1)
    end
    if(drops == 1) then
        SetDropRate(4397,1854,0);
        SetDropRate(4397,1902,1000);
    else
        SetDropRate(4397,1854,1000);
        SetDropRate(4397,1902,0);
    end
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob, killer)
end;

-----------------------------------
-- onMobFight
-----------------------------------

function onMobFight(mob,target)


    if(mob:getBattleTime() ~= 0 and mob:getBattleTime() % 10 == 0 and mob:hasStatusEffect(EFFECT_BLOOD_WEAPON) == false) then
        if(math.random(1,5) == 1) then
            mob:useMobAbility(439)
        end
    end
    if(GetServerVariable("IxAernRR") == 1 and mob:getHP() <= (mob:getMaxHP() / 20)) then
        mob:setHP(mob:getMaxHP())
        target:messageSpecial(6624)
        if(math.random(1,2) == 1) then
            SetServerVariable("IxAernRR",0)
        end
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
    killer:setVar("animosity",0)
    killer:messageSpecial(7724)
end;
