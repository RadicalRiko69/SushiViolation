local t = Def.ActorFrame {};
-- Fade
t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(Center);
	LoadActor("sushi_dead") .. {
		InitCommand=cmd(zoom,0.4;rotationz,20);
	};
	LoadActor("lazy") .. {
		InitCommand=cmd(zoom,1;linear,10.5;zoom,10);
	};
	Def.Quad{
		InitCommand=cmd(zoomto,100000000000000,10000000000000000;addx,-10000000;diffuse,color("1,0,0,0");blend,Blend.Multiply);
		OnCommand=cmd(smooth,1;diffuse,color("0.75,0,0,0.75");decelerate,2;diffuse,color("0.15,0,0,1"));
	};
	Def.Quad{
		InitCommand=cmd(zoomto,100000000000000,10000000000000000;addx,-10000000;diffuse,color("1,0,0,0");diffusealpha,0);
		OnCommand=cmd(finishtweening;diffusealpha,1;decelerate,2;diffuse,color("1,0,0,0"));
	};
	LoadActor("big text") .. {
		InitCommand=cmd(zoom,10;linear,1.5;zoom,0.35);
	};
	LoadActor("game over")..{
		--There's some way to pause a sound for a while without queuecommand, right?
		OnCommand=cmd(queuecommand,"PlaySound");
		PlaySoundCommand=cmd(play);
	};
	LoadActor("music")..{
		--There's some way to pause a sound for a while without queuecommand, right?
		OnCommand=cmd(queuecommand,"PlaySound");
		PlaySoundCommand=cmd(play);
	};
};
return t
