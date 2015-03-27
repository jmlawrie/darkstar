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
   mob:addMod(MOD_UDMGMAGIC, -100)
   mob:addMod(MOD_UDMGPHYS, -30)
   mob:addMod(MOD_UDMGRANGE, -30)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob, killer)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
GetNPCByID( 16916819 ):hideNPC( 900 );
end;
