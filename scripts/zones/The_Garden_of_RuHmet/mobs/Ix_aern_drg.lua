----------------------------------	
-- Area: The Garden of Ru'Hmet
--   NM: Ix'aern (DRG)
-----------------------------------	
  
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	

    -- Set Ix'Aern's Window Open Time, and disable respawn
    wait = math.random((120),(1200));
    SetServerVariable("[POP]Ix_Aern", os.time(t) + wait); -- 45 minutes - 75 minutes
    DeterMob(mob:getID(), true);
    
    -- Set PH back to normal, then set to respawn spawn
    PH = GetServerVariable("[PH]Ix_Aern");
    SetServerVariable("[PH]Ix_Aern", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));
    
end;

