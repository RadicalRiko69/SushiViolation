local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
  FOV=120;
  InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y);
	LoadActor("explosion")..{
			OnCommand=cmd(zoom,0.445);
		};
	LoadActor("glow")..{
			OnCommand=cmd(zoom,0.445;sleep,1;decelerate,3.5;diffusealpha,0);
		};
	LoadActor("monster")..{
			OnCommand=cmd(zoom,0.445;x,SCREEN_CENTER_X+220;sleep,1;decelerate,0.5;addx,-600);
		};
};

t[#t+1] = Def.ActorFrame {
	FOV=120;
	InitCommand=cmd(x,SCREEN_LEFT-220;y,SCREEN_CENTER_Y+170);
	  LoadActor("game over logo")..{
			  OnCommand=cmd(zoom,0.445;sleep,1;decelerate,0.5;addx,440);
		  };
	  LoadActor("now get out")..{
			  OnCommand=cmd(zoom,0.445;addy,50;sleep,1;decelerate,0.5;addx,350);
		  };
  };

return t