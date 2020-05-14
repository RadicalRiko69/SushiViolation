local gc = Var("GameCommand");
local squareSize = 8; -- was 18

return Def.ActorFrame {
	Def.Quad{
		InitCommand=cmd(x,-12;zoom,squareSize;rotationz,45;diffuse,color("#ff0000"));
		GainFocusCommand=cmd(stoptweening;accelerate,0.25;zoom,squareSize;rotationz,45;);
		LoseFocusCommand=cmd(stoptweening;decelerate,0.25;zoom,0;rotationz,360+45);
	};
	LoadFont("_eurostile outline") .. {
		Text=gc:GetText();
		InitCommand=cmd(halign,0;zoom,0.55;skewx,-0.145);
		GainFocusCommand=cmd(stoptweening;decelerate,0.25;diffuse,color("1,0,0,1"));
		LoseFocusCommand=cmd(stoptweening;accelerate,0.25;diffuse,color("0.5,0.5,0.5,1"));
	};
};