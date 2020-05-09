--This file handles the positioning of foreground objects when you're selecting a difficulty.
local pn,infx,infy = ...;
local txytune =		-25					--Text info altitude (Y axis) finetuning
local txxtune =		0.015625*_screen.w	--Text info separation from center (X axis) finetuning (must be always a positive value)	--20 equivalent is 0.03125*_screen.w (when using 4:3)
local saz =			0.75				--Chart info Step Artist Zoom ("saz! en toda la boca!")
local diffy =		40					--Object Y axis difference
local maxwidar =	_screen.cx*0.7	--Chart info Step Artist maxwidth value
local maxwidinf =	_screen.cx*1.1	--Chart info Text maxwidth value
local alignment = (pn == PLAYER_1) and right or left;
local negativeOffset = (pn == PLAYER_1) and 1 or -1;
local start = (pn == PLAYER_1) and SCREEN_LEFT or SCREEN_RIGHT;

return Def.ActorFrame{
	InitCommand=cmd(x,start;y,_screen.cy+110;vertalign,middle,horizalign,alignment);
	SongChosenMessageCommand=cmd(stoptweening;decelerate,0.125;x,SCREEN_CENTER_X);
	SongUnchosenMessageCommand=cmd(stoptweening;accelerate,0.125*1.5;x,start;);
	
	LoadActor(pname(pn).."_info")..{		--PLAYER INFO
		InitCommand=cmd(horizalign,alignment;zoomto,250,45;x,-SCREEN_CENTER_X*negativeOffset;y,-235;);
		OnCommand=function(self)
			if pn == PLAYER_1 then
				self:faderight(1):horizalign(left);
			else
				self:fadeleft(1):horizalign(right);
			end;
		end;
		--PlayerJoinedMessageCommand=cmd(visible,GAMESTATE:IsHumanPlayer(pn));
	};
	
	Def.ActorFrame{		--Chart Info and more for P1
		InitCommand=cmd(y,-diffy);
		--Artist text
		LoadFont("monsterrat/_montserrat semi bold 60px")..{
			InitCommand=cmd(x,-60*negativeOffset;y,-175;zoom,0.215;uppercase,true;maxwidth,900;horizalign,alignment;skewx,-0.25;);
			PlayerJoinedMessageCommand=cmd(visible,GAMESTATE:IsHumanPlayer(pn);queuecommand,"CurrentSteps"..pname(pn).."ChangedMessage");
			["CurrentSteps"..pname(pn).."ChangedMessageCommand"]=function(self)
				if GAMESTATE:GetCurrentSteps(pn) then
					--self:visible(true);
					local author = GAMESTATE:GetCurrentSteps(pn):GetAuthorCredit();
					if author ~= "" then
						self:maxwidth(900); --the original code did not do this but it appears like it intended to... -tertu
						self:settext(author);
					else
						self:maxwidth(1000);
						self:settext("Not available");
					end
				end;
			end;
		};
		LoadFont("monsterrat/_montserrat semi bold 60px")..{	
			InitCommand=cmd(x,-60*negativeOffset;y,-160;zoom,0.215;uppercase,true;maxwidth,900;horizalign,alignment;skewx,-0.25;);
			--PlayerJoinedMessageCommand=cmd(visible,GAMESTATE:IsHumanPlayer(pn);queuecommand,"CurrentSteps"..pname(pn).."ChangedMessage");
			["CurrentSteps"..pname(pn).."ChangedMessageCommand"]=function(self)
				if GAMESTATE:GetCurrentSteps(pn) then
					self:settext(StepsTypeToString(GAMESTATE:GetCurrentSteps(pn)));
					--self:settext("123456789012345678901234567890");
					self:visible(true);
				else
					self:visible(false);
				end;
			end;
		};
		LoadActor(THEME:GetPathG("","_Figures/circle"))..{
			InitCommand=cmd(x,(-infx-txxtune)*negativeOffset;setsize,30,30;x,-40*negativeOffset;y,-175+7.5;);
			["CurrentSteps"..pname(pn).."ChangedMessageCommand"]=function(self)
				if GAMESTATE:GetCurrentSteps(pn) then
					if GAMESTATE:GetCurrentSteps(pn):GetAuthorCredit() ~= "" then
						self:visible(true);
					else
						self:visible(false);
					end
				end;
			end;
		};
		LoadFont("monsterrat/_montserrat semi bold 60px")..{								--SPEEDMOD Display
			InitCommand=cmd(x,-40*negativeOffset;y,-175+7.5;zoom,0.215;maxwidth,130;skewx,-0.25;diffuse,color(".2,.2,.2,1"));
			["CurrentSteps"..pname(pn).."ChangedMessageCommand"]=function(self)
				if GAMESTATE:GetCurrentSteps(pn) then
					local author = GAMESTATE:GetCurrentSteps(pn):GetAuthorCredit();
					if author ~= "" then
						self:visible(true);
						local s = "";
						local sArr = author:split(" ");
						for i,v in ipairs(sArr) do
							s=s..strleft(sArr[i],1)
						end;
						self:settext(s);
					else
						self:visible(false);
					end
				end;
			end;
		};
		LoadActor("mask")..{
			InitCommand=cmd(zoomto,38,38;x,-40.5*negativeOffset;y,-175+7;MaskSource);
		};
		LoadActor(THEME:GetPathG("","USB_stuff/avatars/blank"))..{
			InitCommand=cmd(x,-40*negativeOffset;y,-175+7.5;MaskDest);
			["CurrentSteps"..pname(pn).."ChangedMessageCommand"]=function(self)
				if GAMESTATE:GetCurrentSteps(pn) then
					local author = GAMESTATE:GetCurrentSteps(pn):GetAuthorCredit();
					if author ~= "" and FILEMAN:DoesFileExist(THEME:GetCurrentThemeDirectory().."Graphics/USB_stuff/avatars/"..author..".jpg") then
						self:visible(true);
						self:Load(THEME:GetCurrentThemeDirectory().."Graphics/USB_stuff/avatars/"..author..".jpg")
						self:setsize(30,30);
					else
						self:visible(false);
					end
				else
					self:visible(false);
				end;
			end;
		};
	};
};