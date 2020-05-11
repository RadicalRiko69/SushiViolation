local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
  FOV=120;
  InitCommand=cmd(Center;addy,-1050;zoom,0.445);
	LoadActor("backgrounds scroll")..{
		OnCommand=cmd(sleep,15;linear,300;addy,6000);
	};
};


return t