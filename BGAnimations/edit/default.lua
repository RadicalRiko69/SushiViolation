local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
  	LoadActor("edit")..{
		InitCommand=cmd(scaletoclipped,SCREEN_WIDTH+1,SCREEN_HEIGHT);
		OnCommand=cmd(zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
	};
};

return t