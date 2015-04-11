---------------------------------------------
--  Choke Breath
--
--  Description: Damages enemies in a fan-shaped area of effect. Additional effect: Paralysis & Silence
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

	MobStatusEffectMove(mob, target, EFFECT_PARALYSIS, 10, 0, 60);

	MobStatusEffectMove(mob, target, EFFECT_SILENCE, 1, 0, 60);

	local dmgmod = MobBreathMove(mob, target, 0.333, 0.625, ELE_LIGHT, 500);

	local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_BREATH,MOBPARAM_LIGHT,MOBPARAM_2_SHADOW);
	target:delHP(dmg);
	return dmg;
end;

