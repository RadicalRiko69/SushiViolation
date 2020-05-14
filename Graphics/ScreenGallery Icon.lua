local gc = Var "GameCommand";
local Name = gc:GetName();
local Index = gc:GetIndex();

local previewWidth = SCREEN_CENTER_X;
local previewHeight = SCREEN_CENTER_Y;

local t = Def.ActorFrame{
	Name="PreviewFrame";
	InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y*0.85);
};

local function TitleMenuItem(text,focused)
	if focused == nil then focused = false; end;
	local textColor = focused and color("#FFFFFF") or color("#888888");
	return LoadFont("_russellsquare 40px")..{
		Text=text;
		InitCommand=cmd(zoom,0.45;strokecolor,Color("Outline");diffuse,textColor);
		GainFocusCommand=cmd(stoptweening;decelerate,0.5;diffusealpha,1);
		LoseFocusCommand=cmd(stoptweening;accelerate,0.5;diffusealpha,0);
	};
end;

local previews = {
	Sushi = Def.ActorFrame{
		LoadActor(THEME:GetPathG("","bio/sushi"))..{
			InitCommand=cmd(zoom,0.35;addx,200);
			GainFocusCommand=cmd(stoptweening;decelerate,0.15;diffusealpha,1);
			LoseFocusCommand=cmd(stoptweening;accelerate,0.15;diffusealpha,0);
		};
	};
	Doctor = Def.ActorFrame{
		LoadActor(THEME:GetPathG("","bio/doctor"))..{
			InitCommand=cmd(zoom,0.35;addx,200);
			GainFocusCommand=cmd(stoptweening;decelerate,0.15;diffusealpha,1);
			LoseFocusCommand=cmd(stoptweening;accelerate,0.15;diffusealpha,0);
		};
	};
	Saki = Def.ActorFrame{
		LoadActor(THEME:GetPathG("","bio/saki"))..{
			InitCommand=cmd(zoom,0.35;addx,200);
			GainFocusCommand=cmd(stoptweening;decelerate,0.15;diffusealpha,1);
			LoseFocusCommand=cmd(stoptweening;accelerate,0.15;diffusealpha,0);
		};
	};
	Miso = Def.ActorFrame{
		LoadActor(THEME:GetPathG("","bio/miso"))..{
			InitCommand=cmd(zoom,0.35;addx,200);
			GainFocusCommand=cmd(stoptweening;decelerate,0.15;diffusealpha,1);
			LoseFocusCommand=cmd(stoptweening;accelerate,0.15;diffusealpha,0);
		};
	};
	Maddie = Def.ActorFrame{
		LoadActor(THEME:GetPathG("","bio/maddie"))..{
			InitCommand=cmd(zoom,0.35;addx,200);
			GainFocusCommand=cmd(stoptweening;decelerate,0.15;diffusealpha,1);
			LoseFocusCommand=cmd(stoptweening;accelerate,0.15;diffusealpha,0);
		};
	};
	Sam = Def.ActorFrame{
		LoadActor(THEME:GetPathG("","bio/sam"))..{
			InitCommand=cmd(zoom,0.35;addx,200);
			GainFocusCommand=cmd(stoptweening;decelerate,0.15;diffusealpha,1);
			LoseFocusCommand=cmd(stoptweening;accelerate,0.15;diffusealpha,0);
		};
	};
	Exit = Def.ActorFrame{
		LoadActor(THEME:GetPathG("","bio/exit"))..{
			InitCommand=cmd(zoom,0.35;addx,200);
			GainFocusCommand=cmd(stoptweening;decelerate,0.15;diffusealpha,1);
			LoseFocusCommand=cmd(stoptweening;accelerate,0.15;diffusealpha,0);
		};
		LoadActor(THEME:GetPathG("","bio/frame"))..{
			InitCommand=cmd(zoom,0.35;addx,200);
		};
	};
};

t[#t+1] = previews[Name];

t[#t+1] = LoadFont("_russellsquare 40px")..{
	Name="Explanation";
	Text=Screen.String("Explanation-"..Name);
	InitCommand=cmd(diffusealpha,0;addx,-275;y,SCREEN_CENTER_Y-100;halign,0;valign,0;zoom,0.3;wrapwidthpixels,1300;NoStroke;shadowlength,1;sleep,1;linear,0.5;diffusealpha,1);
	GainFocusCommand=cmd(stoptweening;decelerate,0.15;diffusealpha,1);
	LoseFocusCommand=cmd(stoptweening;accelerate,0.15;diffusealpha,0);
};

t[#t+1] = LoadFont("_eurostile outline")..{
	Name="Age";
	Text="Age: "..Screen.String("Age-"..Name);
	InitCommand=cmd(diffusealpha,0;addx,165;y,SCREEN_CENTER_Y-100;halign,0;valign,0;zoom,0.45;wrapwidthpixels,1300;NoStroke;shadowlength,1;sleep,1;linear,0.5;diffusealpha,1);
	GainFocusCommand=cmd(stoptweening;decelerate,0.15;diffusealpha,1);
	LoseFocusCommand=cmd(stoptweening;accelerate,0.15;diffusealpha,0);
};

t[#t+1] = LoadFont("_eurostile outline")..{
	Name="Sex";
	Text="Sex: "..Screen.String("Sex-"..Name);
	InitCommand=cmd(diffusealpha,0;addx,165;y,SCREEN_CENTER_Y-80;halign,0;valign,0;zoom,0.45;wrapwidthpixels,1300;NoStroke;shadowlength,1;sleep,1;linear,0.5;diffusealpha,1);
	GainFocusCommand=cmd(stoptweening;decelerate,0.15;diffusealpha,1);
	LoseFocusCommand=cmd(stoptweening;accelerate,0.15;diffusealpha,0);
};

t[#t+1] = LoadFont("_eurostile outline")..{
	Name="Species";
	Text="Species: "..Screen.String("Species-"..Name);
	InitCommand=cmd(diffusealpha,0;addx,165;y,SCREEN_CENTER_Y-60;halign,0;valign,0;zoom,0.45;wrapwidthpixels,1300;NoStroke;shadowlength,1;sleep,1;linear,0.5;diffusealpha,1);
	GainFocusCommand=cmd(stoptweening;decelerate,0.15;diffusealpha,1);
	LoseFocusCommand=cmd(stoptweening;accelerate,0.15;diffusealpha,0);
};

t[#t+1] = LoadFont("_eurostile outline")..{
	Name="Likes";
	Text="Likes:\n"..Screen.String("Likes-"..Name);
	InitCommand=cmd(diffusealpha,0;addx,165;y,SCREEN_CENTER_Y-40;halign,0;valign,0;zoom,0.45;wrapwidthpixels,1300;NoStroke;shadowlength,1;sleep,1;linear,0.5;diffusealpha,1);
	GainFocusCommand=cmd(stoptweening;decelerate,0.15;diffusealpha,1);
	LoseFocusCommand=cmd(stoptweening;accelerate,0.15;diffusealpha,0);
};

t[#t+1] = LoadFont("_eurostile outline")..{
	Name="Dislikes";
	Text="Dislikes:\n"..Screen.String("Dislikes-"..Name);
	InitCommand=cmd(diffusealpha,0;addx,165;y,SCREEN_CENTER_Y-10;halign,0;valign,0;zoom,0.45;wrapwidthpixels,1300;NoStroke;shadowlength,1;sleep,1;linear,0.5;diffusealpha,1);
	GainFocusCommand=cmd(stoptweening;decelerate,0.15;diffusealpha,1);
	LoseFocusCommand=cmd(stoptweening;accelerate,0.15;diffusealpha,0);
};


return t;