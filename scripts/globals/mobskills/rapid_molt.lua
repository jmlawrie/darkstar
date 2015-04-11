---------------------------------------------
--  Rapid Molt
--
--  Description: Adds a Regen effect and removes a detrimental status effect
--  Type: Healing
--  Utsusemi/Blink absorb: N/A
--  Range: Self
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
        return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
    local power = mob:getMainLvl()/10 * 3 + 5;
    local duration = 30;
    local dispel = target:eraseStatusEffect();
    local typeEffect = EFFECT_REGEN;

    skill:setMsg(MobBuffMove(mob, typeEffect, power, 0, duration));

    if(dispel == EFFECT_NONE) then
        -- no effect
        skill:setMsg(MSG_NO_EFFECT); -- no effect
    else
        skill:setMsg(MSG_DISAPPEAR);
    end

    return dispel;
end;
