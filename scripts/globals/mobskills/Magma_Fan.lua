---------------------------------------------
--  Manga Fan
--
-- Expels a blast of Fire at targets in a fan-shaped area of effect.
--  Type: Magical (Fire)
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

	local dmgmod = MobBreathMove(mob, target, 0.333, 0.625, ELE_FIRE, 500);
	local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_BREATH,MOBPARAM_FIRE,MOBPARAM_IGNORE_SHADOWS);
	target:delHP(dmg);
	
	return dmg;
end;
