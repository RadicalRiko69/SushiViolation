local t = Def.ActorFrame{};


	t[#t+1] = LoadActor("fail")..{
		InitCommand=cmd(Center;zoom,0.7);
	};
	
	
	t[#t+1] = Def.Quad {
		InitCommand=cmd(Center;zoomto,SCREEN_WIDTH+1,SCREEN_HEIGHT);
		OnCommand=cmd(diffuse,color("1,1,1,0");sleep,3.7;playcommand,"Off");
--		OffCommand=cmd(diffusealpha,0;accelerate,0.001;diffusealpha,0);
	};
	t[#t+1] = LoadActor("hey")..{
		InitCommand=cmd(draworder,301;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-50;vibrate;effectmagnitude,10,10,10);
	};
	t[#t+1] = LoadActor("why")..{
		InitCommand=cmd(draworder,301;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+70);
	};
	

	t[#t+1] = LoadActor(THEME:GetPathS( Var "LoadingScreen", "failed" ) ) .. {
		StartTransitioningCommand=cmd(play);
	};


return t;