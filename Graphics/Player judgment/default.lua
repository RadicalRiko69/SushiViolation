local player = Var "Player";
local judgementType = ActiveModifiers[pname(player)]["JudgmentType"];
local t = Def.ActorFrame {


	LoadActor("Timing",player,judgementType) .. {
		OnCommand=function(self)
			if judgementType == "Classic" then
				self:y(-15);
			else
				self:y(-10);
			end;
			
		end;
	};

	--[[
	LoadActor("Slider",player) .. {
		InitCommand=cmd(y,110;visible,GetUserPrefB("UserPrefDetailedPrecision"));
	};
	]]
};

return t;
