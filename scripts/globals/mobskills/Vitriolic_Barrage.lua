---------------------------------------------
--  Vitriolic Barrage
--
--  Description: Bombards nearby targets with acid, dealing fixed Water damage. Additional effect: Poison
--  Type: Magical (Light)
--
--
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
    
	local tick = math.random(10,20)
	local power = mob:getMainLvl()/4*.6 + 4;
	local typeEffect = EFFECT_POISON
	
	MobStatusEffectMove(mob, target, typeEffect, power, tick, 100);
	
	local barrage = 1000 / skill:getTotalTargets();
	local dmg = MobFinalAdjustments(barrage,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WATER,MOBPARAM_WIPE_SHADOWS);

	
	target:delHP(dmg);

	return dmg;
end;
