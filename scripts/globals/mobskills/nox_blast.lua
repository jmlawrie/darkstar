---------------------------------------------
--  Nox Blast
--
--  Description: A dark blast hits targets in front. Additional effect: knockback and resets TP
--  
--
--
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
 if (VanadielHour() >= 19 or VanadielHour() <= 6) then 
-- printf("Good to go Nox");
	return 0;
	else
	return 1;
	end
end;


function OnMobWeaponSkill(target, mob, skill)
	target:dispelStatusEffect();

	local dmgmod = 1;
	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*2.5,ELE_DARK,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_WIPE_SHADOWS);
	target:delHP(dmg);

	return dmg;
end;
