---------------------------------------------
--  Temporal Shift
--
--  Description: Damages nearby targets with an undulating attack.
--  Type: Physical
--  Utsusemi/Blink absorb: 2-3 shadow(s)
--  Range: Melee
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)

	local numhits = math.random(1,2);
	local accmod = 2;
	local dmgmod = 1;
        if(mob:getID() == 16912846) or (mob:getID() == 16912847)then
            dmgmod = 3;
        end	
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_NONE,info.hitslanded);
	target:delHP(dmg+190);
	return dmg;
end;
