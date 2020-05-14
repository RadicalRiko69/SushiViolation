local t = Def.ActorFrame{
	LoadActor("lane")..{
		InitCommand=cmd(zoom,0.52;draworder,1000;vertalign,bottom;x,SCREEN_CENTER_X-200;y,SCREEN_CENTER_Y+300;croptop,1;fadetop,0.2);
		OnCommand=cmd(linear,1;croptop,-0.2);
		OffCommand=cmd(sleep,0.2;linear,0.5;zoomx,0);
	};
    LoadActor("please wait" )..{
		Name="idk",
		OnCommand=cmd(zoom,0.3; x,SCREEN_CENTER_X-200;y,SCREEN_CENTER_Y; diffuseshift; effectoffset,1; effectperiod, 1; effectcolor1, 1,1,1,0; effectcolor2, 1,1,1,1;
    diffusealpha,1;sleep,0.5;linear,0.25;diffusealpha,0)
	},

};

song_colors= {
    ["Tachophobia"]= "255,0,0,0.15",
    ["Endymion"] = "255,0,0,0.15",
    ["AETHER"]= "255,0,0,0.15",
	["Power Of Love 2001"]= "255,0,0,0.15",
};

t[#t+1] = Def.Quad{
    InitCommand=cmd(FullScreen;blend,Blend.Add;);
    SetCommand=function(s)
        local song = GAMESTATE:GetCurrentSong()
        if song then
            local songname = song:GetDisplayMainTitle()
            if song_colors[songname] ~= nil then
                s:diffuse(color(song_colors[songname]))
            else
                s:diffuse(color("0,0,0,0"))
            end;
        else
            s:diffuse(color("0,0,0,0"))
        end;
    end;
    CurrentSongChangedMessageCommand=cmd(queuecommand,"Set");
}

return t;



