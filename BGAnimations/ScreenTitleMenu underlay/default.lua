return Def.ActorFrame {
    LoadActor("lane")..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+10;zoomx,1;zoomy,0);
		OnCommand=cmd(sleep,1;linear,1;zoomy,0.6);
	};
    LoadActor("backdrop")..{
		InitCommand=cmd(zoom,0.4;diffusealpha,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+10);
		OnCommand=cmd(sleep,2;linear,1;diffusealpha,1);
		OffCommand=cmd(sleep,0.05;linear,0.1;diffusealpha,0);
  };
  LoadActor(THEME:GetPathG("","logo"))..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoom,0.5;sleep,0.75;accelerate,0.5;diffusealpha,1;zoom,0.25;x,SCREEN_CENTER_X+160;y,SCREEN_CENTER_Y-190);
	};
};
