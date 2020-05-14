return Def.ActorFrame{

	LoadActor(THEME:GetPathG("","main bar"))..{
		InitCommand=cmd(diffusealpha,0.9;zoom,0.5;x,SCREEN_CENTER_X-80;y,SCREEN_CENTER_Y+160);
	};
}