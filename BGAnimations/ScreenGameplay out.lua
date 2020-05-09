return Def.Quad {
	InitCommand=cmd(FullScreen;diffuse,color("0,0,0,0"));
		OnCommand=cmd(sleep,1;linear,0;diffusealpha,1);
};