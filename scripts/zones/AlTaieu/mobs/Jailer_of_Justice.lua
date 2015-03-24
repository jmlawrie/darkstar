-----------------------------------
-- Area: Al'Taieu
-- NPC:  Jailer of Justice
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
mob:addMod(MOD_UDMGMAGIC, -64)
end;

-----------------------------------
-- onMobFight
-----------------------------------

function onMobFight(mob, target)

    local time1 = math.random(180,240);
	  local time2 = math.random(1,20);
	  local time3 = time1 + time2;
    local charm = math.random (1,100);
    
    if (mob:getBattleTime() ~= 0 and mob:getBattleTime() % time3 == 0) then
    
   
       mob:useMobAbility(454);
      
        --printf("dafuq");
    end

  if (mob:getBattleTime() ~= 0 and mob:getBattleTime() % 30 == 0) then
	  if( GetMobAction(16912840) == 0 ) then
	  	SpawnMob(16912840):updateEnmity(target);
    elseif( GetMobAction(16912841) == 0 ) then
	  	SpawnMob(16912841):updateEnmity(target);
  	elseif( GetMobAction(16912842) == 0 ) then
	  	SpawnMob(16912842):updateEnmity(target);
  	elseif( GetMobAction(16912843) == 0 ) then
	  	SpawnMob(16912843):updateEnmity(target);
  	elseif( GetMobAction(16912844) == 0 ) then
	  	SpawnMob(16912844):updateEnmity(target);
	  elseif( GetMobAction(16912845) == 0 ) then
		  SpawnMob(16912845):updateEnmity(target);
	  end
	    mob:resetEnmity(target);
  end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
end;
