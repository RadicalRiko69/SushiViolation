
return Def.ActorFrame{
	LoadActor("folder")..{
	SetMessageCommand=function(self,param)
		local group = SONGMAN:GetSongGroupBannerPath(param.Text);
		if FILEMAN:DoesFileExist(group) then
			self:Load(group);
			self:scaletoclipped(209,82);
		end;
	end;
	};
	
	Def.Quad{
		InitCommand=cmd(horizalign,center;zoomto,209,82; diffuseshift; effectoffset,1; effectperiod, 1; effectcolor1, 0,0,0,0; effectcolor2, 0,0,0,0.25;x,0;y,0;);
		SetMessageCommand=function(self,param)
			if FILEMAN:DoesFileExist(SONGMAN:GetSongGroupBannerPath(param.Text)) then
				self:visible(true);
			else
				self:visible(false);
			end;
		end;
	};
	
};