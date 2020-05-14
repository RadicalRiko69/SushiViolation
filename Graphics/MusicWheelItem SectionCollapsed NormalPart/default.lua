return Def.ActorFrame{
	LoadActor(THEME:GetPathG("Common","fallback group"))..{
	OnCommand=cmd(diffusealpha,0;sleep,1;accelerate,0.5;diffusealpha,1);
	SetMessageCommand=function(self,param)
		local group = SONGMAN:GetSongGroupBannerPath(param.Text);
		if FILEMAN:DoesFileExist(group) then
			self:Load(group);
			self:scaletoclipped(209,82);
		else
			self:Load(THEME:GetPathG("Common","fallback group"));
			self:scaletoclipped(209,82);
		end;
	end;
	};
	
	
};