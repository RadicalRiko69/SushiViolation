local t = Def.ActorFrame {
	CodeMessageCommand = function(self, params)
		if params.Name == 'OpenOpList' then
			SCREENMAN:GetTopScreen():OpenOptionsList(params.PlayerNumber)
		end;
	end;
};


return t;
