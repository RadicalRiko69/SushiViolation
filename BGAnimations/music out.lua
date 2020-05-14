return Def.Quad {
	InitCommand=cmd(FullScreen; diffuse, Color.Black);
	StartTransitioningCommand=cmd(diffusealpha,0;sleep,2;linear,0.5;diffusealpha,1);
};