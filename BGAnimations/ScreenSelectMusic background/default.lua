local t = Def.ActorFrame {};

--It's the same as the regular ScreenWithElements BG but has an animation specifically for this screen.

t[#t+1] = Def.ActorFrame {
  FOV=120;
  InitCommand=cmd(Center);
	Def.ActorFrame{
		LoadActor("background-color")..{
			OnCommand=cmd(zoom,2;spin;effectmagnitude, 0,0,-10;effectperiod,1);
			SongChosenMessageCommand=cmd(spin;effectmagnitude, 0,0,-50;);
			SongUnchosenMessageCommand=cmd(spin;effectmagnitude, 0,0,-10;);
			OffCommand=cmd(sleep,1.5;decelerate,2;zoom,10;sleep,2;queuecommand,"On");
		};
	};
	Def.ActorFrame{
		LoadActor("background-color")..{
			OnCommand=cmd(zoom,2;diffusealpha,0.1;spin;effectmagnitude, 0,0,-200;effectperiod,1);
			SongChosenMessageCommand=cmd(spin;effectmagnitude, 0,0,-300;);
			SongUnchosenMessageCommand=cmd(spin;effectmagnitude, 0,0,-200;);
			OffCommand=cmd(sleep,1.5;decelerate,2;zoom,10;sleep,2;queuecommand,"On");
		};
	};
	Def.ActorFrame{
		LoadActor("background-color")..{
			OnCommand=cmd(zoom,2;diffusealpha,0.5;spin;effectmagnitude, 0,0,-30;effectperiod,1);
			SongChosenMessageCommand=cmd(spin;effectmagnitude, 0,0,-50;);
			SongUnchosenMessageCommand=cmd(spin;effectmagnitude, 0,0,-30;);
			OffCommand=cmd(sleep,1.5;decelerate,2;zoom,10;sleep,2;queuecommand,"On");
		};
	};
	
	Def.ActorFrame {
		InitCommand=cmd(hide_if,hideFancyElements;);
		LoadActor("_checkerboard") .. {
			InitCommand=cmd(y,SCREEN_CENTER_Y+100;rotationy,-30;rotationz,180;rotationx,90/4*3.5;zoomto,SCREEN_WIDTH*4,SCREEN_HEIGHT*2;customtexturerect,0,0,SCREEN_WIDTH*4/256,SCREEN_HEIGHT*4/256);
			OnCommand=cmd(texcoordvelocity,0,-0.5;diffuse,color("#FFFFFF");fadetop,2);
			SongChosenMessageCommand=cmd(texcoordvelocity,0,-2);
			SongUnchosenMessageCommand=cmd(texcoordvelocity,0,-0.5);
            OffCommand=cmd(sleep,1.5;decelerate,1;zoom,50;texcoordvelocity,0,-2;diffuse,color("#FFFFFF");fadetop,10;sleep,2;queuecommand,"On";queuecommand,"Init");
		};
	};
	Def.ActorFrame {
		InitCommand=cmd(hide_if,hideFancyElements;);
		LoadActor("_checkerboard") .. {
			InitCommand=cmd(y,SCREEN_CENTER_Y-750;rotationy,-30;rotationz,180;rotationx,90/4*3.5;zoomto,SCREEN_WIDTH*4,SCREEN_HEIGHT*2;customtexturerect,0,0,SCREEN_WIDTH*4/256,SCREEN_HEIGHT*4/256);
			OnCommand=cmd(texcoordvelocity,0,-0.5;diffuse,color("#FFFFFF");fadetop,2);
			SongChosenMessageCommand=cmd(texcoordvelocity,0,-2);
			SongUnchosenMessageCommand=cmd(texcoordvelocity,0,-0.5);
            OffCommand=cmd(sleep,1.5;decelerate,1;zoom,50;texcoordvelocity,0,-2;diffuse,color("#FFFFFF");fadetop,10;sleep,2;queuecommand,"On";queuecommand,"Init");
		};
	};
	--[[Def.ActorFrame{
		LoadActor("circle")..{
			OnCommand=cmd(zoom,1;spin;effectmagnitude, 0,40,-100;effectperiod,40)
		};
	};
	Def.ActorFrame{
		LoadActor("circle")..{
			OnCommand=cmd(zoom,0.5;spin;effectmagnitude, -40,0,-600;effectperiod,40)
		};
	};
	LoadActor("text" )..{
		Name="idk",
		OnCommand=cmd(zoom,0.45; bob;effectmagnitude,0,10,0;effectperiod,40; diffuseshift; effectperiod, 4; effectcolor1, 1,1,1,1; effectcolor2, 1,1,1,0;
    diffusealpha,1)
	},--]]
};

return t