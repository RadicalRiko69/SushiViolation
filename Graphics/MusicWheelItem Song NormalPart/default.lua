local scaw = 209		--banner scale width
local scah = 82		--banner scale height
--reflect effect controls
local ftop = 1	--fadetop
local ctop = 0.25	--croptop
local alph = 0.5	--diffusealpha

return Def.ActorFrame{

	--Don't load a blank file you fucking mongoloid
	--[[LoadActor(THEME:GetPathG("MusicWheelItem Song","OverPart"))..{
		InitCommand=cmd(addy,(scah/2)+8;rotationx,180;diffusealpha,0.5;croptop,ctop;fadetop,ftop);
	};]]

	Def.Sprite{		--Normal song banner item
		Name="SongBanner";
		InitCommand=cmd(scaletoclipped,scaw,scah;diffusealpha,0);
		OnCommand=cmd(zoom,1;sleep,1;accelerate,0.5;diffusealpha,1);
		SetMessageCommand=function(self,param)
			local song = param.Song
			if song then
				local path = song:GetBannerPath();
				if path then
					self:Load(path)
				end;
			else
				self:Load(THEME:GetPathG("Common fallback", "banner")) --// load the fallback banner if we panic
			end;
		end;
	};



};
--]]
