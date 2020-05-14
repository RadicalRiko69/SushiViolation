return Def.ActorFrame{
	LoadActor(THEME:GetPathG("","close folder"))..{
	OnCommand=cmd(diffusealpha,0;sleep,1;accelerate,0.5;diffusealpha,1);
	SetMessageCommand=function(self,param)
		local group = SONGMAN:GetSongGroupBannerPath(param.Text);
		if FILEMAN:DoesFileExist(group) then
			self:Load(THEME:GetPathG("","close folder"));
			self:scaletoclipped(209,82);
		else
			self:Load(THEME:GetPathG("","close folder"));
			self:scaletoclipped(209,82);
		end;
	end;
	};
	
	
};