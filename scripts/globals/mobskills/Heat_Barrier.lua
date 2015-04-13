---------------------------------------------------
-- Heat Barrier
-- Applies a thermal barrier, granting fiery spikes and fire damage on melee hits.
-- Note: needs to be edited to add seperate blaze for Mob ID
-- (this needs to be stronger than other mobs in this family)
---------------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	
--	if(mob:getID() == idGoesHere) then
    local typeEffect = EFFECT_BLAZE_SPIKES;
	local randm = math.random(35,70);	
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, randm, 0, 120));

    return typeEffect;

end;
