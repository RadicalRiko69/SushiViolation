local t = LoadFallbackB();

if not GAMESTATE:IsCourseMode() then
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
		OnCommand=cmd(x,SCREEN_CENTER_X+980;y,SCREEN_CENTER_Y-12.5;zoom,0.5;sleep,0.25;decelerate,1;zoom,1;x,SCREEN_CENTER_X+200;y,SCREEN_CENTER_Y-12.5;SetUpdateFunction,CDTitleUpdate);
		OffCommand=cmd(decelerate,0.4;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
		Def.Sprite {
			Name="CDTitle";
			OnCommand=cmd(x,-100;zoom,0.77;diffusealpha,1;zoom,0;bounceend,0;x,30;zoom,0.77;sleep,0.65;accelerate,1;spin;effectperiod,1;effectmagnitude,0,0,800);
			CurrentSongChangedMessageCommand=function(self)
				(cmd(stoptweening;Load,nil;diffusealpha,0;zoom,0.825;decelerate,0.15;))(self);
				if GAMESTATE:GetCurrentSong():HasCDTitle() then
					self:Load(GAMESTATE:GetCurrentSong():GetCDTitlePath());
				end;
				(cmd(diffusealpha,1;zoom,0.77;rotationz,0;sleep,0.2))(self);
			end;
			SongChosenMessageCommand=cmd(spin;effectperiod,1;effectmagnitude,0,0,1500);
			SongUnchosenMessageCommand=cmd(spin;effectperiod,1;effectmagnitude,0,0,800);
			OffCommand=cmd(decelerate,1;rotationz,0;zoom,0.8;sleep,0.5;decelerate,0.5;zoom,0;sleep,1;diffusealpha,0);
		};	
	};
	
end;

t[#t+1] = Def.ActorFrame{

	LoadActor("fade")..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;scaletoclipped,SCREEN_WIDTH+1,SCREEN_HEIGHT;diffusealpha,0);
		SongChosenMessageCommand=cmd(zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;decelerate,0.15;diffusealpha,1);
		SongUnchosenMessageCommand=cmd(decelerate,0.15;diffusealpha,0);
		OffCommand=cmd(decelerate,0.15;diffusealpha,0);
	};
};

t[#t+1] = Def.ActorFrame{

	--top
	LoadActor("songartist_name")..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-112;zoomy,0.65;zoomx,1.25;visible,false);
		SongChosenMessageCommand=cmd(decelerate,0.15;diffusealpha,1;visible,true);
		SongUnchosenMessageCommand=cmd(decelerate,0.15;diffusealpha,0;visible,false);
		OffCommand=cmd(decelerate,0.15;diffusealpha,0);
	};
	LoadActor("songartist_name")..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-112;zoomy,0.65;zoomx,1.25;visible,false);
		SongChosenMessageCommand=cmd(decelerate,0.15;diffusealpha,1;visible,true);
		SongUnchosenMessageCommand=cmd(decelerate,0.15;diffusealpha,0;visible,false);
		OffCommand=cmd(decelerate,0.15;diffusealpha,0);
	};



	-- CURRENT SONG NAME
		LoadFont("_russellsquare 40px")..{	
			InitCommand=cmd(uppercase,true;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-122;zoom,0.85;maxwidth,700;visible,false);
			SongChosenMessageCommand=cmd(decelerate,0.15;diffusealpha,1;visible,true);
			SongUnchosenMessageCommand=cmd(decelerate,0.15;diffusealpha,0;visible,false);
			OffCommand=cmd(decelerate,0.15;diffusealpha,0);
			CurrentSongChangedMessageCommand=function(self)
			local song = GAMESTATE:GetCurrentSong()
				if song then
					self:settext(song:GetDisplayFullTitle());
					self:finishtweening();self:diffusealpha(0);
					self:decelerate(0.25);self:diffusealpha(1);
				else
					self:stoptweening();self:linear(0.25);self:diffusealpha(0);
				end;
			end;

		};
		-- CURRENT SONG ARTIST
		LoadFont("_russellsquare 40px")..{	
			InitCommand=cmd(uppercase,true;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-98;zoom,0.35;maxwidth,900;visible,false);
			SongChosenMessageCommand=cmd(decelerate,0.15;diffusealpha,1;visible,true);
			SongUnchosenMessageCommand=cmd(decelerate,0.15;diffusealpha,0;visible,false);
			OffCommand=cmd(decelerate,0.15;diffusealpha,0);
			CurrentSongChangedMessageCommand=function(self)
			local song = GAMESTATE:GetCurrentSong();
				if song then
					self:settext(song:GetDisplayArtist());
					self:finishtweening();self:diffusealpha(0);
					self:decelerate(0.25);self:diffusealpha(1);
				else
					self:stoptweening();self:linear(0.25);self:diffusealpha(0);
				end;
			end;


		};
};

t[#t+1] = Def.ActorFrame{

	LoadActor("tab thingy")..{
		InitCommand=cmd(zoom,0.675;diffusealpha,0;x,SCREEN_CENTER_X-200;y,SCREEN_CENTER_Y-55;sleep,0.2;linear,0.5;diffusealpha,1);
		OffCommand=cmd(sleep,0.05;linear,0.1;diffusealpha,0);
	};
		PlayerJoinedMessageCommand=function(self)
			SCREENMAN:SetNewScreen("ScreenSelectProfile");
		end;

	LoadActor("scorebar")..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+175;zoom,0.635;diffusealpha,0);
		SongChosenMessageCommand=cmd(decelerate,0.15;diffusealpha,1);
		SongUnchosenMessageCommand=cmd(decelerate,0.15;diffusealpha,0);
		OffCommand=cmd(decelerate,0.15;diffusealpha,0);
	};
};


for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
	t[#t+1] = Def.ActorFrame{
		InitCommand=function(self)
			self:visible(GAMESTATE:IsHumanPlayer(pn))
			if pn == PLAYER_1 then
				self:x(SCREEN_CENTER_X-150);
				self:y(SCREEN_CENTER_Y+35);
			else
				self:x(SCREEN_CENTER_X+150);
				self:y(SCREEN_CENTER_Y+35);
			end;
			
			self:diffusealpha(0);
		end;
		
		
		SongChosenMessageCommand=cmd(stoptweening;linear,.2;diffusealpha,1);
		TwoPartConfirmCanceledMessageCommand=cmd(stoptweening;linear,.2;diffusealpha,0);
		SongUnchosenMessageCommand=cmd(stoptweening;linear,.05;diffusealpha,0);
		--PlayerJoinedMessageCommand=cmd(visible,GAMESTATE:IsHumanPlayer(player));
		OffCommand=cmd(stoptweening;linear,.05;diffusealpha,0);
		
		LoadActor("MachineScore", pn)..{
			InitCommand=cmd(y,120);
		};
		LoadActor("PlayerScore", pn)..{
			InitCommand=cmd(y,175);
		};
	};
end;

--Banner Frame
t[#t+1] = Def.ActorFrame {
	LoadActor("gloss")..{
		InitCommand=cmd(zoom,0.296;diffusealpha,0;x,SCREEN_CENTER_X-200;y,SCREEN_CENTER_Y;sleep,0.2;linear,0.5;diffusealpha,1; diffuseshift; effectoffset,1; effectperiod, 3; effectcolor1, 0,0,0,0; effectcolor2, 1,1,1,1);
		OffCommand=cmd(sleep,0.05;linear,0.1;diffusealpha,0);
	};
	LoadActor("frame")..{
		InitCommand=cmd(zoom,0.296;diffusealpha,0;x,SCREEN_CENTER_X-200;y,SCREEN_CENTER_Y;sleep,0.2;linear,0.5;diffusealpha,1);
		OffCommand=cmd(sleep,0.05;linear,0.1;diffusealpha,0);
	};
	LoadActor("addition")..{
		InitCommand=cmd(zoom,0.296;diffusealpha,0;x,SCREEN_CENTER_X-200;y,SCREEN_CENTER_Y;sleep,0.2;linear,0.5;diffusealpha,1; diffuseshift; effectoffset,1; effectperiod, 3; effectcolor1, 0,0,0,0; effectcolor2, 1,1,1,1);
		OffCommand=cmd(sleep,0.05;linear,0.1;diffusealpha,0);
	};
		
};

t[#t+1] = Def.ActorFrame{

	LoadActor(THEME:GetPathG("","DifficultyDisplay"))..{
		InitCommand=cmd(zoom,1;x,SCREEN_CENTER_X+120;y,SCREEN_CENTER_Y+180;sleep,1;linear,0.5;addy,-45);
		SongChosenMessageCommand=cmd(decelerate,0.15;diffusealpha,1;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-27;zoom,1.4);
		SongUnchosenMessageCommand=cmd(decelerate,0.15;diffusealpha,1;x,SCREEN_CENTER_X+120;y,SCREEN_CENTER_Y+135;zoom,1);
		TwoPartConfirmCanceledMessageCommand=cmd(decelerate,0.15;diffusealpha,0);
		OffCommand=cmd(decelerate,0.15;diffusealpha,1;x,SCREEN_CENTER_X+120;y,SCREEN_CENTER_Y+135;zoom,1;sleep,0.05;linear,0.15;addy,45;sleep,0.15;diffusealpha,0);
	};
};

--PREVIEW BOX
t[#t+1] = LoadActor("songPreview");

--Command Window
t[#t+1] = LoadActor("code_detector");
t[#t+1] = LoadActor("Command Window");

--[[step credit
t[#t+1] = LoadActor("stepsInfo")--]]

t[#t+1] = Def.ActorFrame{

	LoadActor(THEME:GetPathS("","open up"))..{
		SongChosenMessageCommand=cmd(play);
		StepsChosenMessageCommand=cmd(play);
	};
	LoadActor(THEME:GetPathS("","swish disc"))..{
		SongUnchosenMessageCommand=cmd(play);
	};
	LoadActor(THEME:GetPathS("","clash"))..{
		OffCommand=cmd(play);
	};

};

-- Front Stuff
t[#t+1] = Def.ActorFrame {
	
	LoadActor("paw")..{
		InitCommand=cmd(x,SCREEN_CENTER_X+980;y,SCREEN_CENTER_Y-210;zoom,0.5;sleep,0.25;decelerate,1;x,SCREEN_CENTER_X+205;sleep,0.75;decelerate,1;addx,980;sleep,3;diffusealpha,0);
	};
	LoadActor(THEME:GetPathG("","slide"))..{
		InitCommand=cmd(zoom,0.4446;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-500;decelerate,0.7;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-130.5);
		OnCommand=cmd(diffuseshift; effectoffset,0.5; effectperiod, 2; effectcolor1, 0,0,0,0; effectcolor2, 1,1,1,1);
		OffCommand=cmd(decelerate,1;addy,-200;sleep,1;diffusealpha,0);
	};
	LoadActor("choose a song")..{
		InitCommand=cmd(zoom,0.4446;draworder,999;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-500;decelerate,0.7;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-130.5);
		OffCommand=cmd(decelerate,1;addy,-200;sleep,1;diffusealpha,0);
	};
	LoadActor("choose step level")..{
		InitCommand=cmd(zoom,0.4446;draworder,999;diffusealpha,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-500;decelerate,0.7;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-130.5);
		SongChosenMessageCommand=cmd(linear,0.15;diffusealpha,1);
		SongUnchosenMessageCommand=cmd(linear,0.15;diffusealpha,0);
		OffCommand=cmd(decelerate,1;addy,-200;sleep,1;diffusealpha,0);
	};
		
};



return t
