---------------------------------------------
--  Stupor Spores
--
--  Description: Spreads intoxicating spores that damages nearby targets. Additional effect: Sleep
--  Type: Magic
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

	local numhits = math.random(2,3);
	local accmod = 2;
	local dmgmod = 1;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,info.hitslanded);

	target:delHP(dmg);

    local typeEffect = EFFECT_SLEEP_I;

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 1, 0, math.random(20, 30)));
	return dmg;
end;
