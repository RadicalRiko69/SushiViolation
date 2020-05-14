return Def.ActorFrame{

	LoadActor("message box")..{
		InitCommand=cmd(zoom,0.35;diffusealpha,0.85;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+25; diffuseshift; effectoffset,1; effectperiod, 5; effectcolor1, 1,1,1,0; effectcolor2, 1,1,1,1);
		OffCommand=cmd(linear,0.25;diffusealpha,0);
	};

}