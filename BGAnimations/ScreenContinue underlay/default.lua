local t = Def.ActorFrame {};
-- Fade
t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(Center);
	LoadActor("sushi_dead") .. {
		InitCommand=cmd(zoom,0.4;y,-800;sleep,0.5;linear,0.25;addy,800;linear,0.05;addy,-5;linear,0.05;addy,5;rotationz,20);
	};
	LoadActor("lazy") .. {
		InitCommand=cmd(zoom,10;linear,25;zoom,1);
	};
	LoadActor("continue")..{
		--There's some way to pause a sound for a while without queuecommand, right?
		OnCommand=cmd(sleep,0.5;queuecommand,"PlaySound");
		PlaySoundCommand=cmd(play);
	};
};
return t
