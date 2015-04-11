---------------------------------------------
--  Erratic Flutter
--
--  Description: Unleashes a wave of Fire at targets in an area of effect, and self-hastes.
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes Shadows
--  Range: Unknown Radial
--  Notes:
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)

MobBuffMove(mob, EFFECT_HASTE, 15, 0, 180);

	local dmgmod = 2.3;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*4,ELE_FIRE,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_FIRE,MOBPARAM_WIPE_SHADOWS);
	
	target:delHP(dmg);
	return dmg;
end;
