function GetLocalProfiles()
	local ret = {};

	for p = 0,PROFILEMAN:GetNumLocalProfiles()-1 do
		local profile=PROFILEMAN:GetLocalProfileFromIndex(p);
		local item = Def.ActorFrame {
--[[ 			Def.Quad {
				InitCommand=cmd(zoomto,200,1;y,40/2);
				OnCommand=cmd(diffuse,Color('Outline'););
			}; --]]
			LoadFont("Infinity 24px") .. {
				Text=profile:GetDisplayName();
				InitCommand=cmd(x,-20;y,-10;zoomy,0;zoomx,0.75;maxwidth,195;ztest,true);
				OnCommand=cmd(sleep,1;linear,0.5;zoomy,0.75);
				OffCommand=cmd(linear,0.5;zoomy,0);
			};
			LoadFont("Infinity 24px") .. {
				InitCommand=cmd(x,45;y,8;zoomx,0.45;zoomy,0;maxwidth,195;vertspacing,-8;skewx,-0.1;ztest,true);
				OnCommand=cmd(sleep,1;linear,0.5;zoomy,0.45);
				OffCommand=cmd(linear,0.5;zoomy,0);
				BeginCommand=function(self)
					local numSongsPlayed = profile:GetNumTotalSongsPlayed();
					local s = numSongsPlayed == 1 and "Song" or "Songs";
					self:settext( string.format(THEME:GetString("ScreenSelectProfile","%d "..s.." Played"),numSongsPlayed) );
				end;
			};
		};
		table.insert( ret, item );
	end;

	return ret;
end;

function LoadCard(cColor)
	local t = Def.ActorFrame {
		LoadActor( THEME:GetPathG("ScreenSelectProfile","CardBackground") ) .. {
			InitCommand=cmd(diffuse,cColor);
		};
		LoadActor( THEME:GetPathG("ScreenSelectProfile","CardFrame") );
	};
	return t
end
function LoadPlayerStuff(Player)
	local ret = {};

	local pn = (Player == PLAYER_1) and 1 or 2;

--[[ 	local t = LoadActor(THEME:GetPathB('', '_frame 3x3'), 'metal', 200, 230) .. {
		Name = 'BigFrame';
	}; --]]
	local t = Def.ActorFrame {
		Name = 'JoinFrame';
		LoadCard(Color('White'));
		--This is the [CLOSED] text for when a player isn't active.
		LoadFont("_soms2 techy") .. {
			Text=THEME:GetString("ScreenSelectProfile","PressStart");
			InitCommand=cmd(x,-0.5;y,-3);
			OnCommand=cmd(diffuseshift;effectcolor1,Color('White');effectcolor2,color("0.5,0.5,0.5"));
			OffCommand=cmd(linear,0.15;diffusealpha,0);
		};
	};
	table.insert( ret, t );
	
	t = Def.ActorFrame {
		Name = 'BigFrame';
		LoadCard(PlayerColor(Player));
	};
	table.insert( ret, t );

--[[ 	t = LoadActor(THEME:GetPathB('', '_frame 3x3'), 'metal', 170, 20) .. {
		Name = 'SmallFrame';
	}; --]]
	t = Def.ActorFrame {
		Name = 'SmallFrame';
--[[ 		Def.Quad {
			InitCommand=cmd(zoomto,170+4,32+4);
			OnCommand=cmd(shadowlength,1);
		}; --]]
		InitCommand=cmd(y,-2);
		Def.Quad {
			InitCommand=cmd(zoomto,200-10,40+2);
			OnCommand=cmd(diffuse,Color('Black');diffusealpha,0.5);
		};
		Def.Quad {
			InitCommand=cmd(zoomto,200-10,40);
			OnCommand=cmd(diffuse,PlayerColor(Player);fadeleft,0.25;faderight,0.25;glow,color("1,1,1,0.25"));
		};
		Def.Quad {
			InitCommand=cmd(zoomto,200-10,40;y,-40/2+20);
			OnCommand=cmd(diffuse,Color("Black");fadebottom,1;diffusealpha,0.35);
		};
		Def.Quad {
			InitCommand=cmd(zoomto,200-10,1;y,-40/2+1);
			OnCommand=cmd(diffuse,PlayerColor(Player);glow,color("1,1,1,0.25"));
		};	
	};
	table.insert( ret, t );

	t = Def.ActorScroller{
		Name = 'ProfileScroller';
		NumItemsToDraw=6;
-- 		InitCommand=cmd(y,-230/2+20;);
		OnCommand=cmd(y,1;SetFastCatchup,true;SetMask,200,58;SetSecondsPerItem,0.08);
		TransformFunction=function(self, offset, itemIndex, numItems)
			local focus = scale(math.abs(offset),0,2,1,0);
			self:visible(false);
			self:y(math.floor( offset*40 ));
-- 			self:zoomy( focus );
-- 			self:z(-math.abs(offset));
-- 			self:zoom(focus);
		end;
		children = GetLocalProfiles();
	};
	table.insert( ret, t );
	
	t = Def.ActorFrame {
		Name = "EffectFrame";
	};
	table.insert( ret, t );
	t = LoadFont("Infinity 24px") .. {
		Name = 'SelectedProfileText';
		--InitCommand=cmd(y,160;shadowlength,1;diffuse,PlayerColor(Player));
		InitCommand=cmd(y,172;zoom,0.6;diffusealpha,0;sleep,1;linear,0.5;diffusealpha,1;maxwidth,350);
		OffCommand=cmd(linear,1;addy,200;diffusealpha,0);
	};
	table.insert( ret, t );

	return ret;
end;

function UpdateInternal3(self, Player)
	local pn = (Player == PLAYER_1) and 1 or 2;
	local frame = self:GetChild(string.format('P%uFrame', pn));
	local scroller = frame:GetChild('ProfileScroller');
	local seltext = frame:GetChild('SelectedProfileText');
	local joinframe = frame:GetChild('JoinFrame');
	local smallframe = frame:GetChild('SmallFrame');
	local bigframe = frame:GetChild('BigFrame');

	if GAMESTATE:IsHumanPlayer(Player) then
		frame:visible(true);
		if MEMCARDMAN:GetCardState(Player) == 'MemoryCardState_none' then
			--using profile if any
			joinframe:visible(false);
			smallframe:visible(true);
			bigframe:visible(true);
			seltext:visible(true);
			scroller:visible(true);
			local ind = SCREENMAN:GetTopScreen():GetProfileIndex(Player);
			if ind > 0 then
				scroller:SetDestinationItem(ind-1);
				seltext:settext(PROFILEMAN:GetLocalProfileFromIndex(ind-1):GetDisplayName());
			else
				if SCREENMAN:GetTopScreen():SetProfileIndex(Player, 1) then
					scroller:SetDestinationItem(0);
					self:queuecommand('UpdateInternal2');
				else
					joinframe:visible(true);
					smallframe:visible(false);
					bigframe:visible(false);
					scroller:visible(false);
					seltext:settext('NO USERS : PRESS START TO SKIP');
				end;
			end;
		else
			--using card
			smallframe:visible(false);
			scroller:visible(false);
			seltext:settext('USB');
			SCREENMAN:GetTopScreen():SetProfileIndex(Player, 0);
		end;
	else
		joinframe:visible(true);
		scroller:visible(false);
		seltext:visible(false);
		smallframe:visible(false);
		bigframe:visible(false);
	end;
end;




-- Will be set to the main ActorFrame for the screen in its OnCommand.
local main_frame= false

local function input(event)
	if event.type == "InputEventType_Release" then return end
	local pn= event.PlayerNumber
	local code= event.GameButton
	if not pn or not code then return end
	local input_functions= {
		Start= function()
			MESSAGEMAN:Broadcast("StartButton")
			if not GAMESTATE:IsHumanPlayer(pn) then
				SCREENMAN:GetTopScreen():SetProfileIndex(pn, -1)
			else
				SCREENMAN:GetTopScreen():Finish()
			end
		end,
		Back= function()
			if GAMESTATE:GetNumPlayersEnabled()==0 then
				SCREENMAN:GetTopScreen():Cancel()
			else
				MESSAGEMAN:Broadcast("BackButton")
				SCREENMAN:GetTopScreen():SetProfileIndex(pn, -2)
			end
		end,
		MenuUp= function()
			if GAMESTATE:IsHumanPlayer(pn) then
				local ind = SCREENMAN:GetTopScreen():GetProfileIndex(pn)
				if ind > 1 then
					if SCREENMAN:GetTopScreen():SetProfileIndex(pn, ind - 1) then
						MESSAGEMAN:Broadcast("DirectionButton")
						main_frame:queuecommand('UpdateInternal2')
					end
				end
			end
		end,
		MenuDown= function()
			if GAMESTATE:IsHumanPlayer(pn) then
				local ind = SCREENMAN:GetTopScreen():GetProfileIndex(pn)
				if ind > 0 then
					if SCREENMAN:GetTopScreen():SetProfileIndex(pn, ind + 1) then
						MESSAGEMAN:Broadcast("DirectionButton")
						main_frame:queuecommand('UpdateInternal2')
					end
				end
			end
		end
	}
	input_functions.MenuLeft= input_functions.MenuUp
	input_functions.MenuRight= input_functions.MenuDown
	if input_functions[code] then
		input_functions[code]()
	end
end

local t = Def.ActorFrame {

	StorageDevicesChangedMessageCommand=function(self, params)
		self:queuecommand('UpdateInternal2');
	end;

	PlayerJoinedMessageCommand=function(self, params)
		self:queuecommand('UpdateInternal2');
	end;

	PlayerUnjoinedMessageCommand=function(self, params)
		self:queuecommand('UpdateInternal2');
	end;

	OnCommand=function(self, params)
		main_frame= self:GetParent()
		SCREENMAN:GetTopScreen():AddInputCallback(input)
		self:queuecommand('UpdateInternal2');
	end;

	UpdateInternal2Command=function(self)
		UpdateInternal3(self, PLAYER_1);
		UpdateInternal3(self, PLAYER_2);
	end;

	children = {
		Def.ActorFrame {
			Name = 'P1Frame';
			InitCommand=cmd(x,SCREEN_CENTER_X-175;y,SCREEN_CENTER_Y);
			OnCommand=cmd(zoomx,1;zoomy,0;sleep,0.5;linear,0.5;zoomy,1);
			OffCommand=cmd(sleep,1;linear,0.5;zoomy,0);
			PlayerJoinedMessageCommand=function(self,param)
				if param.Player == PLAYER_1 then
					(cmd(;zoom,1.5;bounceend,0.15;zoom,1.0;))(self);
				end;
			end;
			children = LoadPlayerStuff(PLAYER_1);
		};
		Def.ActorFrame {
			Name = 'P2Frame';
			InitCommand=cmd(x,SCREEN_CENTER_X+175;y,SCREEN_CENTER_Y);
			OnCommand=cmd(zoomx,1;zoomy,0;sleep,0.5;linear,0.5;zoomy,1);
			OffCommand=cmd(sleep,1;linear,0.5;zoomy,0);
			PlayerJoinedMessageCommand=function(self,param)
				if param.Player == PLAYER_2 then
					(cmd(zoom,1.5;bounceend,0.15;zoom,1.0;))(self);
				end;
			end;
			children = LoadPlayerStuff(PLAYER_2);
		};
		-- sounds
		LoadActor( THEME:GetPathS("","Sushi-accept") )..{
			IsAction= true,
			StartButtonMessageCommand=cmd(play);
		};
		LoadActor( THEME:GetPathS("","Sushi-decline") )..{
			IsAction= true,
			BackButtonMessageCommand=cmd(play);
		};
		LoadActor( THEME:GetPathS("","zap") )..{
			IsAction= true,
			DirectionButtonMessageCommand=cmd(play);
		};
	};
};


return t;
