return Def.ActorFrame {
    Def.Sprite{
      Name= "sushi", --kaboom
      Frames= {
        {Frame= 0, Delay= 0.035},
        {Frame= 1, Delay= 0.035},
		{Frame= 2, Delay= 0.035},
		{Frame= 3, Delay= 0.035},
        {Frame= 4, Delay= 0.035},
        {Frame= 5, Delay= 0.035},
		{Frame= 6, Delay= 0.035},
		{Frame= 7, Delay= 0.035},
        {Frame= 8, Delay= 0.035},
        {Frame= 9, Delay= 0.035},
		{Frame= 10, Delay= 0.035},
		{Frame= 11, Delay= 0.035},
        {Frame= 12, Delay= 0.035},
        {Frame= 13, Delay= 0.035},
		{Frame= 14, Delay= 0.035},
		{Frame= 15, Delay= 0.035},
        {Frame= 16, Delay= 0.035},
		{Frame= 17, Delay= 0.035},
        {Frame= 18, Delay= 0.035},
        {Frame= 19, Delay= 0.035},
		{Frame= 20, Delay= 0.035},
		{Frame= 21, Delay= 0.035},
        {Frame= 22, Delay= 0.035},
		{Frame= 23, Delay= 0.035},
        {Frame= 24, Delay= 0.035},
		{Frame= 25, Delay= 0.035},
        {Frame= 26, Delay= 0.035},
		{Frame= 27, Delay= 0.035},
        {Frame= 28, Delay= 0.035},
		{Frame= 29, Delay= 999.010},
    },
      OnCommand= cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoom,10;diffusealpha,0;sleep,0.5;diffusealpha,1;sleep,0.25;linear,0.5;diffusealpha,0;linear,1;zoom,1),
      Texture= "Explosion Spark 6x5 (doubleres).png",
    },
    Def.Sprite{
        Name= "orb", --after explosion
        OnCommand= cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoom,0;diffusealpha,0;sleep,0.5;diffusealpha,1;linear,0.5;zoom,10;diffusealpha,0),
        Texture= "Explosion Glow (doubleres).png",
      },
    Def.Sprite{
        Name= "sushi violation 2018", --main logo
        OnCommand= cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoom,10;diffusealpha,0;sleep,0.05;linear,0.5;diffusealpha,1;zoom,0.5),
        Texture= "SV2018 logo.png",
      },
    Def.Sprite{
        Name= "loglow", --this is the ghost part
        OnCommand= cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoom,0.5;diffusealpha,0;sleep,0.5;diffusealpha,1;linear,1;zoom,0.8;diffusealpha,0),
        Texture= "SV2018 logo.png",
      },
      LoadActor(THEME:GetPathG("","press"))..{
        InitCommand=cmd(Center);
        OnCommand=cmd(zoom,0.45; addy,150; diffusealpha,0; diffuseshift; effectperiod, 2; effectcolor1, 1,1,1,1; effectcolor2, 1,1,1,0; sleep,1; diffusealpha,1;);
      };
};
