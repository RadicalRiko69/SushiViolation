return Def.ActorFrame {
	Def.Quad {
		InitCommand=cmd(Center;zoomto,SCREEN_WIDTH+1,SCREEN_HEIGHT);
		OnCommand=cmd(diffuse,color("0,0,0,0");sleep,0;diffusealpha,1;sleep,1);
	};
	LoadActor(THEME:GetPathS("_Screen","cancel")) .. {
		IsAction= true,
		StartTransitioningCommand=cmd(play);
	};
};