return Def.ActorFrame {

	Def.Sprite{
      Name= "sushi",
      Frames= {
        {Frame= 0, Delay= 0.200},
        {Frame= 1, Delay= 0.200},
		{Frame= 2, Delay= 0.200},
		{Frame= 1, Delay= 0.200},
    },
      OnCommand= cmd(x,SCREEN_CENTER_X-150;y,SCREEN_CENTER_Y+50;zoomy,1;zoomx,0;bob;effectmagnitude,0,0.3,0;sleep,2.5;bounceend,0.5;zoomx,0.25;zoomy,0.25;sleep,30;linear,1.05;zoomx,0;zoomy,0),
      Texture= "sitting 3x1.png",
    },

	Def.Sprite{
        Name= "logo",
        OnCommand= cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffusealpha,0;zoom,0.45;sleep,0.0;linear,0.3;diffusealpha,1;zoom,0.45;sleep,1.8;linear,0.3;zoom,0.25;x,SCREEN_CENTER_X-145;y,SCREEN_CENTER_Y-165),
        Texture= "howtoplay.png",
      },

	  Def.Sprite{
        Name= "first",
        OnCommand= cmd(x,SCREEN_CENTER_X+150;y,SCREEN_CENTER_Y+50;zoomy,0;sleep,5;linear,0.8;zoom,0.55;sleep,3.5;linear,0.8;addy,100;diffusealpha,0),
        Texture= "crossover.png",
      },

	  Def.Sprite{
        Name= "second",
        OnCommand= cmd(x,SCREEN_CENTER_X+150;y,SCREEN_CENTER_Y+50;zoomy,0;sleep,11.5;linear,0.8;zoom,0.55;sleep,2.5;linear,0.8;addy,100;diffusealpha,0),
        Texture= "hold.png",
      },

	  Def.Sprite{
        Name= "third",
        OnCommand= cmd(x,SCREEN_CENTER_X+150;y,SCREEN_CENTER_Y+50;zoomy,0;sleep,16.5;linear,0.8;zoom,0.55;sleep,2.5;linear,0.8;addy,100;diffusealpha,0),
        Texture= "roll.png",
      },

	  Def.Sprite{
        Name= "fourth",
        OnCommand= cmd(x,SCREEN_CENTER_X+150;y,SCREEN_CENTER_Y+50;zoomy,0;sleep,22;linear,0.8;zoom,0.55;sleep,2.5;linear,0.8;addy,100;diffusealpha,0),
        Texture= "quad.png",
      },

	  Def.Sprite{
        Name= "final",
        OnCommand= cmd(x,SCREEN_CENTER_X+150;y,SCREEN_CENTER_Y+50;zoomy,0;sleep,28;linear,0.8;zoom,0.55;sleep,4;linear,0.8;addy,100;diffusealpha,0),
        Texture= "warning.png",
      },

};
