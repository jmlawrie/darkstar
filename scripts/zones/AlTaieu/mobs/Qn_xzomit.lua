-----------------------------------
-- Area: Al'Taieu
-- NPC:  Qn_xzomit
-----------------------------------

require("scripts/globals/missions");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)

end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob)

if ( mob:getID() == 16912840 or mob:getID() == 16912841 or mob:getID() == 16912842 or 
mob:getID() == 16912843 or mob:getID() == 16912844 or mob:getID() == 16912845 ) then
	if (mob:getBattleTime() ~= 0 and mob:getBattleTime() % 30 == 0) then
 		mob:useMobAbility(475);
	end
end

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
end;
