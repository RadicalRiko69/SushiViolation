-- Timerseconds for this screen is controlled by:
-- NextStageSleepTime+WallpaperSleepTime values in ScreenProfileSaveOverlay
-- Wallpaper transition system by ROAD24 and NeobeatIKK

local t =							Def.ActorFrame{};

function getRandomWall()
-- Cortes quiere random wallpaper, este script cargara de forma aleatoria
--  una imagen dentro del folder _RandomWalls en BGAnimations
	local sImagesPath = THEME:GetPathB("","Wallpapers");
	local sRandomWalls = FILEMAN:GetDirListing(sImagesPath.."/",false,true);
	-- El random seed
	 math.randomseed(Hour()*3600+Second());
	return sRandomWalls[math.random(#sRandomWalls)];
end;

	t[#t+1] = Def.ActorFrame{
		LoadActor(getRandomWall())..{
			InitCommand=cmd(Center;zoomto,854,480);
		};
	};

	t[#t+1] = LoadActor(THEME:GetPathG("","logo"))..{
		InitCommand=cmd(xy,SCREEN_LEFT+150,SCREEN_BOTTOM-50;zoom,0.25);
	};

	t[#t+1] = LoadActor(THEME:GetPathG("","disc"))..{
		InitCommand=cmd(xy,SCREEN_RIGHT-70,SCREEN_BOTTOM-60;zoom,0.25;spin;effectmagnitude, 0,0,200;effectperiod,100);
	};


return t
