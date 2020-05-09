local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
  FOV=120;
  InitCommand=cmd(Center);
	Def.ActorFrame{
		LoadActor("background")..{
			OnCommand=cmd(zoom,2;spin;effectmagnitude, 0,0,-10;effectperiod,10)
		};
	};
	Def.ActorFrame{
		LoadActor("background")..{
			OnCommand=cmd(zoom,2;diffusealpha,0.1;spin;effectmagnitude, 0,0,-200;effectperiod,10)
		};
	};
	Def.ActorFrame{
		LoadActor("background")..{
			OnCommand=cmd(zoom,2;diffusealpha,0.5;spin;effectmagnitude, 0,0,-30;effectperiod,10)
		};
	};
};

return t