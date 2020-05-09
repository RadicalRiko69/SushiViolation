function GetLocalProfiles()
	local ret = {};

	for p = 0,PROFILEMAN:GetNumLocalProfiles()-1 do
		local profile=PROFILEMAN:GetLocalProfileFromIndex(p);
		local item = Def.ActorFrame {
			LoadFont("Infinity 24px") .. {
				Text=profile:GetDisplayName();
				InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;zoom,0.75;maxwidth,195);
			};
		};
	end;

	return ret;
end;


return Def.ActorFrame{

	LoadActor("customize user")..{
		InitCommand=cmd(zoom,0.4446;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-500;sleep,0.25;linear,0.7;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y-130.5);
		OffCommand=cmd(linear,1;addy,-200;sleep,1;diffusealpha,0);
	};
}