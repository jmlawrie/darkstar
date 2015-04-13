---------------------------------------------
--  Thermal Pulse
--
--  Description: Deals Fire damage to enemies within area of effect. Additional effect: Blindness
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
    local typeEffect = EFFECT_BLINDNESS;

    MobStatusEffectMove(mob, target, typeEffect, 20, 0, 120);
	
    local dmgmod = MobBreathMove(mob, target, 0.5, 1, ELE_FIRE, 500);

	local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_FIRE,MOBPARAM_IGNORE_SHADOWS);

	target:delHP(dmg);
	return dmg;
end;
