-----------------------------------
-- Area: Al'Taieu
-- NPC:  Absolute Virtue
-- Author: Azno Gone Wild~
-----------------------------------

require("scripts/globals/titles");


-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
    
    mob:setMod(MOD_UDMGMAGIC, 64);
   -- mob:setMod(MOD_INT, 99);
    mob:setMod(MOD_MDEF, 100)
    mob:setMod(MOD_MATT, 16)
    
end;
-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
mob:setMod(MOD_UDMGMAGIC, 64);
   -- mob:setMod(MOD_INT, 99);
    mob:setMod(MOD_MDEF, 100)
    mob:setMod(MOD_MATT, 16)
	----printf("AV Initialized");
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
mob:setMod(MOD_UDMGMAGIC, 64);
   -- mob:setMod(MOD_INT, 99);
    mob:setMod(MOD_MDEF, 100)
    mob:setMod(MOD_MATT, 16)
	SetServerVariable("AV_Phase",1);
	SetServerVariable("AV_Mode",0);
	SetServerVariable("AV_Enrage",0);
    local checkone = 0;
    local checktwo = 0;
    local checkthree = 0;
    local checkfour = 0;
    local checkfive = 0;
    local checksix = 0;
    local checkseven = 0;
    local checkeight = 0;
    local checknine = 0;
	mob:delStatusEffect(EFFECT_MAGIC_SHIELD);
	mob:delStatusEffect(EFFECT_MANAFONT);
	mob:delStatusEffect(EFFECT_PHYSICAL_SHIELD);
	mob:delStatusEffect(EFFECT_MIGHTY_STRIKES);
	mob:delStatusEffect(EFFECT_HUNDRED_FISTS);
	mob:delStatusEffect(EFFECT_CHAINSPELL);
	mob:SetMobAbilityEnabled(true);
	mob:SetAutoAttackEnabled(true);
	----printf("AV engaged");
	
end;

-----------------------------------
-- onMobDisengage
-----------------------------------

function onMobDisengage(mob,target)

end;

-----------------------------------
-- onMobFight
-----------------------------------

function onMobFight(mob,target)
mob:setMod(MOD_UDMGMAGIC, 64);
   -- mob:setMod(MOD_INT, 99);
    mob:setMod(MOD_MDEF, 64)
    mob:setMod(MOD_MATT, 16)
mob:setMod(MOD_IMPACTRES, 0);
local twohour = math.random(1,2);
	local RandomCast;
	local RandomSpell;
	local SpellNumber;
	local AVModeCounter;
    local regen = 500;
    local loveadds = GetServerVariable("Love_add_count");
    local killregen = (loveadds * 1.8)
    if killregen >= 401 then
    killregen = 401;
    end
    local newregen = (regen - killregen)
    if (mob:getBattleTime() ~= 0 and mob:getBattleTime() % 1 == 0) then
        mob:addHP(newregen);
        mob:addMP(500);
    end
if (((os.time())-(GetServerVariable( 'Love_and_AV_time_limit'))) >= 7200) then
 DespawnMob(16912876);
 end

	
		local castspells = math.random (1, 200);
if(mob:getHPP() >= 59) then
		-- Phase 1
        mob:AnimationSub(0);
		RandomCast = math.random();
		if((math.random(1,10) >= 8)) then --Cast every 15 seconds on average
			RandomSpell = math.random(1,16);
			if(RandomSpell == 6) then
				SpellNumber = 496; -- Firaga III
			elseif(RandomSpell == 2) then
				SpellNumber = 497; -- Blizzaga III
			elseif(RandomSpell == 3) then
				SpellNumber = 500; -- Thundaga III
			elseif(RandomSpell == 4) then
				SpellNumber = 148; -- Fire V
			elseif(RandomSpell == 5) then
				SpellNumber = 153; -- Blizzard V
			elseif(RandomSpell == 7) then
				SpellNumber = 168; -- Thunder V
			elseif(RandomSpell <= 8) then
				SpellNumber = 274; -- Sleepga II
			elseif(RandomSpell <= 9) then
				SpellNumber = 227; -- Poisonga III
			elseif(RandomSpell <= 10) then
				SpellNumber = 360; -- Dispelga
			elseif(RandomSpell <= 11) then
				SpellNumber = 232; -- Bio III
			elseif(RandomSpell <= 12) then
				SpellNumber = 246; -- Drain II
			elseif(RandomSpell <= 13) then
				SpellNumber = 266; -- Absorb-STR
			elseif(RandomSpell <= 14) then
				SpellNumber = 268; -- Absorb-VIT
			else
				SpellNumber = 252; -- Stun
			end
			mob:castSpell(SpellNumber);
			----printf("AV cast spell %u RC: %1.2f, RS: %1.2f",SpellNumber,RandomCast,RandomSpell);
		end
    end


if(mob:getHPP() <= 59) then
mob:AnimationSub(2);
end

if (mob:getHPP() <= 59) then
--[[	if (mob:getBattleTime() ~= 0 and mob:getBattleTime() % 60 == 0) then
        local Pet = 16912880;
		local Pet1 = 16912881;
        local Pet2 = 16912882;

        -- Spawn the pet..
        local pet = SpawnMob( 16912880 );
		local pet1 = SpawnMob( 16912881 );
		local pet2 = SpawnMob( 16912882 );
        pet:updateEnmity( target );
		pet1:updateEnmity( target );
		pet2:updateEnmity( target );
	end --]]
	
	local First2hr = math.random (1,40);

	if (First2hr == 1 and checkone == 0) then 
		mob:useMobAbility(432);
		--printf("Mighty_Strike");
        local checkone = 1;
	elseif (First2hr == 2 and checktwo == 0) then
		mob:useMobAbility(434);
		--printf("Hundren_fists")
        local checktwo = 1;
	elseif (First2hr == 3 and checkthree == 0) then
		mob:useMobAbility(439);
		--printf("Blood_Weapon");
        local checkthree = 1;
	end

	local Manafont = math.random (1,50);
local Chainspell = math.random (1,100);
	if (mob:hasStatusEffect(EFFECT_CHAINSPELL) == false and checkfour == 0) then
		if(spelltime == 1) then
			mob:useMobAbility(436);
			--printf("Chainspell");
            local checkfour = 1;
		end
		end

	if (mob:hasStatusEffect(EFFECT_MANAFONT) == false) then
mob:addStatusEffect(EFFECT_MANAFONT, 0, 1, 0, 0);
	

		if (castspells == 1) then
			mob:castSpell(218);
			--printf("Comet");
		elseif (castspells == 2) then
			mob:castSpell(219);
			--printf("Meteor");
		end
        
	end
	
	local spelltime = math.random (1,5);
    
    
	if (mob:hasStatusEffect(EFFECT_CHAINSPELL) and mob:AnimationSub() == 1 or mob:AnimationSub() == 2) then
		
		

		if (Chainspell == 1) then
			mob:castSpell(187);
			--printf("aeroga_3");
		elseif(Chainspell == 2) then
			mob:castSpell(209);
			--printf("Tornado_2");
		elseif(Chainspell == 3) then
			mob:castSpell(158);
			--printf("Aero_iv");
		elseif (Chainspell == 4 and mob:getHPP() >= 79 and mob:AnimationSub() == 1) then
			mob:castSpell(218);
			----printf("chainspell_meteor");
		elseif(Chainspell == 5 and mob:getHPP() >= 79 and mob:AnimationSub() == 1) then
			mob:castSpell(219);
			----printf("chainspell_comet");
		end
	end
	
	local Godmode = math.random (1,200);

	if (Godmode == 1 and checksix == 0) then
		mob:useMobAbility(437);
		----printf("Invincible");
       local checksix = 1;
	elseif(Godmode == 2 and checkseven == 0) then
		mob:useMobAbility(438);
     local checkseven = 1;
		----printf("Perfect_dodge");
	
    elseif(Godmode == 3 and checkeight == 0) then
    mob:useMobAbility(473);
   local checkeight = 1;
    
    elseif(Godmode == 4 and checknine == 0) then
    mob:useMobAbility(479);
   local checknine = 1;
    end
end
	
	
	
	
	
	
	



 if (mob:getBattleTime() ~= 0 and mob:getBattleTime() % 60 == 0) then
		
        -- Spawn the pet..
        local pet1 = SpawnMob( 16912877 );
		local pet2 = SpawnMob( 16912878 );
		local pet3 = SpawnMob( 16912879 );
        local pet4 = SpawnMob( 16912880 );
		local pet5 = SpawnMob( 16912881 );
		local pet6 = SpawnMob( 16912882 );			
        pet1:updateEnmity( target );
		pet2:updateEnmity( target );
		pet3:updateEnmity( target );     
        pet4:updateEnmity( target );
		pet5:updateEnmity( target );
		pet6:updateEnmity( target );
	
	end

end;
-- --printf("MP: %u, HP: %i",mob:getMP(),mob:getHP());

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	mob:AnimationSub(0);
	killer:addTitle(VIRTUOUS_SAINT);
	mob:delMod(MOD_MDEF, 100)
	mob:delMod(MOD_MATT, 132)
end;
