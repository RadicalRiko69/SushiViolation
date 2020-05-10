local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
  FOV=120;
  InitCommand=cmd(Center);
	LoadActor("NEW WARNING")..{
		InitCommand=cmd(zoom,0.445);
	};
};

t[#t+1] = Def.ActorFrame {
	InitCommand=function(self)
		--Reset the vars, player options, etc here.
		ResetGame();
	end;
  };

return t