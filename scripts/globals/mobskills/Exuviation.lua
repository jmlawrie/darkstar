---------------------------------------------
--  Exuviation
--
--  Description: Restores HP and removes one detrimental magic effect.
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

	local potency = skill:getParam();

    if(potency == 0) then
    	potency = 9;
    end

	potency = potency - math.random(0, potency/6);

	skill:setMsg(MSG_SELF_HEAL);
	
	mob:eraseStatusEffect();
	
	return MobHealMove(mob, mob:getMaxHP() * potency / 100);
end;
