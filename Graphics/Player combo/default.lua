local player = Var "Player";
local judgementType = ActiveModifiers[pname(player)]["JudgmentType"];
local t = Def.ActorFrame {};


t[#t+1] = LoadActor("Number",player,judgementType)..{
	OnCommand=function(self)
		if judgementType == "Classic" then
			self:zoom(0);
			self:y(-2);
		else --Normal or Deviation
			self:zoom(1);
			self:y(20);
		end;
		
end
	
}
t[#t+1] = LoadActor("ComboLabel",player,judgementType)..{
	OnCommand=function(self)
		
		if judgementType == "Classic" then
			self:zoom(1.55);
			self:y(50);
		else --Normal or Deviation
			self:zoom(1.45);
			self:y(9);
		end;
		
end
}

return t;
