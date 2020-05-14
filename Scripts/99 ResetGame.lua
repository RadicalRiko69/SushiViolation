function ResetGame()
	ActiveModifiers = {
		P1 = table.shallowcopy(PlayerDefaults),
		P2 = table.shallowcopy(PlayerDefaults),
		GAMESTATE:SetPreferredSongGroup("Ben Speirs' SPEIRMIX GALAXY"),
		--EDIT = table.shallowcopy(PlayerDefaults),
		--Save values here if editing profile
	}
	
	--not yet
	--QUESTMODE:Reset();
	PREFSMAN:SetPreference("AllowW1",'AllowW1_Never');
	--PREFSMAN:SetPreference("MusicWheelUsesSections",'Never');
	PREFSMAN:SetPreference("TimingWindowSecondsAttack",0.135000);
	PREFSMAN:SetPreference("TimingWindowSecondsHold",0.350);
	PREFSMAN:SetPreference("TimingWindowSecondsMine",0.070);
	PREFSMAN:SetPreference("TimingWindowSecondsRoll",100000.350);
	PREFSMAN:SetPreference("TimingWindowSecondsW1",0.000);
	PREFSMAN:SetPreference("TimingWindowSecondsW2",0.055);
	PREFSMAN:SetPreference("TimingWindowSecondsW3",0.100);
	PREFSMAN:SetPreference("TimingWindowSecondsW4",0.145);
	PREFSMAN:SetPreference("TimingWindowSecondsW5",0.190);
	PREFSMAN:SetPreference("SuperMeterPercentChangeCheckpointHit",0);
	PREFSMAN:SetPreference("SuperMeterPercentChangeCheckpointMiss",0);
	PREFSMAN:SetPreference("SuperMeterPercentChangeHeld",6);
	PREFSMAN:SetPreference("SuperMeterPercentChangeHitMine",-8);
	PREFSMAN:SetPreference("SuperMeterPercentChangeLetGo",-10);
	PREFSMAN:SetPreference("SuperMeterPercentChangeMiss",-2);
	PREFSMAN:SetPreference("SuperMeterPercentChangeW1",10);
	PREFSMAN:SetPreference("SuperMeterPercentChangeW2",8);
	PREFSMAN:SetPreference("SuperMeterPercentChangeW3",6);
	PREFSMAN:SetPreference("SuperMeterPercentChangeW4",2);
	PREFSMAN:SetPreference("SuperMeterPercentChangeW5",-2);

	--test
	--SCREENMAN:SystemMessage("idk what im doin")
end
