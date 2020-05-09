return Def.ActorFrame{

  Def.ActorFrame{
		LoadActor("hider")..{
			OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoom,10;diffusealpha,1;sleep,30000;linear,0.25;diffusealpha,0)
		}
	};
	
	Def.ActorFrame{
		LoadActor("oscillator x")..{
			OnCommand= cmd(zoom,0.45;y,252;x,550;sleep,1;decelerate,2.25;x,SCREEN_CENTER_X-170;sleep,300000),
		}
	};
  
  Def.ActorFrame{
		LoadActor("hider")..{
			OnCommand=cmd(x,SCREEN_CENTER_X+70;y,SCREEN_CENTER_Y;zoom,1;diffusealpha,1;sleep,30000;linear,0.25;diffusealpha,0)
		}
	};
  Def.ActorFrame{
		LoadActor("0-game-disc")..{
			OnCommand=cmd(x,SCREEN_CENTER_X+245;y,SCREEN_CENTER_Y+170;zoom,0.3;spin;effectmagnitude, 0,0,200;effectperiod,100)
		}
	};

  LoadActor("loading" )..{
		Name="idk",
		OnCommand=cmd(zoom,0.8; x,SCREEN_CENTER_X+75;y,SCREEN_CENTER_Y+170; diffuseshift; effectoffset,1; effectperiod, 1; effectcolor1, 1,1,1,0; effectcolor2, 1,1,1,1;
    diffusealpha,1;sleep,30000;linear,0.25;diffusealpha,0)
	},
}