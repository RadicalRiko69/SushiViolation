local sections = {
	{ "Sushi Violation 2018 (20XX Edition)", {
		"A game created by Team Sushi",
	}},
	{ "Sushi Violation is created by\nGiovanni Shawn (2014-2020)", {
		"We are not associated with Sexuality Violation btw",
	}},
	{ "Team Sushi", {
		"Giovanni Shawn",
		"José Varela",
	}},
	{ "Programming", {
		"Giovanni Shawn",
		"José Varela",
	}},
	{ "With help from", {
		"Rhythm Lunatic",
		"StepMania Theme Dev Server 2.0",
	}},
	{ "Private Testers", {
		"Hamzah Nutt",
		"Michael Strider Stone",
		"Alex Redo",
		"Malikhoa Shikwane",
		"Farren Tan Soon Yuan",
		"Spencer Franklin",
		"Roy Steven Van Liew",
	}},
	{ "Open Source Libraries", {
		"Profile management by dbk2",
		"item_scroller by Kyzentun",
	}},
	{ "Characters", {
		"Sushi",
		"The Doctor",
		"Saki",
		"Miso",
		"Maddie H.",
	}},
	{ "Music Origin", {
		"DanceDanceRevolution",
		"In The Groove",
		"beatmania IIDX",
		"Pump It Up",
		"Sound Voltex",
		"StepManiaX",
		"DanceRush Stardom",
		"Mungyodance",
		"Billboard Hot 100",
		"Bandcamp",
		"NeonFM",
		"Extreme Music",
		"America's Best Dance Crew",
		"o2jam",
		"DanceTraX",
		"Rave It Out",
	}},
	{ "All music, sounds, and artwork\nbelong to their respective owners", {
		"This includes any borrowed code from other themes",
	}},
	{ "Shoutouts", {
		"StepMania Theme Dev Server 2.0",
		"happyf333tz Igloo Arcade",
		"_tokyotitan_",
		"StriderStone",
		"UKSRT",
		"Andamiro",
		"Team Infinity",
	}},
	{ "Special Thanks", {
		"Everyone who private tested this game\nbefore the demo release",
		"Everyone who enjoyed the demo release",
		"Everyone who GENUINELY enjoyed the series as a whole",
		"And YOU!",
	}}
}

-- To add people or sections modify the above.

local lineOn = cmd(zoom,0.7;horizalign,right)
local sectionOn = cmd(diffuse,color("#9d00ff");strokecolor,color("#0031ff");horizalign,right;skex,-0.145)
local item_padding_start = 4;

local creditScroller = Def.ActorScroller {
	SecondsPerItem = 3.15;
	NumItemsToDraw = 40;	--dont disable this line
	TransformFunction = function( self, offset, itemIndex, numItems)
		self:y(30*offset)
	end;
	OnCommand = cmd(scrollwithpadding,item_padding_start,15);
}

local function AddLine( text, command )
	local text = Def.ActorFrame{
		LoadFont("_eurostile outline")..{
			Text = text or "";
			OnCommand = command or lineOn;
		}
	}
	table.insert( creditScroller, text )
end

-- Add sections with padding.
for section in ivalues(sections) do
	AddLine( section[1], sectionOn )
	for name in ivalues(section[2]) do
		AddLine( name )
	end
	AddLine()
	AddLine()
end

creditScroller.BeginCommand=function(self)
	SCREENMAN:GetTopScreen():PostScreenMessage( 'SM_MenuTimer', (creditScroller.SecondsPerItem * (#creditScroller + item_padding_start) + 20) );
end;

return Def.ActorFrame{

	creditScroller..{
		InitCommand=cmd(x,SCREEN_RIGHT-20;y,SCREEN_BOTTOM-64),
	},
	LoadFont("Common normal")..{	--DEBUG: Animation time and Metric set time.
		InitCommand=cmd(visible,DoDebug;xy,SCREEN_RIGHT,SCREEN_TOP;horizalign,right;vertalign,top;zoom,0.5;
		settext,"Timer Seconds: "..(creditScroller.SecondsPerItem * (#creditScroller + item_padding_start) + 20));	--sumar solo los tiempos del ultimo actor
	};
--[[	LoadActor(THEME:GetPathB("ScreenWithMenuElements","background/_bg top"))..{
		InitCommand=cmd(Center),
	},--]]
};
