return Def.ActorFrame{
	--LoadActor("case")..{
	--	InitCommand=cmd(x,SCREEN_CENTER_X-240;y,SCREEN_CENTER_Y;rotationy,-60;zoom,3;spin;effectmagnitude,0,40,0);
	--};
	
	LoadActor("lane")..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+25;zoomx,1;zoomy,0);
		OnCommand=cmd(sleep,2.65;decelerate,1;zoomy,0.6);
		OffCommand=cmd(decelerate,1;zoomy,0);
	};

	LoadActor("available")..{
		InitCommand=cmd(zoom,0.55;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+500;decelerate,0.85;addy,-400);
		OnCommand=cmd(sleep,0.85;decelerate,0.85;addy,100);
		OffCommand=cmd(decelerate,2;addy,300);
	};
	
	Def.ActorFrame{
		InitCommand=cmd(zoom,0.45;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-400);
		OnCommand=cmd(decelerate,0.85;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-20;sleep,0.8;accelerate,0.75;zoom,0.3;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-175);
		OffCommand=cmd(decelerate,2;addy,-300);
			LoadActor("demo version logo")..{
			};
	};

	--MESSAGES

	LoadActor("20 new songs")..{
		InitCommand=cmd(zoom,0.5;x,SCREEN_CENTER_X+800;y,SCREEN_CENTER_Y-30);
		OnCommand=cmd(sleep,3.25;decelerate,0.85;addx,-900;sleep,5;linear,1;diffusealpha,0);
	};
	LoadActor("9 new noteskins")..{
		InitCommand=cmd(zoom,0.5;x,SCREEN_CENTER_X-800;y,SCREEN_CENTER_Y+80);
		OnCommand=cmd(sleep,3.25;decelerate,0.85;addx,900;sleep,5;linear,1;diffusealpha,0);
	};
	LoadActor("closed")..{
		InitCommand=cmd(zoom,0.65;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+20;diffusealpha,0);
		OnCommand=cmd(sleep,12;decelerate,2;diffusealpha,1);
		OffCommand=cmd(decelerate,1;diffusealpha,0);
	};
	
--ITEMS

LoadActor("0-game-disc")..{
		InitCommand=cmd(zoom,0.3;x,SCREEN_CENTER_X+150;y,SCREEN_CENTER_Y-30;spin;effectperiod,1;effectmagnitude,0,0,100;diffusealpha,0);
		OnCommand=cmd(sleep,3.5;linear,1;diffusealpha,1;sleep,5;linear,1;diffusealpha,0);
	};

LoadActor("note-heart")..{
		InitCommand=cmd(zoom,0.4;x,SCREEN_CENTER_X-220;y,SCREEN_CENTER_Y+50;stoptweening;bob;effectmagnitude,0,-5,0;diffusealpha,0);
		OnCommand=cmd(sleep,3.5;linear,1;diffusealpha,1;sleep,5;linear,1;diffusealpha,0);
	};
LoadActor("note-pantsu")..{
		InitCommand=cmd(zoom,0.4;x,SCREEN_CENTER_X-210;y,SCREEN_CENTER_Y+120;stoptweening;bob;effectmagnitude,0,-2,0;diffusealpha,0);
		OnCommand=cmd(sleep,3.5;linear,1;diffusealpha,1;sleep,5;linear,1;diffusealpha,0);
	};
LoadActor("_receptor (doubleres)")..{
		InitCommand=cmd(zoom,0.8;x,SCREEN_CENTER_X-100;y,SCREEN_CENTER_Y+50;stoptweening;bob;effectmagnitude,0,-5,0;diffusealpha,0);
		OnCommand=cmd(sleep,3.5;linear,1;diffusealpha,1;sleep,5;linear,1;diffusealpha,0);
	};
LoadActor("metal")..{
		InitCommand=cmd(zoom,0.65;x,SCREEN_CENTER_X-110;y,SCREEN_CENTER_Y+115;stoptweening;bob;effectmagnitude,0,-2,0;diffusealpha,0);
		OnCommand=cmd(sleep,3.5;linear,1;diffusealpha,1;sleep,5;linear,1;diffusealpha,0);
	};
Def.Sprite{
      Name= "look look",
      Frames= {
        {Frame= 0, Delay= 0.050},
        {Frame= 1, Delay= 0.050},
        {Frame= 2, Delay= 0.050},
        {Frame= 3, Delay= 0.050},
        {Frame= 4, Delay= 0.050},
        {Frame= 5, Delay= 0.050},
        {Frame= 6, Delay= 0.050},
        {Frame= 7, Delay= 0.050},
      },
        InitCommand=cmd(zoom,0.7;x,SCREEN_CENTER_X-160;y,SCREEN_CENTER_Y+80;stoptweening;bob;effectmagnitude,0,3,0;diffusealpha,0);
		OnCommand=cmd(sleep,3.5;linear,1;diffusealpha,1;sleep,5;linear,1;diffusealpha,0);
        Texture= "arrow 8x1.png",
      },
};