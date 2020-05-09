return Def.ActorFrame{
	
	Def.Quad{ OnCommand=cmd(sleep,1000;visible,false), },
	
	--LoadActor("../Sweet Rain-bg.png")..{ OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT;), },
	
	Def.ActorFrame{ OnCommand=function(self) self:visible(true); space_bg = self end, ShowCommand=cmd(visible,true;), HideCommand=cmd(visible,false;),
		LoadActor("sky.png")..{ OnCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoom,1.5;), },
			
		LoadActor("clouds")..{ OnCommand=cmd(x,0;y,0;zoom,8;
		customtexturerect,0,0,2,2;texcoordvelocity,0.04,0;),},
	},
	
	
}