-----------------------------------
-- Area: Al'Taieu
-- NPC:  Jailer of Hope
-- Author: Scavenge
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
mob:addMod(MOD_UDMGMAGIC, 64)
    mob:hideName(false);
    mob:untargetable(false);
end;

function onMobFight(mob, target)
mob:addMod(MOD_TRIPLE_ATTACK, 10)
if (mob:getBattleTime() ~= 0 and mob:getBattleTime() % 1 == 0) then
mob:addMP(150)
end





--if (mob:hasStatusEffect(EFFECT_SHOCK_SPIKES)) then
local mightystrikes = math.random (1,133);



    if (mob:hasStatusEffect(EFFECT_SHOCK_SPIKES)) then
--printf("spikes check");
				if (mob:hasStatusEffect(EFFECT_CHAINSPELL)) then
					
					--printf("no-ability check");
				
					local Chainspell = math.random (1,120);

					if (Chainspell == 1) then
						mob:castSpell(196);
						--printf("Thundaga_3");
					elseif(Chainspell == 2) then
						mob:castSpell(213);
						--printf("Burst_2");
					elseif (Chainspell == 4 and mob:getHPP() >= 79) then
						mob:castSpell(213);
						--printf("Burst_II");
					elseif(Chainspell == 5 and mob:getHPP() >= 79) then
						mob:castSpell(196);
						--printf("Thundaga_III");
					end
				elseif (mob:hasStatusEffect(EFFECT_SHOCK_SPIKES) and (mob:hasStatusEffect(EFFECT_CHAINSPELL) == false)) then
					mob:addStatusEffect(EFFECT_CHAINSPELL,1,0,20);
					--printf("Chainspell");
				end
			
		
	
    else


		

		
		local x = math.random(1,47)
		if x == 1 then

				local castspells = math.random (1, 2);

			if (castspells == 1) then
				mob:castSpell(196);
				--printf("Thundaga_iii");
			elseif (castspells == 2) then
				mob:castSpell(196);
				--printf("Thundaga_3");
			elseif (castspells == 3) then
			mob:castSpell(167);
			--printf("Thunder IV");
			end
		end
		
		

		
    end
        if (mightystrikes == 1) then 
			--printf("first2hr check");
			mob:useMobAbility(432);
			--printf("Mighty_Strike");
		end
end;
-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
end;
