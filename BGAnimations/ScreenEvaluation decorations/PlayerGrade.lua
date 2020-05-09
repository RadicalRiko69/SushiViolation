local player = ...

function round(num, numDecimalPlaces)
  return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end

local delay = 0.325

local dancepoints = round(STATSMAN:GetCurStageStats():GetPlayerStageStats(player):GetPercentDancePoints()*100)
local misses = 	STATSMAN:GetCurStageStats():GetPlayerStageStats(player):GetTapNoteScores("TapNoteScore_Miss")+
		STATSMAN:GetCurStageStats():GetPlayerStageStats(player):GetTapNoteScores("TapNoteScore_CheckpointMiss");

--local grade = ToEnumShortString(STATSMAN:GetCurStageStats():GetPlayerStageStats(player):GetGrade());

local grade;

if STATSMAN:GetCurStageStats():AllFailed() then
	grade = "Failed";
else
	if dancepoints >= 50 then
		grade = "Tier06";
		if dancepoints >= 60 then
			grade = "Tier05";
			if dancepoints >= 70 then
				grade = "Tier04";
				if dancepoints >= 80 then
					grade = "Tier03";
					if misses==0 then
						grade = "Tier02";
						if dancepoints >= 99 then
							grade = "Tier01";
							if dancepoints == 100 then
								grade = "Tier00";
							end
						end
					end
				end
			end
		end
	else
		grade = "Tier07";
	end
end

	

return Def.ActorFrame{

	LoadActor(THEME:GetPathG("","GradeDisplayEval/"..grade))..{
		InitCommand=cmd(draworder,200;zoom,0.25);
	};

	LoadActor("scorebox")..{
		InitCommand=cmd(zoom,0.45;y,150;diffusealpha,0;decelerate,0.3;diffusealpha,1);
		OffCommand=cmd(linear,0.75;addy,50);
	};

	--%
	LoadFont("_@dfghsgothic-w9 25px")..{
		InitCommand=cmd(horizalign,center;zoom,0.65);
		--OnCommand=cmd(x,-75;y,110;diffusealpha,0;sleep,1+delay*9;decelerate,0.3;diffusealpha,1);
		OnCommand=cmd(y,115;shadowlength,1;playcommand,"SetText");
		OffCommand=cmd(linear,0.75;addy,50);
		Text="COMPLETION";
	};
	LoadFont("_@dfghsgothic-w9 50px")..{
		InitCommand=cmd(horizalign,center;vertalign,top;zoom,0.75;skewx,-0.3;shadowlength,2);
		--OnCommand=cmd(x,-75;y,125;diffusealpha,0;sleep,1+delay*9;decelerate,0.3;diffusealpha,1);
		OnCommand=cmd(y,130;diffusealpha,0;decelerate,0.3;diffusealpha,1);
		OffCommand=cmd(linear,0.75;addy,50);
		Text=dancepoints.."%";
	};

}