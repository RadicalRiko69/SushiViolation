local t = Def.ActorFrame{
	Def.Banner{
		Name="SongBackground";
		PlayerJoinedMessageCommand=cmd(playcommand,"On");
		SetMessageCommand=function(self,params)
		self:LoadFromCourse(params.Course);
		self:scaletoclipped(300,185);
		self:zoom(0.75);

		--InitCommand=cmd(zoom,0;sleep,0.5;linear,0.5;zoomy,0.5;draworder,15;scaletoclipped,418,164;);
		--SongChosenMessageCommand=cmd(linear,0;);
		--SongUnchosenMessageCommand=cmd(linear,0;zoom,.5;);
		--TwoPartConfirmCanceledMessageCommand=cmd(linear,0;zoom,.5;);
		--OnCommand=cmd(diffusealpha,0;zoomy,0;linear,0.5;diffusealpha,1;zoom,.5;);
		--PlayerJoinedMessageCommand=cmd(playcommand,"On");
		--SetMessageCommand=function(self,params)
		--self:LoadFromSongBanner(params.Song);
		--self:scaletoclipped(418,164);
		--self:zoom(0.5);
			
		end;
	}
}

return t;

