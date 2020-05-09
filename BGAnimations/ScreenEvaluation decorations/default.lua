local t = Def.ActorFrame{
	InitCommand=cmd(hibernate,3);
}




local function CDTitleUpdate(self)
		local song = GAMESTATE:GetCurrentSong();
		local cdtitle = self:GetChild("CDTitle");
		local height = cdtitle:GetHeight();
		
		if song then
			if song:HasCDTitle() then
				cdtitle:visible(true);
				cdtitle:Load(song:GetCDTitlePath());
			else
				cdtitle:visible(false);
			end;
		else
			cdtitle:visible(false);
		end;
		
		self:zoom(0.57)
	end;
	t[#t+1] = Def.ActorFrame {
		OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+140;SetUpdateFunction,CDTitleUpdate);
		Def.Sprite {
			Name="CDTitle";
			OnCommand=cmd(zoom,0.33;diffusealpha,1;sleep,1;decelerate,1;spin;effectperiod,1;effectmagnitude,0,0,100);
			OffCommand=cmd(decelerate,1;rotationz,0;decelerate,0.5;zoom,0;sleep,1;diffusealpha,0);
		};	
	};

local song = GAMESTATE:GetCurrentSong();


--Seriously, why does this themer hate ActorFrames so much
--Rewriting this stuff to be easier to position drives me up the wall
t[#t+1] = Def.ActorFrame{
	InitCommand=cmd(xy,SCREEN_CENTER_X,80);

	--LoadActor(THEME:GetPathG("","PlayerSteps"), PLAYER_1)..{
	--	InitCommand=cmd(draworder,100;zoom,0.925;x,-215;y,-10;visible,GAMESTATE:IsSideJoined(PLAYER_1));
	--};
	--LoadActor(THEME:GetPathG("","PlayerSteps"), PLAYER_2)..{
	--	InitCommand=cmd(draworder,100;x,170;y,-10;zoom,0.925;visible,GAMESTATE:IsSideJoined(PLAYER_2));
	--};


	LoadActor("song line")..{
		InitCommand=cmd(y,SCREEN_CENTER_Y-246;zoom,0.4);
		OffCommand=cmd(linear,0.25;zoomy,0);
	};
	LoadFont("Infinity 24px")..{
		InitCommand=cmd(addy,-8;maxwidth,500;zoomy,0.75;zoomx,0.5;diffusebottomedge,color("#84ffff");shadowlength,1);
		OffCommand=cmd(linear,0.25;zoomy,0);
		Text=string.upper(song:GetDisplayMainTitle().." "..song:GetDisplaySubTitle())
	};
	LoadActor("judge line")..{
		InitCommand=cmd(y,SCREEN_CENTER_Y-120;addx,-16;zoom,0.4455);
		OffCommand=cmd(linear,0.25;zoomy,0);
	};
	LoadActor("bottom bar")..{
		InitCommand=cmd(y,SCREEN_CENTER_Y+95;zoom,0.4455);
		OffCommand=cmd(linear,0.75;addy,200);
	};
	LoadActor("results")..{
		InitCommand=cmd(y,SCREEN_CENTER_Y-290;zoom,0.45);
		OffCommand=cmd(linear,0.75;addy,-200);
	};
	LoadActor("MISSION_NEXT")..{
		--There's some way to pause a sound for a while without queuecommand, right?
		OnCommand=cmd(queuecommand,"PlaySound");
		PlaySoundCommand=cmd(play);
	};
	LoadActor("resalts (loop)")..{
		--There's some way to pause a sound for a while without queuecommand, right?
		OnCommand=cmd(sleep,5;queuecommand,"PlaySound");
		PlaySoundCommand=cmd(play);
	};
	

};






t[#t+1] = Def.ActorFrame{

	InitCommand=cmd(draworder,100;y,SCREEN_CENTER_Y-70;);
	OnCommand=function(self)
		if GAMESTATE:IsHumanPlayer(PLAYER_1) then
			if STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1):IsDisqualified()==true then
				self:visible(false);
			else
				self:visible(true);
			end
		else
			self:visible(false);
		end

		if GAMESTATE:GetNumSidesJoined() == 2 then
			self:x(SCREEN_CENTER_X-140);
			if GAMESTATE:GetCurrentStyle():GetStyleType() == "StyleType_TwoPlayersSharedSides" then
			self:visible(false)

				if GAMESTATE:GetMasterPlayerNumber() == "PlayerNumber_P1" then
					self:visible(true)
					self:x(SCREEN_CENTER_X);
				end
			end

		else
			self:x(SCREEN_CENTER_X-200);
		end
	end;

	--LoadActor("P1Stats")..{};
};





for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
	--Calculate positioning of items based on aspect ratio. (16:9 is the default.)
	local numbers_xPos = 180;
	local grades_xPos = 240;
	-- position = pn==PLAYER_2 ? 1 : -1;
	local position = (pn == "PlayerNumber_P2") and 1 or -1;
	local sPosition = 135;
	
	t[#t+1] = LoadActor("PlayerNumbers", pn)..{
		InitCommand=cmd(zoom,0.7;xy,SCREEN_CENTER_X+numbers_xPos*position,sPosition);
		OnCommand=function(self)
		OffCommand=cmd(linear,0.25;diffusealpha,0);
		end;
	};
	t[#t+1] = LoadActor("PlayerGrade", pn)..{
		InitCommand=cmd(xy,SCREEN_CENTER_X+grades_xPos*position,SCREEN_CENTER_Y-39);
		OffCommand=cmd(linear,0.25;diffusealpha,0);
	};
	

	
end

--IMPORTANT CODE! USE FOR STANDARD SUPPORT TESTING!!
--t[#t+1] = Def.ActorFrame {
--	FOV=120;
--		InitCommand=cmd(Center);
--			LoadActor("4-3 bar (1080)")..{
--				InitCommand=cmd(scaletoclipped,SCREEN_WIDTH+1,SCREEN_HEIGHT);
--				OnCommand=cmd(zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
--		};
--};




return t;
