return Def.Quad {
	InitCommand=cmd(FullScreen; diffuse, Color.Black);
	StartTransitioningCommand=cmd(diffusealpha,0;sleep,1;linear,0.15;diffusealpha,1);
};