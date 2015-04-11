---------------------------------------------------
-- Proboscis
-- Steals MP and dispels one beneficial status effect from targets in front.
-- Type: Magical
-- Utsusemi/Blink absorb: Unknown
-- Range: 15'
-- Notes: Damage shown in chat log is done to MP instead of HP.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    if(target:getMP() > 0) then
        return 0;
    end
    return 1;
end;

function OnMobWeaponSkill(target, mob, skill)

    
if(target:isUndead() == false) then

      local dmgmod = 1.3;
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*1.6,ELE_DARK,dmgmod,TP_MAB_BONUS,1);
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_IGNORE_SHADOWS);

    skill:setMsg(MSG_DRAIN_MP);

    if(target:isUndead() == false) then

        -- can't go over limited mp
        if(target:getMP() < dmg) then
            dmg = target:getMP();
        end

        target:delMP(dmg);
        mob:addMP(dmg);
    else
        skill:setMsg(MSG_NO_EFFECT);
    end
	end
    return dmg;
	
end;
