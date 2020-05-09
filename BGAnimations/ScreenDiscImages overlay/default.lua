return Def.ActorFrame {
  Def.Sprite{
        Name= "title background",
        InitCommand=cmd(zoom,0.235);
        OnCommand= cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffusealpha,0;sleep,9;linear,1;diffusealpha,1;sleep,20;diffusealpha,0),
        Texture= "warp BG.jpg",
      },
  Def.Sprite{
        Name= "messages background",
        OnCommand= cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoom,8;diffusealpha,0;sleep,6;linear,1;diffusealpha,1;sleep,7;diffusealpha,0),
        Texture= "black.png",
      },
  

      --Introduction: Simfile series
    
      --SV1
      Def.Sprite{
        Name= "simfile pack",
        OnCommand= cmd(zoom,0.6;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;sleep,1;linear,0.5;zoom,1;diffusealpha,0),
        Texture= "Sushi Violation.png",
      },
      --frame
      Def.Sprite{
        Name= "simfile pack",
        OnCommand= cmd(zoom,0.52;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;sleep,1;linear,0.65;zoom,1;diffusealpha,0),
        Texture= "metal frame.png",
      },
      Def.Sprite{
        Name= "flash",
        OnCommand= cmd(zoom,5;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;sleep,0.1;linear,0.5;zoomx,0;zoomy,2;diffusealpha,0),
        Texture= "updatecoin.png",
      },



      --SV2
      Def.Sprite{
        Name= "simfile pack",
        OnCommand= cmd(zoom,0;sleep,1.9;zoom,0.6;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;sleep,1;linear,0.5;zoom,1;diffusealpha,0),
        Texture= "Sushi Violation 2.png",
      },
      --frame
      Def.Sprite{
        Name= "simfile pack",
        OnCommand= cmd(zoom,0;sleep,1.9;zoom,0.52;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;sleep,1;linear,0.65;zoom,1;diffusealpha,0),
        Texture= "metal frame.png",
      },
      Def.Sprite{
        Name= "flash",
        OnCommand= cmd(zoom,5;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffusealpha,0;sleep,1.8;sleep,0.1;diffusealpha,1;linear,0.5;zoomx,0;zoomy,2;diffusealpha,0),
        Texture= "updatecoin.png",
      },
      


      --SVEX
      Def.Sprite{
        Name= "simfile pack",
        OnCommand= cmd(zoom,0;sleep,3.8;zoom,0.6;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;sleep,1;linear,0.5;zoom,1;diffusealpha,0),
        Texture= "Sushi Violation EX.png",
      },
      --frame
      Def.Sprite{
        Name= "simfile pack",
        OnCommand= cmd(zoom,0;sleep,3.8;zoom,0.52;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;sleep,1;linear,0.65;zoom,1;diffusealpha,0),
        Texture= "metal frame.png",
      },
      Def.Sprite{
        Name= "flash",
        OnCommand= cmd(zoom,5;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffusealpha,0;sleep,3.7;sleep,0.1;diffusealpha,1;linear,0.5;zoomx,0;zoomy,2;diffusealpha,0),
        Texture= "updatecoin.png",
      },



      --SV3
      Def.Sprite{
        Name= "simfile pack",
        OnCommand= cmd(zoom,0;sleep,5.6;zoom,0.6;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;sleep,1;linear,0.5;zoom,1;diffusealpha,0),
        Texture= "Sushi Violation 3.png",
      },
      --frame
      Def.Sprite{
        Name= "simfile pack",
        OnCommand= cmd(zoom,0;sleep,5.6;zoom,0.52;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;sleep,1;linear,0.65;zoom,1;diffusealpha,0),
        Texture= "metal frame.png",
      },
      Def.Sprite{
        Name= "flash",
        OnCommand= cmd(zoom,5;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffusealpha,0;sleep,5.5;sleep,0.1;diffusealpha,1;linear,0.5;zoomx,0;zoomy,2;diffusealpha,0),
        Texture= "updatecoin.png",
      },


      --Presenting: The 1st Sushi Dance Floor
      Def.Sprite{
        Name= "messages part one",
        OnCommand= cmd(diffusealpha,0;zoom,8;sleep,7;linear,1;diffusealpha,1;zoom,0.6;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;sleep,1;linear,0.5;zoom,1;diffusealpha,0),
        Texture= "newest.png",
      },
      Def.Sprite{
        Name= "messages part one",
        OnCommand= cmd(diffusealpha,0;zoom,8;sleep,9;linear,1;diffusealpha,1;zoom,0.6;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;sleep,1;linear,0.5;zoom,1;diffusealpha,0),
        Texture= "is.png",
      },
      Def.Sprite{
        Name= "messages part one",
        OnCommand= cmd(diffusealpha,0;zoom,8;sleep,11;linear,1;diffusealpha,1;zoom,0.6;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;sleep,1;linear,0.5;zoom,1;diffusealpha,0),
        Texture= "first.png",
      },
      Def.Sprite{
        Name= "logo",
        OnCommand= cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffusealpha,0;zoom,10;sleep,14;linear,0.5;diffusealpha,1;zoom,0.5;sleep,3;linear,0.5;zoom,1;diffusealpha,0),
        Texture= "SV2018 logo.png",
      },


      Def.Sprite{
        Name= "flash",
        OnCommand= cmd(zoom,0;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;sleep,13;linear,1;zoom,20;sleep,0.05;linear,0.5;diffusealpha,0),
        Texture= "updatecoin.png",
      },

     
      Def.Sprite{
        Name= "simfile pack background",
        InitCommand=cmd(zoom,.7);
        OnCommand= cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffusealpha,0;hibernate,18;linear,0.25;diffusealpha,1;sleep,26;linear,0.5;diffusealpha,0),
        Texture= "Sushi video.mp4",
      },
      Def.Sprite{
        Name= "simfile pack background",
        InitCommand=cmd(scaletoclipped,SCREEN_WIDTH,SCREEN_HEIGHT);
        OnCommand= cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffusealpha,0;sleep,51;linear,0.5;diffusealpha,1;sleep,13;linear,1;diffusealpha,0),
        Texture= "movie",
      },
      

      --features
      Def.Sprite{
        Name= "features",
        OnCommand= cmd(x,SCREEN_CENTER_X-700;y,SCREEN_CENTER_Y-100;zoom,0.5;sleep,45;linear,0.5;addx,725;diffusealpha,1;sleep,2;linear,0.5;addx,800;diffusealpha,0),
        Texture= "basicmode.png",
      },
      Def.Sprite{
        Name= "features",
        OnCommand= cmd(x,SCREEN_CENTER_X+700;y,SCREEN_CENTER_Y+100;zoom,0.5;sleep,45;linear,0.5;addx,-725;diffusealpha,1;sleep,2;linear,0.5;addx,-800;diffusealpha,0),
        Texture= "over150.png",
      },
      Def.Sprite{
        Name= "features",
        OnCommand= cmd(x,SCREEN_CENTER_X+700;y,SCREEN_CENTER_Y+100;zoom,0.5;sleep,48;linear,0.5;addx,-725;diffusealpha,1;sleep,2;linear,0.5;addx,-800;diffusealpha,0),
        Texture= "missionmode.png",
      },
      Def.Sprite{
        Name= "features",
        OnCommand= cmd(x,SCREEN_CENTER_X-700;y,SCREEN_CENTER_Y-100;zoom,0.5;sleep,48;linear,0.5;addx,725;diffusealpha,1;sleep,2;linear,0.5;addx,800;diffusealpha,0),
        Texture= "brandnew.png",
      },
      Def.Sprite{
      Name= "baby",
      Frames= {
        {Frame= 0, Delay= 51.500},
        {Frame= 1, Delay= 0.200},
        {Frame= 2, Delay= 0.200},
        {Frame= 3, Delay= 0.200},
        {Frame= 4, Delay= 0.200},
        {Frame= 5, Delay= 0.200},
        {Frame= 6, Delay= 0.200},
        {Frame= 7, Delay= 0.200},
        {Frame= 8, Delay= 0.200},
        {Frame= 9, Delay= 0.200},
        {Frame= 10, Delay= 0.200},
        {Frame= 11, Delay= 0.200},
        {Frame= 12, Delay= 0.200},
        {Frame= 13, Delay= 0.200},
        {Frame= 14, Delay= 0.200},
        {Frame= 15, Delay= 0.200},
        {Frame= 16, Delay= 0.200},
        {Frame= 17, Delay= 0.200},
        {Frame= 18, Delay= 0.200},
        {Frame= 19, Delay= 0.200},
        {Frame= 20, Delay= 0.200},
        {Frame= 21, Delay= 0.200},
        {Frame= 22, Delay= 0.200},
        {Frame= 23, Delay= 0.200},
        {Frame= 24, Delay= 0.200},
        {Frame= 25, Delay= 0.200},
        {Frame= 26, Delay= 0.200},
        {Frame= 27, Delay= 0.200},
        {Frame= 28, Delay= 0.200},
        {Frame= 29, Delay= 0.200},
        {Frame= 30, Delay= 0.200},
        {Frame= 31, Delay= 0.200},
        {Frame= 32, Delay= 0.200},
        {Frame= 33, Delay= 0.200},
        {Frame= 34, Delay= 0.200},
        {Frame= 35, Delay= 0.200},
        {Frame= 36, Delay= 0.200},
        {Frame= 37, Delay= 0.100},
        {Frame= 38, Delay= 0.100},
        {Frame= 39, Delay= 0.100},
        {Frame= 40, Delay= 0.100},
        {Frame= 41, Delay= 0.100},
        {Frame= 42, Delay= 0.100},
        {Frame= 43, Delay= 0.100},
        {Frame= 44, Delay= 0.100},
        {Frame= 45, Delay= 0.100},
        {Frame= 46, Delay= 0.100},
        {Frame= 47, Delay= 0.100},
        {Frame= 48, Delay= 0.100},
        {Frame= 49, Delay= 0.100},
        {Frame= 50, Delay= 0.100},
        {Frame= 51, Delay= 0.100},
        {Frame= 52, Delay= 0.100},
        {Frame= 53, Delay= 0.100},
        {Frame= 54, Delay= 0.100},
        {Frame= 55, Delay= 0.100},
        {Frame= 56, Delay= 0.100},
        {Frame= 57, Delay= 0.100},
        {Frame= 58, Delay= 0.100},
        {Frame= 59, Delay= 0.100},
        {Frame= 60, Delay= 0.100},
        {Frame= 61, Delay= 0.100},
        {Frame= 62, Delay= 0.100},
        {Frame= 63, Delay= 0.100},
        {Frame= 64, Delay= 0.100},
        {Frame= 65, Delay= 0.100},
        {Frame= 66, Delay= 0.100},
        {Frame= 67, Delay= 0.100},
        {Frame= 68, Delay= 0.100},
        {Frame= 69, Delay= 0.100},
        {Frame= 70, Delay= 0.100},
        {Frame= 71, Delay= 0.100},
        {Frame= 72, Delay= 0.100},
        {Frame= 73, Delay= 0.100},
        {Frame= 74, Delay= 0.100},
        {Frame= 75, Delay= 0.100},
        {Frame= 76, Delay= 0.100},
        {Frame= 77, Delay= 0.100},
        {Frame= 78, Delay= 0.100},
        {Frame= 79, Delay= 0.100},
      },
        OnCommand= cmd(diffusealpha,0;sleep,51.3;zoom,0.5;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;sleep,0;diffusealpha,1;linear,15;zoom,1.1;sleep,4;diffusealpha,0),
        Texture= "sushi song list 10x8.png",
      },
      --Def.Sprite{
      --  Name= "flash",
      --  OnCommand= cmd(zoom,15;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffusealpha,0;sleep,52.2;sleep,0.1;diffusealpha,1;linear,1.1;diffusealpha,0),
      --  Texture= "updatecoin.png",
      --},

      
      Def.Sprite{
        Name= "messages background",
        OnCommand= cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoom,8;diffusealpha,0;sleep,62;linear,1;diffusealpha,1),
        Texture= "black.png",
      },
      Def.Sprite{
        Name= "messages background",
        OnCommand= cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoom,0.445;diffusealpha,0;sleep,62.5;linear,0.25;diffusealpha,1;sleep,1;diffusealpha,0),
        Texture= "1-can.png",
      },
      Def.Sprite{
        Name= "messages background",
        OnCommand= cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoom,0.445;diffusealpha,0;sleep,62.83;diffusealpha,1;sleep,1;diffusealpha,0),
        Texture= "2-you.png",
      },
      Def.Sprite{
        Name= "messages background",
        OnCommand= cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoom,0.445;diffusealpha,0;sleep,63.2;diffusealpha,1;sleep,1;diffusealpha,0),
        Texture= "3-pass.png",
      },
      Def.Sprite{
        Name= "messages background",
        OnCommand= cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoom,0.445;diffusealpha,0;sleep,63.65;diffusealpha,1;sleep,1;diffusealpha,0),
        Texture= "4-the.png",
      },
      Def.Sprite{
        Name= "messages background",
        OnCommand= cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoom,0.445;diffusealpha,0;sleep,64;diffusealpha,1;sleep,1;diffusealpha,0),
        Texture= "5-sushi.png",
      },
      Def.Sprite{
        Name= "messages background",
        OnCommand= cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoom,0.445;diffusealpha,0;sleep,64.2;diffusealpha,1;sleep,1;diffusealpha,0),
        Texture= "6-dance.png",
      },
      Def.Sprite{
        Name= "messages background",
        OnCommand= cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoom,0.445;diffusealpha,0;sleep,64.42;diffusealpha,1;sleep,1;diffusealpha,0),
        Texture= "7-floor.png",
      },
      Def.Sprite{
        Name= "title background",
        InitCommand=cmd(zoom,0.235);
        OnCommand= cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffusealpha,0;sleep,65;linear,1;diffusealpha,1),
        Texture= "warp BG.jpg",
      },
      Def.Sprite{
        Name= "logo",
        OnCommand= cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;diffusealpha,0;zoom,10;sleep,65;linear,0.5;diffusealpha,1;zoom,0.5),
        Texture= "SV2018 logo.png",
      },
      Def.Sprite{
        Name= "messages background",
        OnCommand= cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoom,8;diffusealpha,0;sleep,69;diffusealpha,1),
        Texture= "black.png",
      },
};
