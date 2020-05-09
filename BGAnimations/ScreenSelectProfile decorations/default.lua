return Def.ActorFrame{

	LoadActor("header")..{
		InitCommand=cmd(zoom,0.4446;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-500;sleep,0.25;linear,0.7;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-130.5);
		OffCommand=cmd(linear,1;addy,-200;sleep,1;diffusealpha,0);
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