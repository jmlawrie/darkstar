-----------------------------------
-- Area: Al'Taieu
-- MOB: Jailer of Love
-- Author: Scavenge
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
    mob:hideName(false);
    mob:untargetable(false);
    mob:AnimationSub(6);
    mob:addMod(MOD_UDMGMAGIC, -64);
    SetServerVariable( 'Love_and_AV_time_limit', os.time() );
    SetServerVariable("Love_add_count",0);
    SetServerVariable("phuabos",0);
    SetServerVariable("xzomits",0);
    SetServerVariable("hpemdes",0);
    SetServerVariable("FamilyRandom",0);
end;

-----------------------------------
-----------------------------------

function onMobEngaged(mob, killer)
    --mob:addMod(MOD_REGEN, -650);
    mob:hideName(false);
    mob:untargetable(false);
    mob:AnimationSub(6);
end;





function onMobFight(mob,target)
	if (((os.time())-(GetServerVariable( 'Love_and_AV_time_limit'))) >= 7200) then -- Combined 2 hour time limit with AV
 		DespawnMob(16912848);
	end
	
	if (mob:hasStatusEffect(EFFECT_MANAFONT) == false) then  -- lazy way of making sure it can always cast
		mob:addStatusEffect(EFFECT_MANAFONT, 0, 1, 0, 0);
	end
	
      --[[  this section was added originally with the intention of elemental modes
      
       local tp = math.random (1,9);
       
	if (mob:getBattleTime() ~= 0 and mob:getBattleTime() % time3 == 0) then
       		if tp == 2 then
       			mob:useMobAbility(1116); -- spinarooni (concussive oscillation)
		elseif tp == 3 then
			mob:useMobAbility(1117);  -- ion shower
       		elseif(tp == 4) then
			mob:castSpell(274); -- Sleepga II
		elseif(tp == 5) then
        		mob:castSpell(360); -- Dispelga
		end
	end
	
      
       
    --if (mob:getBattleTime() ~= 0 and mob:getBattleTime() % time3 == 0) then
    
   
      --  mob:useMobAbility(454);
      
        --printf("charm");  -- currently causing crashes due to being charmed mid-cast 
        		    -- or possibly too many pets (a hunch, since JoL has 10 billion 
        		    -- already, charming an alliance doesn't help)
    --end
    
     ]]

	if (mob:getBattleTime() ~= 0 and mob:getBattleTime() % 1 == 0) then
		mob:addHP(math.random(50,65)); -- Constant regen
	end;
	
	if (mob:getBattleTime() ~= 0 and mob:getBattleTime() % 1 == 0 and GetServerVariable("phuabos") ~= 3 ) then
		mob:addHP(math.random(200,250));  -- Regen that decays after proper number of adds have spawned TODO: trigger on death of final wave
	end;

-- declare adds variables

local xzomits = {16912858,16912859,16912860};
local xzomits1 = {16912861,16912862,16912863};
local xzomits2 = {16912864,16912865,16912866};
local xzomitStatus = {GetMobAction(xzomits[1]),GetMobAction(xzomits[2]),GetMobAction(xzomits[3])};
local xzomitStatus1 = {GetMobAction(xzomits1[1]),GetMobAction(xzomits1[2]),GetMobAction(xzomits1[3])};
local xzomitStatus2 = {GetMobAction(xzomits2[1]),GetMobAction(xzomits2[2]),GetMobAction(xzomits2[3])};

local hpemdes = {16912867,16912868,16912869};
local hpemdes1 = {16912870,16912871,16912872};
local hpemdes2 = {16912873,16912874,16912875};
local hpemdeStatus = {GetMobAction(hpemdes[1]),GetMobAction(hpemdes[2]),GetMobAction(hpemdes[3])};
local hpemdeStatus1 = {GetMobAction(hpemdes1[1]),GetMobAction(hpemdes1[2]),GetMobAction(hpemdes1[3])};
local hpemdeStatus2 = {GetMobAction(hpemdes2[1]),GetMobAction(hpemdes2[2]),GetMobAction(hpemdes2[3])};

local phuabos = {16912849,16912850,16912851};
local phuabos1 = {16912852,16912853,16912854};
local phuabos2 = {16912855,16912856,16912857};
local phuaboStatus = {GetMobAction(phuabos[1]),GetMobAction(phuabos[2]),GetMobAction(phuabos[3])};
local phuaboStatus1 = {GetMobAction(phuabos1[1]),GetMobAction(phuabos1[2]),GetMobAction(phuabos1[3])};
local phuaboStatus2 = {GetMobAction(phuabos2[1]),GetMobAction(phuabos2[2]),GetMobAction(phuabos2[3])};

	-- begin add spawning system
	if (mob:getBattleTime() ~= 0 and mob:getBattleTime() % 150 == 0) then 
		
		local FamilyRandom = math.random(1,3);
		SetServerVariable("FamilyRandom",FamilyRandom);  -- choose from add families: xzomits, hpemdes, phuabos
		
	
	
	
		if (GetServerVariable("FamilyRandom") == 1 ) then -- begin family 1
	
			if (GetServerVariable("xzomits") == 0 ) then -- begin xzomits
	
				for i = 1, 3 do
			    		GetMobByID(xzomits[i]);
					
					if xzomitStatus[i] == 0 then
						SpawnMob(xzomits[i]):updateEnmity(target);
						SetServerVariable("xzomits",1);
               				end
				end
				
			elseif (GetServerVariable("xzomits") == 1 ) then
				
				for i = 1, 3 do
					GetMobByID(xzomits1[i]);
				
					if xzomitStatus1[i] == 0 then
						SpawnMob(xzomits1[i]):updateEnmity(target);
						SetServerVariable("xzomits",2);
                			end
				end
				
			elseif (GetServerVariable("xzomits") == 2 ) then
				
				for i = 1, 3 do
					GetMobByID(xzomits2[i]);
					
					if xzomitStatus2[i] == 0 then
						SpawnMob(xzomits2[i]):updateEnmity(target);
						SetServerVariable("xzomits",3);
					end
				end
			
			elseif (GetServerVariable("xzomits") == 3) then
				local FamilyRandom1 = math.random(2,3);
				SetServerVariable("FamilyRandom",FamilyRandom1);
			
			end -- end xzomits
		
		end -- end family 1
	
	
		if (GetServerVariable("FamilyRandom") == 2 ) then -- begin family 2
			
			if (GetServerVariable("hpemdes") == 0 ) then -- begin hpemdes
				
				for i = 1, 3 do
					GetMobByID(hpemdes[i]);
					if hpemdeStatus[i] == 0 then
						SpawnMob(hpemdes[i]):updateEnmity(target);
						SetServerVariable("hpemdes",1);
                			end
				end
				
			elseif (GetServerVariable("hpemdes") == 1 ) then
				
				for i = 1, 3 do
					GetMobByID(hpemdes1[i]);
					if hpemdeStatus1[i] == 0 then
						SpawnMob(hpemdes1[i]):updateEnmity(target);
						SetServerVariable("hpemdes",2);
                			end
				end
				
			elseif (GetServerVariable("hpemdes") == 2 ) then
				
				for i = 1, 3 do
					GetMobByID(hpemdes2[i]);
					if hpemdeStatus2[i] == 0 then
						SpawnMob(hpemdes2[i]):updateEnmity(target);
						SetServerVariable("hpemdes",3);
                			end
				end
				
			elseif (GetServerVariable("hpemdes") == 3) then
				
				local FamilyRandom1 = math.random(1,3);
				SetServerVariable("FamilyRandom",FamilyRandom1);
				
			end -- end hpemdes
			
		end -- end family 2
	
	
		if (GetServerVariable("FamilyRandom") == 3 ) then -- begin family 3
			if (GetServerVariable("phuabos") == 0 ) then	-- begin phuabos
				for i = 1, 3 do
					GetMobByID(phuabos[i]);
					if phuaboStatus[i] == 0 then
						SpawnMob(phuabos[i]):updateEnmity(target);
						local randy = math.random(0,2)
						SetServerVariable("phuabos",1);
                			end
				end
				
				
				
			elseif (GetServerVariable("phuabos") == 1 ) then
				for i = 1, 3 do
					GetMobByID(phuabos1[i]);
					if phuaboStatus1[i] >= 0 then
						SpawnMob(phuabos1[i]):updateEnmity(target);
						local randy = math.random(0,2)
						SetServerVariable("phuabos",2);
                			end
				end
				
				
				
			elseif (GetServerVariable("phuabos") == 2 ) then
				for i = 1, 3 do
					GetMobByID(phuabos2[i]);
					if phuaboStatus2[i] >= 0 then
						SpawnMob(phuabos2[i]):updateEnmity(target);
						local randy = math.random(0,2)
						SetServerVariable("phuabos",3);
						SetServerVariable("Love_add_count",24);
                			end
				end
    
			
		
			elseif (GetServerVariable("phuabos") == 3 ) then
				for i = 1, 3 do
					GetMobByID(phuabos2[i]);
					if phuaboStatus2[i] >= 0 then
						SpawnMob(phuabos2[i]):updateEnmity(target);
						local randy = math.random(0,2);
						local addcount = GetServerVariable("Love_add_count");
						local newcount = (addcount + 3); -- For keeping track of AV regen decrease
						SetServerVariable("Love_add_count", newcount);
						SetServerVariable("phuabos",3);
                 			end
				end
				
    			end -- end phuabos
    		
    		
    		
    		
			
		end -- end family 3
	
	end  -- end add spawning system

end;  

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
 
 SpawnMob( 16912876, 100 ):updateEnmity(killer);  -- Spawn AV
 
	for i = 1, 3 do
		DespawnMob(xzomits[i])
		DespawnMob(xzomits1[i])
		DespawnMob(xzomits2[i])
		DespawnMob(hpemdes[i])
		DespawnMob(hpemdes1[i])
		DespawnMob(hpemdes2[i])
		DespawnMob(phuabos[i])
		DespawnMob(phuabos1[i])
		DespawnMob(phuabos2[i])
	end

	-- reset server variables

	SetServerVariable("phuabos",0);
	SetServerVariable("xzomits",0);
	SetServerVariable("hpemdes",0);
	SetServerVariable("FamilyRandom",0);
end;
