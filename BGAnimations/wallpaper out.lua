return Def.Quad {
	InitCommand=cmd(FullScreen; diffuse, Color.Black);
	StartTransitioningCommand=cmd(diffusealpha,0;sleep,5;linear,0.5;diffusealpha,1);
};