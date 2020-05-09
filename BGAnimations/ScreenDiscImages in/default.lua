return Def.Quad {
	InitCommand=cmd(FullScreen),
	StartTransitioningCommand=cmd(diffusealpha,1.5; linear,0.7;diffusealpha,0)
}
