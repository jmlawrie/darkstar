-----------------------------------
-- Area: The Garden of Ru'Hmet
-- NPC:  grah blm
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
    mob:AnimationSub(0);
    mob:addMod(MOD_UDMGMAGIC, -64)
	mob:addStatusEffect(EFFECT_MANAFONT, 0, 1, 0, 0);
end;

function onMobFight(mob)

if (mob:getBattleTime() ~= 0 and mob:getBattleTime() % 30 == 0) then

local Morph = nil;
        
        local rand = math.random( 0, 3 );
         Morph = 0 + rand;
        
		mob:AnimationSub(Morph);
		
		
end
if (mob:AnimationSub() == 1) then
		mob:AnimationSub(0)
		end
RandomCast = math.random();
		if(RandomCast >= 0.95) then 
			RandomSpell = math.random();
			if(RandomSpell <= 0.06) then
				SpellNumber = 266; -- Absorb - STR 
			elseif(RandomSpell <= 0.16) then
				SpellNumber = 269; -- Absorb - AGI
			elseif(RandomSpell <= 0.3) then
				SpellNumber = 267; -- Absorb - DEX
			elseif(RandomSpell <= 0.33) then
				SpellNumber = 275; -- Absorb - TP
			elseif(RandomSpell <= 0.38) then
				SpellNumber = 268; -- Absorb - VIT
			elseif(RandomSpell <= 0.45) then
				SpellNumber = 276; -- Blind II
			elseif(RandomSpell <= 0.55) then
				SpellNumber = 232; -- Bio III
			elseif(RandomSpell <= 0.65) then
				SpellNumber = 260; -- Dispel
			elseif(RandomSpell <= 0.75) then
				SpellNumber = 246; -- Drain II
			elseif(RandomSpell <= 0.8) then
				SpellNumber = 259; -- Sleep II
			elseif(RandomSpell <= 0.85) then
				SpellNumber = 274; -- Sleepga II
			elseif(RandomSpell <= 0.9) then
				SpellNumber = 247; -- Aspir
			elseif(RandomSpell <= 0.95) then
				SpellNumber = 271; -- Absort - MND 
			else
				SpellNumber = 231; -- Bio II
			end
			mob:castSpell(SpellNumber);
	--		printf("BLM cast spell %u RC: %1.2f, RS: %1.2f",SpellNumber,RandomCast,RandomSpell);
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
mob:AnimiationSub(0);
end;
