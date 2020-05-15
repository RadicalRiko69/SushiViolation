local c = {};
local player,judgmentType = ...;
local Pulse = THEME:GetMetric("Combo", "JudgmentPulseCommand");
local current = 0;
local scoreAdd = 0;
local multiplier = 1;
local meter = 0;
local AllowSuperb = (PREFSMAN:GetPreference("AllowW1") == 'AllowW1_Never');
local t = Def.ActorFrame {

	Def.ActorFrame {
		Name="JudgmentFrame";
		LoadActor(judgmentType) .. {
			Name="Judgment";
			InitCommand=cmd(pause;y,20;visible,false);
			ResetCommand=cmd(finishtweening;stopeffect;visible,false);
		};
	};
	
	

};
--[[
local JudgeCmds = {
	TapNoteScore_W1 = THEME:GetMetric( "Judgment", "JudgmentW1Command" );
	TapNoteScore_W2 = THEME:GetMetric( "Judgment", "JudgmentW2Command" );
	TapNoteScore_W3 = THEME:GetMetric( "Judgment", "JudgmentW3Command" );
	TapNoteScore_W4 = THEME:GetMetric( "Judgment", "JudgmentW4Command" );
	TapNoteScore_W5 = THEME:GetMetric( "Judgment", "JudgmentW5Command" );
	TapNoteScore_Miss = THEME:GetMetric( "Judgment", "JudgmentMissCommand" );
};
]]

--Specifies which frame is for which grading in the node judgment sprites
local TNSFrames = {
	TapNoteScore_W1 = 0;
	TapNoteScore_W2 = 1;
	TapNoteScore_W3 = 2;
	TapNoteScore_W4 = 3;
	TapNoteScore_W5 = 4;
	TapNoteScore_Miss = 5;
	--I know this causes errors but fuck it.
	TapNoteScore_CheckpointHit = nil;
	TapNoteScore_CheckpointMiss = nil;
	TapNoteScore_AvoidMine = nil;
};

--WTF is this shit? Is it just arbitrary scoring?
local TapScoring = {
	TapNoteScore_W1 = 0;
	TapNoteScore_W2 = 1000;
	TapNoteScore_W3 = 500;
	TapNoteScore_W4 = 100;
	TapNoteScore_W5 = -200;
	TapNoteScore_Miss = -800;
	TapNoteScore_CheckpointHit = 900;
	TapNoteScore_CheckpointMiss = -700;
	TapNoteScore_AvoidMine = 0;
};

local HoldScoring = {
	HoldNoteScore_None = 0;
	HoldNoteScore_Held = 0;
	HoldNoteScore_LetGo = 0;
};

t.InitCommand = function(self)
	c.JudgmentFrame = self:GetChild("JudgmentFrame");
	c.Judgment = c.JudgmentFrame:GetChild("Judgment");
end;

t.OnCommand = function(self)
	local player = self:GetParent();
	altcombo = 0;
--	player:SetActorWithJudgmentPosition( c.JudgmentFrame );
end;



t.JudgmentMessageCommand=function(self, param)

	if param.Player ~= player then return end;
	if not param.TapNoteScore then return end;
	if param.HoldNoteScore then return end;	

	local iNumStates = c.Judgment:GetNumStates();
	local iFrame = TNSFrames[param.TapNoteScore];

	
	if iNumStates == 12 then
		iFrame = iFrame * 2;
		if not param.Early then
			iFrame = iFrame + 1;
		else
			self:visible(false);
		end
	end

	
		local PSS = STATSMAN:GetCurStageStats():GetPlayerStageStats(param.Player);	
		local meter = math.ceil(GAMESTATE:GetCurrentSteps(param.Player):GetMeter()/5);
		local multiplier = 1+(math.floor(PSS:GetCurrentCombo()/100));
	
		if multiplier>=5 then
			multiplier=5
		end
	
		current = current+((TapScoring[param.TapNoteScore])*meter);
		
		if current < 0 then
			current = 0;
		end
	
	--SCREENMAN:SystemMessage("desu  "..current.."   "..multiplier.."X".."   "..meter);

	PSS:SetScore(current);
	

	
	c.Judgment:visible( true );
	c.Judgment:setstate( iFrame );
	--(cmd(stoptweening;diffusealpha,1;zoom,0.875;linear,0.05;zoom,0.625;sleep,1;linear,0.2;diffusealpha,0;zoomx,1.05;zoomy,0.5))(c.Judgment);
	
	
	if judgmentType == "Classic" then
		(cmd(stoptweening;diffusealpha,1;zoom,1;decelerate,0.1;zoom,0.9;sleep,1;accelerate,0.2;zoom,0))( c.Judgment, param );
	else --if GetUserPref("UserPrefJudgmentType") == "Normal" or GetUserPref("UserPrefJudgmentType") == "Deviation" then
		Pulse( c.Judgment, param );
	end
	
--	JudgeCmds[param.TapNoteScore](c.Judgment);

	c.JudgmentFrame:stoptweening();

end;



return t;
