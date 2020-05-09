return Def.Quad {
	InitCommand=cmd(FullScreen; diffuse, Color.Black),
	StartTransitioningCommand=cmd(diffusealpha,1;linear,0.4;diffusealpha,0)
}
