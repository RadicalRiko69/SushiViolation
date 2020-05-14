local isWheelCustom = ...

return Def.ActorFrame{
		Def.Sprite{
			--Name = "BGAPreview";
			InitCommand=cmd(x,SCREEN_CENTER_X-200;y,SCREEN_CENTER_Y);
			OffCommand=cmd(decelerate,0.15;diffusealpha,0;visible,false);
			CurrentSongChangedMessageCommand=cmd(stoptweening;Load,nil;sleep,0.25;queuecommand,"PlayVid2");
			PlayVid2Command=function(self)
				--self:Load(nil);
				local song = GAMESTATE:GetCurrentSong()
				path = GetBGAPreviewPath("PREVIEWVID");
				--path = song:GetBannerPath();
				self:Load(path);
				self:diffusealpha(0);
				self:zoomto(209,82);
				self:linear(0.2);
				if path == "/Backgrounds/Title.mp4" then
					self:diffusealpha(0.5);
				else
					self:diffusealpha(1);
				end
			end;
		};

		--MODE DISPLAY
		LoadFont("_russellsquare 40px")..{
			InitCommand=cmd(uppercase,true;horizalign,right;diffusealpha,0;x,SCREEN_CENTER_X-110;y,SCREEN_CENTER_Y-55;zoom,0.3;sleep,0.25;decelerate,0.5;diffusealpha,1);
			OffCommand=cmd(visible,false);
			OnCommand=function(self)
				local mode = GAMESTATE:GetCoinMode()
				self:settext(THEME:GetString("CoinMode",GAMESTATE:GetCoinMode()));
			end;
		};
		--Genre display
		LoadFont("_russellsquare 40px")..{
			InitCommand=cmd(diffusealpha,0;uppercase,true;x,SCREEN_CENTER_X-10;y,SCREEN_CENTER_Y+130;zoom,0.4);
			OffCommand=cmd(decelerate,0.15;diffusealpha,0;visible,false);
			SongChosenMessageCommand=cmd(decelerate,0.15;diffusealpha,1;visible,true);
			SongUnchosenMessageCommand=cmd(decelerate,0.15;diffusealpha,0;visible,false);
			CurrentSongChangedMessageCommand=function(self)
				self:settext("GENRE:");
			end;
		};
		LoadFont("_russellsquare 40px")..{
			InitCommand=cmd(diffusealpha,0;uppercase,true;x,SCREEN_CENTER_X-10;y,SCREEN_CENTER_Y+144;zoom,0.4;maxwidth,360);
			OffCommand=cmd(decelerate,0.15;diffusealpha,0;visible,false);
			SongChosenMessageCommand=cmd(decelerate,0.15;diffusealpha,1;visible,true);
			SongUnchosenMessageCommand=cmd(decelerate,0.15;diffusealpha,0;visible,false);
			CurrentSongChangedMessageCommand=function(self)
				local genre = GAMESTATE:GetCurrentSong():GetGenre()
				if genre == "" then
					genre = "???"
				end
				self:settext(genre);
			end;
		};		

		--LENGTH DISPLAY
		LoadFont("_russellsquare 40px")..{
			InitCommand=cmd(diffusealpha,0;uppercase,true;x,SCREEN_CENTER_X-10;y,SCREEN_CENTER_Y+167;zoom,0.4);
			OffCommand=cmd(decelerate,0.15;diffusealpha,0;visible,false);
			SongChosenMessageCommand=cmd(decelerate,0.15;diffusealpha,1;visible,true);
			SongUnchosenMessageCommand=cmd(decelerate,0.15;diffusealpha,0;visible,false);
			CurrentSongChangedMessageCommand=function(self)
				self:settext("LENGTH:");
			end;
		};
		
		LoadFont("_russellsquare 40px")..{
			InitCommand=cmd(diffusealpha,0;horizalign,left;x,SCREEN_CENTER_X-30;y,SCREEN_CENTER_Y+182;zoom,0.4;maxwidth,120);
			OffCommand=cmd(decelerate,0.15;diffusealpha,0;visible,false);
			SongChosenMessageCommand=cmd(decelerate,0.15;diffusealpha,1;visible,true);
			SongUnchosenMessageCommand=cmd(decelerate,0.15;diffusealpha,0;visible,false);
			CurrentSongChangedMessageCommand=function(self)
			if GAMESTATE:GetCurrentSong() then
				local length = GAMESTATE:GetCurrentSong():MusicLengthSeconds()
				self:settext(SecondsToMMSS(length));
			else
				self:settext("N/A");
			end;
		end;
		};	

		--BPM DISPLAY
		LoadFont("_russellsquare 40px")..{
			InitCommand=cmd(diffusealpha,0;uppercase,true;x,SCREEN_CENTER_X-10;y,SCREEN_CENTER_Y+205;zoom,0.4);
			OffCommand=cmd(decelerate,0.15;diffusealpha,0;visible,false);
			SongChosenMessageCommand=cmd(decelerate,0.15;diffusealpha,1;visible,true);
			SongUnchosenMessageCommand=cmd(decelerate,0.15;diffusealpha,0;visible,false);
			CurrentSongChangedMessageCommand=function(self)
				self:settext("BPM:");
			end;
		};
		
		LoadFont("_russellsquare 40px")..{
			InitCommand=cmd(diffusealpha,0;uppercase,true;x,SCREEN_CENTER_X-10;y,SCREEN_CENTER_Y+220;zoom,0.4);
			OffCommand=cmd(decelerate,0.15;diffusealpha,0;visible,false);
			SongChosenMessageCommand=cmd(decelerate,0.15;diffusealpha,1;visible,true);
			SongUnchosenMessageCommand=cmd(decelerate,0.15;diffusealpha,0;visible,false);
			CurrentSongChangedMessageCommand=function(self)

				local song = GAMESTATE:GetCurrentSong();
				-- ROAD24: more checks,
				-- TODO: decide what to do if no song is chosen, ignore or hide ??
				if song then
					local speedvalue;
					if song:IsDisplayBpmRandom() then
						speedvalue = "???";
					else
						local rawbpm = GAMESTATE:GetCurrentSong():GetDisplayBpms();
						local lobpm = math.ceil(rawbpm[1]);
						local hibpm = math.ceil(rawbpm[2]);
						if lobpm == hibpm then
							speedvalue = hibpm
						else
							speedvalue = lobpm.."~"..hibpm
						end;
					end;
					self:settext(speedvalue);
				else
					self:stoptweening();self:decelerate(0.15);self:diffusealpha(0);
				end;
			end;
		};
		
		
		--HEART
		LoadActor(THEME:GetPathG("","heart"))..{
			InitCommand=cmd(diffusealpha,0;x,SCREEN_CENTER_X-290;y,SCREEN_CENTER_Y-55;zoom,0.6;sleep,0.25;decelerate,0.5;diffusealpha,1);
			OffCommand=cmd(decelerate,0.15;diffusealpha,0;visible,false);
			};
		LoadFont("_russellsquare 40px")..{
			InitCommand=cmd(diffusealpha,0;x,SCREEN_CENTER_X-278;y,SCREEN_CENTER_Y-55;zoom,0.3;sleep,0.25;decelerate,0.5;diffusealpha,1);
			OffCommand=cmd(decelerate,0.15;diffusealpha,0;visible,false);
			CurrentSongChangedMessageCommand=function(self)
				self:settext("x"..GetNumHeartsForSong());
			end;
		};
};
