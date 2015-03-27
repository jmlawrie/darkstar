----------------------------------	
-- Area: Grand Palace of Hu'Xzoi
--   NM: Jailer of Temperance
-----------------------------------	
  

function onMobSpawn(mob)
mob:addMod(MOD_UDMGMAGIC, -256)
mob:setMod(MOD_SLASHRES, 0);
mob:setMod(MOD_PIERCERES, 0);
mob:setMod(MOD_IMPACTRES, 750);
mob:setMod(MOD_HTHRES, 0);
end;


function onMobFight(mob)
mob:setMod(MOD_SLASHRES, 0);
mob:setMod(MOD_PIERCERES, 0);
mob:setMod(MOD_IMPACTRES, 750);
mob:setMod(MOD_HTHRES, 0);

if (mob:getBattleTime() ~= 0 and mob:getBattleTime() % 30 == 0) then

local Morph = nil;

        
        local rand = math.random( 0, 2 );
         Morph = 1 + rand;
            
		mob:AnimationSub(Morph);
		
end
if (mob:AnimationSub() == 1) then
--printf("asub1")
mob:setMod(MOD_SLASHRES, 0);
mob:setMod(MOD_PIERCERES, 0);
mob:setMod(MOD_IMPACTRES, 750);
mob:setMod(MOD_HTHRES, 750);
local RandomAbil = math.random(1,60);
if(RandomAbil == 2) then
mob:useMobAbility(474);
--printf("meikyo")

end
end
if (mob:AnimationSub() == 2) then
--printf("asub2")
mob:setMod(MOD_SLASHRES, 0);
mob:setMod(MOD_PIERCERES, 750);
mob:setMod(MOD_IMPACTRES, 0);	
mob:setMod(MOD_HTHRES, 0);
local RandomAbil = math.random(1,60);
if(RandomAbil == 2) then
mob:useMobAbility(474);
end
end
if (mob:AnimationSub() == 3) then
--printf("asub3")
mob:setMod(MOD_SLASHRES, 750);
mob:setMod(MOD_PIERCERES, 0);
mob:setMod(MOD_IMPACTRES, 0);
mob:setMod(MOD_HTHRES, 0);
local RandomAbil = math.random(1,60);
if(RandomAbil == 2) then
mob:useMobAbility(474);
--printf("move3")
end
end
end;

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
mob:AnimationSub(0);
    -- Set Jailer of Temperance's Window Open Time, and disable respawn
    wait = math.random((120),(1200));
    SetServerVariable("[POP]Jailer_of_Temperance", os.time(t) + wait); -- 45 minutes - 75 minutes
    DeterMob(mob:getID(), true);
    
    -- Set PH back to normal, then set to respawn spawn
    PH = GetServerVariable("[PH]Jailer_of_Temperance");
    SetServerVariable("[PH]Jailer_of_Temperance", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));
    
end;

