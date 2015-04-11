---------------------------------------------
--  Erosion Dust
--
-- Spreads eroding dust particles on targets in an area of effect, dealing Light damage and inflicting Dia.
--  Type: Magical (light)
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
	local typeEffect = EFFECT_DIA;

    MobStatusEffectMove(mob, target, typeEffect, 11, 0, 120);
	
	local dmgmod = 1;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,ELE_LIGHT,dmgmod,TP_MAB_BONUS,1);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_LIGHT,MOBPARAM_WIPE_SHADOWS);
	target:delHP(dmg);
	
	return dmg;
end;
