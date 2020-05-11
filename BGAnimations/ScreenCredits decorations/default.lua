local t = Def.ActorFrame {};
-- Fade
t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(Center;addy,100);
	LoadActor("cliff") .. {
		InitCommand=cmd(zoom,0.75;x,-800;sleep,300;decelerate,5;addx,550);
	};
};

t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(Center);
	LoadActor("thank you") .. {
		InitCommand=cmd(diffusealpha,0;zoom,0.35;sleep,320;decelerate,5;diffusealpha,1);
	};
};
return t
