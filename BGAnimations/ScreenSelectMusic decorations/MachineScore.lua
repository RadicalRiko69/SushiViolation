local player = ...
assert(player, "SSM MachineScore: Need a player, dingus");

return Def.ActorFrame{

	Def.Quad{
		InitCommand=cmd(diffuse,color("0,0,0,.8");setsize,110,15;fadeleft,.1;faderight,.1;y,-26);
	};
	LoadFont("_@dfghsgothic-w9 25px")..{
		Text=THEME:GetString("ScreenSelectMusic","MachineBest");
		InitCommand=cmd(shadowlength,0.8;y,-27;zoom,.5);
	};
	

	Def.Sprite{
		InitCommand=cmd(x,-85;horizalign,left;zoom,0.1;fadetop,0;);
		CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
		['CurrentSteps'..ToEnumShortString(player)..'ChangedMessageCommand']=cmd(playcommand,"Set");
		PlayerJoinedMessageCommand=cmd(queuecommand,"Set");
		SetCommand=function(self)
			local song = GAMESTATE:GetCurrentSong();
			if song then
				self:diffusealpha(1);
				profile = PROFILEMAN:GetMachineProfile();
				steps = GAMESTATE:GetCurrentSteps(player);
				if not steps then return end;
				scorelist = profile:GetHighScoreList(GAMESTATE:GetCurrentSong(),steps);
				assert(scorelist);
				local scores = scorelist:GetHighScores();
				local topscore = scores[1];

					if topscore then

						local dancepoints = topscore:GetPercentDP()*100
						local misses = topscore:GetTapNoteScore("TapNoteScore_Miss")+topscore:GetTapNoteScore("TapNoteScore_CheckpointMiss")
						local grade = GetGradeFromDancePoints(dancepoints);
						--SCREENMAN:SystemMessage(grade);
						self:Load(THEME:GetPathG("","GradeDisplayPane/"..grade));
				else
					--if no score
					self:diffusealpha(0);
				end
			else
				--if no song
				self:diffusealpha(0);
			end;
		end;
	};

	--(((math.floor(topscore:GetPercentDP()*100000))/1000).."%");

		LoadFont("_@dfghsgothic-w9 25px")..{
			InitCommand=cmd(shadowlength,0.8;horizalign,right;x,50;y,-12;zoomx,0.39;zoomy,0.37;queuecommand,"Set");
			CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
			['CurrentSteps'..ToEnumShortString(player)..'ChangedMessageCommand']=cmd(playcommand,"Set");
			PlayerJoinedMessageCommand=cmd(queuecommand,"Set");
			SetCommand=function(self)
				local song = GAMESTATE:GetCurrentSong();
				if song and GAMESTATE:GetCurrentSteps(player) then
					self:diffusealpha(1);
					profile = PROFILEMAN:GetMachineProfile();
					scorelist = profile:GetHighScoreListIfExists(song,GAMESTATE:GetCurrentSteps(player));
					if scorelist and #scorelist:GetHighScores() > 0 then
						local text = scorelist:GetHighScores()[1]:GetName();
						if text=="EVNT" or text == "" then
							self:settext("");
						else
							self:settext(text);
						end
					else
						self:settext("NOT PLAYED");
					end;
				else
					self:settext("---");
					self:diffusealpha(0.4);
				end

			end
		};


	LoadFont("_@dfghsgothic-w9 50px")..{
		InitCommand=cmd(shadowlength,0.8;horizalign,right;x,50;y,5;zoom,0.5;skewx,-0.15;queuecommand,"Set");
		CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
		['CurrentSteps'..ToEnumShortString(player)..'ChangedMessageCommand']=cmd(playcommand,"Set");
		PlayerJoinedMessageCommand=cmd(queuecommand,"Set");
		SetCommand=function(self)
			local song = GAMESTATE:GetCurrentSong();
			if song and GAMESTATE:GetCurrentSteps(player) then
				profile = PROFILEMAN:GetMachineProfile();
				scorelist = profile:GetHighScoreList(song,GAMESTATE:GetCurrentSteps(player));
				assert(scorelist);
				local scores = scorelist:GetHighScores();
				local topscore = scores[1];
				local text = "";
				if topscore then
					text = math.floor(topscore:GetPercentDP()*100).."%"
				else
					text = "0%";
				end;
				self:diffusealpha(1);
				self:settext(text);
			else
				self:settext("0%");
				self:diffusealpha(0.4);
			end;

		end;
	};
};
