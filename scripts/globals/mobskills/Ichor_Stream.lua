---------------------------------------------
--  Ichor Stream
--
--  Poisons targets in cone shape
--  Type: Physical
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)

	local typeEffect = EFFECT_POISON;
	local power = (mob:getMainLvl()/10);
	 if(mob:getID() == 16912846) or (mob:getID() == 16912847)then
            dmgmod = 2.5;
        end	

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 1, 3, 18);
	return typeEffect;
end;
