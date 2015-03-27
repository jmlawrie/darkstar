-----------------------------------	
-- Area: The Garden of Ru'Hmet
-- MOB:  Aw'aern
-- Note: Place Holder for Ix'aern (DRG)
-----------------------------------	

require("scripts/zones/The_Garden_of_RuHmet/MobIDs");
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	local rand = math.random(1,2)
	if (mob:getID() == 16920646 or mob:getID() == 16920647 or mob:getID() == 16920648) then
		if (rand == 1) then
			killer:setVar("animosity", os.time());
			killer:messageSpecial(7723);
		end
	end;
    	local X = mob:getXPos();
		local Y = mob:getYPos();
		local Z = mob:getZPos();

    mob = mob:getID();
    if (Ix_Aern_PH[mob] ~= nil) then

        ToD = GetServerVariable("[POP]Ix_Aern");
        if (ToD <= os.time(t) and GetMobAction(Ix_Aern) == 0) then
            if (math.random((1),(5)) == 5) then
                GetMobByID(Ix_Aern):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Ix_Aern", mob);
				SpawnMob(16921022);
				GetMobByID(16921022):setPos(X,Y,Z);
				GetMobByID(16921022):setSpawn(X,Y,Z);
                DeterMob(mob, true);
            end
        end
    end 




	--[[local VanadielHour = VanadielHour();
	local posi_drk = GetServerVariable("[POSI]Ix_aern_drk");
	local ixdrg = GetMobByID(16921022);
	local drga = GetMobByID(16921023);
	local drgb = GetMobByID(16921024);
	local drgc = GetMobByID(16921025);
	local posi_drg = GetServerVariable("[POSI]Ix_aern_drg");
		print(posi_drg);
	i = GetServerVariable("[PH]Ix_aern_drk");
	g = GetServerVariable("[PH]Ix_aern_drg");
		print(g);
	-- Ix'Aern DRK PH check
	-- Check if Aw_aern are in the room with the ???
		mob = mob:getID();
		if (posi_drk == 1) then 
			if (Ix_aern_drk_PH_pos1[mob] ~= nil) then
				
				if (i == 3) then 
					killer:messageSpecial(SHEER_ANIMOSITY);
					if(VanadielHour % 4 == 0) then 
						SetServerVariable("[PH]Ix_aern_drk", 0);
					end
				else
					i = i + 1; -- adds 1 to the kill count.
					SetServerVariable("[PH]Ix_aern_drk", i); -- set server variable to what i value is.
				end
			end
		elseif (posi_drk == 2) then 
			if (Ix_aern_drk_PH_pos2[mob] ~= nil) then
				if (i == 3) then 
					killer:messageSpecial(SHEER_ANIMOSITY);
					if(VanadielHour % 4 == 0) then 
						SetServerVariable("[PH]Ix_aern_drk", 0);
					end
				else
					i = i + 1; -- adds 1 to the kill count.
					SetServerVariable("[PH]Ix_aern_drk", i); -- set server variable to what i value is.
				end
			end
		elseif (posi_drk == 3) then 
			if (Ix_aern_drk_PH_pos3[mob] ~= nil) then
				if (i == 3) then 
					killer:messageSpecial(SHEER_ANIMOSITY);
					if(VanadielHour % 4 == 0) then 
						SetServerVariable("[PH]Ix_aern_drk", 0);
					end
				else
					i = i + 1; -- adds 1 to the kill count.
					SetServerVariable("[PH]Ix_aern_drk", i); -- set server variable to what i value is.
				end
			end
		elseif (posi_drk == 4) then 
			if (Ix_aern_drk_PH_pos4[mob] ~= nil) then
				if (i == 3) then 
					killer:messageSpecial(SHEER_ANIMOSITY);
					if(VanadielHour % 4 == 0) then 
						SetServerVariable("[PH]Ix_aern_drk", 0);
					end
				else
					i = i + 1; -- adds 1 to the kill count.
					SetServerVariable("[PH]Ix_aern_drk", i); -- set server variable to what i value is.
				end
			end
		
		end
		--Ix'Aern DRG PH check			
		if (Ix_aern_drg_PH_pos1[mob] ~= nil) then			
				--print("DRG MOB ZONE 1");
			if (posi_drg == 1 and g == 3) then 
				ixdrg:setSpawn(-320,5.00,-360); -- Change MobSpawn to Players @pos.
				SpawnMob(16921022,180):updateEnmity(killer);
				drga:setSpawn(-320,5.00,-360); -- Change MobSpawn to Players @pos.
				SpawnMob(16921023,180):updateEnmity(killer);
				drgb:setSpawn(-320,5.00,-360); -- Change MobSpawn to Players @pos.
				SpawnMob(16921024,180):updateEnmity(killer);
				drgc:setSpawn(-320,5.00,-360); -- Change MobSpawn to Players @pos.
				SpawnMob(16921025,180):updateEnmity(killer);
			else
				g = g + 1; -- adds 1 to the kill count.
				SetServerVariable("[PH]Ix_aern_drg",g);
				SetServerVariable("[POSI]Ix_aern_drg",1);
			end
		elseif (Ix_aern_drg_PH_pos2[mob] ~= nil) then
				--print("DRG MOB ZONE 2");
			if (posi_drg == 2 and g == 3) then 
				ixdrg:setSpawn(-320,5.00,-520); -- Change MobSpawn to Players @pos.
				SpawnMob(16921022,180):updateEnmity(killer);
				drga:setSpawn(-320,5.00,-520); -- Change MobSpawn to Players @pos.
				SpawnMob(16921023,180):updateEnmity(killer);
				drgb:setSpawn(-320,5.00,-520); -- Change MobSpawn to Players @pos.
				SpawnMob(16921024,180):updateEnmity(killer);
				drgc:setSpawn(-320,5.00,-520); -- Change MobSpawn to Players @pos.
				SpawnMob(16921025,180):updateEnmity(killer);
			else
				g = g + 1; -- adds 1 to the kill count.
				SetServerVariable("[PH]Ix_aern_drg",g);
				SetServerVariable("[POSI]Ix_aern_drg",2);
			end
		elseif (Ix_aern_drg_PH_pos3[mob] ~= nil) then
				--print("DRG MOB ZONE 3");
			if (posi_drg == 3 and g == 3) then 
				ixdrg:setSpawn(-520,5.00,-520); -- Change MobSpawn to Players @pos.
				SpawnMob(16921022,180):updateEnmity(killer);
				drga:setSpawn(-520,5.00,-520); -- Change MobSpawn to Players @pos.
				SpawnMob(16921023,180):updateEnmity(killer);
				drgb:setSpawn(-520,5.00,-520); -- Change MobSpawn to Players @pos.
				SpawnMob(16921024,180):updateEnmity(killer);
				drgc:setSpawn(-520,5.00,-520); -- Change MobSpawn to Players @pos.
				SpawnMob(16921025,180):updateEnmity(killer);
				
			else
				g = g + 1; -- adds 1 to the kill count.
				SetServerVariable("[PH]Ix_aern_drg",g);
				SetServerVariable("[POSI]Ix_aern_drg",3);
			end
		elseif (Ix_aern_drg_PH_pos4[mob] ~= nil) then
				--print("DRG MOB ZONE 4");
			if (posi_drg == 4 and g == 3) then 
				ixdrg:setSpawn(-520,5.00,-360); -- Change MobSpawn to Players @pos.
				SpawnMob(16921022,180):updateEnmity(killer);
				drga:setSpawn(-520,5.00,-360); -- Change MobSpawn to Players @pos.
				SpawnMob(16921023,180):updateEnmity(killer);
				drgb:setSpawn(-520,5.00,-360); -- Change MobSpawn to Players @pos.
				SpawnMob(16921024,180):updateEnmity(killer);
				drgc:setSpawn(-520,5.00,-360); -- Change MobSpawn to Players @pos.
				SpawnMob(16921025,180):updateEnmity(killer);
			else
				g = g + 1; -- adds 1 to the kill count.
				SetServerVariable("[PH]Ix_aern_drg",g);
				SetServerVariable("[POSI]Ix_aern_drg",4);
			end
		end]]--
	
end;
