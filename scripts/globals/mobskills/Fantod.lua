---------------------------------------------
--  Fantod
--
--  Description: Enhances attack and magic attack.
--  Type: Enhancing
--  Utsusemi/Blink absorb: N/A
--  Range: Self
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
	local power = 400;
	local duration = 10;

	skill:setMsg(MobBuffMove(mob, EFFECT_ATTACK_BOOST, power, 0, duration));
    skill:setMsg(MobBuffMove(mob, EFFECT_MAGIC_ATK_BOOST, power, 0, duration));
	
	return EFFECT_ATTACK_BOOST;
end;
