local comboLabel;
local player,judgementType = ...;
local ShowComboAt = THEME:GetMetric("Combo", "ShowComboAt");
local ShowMissComboAt = THEME:GetMetric("Combo", "ShowMissComboAt");
--local Pulse = THEME:GetMetric("Combo", "LabelPulseCommand");

local t = Def.ActorFrame {
	LoadActor(judgementType) .. {
		Name="ComboLabel";
		InitCommand=cmd(visible,false;zoom,0.25;y,-20);
		OnCommand=function(self)
			comboLabel = self;
			self:visible(false);
			--SCREENMAN:SystemMessage(tostring(comboLabel));
		end;
		ComboCommand=function(self, param)
			local iCombo = param.Misses or param.Combo;
			local iShowComboAt = (param.Misses and param.Misses > 0) and ShowMissComboAt or ShowComboAt;

			self:stoptweening();
			self:diffuse(color("#FFFFFF"));

			if param.Misses then
				if judgementType == "Classic" then
					self:visible(false);
					return
				else
					self:diffuse(color("#FF0000"));
				end
			end


			if judgementType == "Classic" then
				(cmd(stoptweening;diffusealpha,1;zoom,0.55;linear,0.099;zoom,0.5))(self,param);
			else --if GetUserPref("UserPrefJudgmentType") == "Normal" or GetUserPref("UserPrefJudgmentType") == "Deviation" then
				(cmd(stoptweening;diffusealpha,1;zoom,0.365;linear,0.035;zoom,0.35;sleep,0.495;linear,0.25;diffusealpha,0))(self,param);
			end

			-- Do the above even if we're not going to show the combo, so the
			-- tweening always matches up with the judgement.
			if not iCombo or iCombo < iShowComboAt then
				self:visible(false);
			else
				self:visible(true);
			end;
		end;
	};

	OnCommand = function(self)
		-- Set the frame around the number as the Combo actor, so it's
		-- moved by ComboTransformCommand.  Don't set the number itself,
		-- since we want to set an explicit zoom on it, and ComboTransformCommand
		-- will override the whole TweenState.
		local player = self:GetParent();
		--player:SetActorWithComboPosition( c.NumberFrame );
	end;
};
	


return t;
