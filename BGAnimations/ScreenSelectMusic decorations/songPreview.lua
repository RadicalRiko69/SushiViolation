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

		--Genre display
		LoadFont("_russellsquare 40px")..{
			InitCommand=cmd(diffusealpha,0;uppercase,true;x,SCREEN_CENTER_X-10;y,SCREEN_CENTER_Y+135;zoom,0.4);
			OffCommand=cmd(decelerate,0.15;diffusealpha,0;visible,false);
			SongChosenMessageCommand=cmd(decelerate,0.15;diffusealpha,1;visible,true);
			SongUnchosenMessageCommand=cmd(decelerate,0.15;diffusealpha,0;visible,false);
			CurrentSongChangedMessageCommand=function(self)
				self:settext("GENRE:");
				(cmd(finishtweening;zoomy,0;zoomx,0.5;decelerate,0.33;zoom,0.4)) (self)
			end;
		};
		LoadFont("_russellsquare 40px")..{
			InitCommand=cmd(diffusealpha,0;uppercase,true;x,SCREEN_CENTER_X-10;y,SCREEN_CENTER_Y+150;zoom,0.4);
			OffCommand=cmd(decelerate,0.15;diffusealpha,0;visible,false);
			SongChosenMessageCommand=cmd(decelerate,0.15;diffusealpha,1;visible,true);
			SongUnchosenMessageCommand=cmd(decelerate,0.15;diffusealpha,0;visible,false);
			CurrentSongChangedMessageCommand=function(self)
				local genre = GAMESTATE:GetCurrentSong():GetGenre()
				if genre == "" then
					genre = "???"
				end
				self:settext(genre);
				(cmd(finishtweening;zoomy,0;zoomx,0.5;decelerate,0.33;zoom,0.4;maxwidth,360)) (self)
			end;
		};		
		
		--BPM DISPLAY
		LoadFont("_russellsquare 40px")..{
			InitCommand=cmd(diffusealpha,0;uppercase,true;x,SCREEN_CENTER_X-10;y,SCREEN_CENTER_Y+195;zoom,0.4);
			OffCommand=cmd(decelerate,0.15;diffusealpha,0;visible,false);
			SongChosenMessageCommand=cmd(decelerate,0.15;diffusealpha,1;visible,true);
			SongUnchosenMessageCommand=cmd(decelerate,0.15;diffusealpha,0;visible,false);
			CurrentSongChangedMessageCommand=function(self)
				self:settext("BPM:");
				(cmd(finishtweening;zoomy,0;zoomx,0.5;decelerate,0.33;zoom,0.4;)) (self)
			end;
		};
		
		LoadFont("_russellsquare 40px")..{
			InitCommand=cmd(diffusealpha,0;uppercase,true;x,SCREEN_CENTER_X-10;y,SCREEN_CENTER_Y+210;zoom,0.4);
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
					(cmd(finishtweening;zoomy,0;zoomx,0.5;decelerate,0.33;zoom,0.4)) (self)
				else
					self:stoptweening();self:linear(0.25);self:diffusealpha(0);
				end;
			end;
		};
		
		
		--[[HEART
		LoadActor("select music")..{
		InitCommand=cmd(x,_screen.cx-105;y,_screen.cy+85;zoom,0.6;);
		OnCommand=cmd(playcommand,"Refresh";);
		CurrentSongChangedMessageCommand=cmd(finishtweening;diffusealpha,0;sleep,0.01;queuecommand,"Refresh";);
		RefreshCommand=function(self)
			(cmd(diffusealpha,0;sleep,0.3;y,_screen.cy+85;linear,0.3;diffusealpha,1;y,_screen.cy+75))(self);
		end;
		};--]]
};
