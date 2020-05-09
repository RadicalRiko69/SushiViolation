return Def.ActorFrame {
    LoadActor("giant bar (doubleres)")..{
		InitCommand=cmd(zoom,0.85;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+600);
        OnCommand=cmd(sleep,1;decelerate,1;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+155);
		OffCommand=cmd(sleep,0.05;linear,0.1;diffusealpha,0);
	};
    LoadActor("text (doubleres)")..{
		InitCommand=cmd(zoom,0.825;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+156;diffusealpha,0);
        OnCommand=cmd(sleep,2;decelerate,1;diffusealpha,1);
		OffCommand=cmd(sleep,0.05;linear,0.1;diffusealpha,0);
	};
    LoadActor("main menu")..{
		InitCommand=cmd(zoom,0.35;x,SCREEN_CENTER_X-800;y,SCREEN_CENTER_Y-195);
        OnCommand=cmd(sleep,1;decelerate,1;x,SCREEN_CENTER_X-180;y,SCREEN_CENTER_Y-195);
		OffCommand=cmd(sleep,0.05;linear,0.1;diffusealpha,0);
	};

};
