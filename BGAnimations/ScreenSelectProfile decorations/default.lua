return Def.ActorFrame{

	LoadActor(THEME:GetPathG("","slide"))..{
		InitCommand=cmd(zoom,0.4446;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-500;decelerate,0.7;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-130.5);
		OnCommand=cmd(diffuseshift; effectoffset,0.5; effectperiod, 2; effectcolor1, 0,0,0,0; effectcolor2, 1,1,1,1);
		OffCommand=cmd(decelerate,1;addy,-200;sleep,1;diffusealpha,0);
	};
	LoadActor("header")..{
		InitCommand=cmd(zoom,0.4446;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-500;decelerate,0.7;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-130.5);
		OffCommand=cmd(decelerate,1;addy,-200;sleep,1;diffusealpha,0);
	};
	LoadActor("giant bar (doubleres)")..{
		InitCommand=cmd(zoom,0.475;x,SCREEN_CENTER_X-160;y,SCREEN_CENTER_Y+150);
		OffCommand=cmd(linear,1;addy,200;sleep,1;diffusealpha,0);
	};
	LoadActor("p2 (doubleres)")..{
		InitCommand=cmd(zoom,0.475;x,SCREEN_CENTER_X+160;y,SCREEN_CENTER_Y+150);
		OffCommand=cmd(linear,1;addy,200;sleep,1;diffusealpha,0);
	};

}