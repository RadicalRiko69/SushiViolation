local gc = Var("GameCommand");

return Def.ActorFrame {
	
	LoadActor(gc:GetText()) .. {
		InitCommand=cmd(zoom,0.5;y,-87.5);
		GainFocusCommand=cmd(x,-10;stoptweening;linear,0.2;diffusealpha,1;x,0);
		LoseFocusCommand=cmd(x,0;stoptweening;linear,0.2;diffusealpha,0;x,10);
	};
	LoadActor("tv frame")..{
		InitCommand=cmd(zoom,0.5;y,-87.5);
		OffCommand=cmd(sleep,0.05;linear,0.1;diffusealpha,0);
	};


};
