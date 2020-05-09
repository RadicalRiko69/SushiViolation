local gc = Var "GameCommand";
local name = gc:GetName():lower();
local index = gc:GetIndex()-1;

local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
	LoadActor("disc_"..name) .. {
		InitCommand=cmd(y,SCREEN_CENTER_Y-35;x,150*index;zoom,0;bounceend,0.35;zoom,0.1);
		GainFocusCommand=cmd(stoptweening;glowshift;decelerate,0.5;zoom,0.15;spin;effectmagnitude,0,0,-200;effectperiod,40);
		LoseFocusCommand=cmd(stoptweening;stopeffect;decelerate,0.5;zoom,0.1;rotationz,0);
		OffCommand=cmd(linear,0.15;addy,125);
	};
};

-- Emblem Frame
t[#t+1] = Def.ActorFrame {
	FOV=90;
	InitCommand=cmd(zoom,0.9);
	-- Main Emblem
	LoadActor( gc:GetName() ) .. {
		InitCommand=cmd(diffusealpha,0);
		GainFocusCommand=cmd(finishtweening;stopeffect;diffusealpha,1;zoom,0.35;decelerate,0.5;pulse;effecttiming,0.75,0.125,0.125,0.75;effectmagnitude,0.95,1,1;);
		LoseFocusCommand=cmd(finishtweening;stopeffect;smooth,0.4;diffusealpha,0;zoom,1);
		OffFocusedCommand=cmd(finishtweening;stopeffect;decelerate,0.55;zoom,0.55;sleep,0.5;accelerate,0.5;zoom,2);
	};
};
-- Background!
t[#t+1] = Def.ActorFrame {
	LoadActor("Large_TV") .. {
		InitCommand=cmd(addy,17;addx,2;diffusealpha,0);
		GainFocusCommand=cmd(finishtweening;stopeffect;diffusealpha,1;zoom,0.23;decelerate,0.5;pulse;effecttiming,0.75,0.125,0.125,0.75;effectmagnitude,0.95,1,1;);
		LoseFocusCommand=cmd(finishtweening;stopeffect;smooth,0.4;diffusealpha,0;zoom,1);
		OffFocusedCommand=cmd(finishtweening;stopeffect;decelerate,0.55;zoom,0.36;addy,10;sleep,0.5;accelerate,0.5;zoom,1);
	};
};



t.GainFocusCommand=cmd(stoptweening;visible,true;zoom,1.1;decelerate,0.05;zoom,1);
t.LoseFocusCommand=cmd(stoptweening;visible,true;zoom,1);




return t