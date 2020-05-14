local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
  FOV=120;
  InitCommand=cmd(Center);
	Def.ActorFrame{
		LoadActor("background-color")..{
			OnCommand=cmd(zoom,2;spin;effectmagnitude, 0,0,-10;effectperiod,10)
		};
	};
	Def.ActorFrame{
		LoadActor("background-color")..{
			OnCommand=cmd(zoom,2;diffusealpha,0.1;spin;effectmagnitude, 0,0,-200;effectperiod,10)
		};
	};
	Def.ActorFrame{
		LoadActor("background-color")..{
			OnCommand=cmd(zoom,2;diffusealpha,0.5;spin;effectmagnitude, 0,0,-30;effectperiod,10)
		};
	};
	
	Def.ActorFrame {
		InitCommand=cmd(hide_if,hideFancyElements;);
		LoadActor("_checkerboard") .. {
			InitCommand=cmd(y,SCREEN_CENTER_Y+100;rotationy,-30;rotationz,180;rotationx,90/4*3.5;zoomto,SCREEN_WIDTH*4,SCREEN_HEIGHT*2;customtexturerect,0,0,SCREEN_WIDTH*4/256,SCREEN_HEIGHT*4/256);
			OnCommand=cmd(texcoordvelocity,0,-0.5;diffuse,color("#FFFFFF");fadetop,2);
		};
	};
	Def.ActorFrame {
		InitCommand=cmd(hide_if,hideFancyElements;);
		LoadActor("_checkerboard") .. {
			InitCommand=cmd(y,SCREEN_CENTER_Y-750;rotationy,-30;rotationz,180;rotationx,90/4*3.5;zoomto,SCREEN_WIDTH*4,SCREEN_HEIGHT*2;customtexturerect,0,0,SCREEN_WIDTH*4/256,SCREEN_HEIGHT*4/256);
			OnCommand=cmd(texcoordvelocity,0,-0.5;diffuse,color("#FFFFFF");fadetop,2);
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