local timer_seconds = THEME:GetMetric(Var "LoadingScreen","TimerSeconds");

return Def.ActorFrame {
	InitCommand=cmd(Center),
	-- Fade
	Def.ActorFrame {
		InitCommand=cmd();
		Def.Quad {
			InitCommand=cmd(scaletoclipped,SCREEN_WIDTH,SCREEN_HEIGHT),
			OnCommand=cmd(diffuse,Color.Black;diffusealpha,0;linear,0.5;diffusealpha,0.25;
						sleep,timer_seconds/2;  
						linear,timer_seconds/2-0.5;diffusealpha,0.8),
		},
		-- Warning Fade
		Def.Quad {
			InitCommand=cmd(y,-4;scaletoclipped,SCREEN_WIDTH,164),
			OnCommand=cmd(diffuse,Color.Black;diffusealpha,0.5;
						  linear,timer_seconds;zoomtoheight,164*0.75),
		}
	},
	--
	LoadActor("game over")..{
		InitCommand=cmd(scaletoclipped,SCREEN_WIDTH+1,SCREEN_HEIGHT);
		OnCommand=cmd(zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
	};
}
