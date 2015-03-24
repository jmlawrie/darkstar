-----------------------------------
-- Area: The Garden of Ru'Hmet
-- NPC:  Jailer of Faith
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
    mob:addMod(MOD_UDMGMAGIC, -64)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob, killer)
end;

-----------------------------------
-- onMobFight
-----------------------------------

function onMobFight(mob, target)
	local rand1 = math.random(4,8)
	local rand2 = math.random(1,4)
	local rand3 = math.random(1,8)
    if(mob:getBattleTime() ~= 0 and mob:getBattleTime() % 5 == 0 and mob:hasStatusEffect(EFFECT_MANAFONT) == false  and GetMobAction(16921021) == 1) then
        if(math.random(1,3) == 1) then
            mob:useMobAbility(435)
        end
    end
    if(mob:getBattleTime() ~= 0 and mob:getBattleTime() % rand1 == 0 and GetMobAction(16921021) == 1 and mob:hasStatusEffect(EFFECT_SILENCE) == false) then
		if(mob:hasStatusEffect(EFFECT_MANAFONT)) then
			if(rand3 == 1) then
				mob:castSpell(357)
			elseif(rand3 == 2) then
				mob:castSpell(365)
			elseif(rand3 == 3) then
				mob:castSpell(191)
			elseif(rand3 == 4) then
				mob:castSpell(162)
			else
				mob:castSpell(211)
			end
		else
			if(rand2 == 1) then
				mob:castSpell(357)
			elseif(rand2 == 2) then
				mob:castSpell(365)
			elseif(rand2 == 3) then
				mob:castSpell(191)
			elseif(rand2 == 4) then
				mob:castSpell(162)
			end
		end
	end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	local timer = GetServerVariable("FaithQmTimer")
	local location = GetServerVariable("FaithQmLocation") 
	local QM =  GetNPCByID(16921029)		
	SetServerVariable("FaithQmLocation",math.random(34,38)) -- Set random position for QM
    if(location == 34) then
        QM:setPos(-260, 0, -645)
    elseif(location == 35) then
        QM:setPos(-580, 0, -645)     
    elseif(location == 36) then
        QM:setPos(-685, 0, -340)
    elseif(location == 37) then
        QM:setPos(-155, 0, -340)
    elseif(location == 38) then
        QM:setPos(-420, 0, -155)
    end
        QM:hideNPC(900) -- Hide QM for 15 minutes
		SetServerVariable("FaithQmTimer",os.time()) -- Reset QM timer
end;
