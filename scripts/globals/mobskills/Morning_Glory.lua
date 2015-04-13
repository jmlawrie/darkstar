---------------------------------------------
--  Morning Glory
--
--  Description: Hits nearby targets with a petal bloom.
--  Type: Physical
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
	local numhits = 1;
	local accmod = 1;
	local dmgmod = 4.0;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,1.5,2);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,MOBPARAM_1_SHADOW);
	target:delHP(dmg);
	return dmg;
end;
