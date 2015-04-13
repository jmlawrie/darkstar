---------------------------------------------------
-- Call of the Moon
-- Range: 10
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
 if (VanadielHour() >= 7 and VanadielHour() <= 18) then 
 --  printf("Good to go Moon2");
	return 0;
	else
	return 1;
	end
end;

function OnMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_INTIMIDATE;

    MobStatusEffectMove(mob, target, typeEffect, 20, 0, 120);


    return typeEffect;
end;
