-----------------------------------
-- Area: The Garden of Ru'Hmet
-- NPC:  Jailer of Fortitude
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
        if (mob:AnimationSub() == 1) then
		mob:AnimationSub(0)
		else
		mob:AnimationSub(Morph);
		end
end
if (mob:AnimationSub() == 1) then
		mob:AnimationSub(0)
		end
RandomCast = math.random();
		if(RandomCast >= 0.95) then 
			RandomSpell = math.random();
			if(RandomSpell <= 0.06) then
				SpellNumber = 29; -- Banish II
			elseif(RandomSpell <= 0.16) then
				SpellNumber = 30; -- Banish III
			elseif(RandomSpell <= 0.3) then
				SpellNumber = 38; -- Banishga 
			elseif(RandomSpell <= 0.33) then
				SpellNumber = 39; -- Banishga III
			elseif(RandomSpell <= 0.38) then
				SpellNumber = 9; -- Curaga III
			elseif(RandomSpell <= 0.45) then
				SpellNumber = 24; -- Dia II
			elseif(RandomSpell <= 0.55) then
				SpellNumber = 25; -- Dia III
			elseif(RandomSpell <= 0.65) then
				SpellNumber = 112; -- Flash
			elseif(RandomSpell <= 0.75) then
				SpellNumber = 21; -- Holy
			elseif(RandomSpell <= 0.8) then
				SpellNumber = 128; -- Protectra IV
			elseif(RandomSpell <= 0.85) then
				SpellNumber = 133; -- Shellra IV
			elseif(RandomSpell <= 0.9) then
				SpellNumber = 143; -- Erase
			elseif(RandomSpell <= 0.95) then
				SpellNumber = 33; -- Diaga 
			else
				SpellNumber = 9; -- Cure IV
			end
			mob:castSpell(SpellNumber);
		--	printf("WHM cast spell %u RC: %1.2f, RS: %1.2f",SpellNumber,RandomCast,RandomSpell);
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
