
// Work in Progress Autosplitter by Nikoheart
// 0.4 - BN1/BN2 Mostly Done, BN5/6 Pointers found
// requires just-ero's asl-help in LiveSplit/Components
// https://github.com/just-ero/asl-help/raw/main/lib/asl-help
// Thanks NMarko for help with Area/SubArea ID

// 21.04.23
// Both games can be run from this single autosplitter
// Big switch case added to commensate settings between both volumes
// Major testing needed

// ----- Things to do in BN1 
// get id of results item win? (for All Chips run)
// re-organise settings of autosplitter with super mods
// test with speedrun community if WWW Comp 1 skip works

// ----- Things to do in BN2 
// look for addresses.battle_mode / battle_state to use maybe instead of InBattle (can be potentially unreliable)
// BN2 SSS Licence Exam - PlanetMan/Bass to test and post-game credits screen (the congratulations one)

// ----- Things to do in BW3
// Does Legacy Collection do V2/V3 or does it cater to Alpha, Beta, Omega?

// ----- BN4
// research how to work around RAM offsetting

// ----- BN5/6
// Go through runs, get enemyIDs and map out settings/splits

state("MMBN_LC1") 
{
	// --- Main Menu of Legacy Collection
	byte LC1_GameChoice : 0x989B384; // BN1 = 0, BN2 = 2, BN3W = 3, BN3B = 4
	byte LC1_GameSelected : 0x989BA88; // when chosen, value turns 0

	// --- Global Pointers Throughout Games
	byte LC1_GameState : 0x29EE840, 0xB8, 0x0; // 28 on ng/continue select - 0 is hit when selecting "Return to Title Screen"
	byte LC1_AreaID : 0x29EE840, 0xB8, 0x4;
	byte LC1_SubAreaID : 0x29EE840, 0xB8, 0x5;
	byte LC1_Progress : 0x29EE840, 0xB8, 0x6;
	byte LC1_BattlePaused : 0x29EE840, 0xB8, 0x9;
	int LC1_Zenny : 0x29EE840, 0xB8, 0x74;
	// int KeyItems : 0x29EE840, 0xB8, 0xC0;
	
	int LC1_ENo1 : 0x29EE840, 0x50, 0x0;
	int LC1_ENo2 : 0x29EE840, 0x50, 0x4;
	int LC1_ENo3 : 0x29EE840, 0x50, 0x8;

	// --- Mega Man Battle Network 1 Pointers
	short MMBN1_ENoHP1 : 0x29F21F8, 0x60;
	short MMBN1_ENoHP2 : 0x29F21F8, 0x110;
	short MMBN1_ENoHP3 : 0x29F21F8, 0x1C0;
	byte MMBN1_HigsMemo : 0x29EE840, 0xB8, 0xF4;
	byte MMBN1_LabMemo : 0x29EE840, 0xB8, 0xF5;
	byte MMBN1_YuriMemo : 0x29EE840, 0xB8, 0xF6;
	byte MMBN1_PaMemo : 0x29EE840, 0xB8, 0xF7;
	int MMBN1_FinalSplit : 0x29F21F8, 0x4;

	// --- Mega Man Battle Network 2 Pointers
	short MMBN2_ENoHP1 : 0x29F21F8, 0x1A4;
	short MMBN2_ENoHP2 : 0x29F21F8, 0x264;
	short MMBN2_ENoHP3 : 0x29F21F8, 0x264;
	byte MMBN2_BLicense: 0x29EE840, 0xB8, 0x148;
	byte MMBN2_HeatData : 0x29EE840, 0xB8, 0x134;
	int MMBN2_FinalSplit: 0x29F4CD8, 0x4;

	// --- Mega Man Battle Network 3 White/Blue Pointers
	byte MMBN3_ENoHP1 : 0x29F9748, 0x108;
	byte MMBN3_ENoHP2 : 0x29F9748, 0x1DC;
	byte MMBN3_ENoHP3 : 0x29F9748, 0x2B0;
}

state("MMBN_LC2") 
{
	// --- Main Menu of Legacy Collection
	byte LC2_GameChoice : 0xAC13F84; // BN4RS - 5/BM - 6,  BN5TM - 7/TC - 8, BN6CG - 9/CF - 10
	byte LC2_GameSelected : 0xAC14688; // when chosen, value turns 0
	
	// --- Mega Man Battle Network 4
	// --- THIS IS GOING TO NEED A LOT OF SERIOUS WORK
	// --- BN4 moves everything around a bit each screen transition
	// --- How are we going to capture this...
	// --- watchers? ram_offset?
	// --- https://github.com/TeamBattleNet/Scripts/blob/dea3a2d44963007c8b2a1e1bba3fe5f05dda9829/HUD/BN4/RAM.lua#L12-L28
	
	// --- Mega Man Battle Network 5 Pointers
	// byte MMBN5_GameState : 0xB70FEF3, 0x7EA;
	// byte MMBN5_AreaID : 0xB70FEF3, 0x7EE;
	// byte MMBN5_SubAreaID : 0xB70FEF3, 0x7EF;
	// byte MMBN5_Progress : 0xB70FEF3, 0x7F0;
	// byte MMBN5_GameState : 0xE47634F, 0x200;
	// byte MMBN5_AreaID : 0xE47634F, 0x204;
	// byte MMBN5_SubAreaID : 0xE47634F, 0x205;
	// byte MMBN5_Progress : 0xE47634F, 0x206;
	byte MMBN5_GameState : 0x1DCF1861, 0x793;
	byte MMBN5_AreaID : 0x1DCF1861, 0x797;
	byte MMBN5_SubAreaID : 0x1DCF1861, 0x798;
	byte MMBN5_Progress : 0x1DCF1861, 0x799;
	short MMBN5_ENo1HP : 0x3D679D8, 0x10C;
	short MMBN5_ENo1 : 0x3D679D8, 0x110;
	short MMBN5_ENo2HP : 0x3D679D8, 0x1E4;
	short MMBN5_ENo2 : 0x3D679D8, 0x1E8;
	short MMBN5_ENo2HP : 0x3D679D8, 0x2B8;
	short MMBN5_ENo3 : 0x3D679D8, 0x2BC;

	// --- Mega Man Battle Network 6 Pointers
	byte MMBN6_GameState : 0x1DCF1861, 0xE3;
	byte MMBN6_AreaID : 0x1DCF1861, 0xE7;
	byte MMBN6_SubAreaID : 0x1DCF1861, 0xE8;
	byte MMBN6_Progress : 0x1DCF1861, 0xE9;
	byte MMBN6_BattlePaused : 0x1DCF1861, 0xED;
	short MMBN6_ENo1HP : 0x3D6FFC8, 0x110;
	short MMBN6_ENo1 : 0x3D6FFC8, 0x110;
	short MMBN6_ENo2HP : 0x3D6FFC8, 0x1E4;
	short MMBN6_ENo2 : 0x3D6FFC8, 0x1E8;
	short MMBN6_ENo3HP : 0x3D6FFC8, 0x2BC;
	short MMBN6_ENo3 : 0x3D6FFC8, 0x2C0;
}

startup
{
	Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Basic");
    
	settings.Add("BN1", true, "Mega Man Battle Network 1");
	settings.CurrentDefaultParent = "BN1";

	settings.Add("BN1FinalSplit", true, "Final Split");
	settings.CurrentDefaultParent = "BN1FinalSplit";
	settings.Add("BN1LifeVirusSplit", true, "Life Virus Kill + End Split");
	settings.Add("BN1NoLifeVirusSplit", false, "Skip Life Virus + End Split");
	settings.CurrentDefaultParent = "BN1";
	
	settings.Add("BN1MainSplits", true, "Main Splits");
	settings.CurrentDefaultParent = "BN1MainSplits";
	settings.Add("BN1FireMan", true, "FireMan");
	settings.Add("BN1NumberMan", true, "NumberMan");
	settings.Add("BN1GutsMan", true, "GutsMan");
	settings.Add("BN1StoneMan", true, "StoneMan");
	settings.Add("BN1ColdBear", true, "ColdBear");
	settings.Add("BN1IceMan", true, "IceMan");
	settings.Add("BN1SkullMan", true, "SkullMan");
	settings.Add("BN1ColorMan", true, "ColorMan");
	settings.Add("BN1ElecMan", false, "ElecMan");
	settings.Add("BN1ProtoMan", true, "ProtoMan");
	settings.Add("BN1Memos", true, "Memos");
	settings.Add("BN1BombMan", true, "BombMan");
	settings.Add("BN1MagicMan", true, "MagicMan");
	settings.Add("BN1LifeVirus", true, "LifeVirus");
	settings.CurrentDefaultParent = "BN1";

	settings.Add("BN1MBosses", true, "Mini-Bosses");
	settings.CurrentDefaultParent = "BN1MBosses";
	settings.Add("BN1Floshell", true, "Floshell");
	settings.CurrentDefaultParent = "BN1";

	settings.Add("BN1OBosses", false, "Optional Bosses");
	settings.CurrentDefaultParent = "BN1OBosses";
	settings.Add("BN1GutsManV2", false, "GutsManV2");
	settings.Add("BN1GutsManV3", false, "GutsManV3");
	settings.Add("BN1ProtoManV2", false, "ProtoManV2");
	settings.Add("BN1ProtoManV3", false, "ProtoManV3");
	settings.Add("BN1WoodMan", false, "WoodMan");
	settings.Add("BN1WoodManV2", false, "WoodManV2");
	settings.Add("BN1WoodManV3", false, "WoodManV3");
	settings.Add("BN1FireManV2", false, "FireManV2");
	settings.Add("BN1FireManV3", false, "FireManV3");
	settings.Add("BN1NumberManV2", false, "NumberManV2");
	settings.Add("BN1NumberManV3", false, "NumberManV3");
	settings.Add("BN1StoneManV2", false, "StoneManV2");
	settings.Add("BN1StoneManV3", false, "StoneManV3");
	settings.Add("BN1IceManV2", false, "IceManV2");
	settings.Add("BN1IceManV3", false, "IceManV3");
	settings.Add("BN1SkullManV2", false, "SkullManV2");
	settings.Add("BN1SkullManV3", false, "SkullManV3");
	settings.Add("BN1ColorManV2", false, "ColorManV2");
	settings.Add("BN1ColorManV3", false, "ColorManV3");
	settings.Add("BN1BombManV2", false, "BombManV2");
	settings.Add("BN1BombManV3", false, "BombManV3");
	settings.Add("BN1SharkMan", false, "SharkMan");
	settings.Add("BN1SharkManV2", false, "SharkManV2");
	settings.Add("BN1SharkManV3", false, "SharkManV3");
	settings.Add("BN1ElecManV2", false, "ElecManV2");
	settings.Add("BN1ElecManV3", false, "ElecManV3");
	settings.Add("BN1PharaohMan", false, "PharaohMan");
	settings.Add("BN1PharaohManV2", false, "PharaohManV2");
	settings.Add("BN1PharaohManV3", false, "PharaohManV3");
	settings.Add("BN1ShadowMan", false, "ShadowMan");
	settings.Add("BN1ShadowManV2", false, "ShadowManV2");
	settings.Add("BN1ShadowManV3", false, "ShadowManV3");
	settings.Add("BN1MagicManV2", false, "MagicManV2");
	settings.Add("BN1MagicManV3", false, "MagicManV3");
	settings.Add("BN1Bass", false, "Bass");
	settings.CurrentDefaultParent = null;

	settings.Add("BN2", true, "Mega Man Battle Network 2");
	settings.CurrentDefaultParent = "BN2";

	settings.Add("BN2MainSplits", true, "Main Splits");
	settings.CurrentDefaultParent = "BN2MainSplits";
	settings.Add("BN2ZLicensePassed", false, "Z License Passed");
	settings.Add("BN2AirMan", true, "AirMan");
	settings.Add("BN2BLicensePassed", true, "B License Passed");
	settings.Add("BN2GutsMan", true, "GutsMan");
	settings.Add("BN2QuickMan", true, "QuickMan");
	settings.Add("BN2ALicensePrelims", true, "A License Prelimiaries Passed");
	settings.Add("BN2ALicenseExam", true, "A License Exam Passed");
	settings.Add("BN2CutMan", true, "CutMan");
	settings.Add("BN2EscapedYumland", true, "Escaped Yumland");
	settings.Add("BN2ShadowMan", true, "ShadowMan");
	settings.Add("BN2ThunderMan", true, "ThunderMan");
	settings.Add("BN2SnakeMan", true, "SnakeMan");
	settings.Add("BN2ProtoMan", true, "ProtoMan");
	settings.Add("BN2KnightMan", true, "KnightMan");
	settings.Add("BN2MagnetMan", true, "MagnetMan");
	settings.Add("BN2HeatData", true, "HeatData Acquired");
	settings.Add("BN2FreezeMan", true, "FreezeMan");
	settings.Add("BN2BossRush1", true, "Bosh Rush 1");
	settings.Add("BN2BossRush2", true, "Bosh Rush 2");
	settings.Add("BN2Bass", true, "Bass");
	settings.Add("BN2Completed", true, "Completed");
	settings.CurrentDefaultParent = "BN2";

	settings.Add("BN2AltSplits", false, "Alternative Splits");
	settings.CurrentDefaultParent = "BN2AltSplits";
	settings.Add("BN2Doghouse", false, "Doghouse");
	settings.Add("BN2GospelSplit", false, "Gospel");
	settings.CurrentDefaultParent = "BN2";

	settings.Add("BN2OBosses", false, "Optional Bosses");
	settings.CurrentDefaultParent = "BN2OBosses";
	settings.Add("BN2AirManV2", true, "AirManV2");
	settings.Add("BN2AirManV3", true, "AirManV3");
	settings.Add("BN2QuickManV2", false, "QuickManV2");
	settings.Add("BN2QuickManV3", false, "QuickManV3");
	settings.Add("BN2CutManV2", false, "CutManV2");
	settings.Add("BN2CutManV3", false, "CutManV3");
	settings.Add("BN2ShadowManV2", false, "ShadowManV2");
	settings.Add("BN2ShadowManV3", false, "ShadowManV3");
	settings.Add("BN2KnightManV2", false, "KnightManV2");
	settings.Add("BN2KnightManV3", false, "KnightManV3");
	settings.Add("BN2MagnetManV2", false, "MagnetManV2");
	settings.Add("BN2MagnetManV3", false, "MagnetManV3");
	settings.Add("BN2FreezeManV2", false, "FreezeManV2");
	settings.Add("BN2FreezeManV3", false, "FreezeManV3");
	settings.Add("BN2HeatMan", false, "HeatMan");
	settings.Add("BN2HeatManV2", false, "HeatManV2");
	settings.Add("BN2HeatManV3", false, "HeatManV3");
	settings.Add("BN2ToadMan", false, "ToadMan");
	settings.Add("BN2ToadManV2", false, "ToadManV2");
	settings.Add("BN2ToadManV3", false, "ToadManV3");
	settings.Add("BN2ThunderManV2", false, "ThunderManV2");
	settings.Add("BN2ThunderManV3", false, "ThunderManV3");
	settings.Add("BN2SnakeManV2", false, "SnakeManV2");
	settings.Add("BN2SnakeManV3", false, "SnakeManV3");
	settings.Add("BN2GutsManV2", false, "GutsManV2");
	settings.Add("BN2GutsManV3", false, "GutsManV3");
	settings.Add("BN2ProtoManV2", false, "ProtoManV2");
	settings.Add("BN2ProtoManV3", false, "ProtoManV3");
	settings.Add("BN2GateMan", false, "GateMan");
	settings.Add("BN2GateManV2", false, "GateManV2");
	settings.Add("BN2GateManV3", false, "GateManV3");
	settings.Add("BN2PlanetMan", false, "PlanetMan");
	settings.Add("BN2PlanetManV2", false, "PlanetManV2");
	settings.Add("BN2PlanetManV3", false, "PlanetManV3");
	settings.Add("BN2NapalmMan", false, "NapalmMan");
	settings.Add("BN2NapalmManV2", false, "NapalmManV2");
	settings.Add("BN2NapalmManV3", false, "NapalmManV3");
	settings.Add("BN2PharaohMan", false, "NapalmMan");
	settings.Add("BN2PharaohManV2", false, "PharaohManV2");
	settings.Add("BN2PharaohManV3", false, "PharaohManV3");
	settings.Add("BN2BassDeluxe", false, "Bass Deluxe");
	settings.CurrentDefaultParent = null;

	settings.Add("BN3W", true, "Mega Man Battle Network 3 White");
	settings.CurrentDefaultParent = "BN3W";

	// V2/V3 of enemies, or Alpha, Beta and Omega???
	settings.Add("BN3WMainSplits", true, "Main Splits");
	settings.CurrentDefaultParent = "BN3WMainSplits";
	settings.Add("BN3WN1Prelim1", true, "N1 Prelim 1");
	settings.Add("BN3WFlashMan", true, "FlashMan");
	settings.Add("BN3WN1Prelim2", true, "N1 Prelim 2");
	settings.Add("BN3WBeastMan", true, "BeastMan");
	settings.Add("BN3WWind", true, "Wind *");
	settings.Add("BN3WN1Prelim3", true, "N1 Prelim 3");
	settings.Add("BN3WBubbleMan", true, "BubbleMan");
	settings.Add("BN3WDesertMan", true, "DesertMan");
	settings.Add("BN3WToraJobs", true, "Tora Jobs");
	settings.Add("BN3WPlantMan", true, "PlantMan");
	settings.Add("BN3WStartFires", true, "Start Fires");
	settings.Add("BN3WFlameMan", true, "FlameMan");
	settings.Add("BN3WRank10", true, "Rank 10");
	settings.Add("BN3WDrillMan", true, "FlameMan");
	// is BubbleManV2 correct?
	settings.Add("BN3WBubbleManV2", true, "BubbleMan V2");
	settings.Add("BN3WCompletion", true, "Completion");
	settings.CurrentDefaultParent = "BN3W";

	settings.Add("BN3WOBosses", false, "Optional Bosses");
	settings.CurrentDefaultParent = "BN3WOBosses";
	// settings.Add("BN3WFlashManAlpha", true, "FlashMan Alpha");
	// settings.Add("BN3WFlashManBeta", true, "FlashMan Beta");
	// settings.Add("BN3WFlashManOmega", true, "FlashMan Omega");
	settings.Add("BN3WAlpha", true, "Alpha");
	settings.Add("BN3WAlphaOmega", true, "Alpha Omega");
	settings.Add("BN3WGutsMan", true, "GutsMan");
	settings.Add("BN3WProtoMan", true, "ProtoMan");
	settings.Add("BN3WMetalMan", true, "MetalMan");
	settings.Add("BN3WPunk", true, "Punk");
	settings.Add("BN3WKingMan", true, "KingMan");
	settings.Add("BN3WMistMan", true, "MistMan");
	settings.Add("BN3WBowlMan", true, "BowlMan");
	settings.Add("BN3WDarkMan", true, "DarkMan");
	settings.Add("BN3WJapanMan", true, "JapanMan");
	settings.Add("BN3WSerenade", true, "Serenade");
	settings.Add("BN3WBass", true, "Bass");
	settings.Add("BN3WBassGS", true, "Bass GS");
	settings.Add("BN3WBassOmega", true, "Bass Omega");
	settings.CurrentDefaultParent = null;

	settings.Add("BN3B", true, "Mega Man Battle Network 3 Blue");
	settings.CurrentDefaultParent = "BN3B";

	settings.Add("BN3BMainSplits", true, "Main Splits");
	settings.CurrentDefaultParent = "BN3BMainSplits";
	settings.Add("BN3BN1Prelim1", true, "N1 Prelim 1");
	settings.Add("BN3BFlashMan", true, "FlashMan");
	settings.Add("BN3BN1Prelim2", true, "N1 Prelim 2");
	settings.Add("BN3BBeastMan", true, "BeastMan");
	settings.CurrentDefaultParent = null;
}

init
{
	vars.BossEncounter = new List<string>();
	vars.BossDefeated = new List<string>();
	vars.WWWBaseEntered = new List<string>();
	vars.LifeVirusDefeated = new List<string>();
	vars.BN3BorW = "";
	vars.LC2Version = "";
	vars.LC2GC = "";
}

start
{
	switch(game.ProcessName)
	{
		case "MMBN_LC1":
		{
			return old.LC1_GameState == 28 && current.LC1_GameState != 28;
			break;
		}
		case "MMBN_LC2":
		{
			return (old.MMBN5_GameState == 28 && current.MMBN5_GameState != 28 ||
					old.MMBN6_GameState == 28 && current.MMBN6_GameState != 28);
			break;
		}
	}
}

onStart
{
	print("\nNew run started!\n----------------\n");
}

update
{
	switch(game.ProcessName)
	{
		case "MMBN_LC1":
		{
			// --- Mega Man Battle Network 1
			if(settings["BN1Floshell"] && current.LC1_ENo1 == 24
				|| settings["BN1ColdBear"] && current.LC1_ENo1 == 41 && current.LC1_ENo2 == 42
				|| settings["BN1GutsMan"] && current.LC1_ENo1 == 96
				|| settings["BN1GutsManV2"] && current.LC1_ENo1 == 97
				|| settings["BN1GutsManV3"] && current.LC1_ENo1 == 98
				|| settings["BN1ProtoMan"] && current.LC1_ENo1 == 99
				|| settings["BN1ProtoManV2"] && current.LC1_ENo1 == 100
				|| settings["BN1ProtoManV3"] && current.LC1_ENo1 == 101
				|| settings["BN1WoodMan"] && current.LC1_ENo1 == 102
				|| settings["BN1WoodManV2"] && current.LC1_ENo1 == 103
				|| settings["BN1WoodManV3"] && current.LC1_ENo1 == 104
				|| settings["BN1FireMan"] && current.LC1_ENo1 == 105
				|| settings["BN1FireManV2"] && current.LC1_ENo1 == 106
				|| settings["BN1FireManV3"] && current.LC1_ENo1 == 107
				|| settings["BN1NumberMan"] && current.LC1_ENo1 == 108
				|| settings["BN1NumberManV2"] && current.LC1_ENo1 == 109
				|| settings["BN1NumberManV3"] && current.LC1_ENo1 == 110
				|| settings["BN1StoneMan"] && current.LC1_ENo1 == 111
				|| settings["BN1StoneManV2"] && current.LC1_ENo1 == 112
				|| settings["BN1StoneManV3"] && current.LC1_ENo1 == 113
				|| settings["BN1IceMan"] && current.LC1_ENo1 == 114
				|| settings["BN1IceManV2"] && current.LC1_ENo1 == 115
				|| settings["BN1IceManV3"] && current.LC1_ENo1 == 116
				|| settings["BN1SkullMan"] && current.LC1_ENo1 == 117
				|| settings["BN1SkullManV2"] && current.LC1_ENo1 == 118
				|| settings["BN1SkullManV3"] && current.LC1_ENo1 == 119
				|| settings["BN1ColorMan"] && current.LC1_ENo1 == 120
				|| settings["BN1ColorManV2"] && current.LC1_ENo1 == 121
				|| settings["BN1ColorManV3"] && current.LC1_ENo1 == 122
				|| settings["BN1BombMan"] && current.LC1_ENo1 == 123
				|| settings["BN1BombManV2"] && current.LC1_ENo1 == 124
				|| settings["BN1BombManV3"] && current.LC1_ENo1 == 124
				|| settings["BN1SharkMan"] && current.LC1_ENo1 == 126
				|| settings["BN1SharkManV2"] && current.LC1_ENo1 == 127
				|| settings["BN1SharkManV3"] && current.LC1_ENo1 == 128
				|| settings["BN1ElecMan"] && (current.LC1_ENo1 == 129 || current.LC1_ENo1 == 154)
				|| settings["BN1ElecManV2"] && current.LC1_ENo1 == 130
				|| settings["BN1ElecManV3"] && current.LC1_ENo1 == 131
				|| settings["BN1PharaohMan"] && current.LC1_ENo1 == 132
				|| settings["BN1PharaohManV2"] && current.LC1_ENo1 == 133
				|| settings["BN1PharaohManV3"] && current.LC1_ENo1 == 134
				|| settings["BN1ShadowMan"] && current.LC1_ENo1 == 135
				|| settings["BN1ShadowManV2"] && current.LC1_ENo1 == 136
				|| settings["BN1ShadowManV3"] && current.LC1_ENo1 == 137
				|| settings["BN1MagicMan"] && current.LC1_ENo1 == 141
				|| settings["BN1MagicManV2"] && current.LC1_ENo1 == 142
				|| settings["BN1MagicManV3"] && current.LC1_ENo1 == 143
				|| settings["BN1Bass"] && current.LC1_ENo1 == 144)
				{
					vars.BossEncounter.Add("BN1" + current.LC1_ENo1.ToString());
				}

			if(settings["BN1LifeVirus"] && current.LC1_ENo1 == 147)
				{
					vars.LifeVirusDefeated.Add("Defeated");
				}

			if(current.LC1_AreaID == 5 && current.LC1_SubAreaID == 0)
				{
					vars.WWWBaseEntered.Add("Entered");
				}

			// --- Mega Man Battle Network 2
			// Bass Deluxe ID might be incorrect, haven't tested
			if(settings["BN2AirMan"] && current.LC1_ENo1 == 128
				|| settings["BN2AirManV2"] && current.LC1_ENo1 == 129
				|| settings["BN2AirManV3"] && current.LC1_ENo1 == 130
				|| settings["BN2QuickMan"] && current.LC1_ENo1 == 131
				|| settings["BN2QuickManV2"] && current.LC1_ENo1 == 132
				|| settings["BN2QuickManV3"] && current.LC1_ENo1 == 133
				|| settings["BN2CutMan"] && current.LC1_ENo1 == 134
				|| settings["BN2CutManV2"] && current.LC1_ENo1 == 135
				|| settings["BN2CutManV3"] && current.LC1_ENo1 == 136
				|| settings["BN2ShadowMan"] && current.LC1_ENo1 == 137
				|| settings["BN2ShadowManV2"] && current.LC1_ENo1 == 138
				|| settings["BN2ShadowManV3"] && current.LC1_ENo1 == 139
				|| settings["BN2KnightMan"] && current.LC1_ENo1 == 140
				|| settings["BN2KnightManV2"] && current.LC1_ENo1 == 141
				|| settings["BN2KnightManV3"] && current.LC1_ENo1 == 142
				|| settings["BN2MagnetMan"] && current.LC1_ENo1 == 143
				|| settings["BN2MagnetManV2"] && current.LC1_ENo1 == 144
				|| settings["BN2MagnetManV3"] && current.LC1_ENo1 == 145
				|| settings["BN2FreezeMan"] && current.LC1_ENo1 == 146
				|| settings["BN2FreezeManV2"] && current.LC1_ENo1 == 147
				|| settings["BN2FreezeManV3"] && current.LC1_ENo1 == 148
				|| settings["BN2HeatMan"] && current.LC1_ENo1 == 152
				|| settings["BN2HeatManV2"] && current.LC1_ENo1 == 153
				|| settings["BN2HeatManV3"] && current.LC1_ENo1 == 154
				|| settings["BN2ToadMan"] && current.LC1_ENo1 == 155
				|| settings["BN2ToadManV2"] && current.LC1_ENo1 == 156
				|| settings["BN2ToadManV3"] && current.LC1_ENo1 == 157
				|| settings["BN2ThunderMan"] && current.LC1_ENo1 == 158
				|| settings["BN2ThunderManV2"] && current.LC1_ENo1 == 159
				|| settings["BN2ThunderManV3"] && current.LC1_ENo1 == 160
				|| settings["BN2SnakeMan"] && current.LC1_ENo1 == 161
				|| settings["BN2SnakeManV2"] && current.LC1_ENo1 == 162
				|| settings["BN2SnakeManV3"] && current.LC1_ENo1 == 163
				|| settings["BN2GutsMan"] && current.LC1_ENo1 == 164
				|| settings["BN2GutsManV2"] && current.LC1_ENo1 == 165
				|| settings["BN2GutsManV3"] && current.LC1_ENo1 == 166
				|| settings["BN2ProtoMan"] && current.LC1_ENo1 == 167
				|| settings["BN2ProtoManV2"] && current.LC1_ENo1 == 168
				|| settings["BN2ProtoManV3"] && current.LC1_ENo1 == 169
				|| settings["BN2GateMan"] && current.LC1_ENo1 == 170
				|| settings["BN2GateManV2"] && current.LC1_ENo1 == 171
				|| settings["BN2GateManV3"] && current.LC1_ENo1 == 172
				|| settings["BN2PlanetMan"] && current.LC1_ENo1 == 173
				|| settings["BN2PlanetManV2"] && current.LC1_ENo1 == 174
				|| settings["BN2PlanetManV3"] && current.LC1_ENo1 == 175
				|| settings["BN2NapalmMan"] && current.LC1_ENo1 == 176
				|| settings["BN2NapalmManV2"] && current.LC1_ENo1 == 177
				|| settings["BN2NapalmManV3"] && current.LC1_ENo1 == 178
				|| settings["BN2PharaohMan"] && current.LC1_ENo1 == 179
				|| settings["BN2PharaohManV2"] && current.LC1_ENo1 == 180
				|| settings["BN2PharaohManV3"] && current.LC1_ENo1 == 181
				|| settings["BN2BassDeluxe"] && current.LC1_ENo1 == 184)
				{
					vars.BossEncounter.Add("BN2" + current.LC1_ENo1.ToString());
				}

			if(current.LC1_GameChoice == 3)
				{
					vars.BN3BorW = "BN3B";
				}
			else if (current.LC1_GameChoice == 4)
				{
					vars.BN3BorW = "BN3W";
				}
			else if (current.LC1_GameChoice <= 0)
				{
					vars.BN3BorW = "";
				}

			// Complete all of BN3B and BN3W associated bosses
			if (settings[vars.BN3BorW.ToString() + "FlashMan"] && current.LC1_ENo1 == 168
				// || settings[vars.BN3BorW.ToString() + "FlashManAlpha"] && current.LC1_ENo1 == 169
				// || settings[vars.BN3BorW.ToString() + "FlashManBeta"] && current.LC1_ENo1 == 170
				// || settings[vars.BN3BorW.ToString() + "FlashManOmega"] && current.LC1_ENo1 == 171
				|| settings[vars.BN3BorW.ToString() + "BeastMan"] && current.LC1_ENo1 == 172
				// || settings[vars.BN3BorW.ToString() + "BeastManAlpha"] && current.LC1_ENo1 == 173
				// || settings[vars.BN3BorW.ToString() + "BeastManBeta"] && current.LC1_ENo1 == 174
				// || settings[vars.BN3BorW.ToString() + "BeastManOmega"] && current.LC1_ENo1 == 175
				|| settings[vars.BN3BorW.ToString() + "BubbleMan"] && current.LC1_ENo1 == 176
				// || settings[vars.BN3BorW.ToString() + "BubbleManAlpha"] && current.LC1_ENo1 == 177
				// || settings[vars.BN3BorW.ToString() + "BubbleManBeta"] && current.LC1_ENo1 == 178
				// || settings[vars.BN3BorW.ToString() + "BubbleManOmega"] && current.LC1_ENo1 == 179
				|| settings[vars.BN3BorW.ToString() + "DesertMan"] && current.LC1_ENo1 == 180
				// || settings[vars.BN3BorW.ToString() + "DesertManAlpha"] && current.LC1_ENo1 == 181
				// || settings[vars.BN3BorW.ToString() + "DesertManBeta"] && current.LC1_ENo1 == 182
				// || settings[vars.BN3BorW.ToString() + "DesertManOmega"] && current.LC1_ENo1 == 183
				|| settings[vars.BN3BorW.ToString() + "PlantMan"] && current.LC1_ENo1 == 184
				// || settings[vars.BN3BorW.ToString() + "PlantManAlpha"] && current.LC1_ENo1 == 185
				// || settings[vars.BN3BorW.ToString() + "PlantManBeta"] && current.LC1_ENo1 == 186
				// || settings[vars.BN3BorW.ToString() + "PlantManOmega"] && current.LC1_ENo1 == 187
				|| settings[vars.BN3BorW.ToString() + "FlameMan"] && current.LC1_ENo1 == 188
				// || settings[vars.BN3BorW.ToString() + "FlameManAlpha"] && current.LC1_ENo1 == 189
				// || settings[vars.BN3BorW.ToString() + "FlameManBeta"] && current.LC1_ENo1 == 190
				// || settings[vars.BN3BorW.ToString() + "FlameManOmega"] && current.LC1_ENo1 == 191
				|| settings[vars.BN3BorW.ToString() + "DrillMan"] && current.LC1_ENo1 == 192
				// || settings[vars.BN3BorW.ToString() + "DrillManAlpha"] && current.LC1_ENo1 == 193
				// || settings[vars.BN3BorW.ToString() + "DrillManBeta"] && current.LC1_ENo1 == 194
				// || settings[vars.BN3BorW.ToString() + "DrillManOmega"] && current.LC1_ENo1 == 195
				|| settings[vars.BN3BorW.ToString() + "Alpha"] && current.LC1_ENo1 == 196
				|| settings[vars.BN3BorW.ToString() + "AlphaOmega"] && current.LC1_ENo1 == 197
				|| settings[vars.BN3BorW.ToString() + "GutsMan"] && current.LC1_ENo1 == 200
				// || settings[vars.BN3BorW.ToString() + "GutsManAlpha"] && current.LC1_ENo1 == 201
				// || settings[vars.BN3BorW.ToString() + "GutsManBeta"] && current.LC1_ENo1 == 202
				// || settings[vars.BN3BorW.ToString() + "GutsManOmega"] && current.LC1_ENo1 == 203
				|| settings[vars.BN3BorW.ToString() + "ProtoMan"] && current.LC1_ENo1 == 204
				// || settings[vars.BN3BorW.ToString() + "ProtoManAlpha"] && current.LC1_ENo1 == 205
				// || settings[vars.BN3BorW.ToString() + "ProtoManBeta"] && current.LC1_ENo1 == 206
				// || settings[vars.BN3BorW.ToString() + "ProtoManOmega"] && current.LC1_ENo1 == 207
				|| settings[vars.BN3BorW.ToString() + "MetalMan"] && current.LC1_ENo1 == 208
				// || settings[vars.BN3BorW.ToString() + "MetalManAlpha"] && current.LC1_ENo1 == 209
				// || settings[vars.BN3BorW.ToString() + "MetalManBeta"] && current.LC1_ENo1 == 210
				// || settings[vars.BN3BorW.ToString() + "MetalManOmega"] && current.LC1_ENo1 == 211
				|| settings[vars.BN3BorW.ToString() + "Punk"] && current.LC1_ENo1 == 212
				// || settings[vars.BN3BorW.ToString() + "PunkAlpha"] && current.LC1_ENo1 == 213
				// || settings[vars.BN3BorW.ToString() + "PunkBeta"] && current.LC1_ENo1 == 214
				// || settings[vars.BN3BorW.ToString() + "PunkOmega"] && current.LC1_ENo1 == 215
				|| settings[vars.BN3BorW.ToString() + "KingMan"] && current.LC1_ENo1 == 216
				// || settings[vars.BN3BorW.ToString() + "KingManAlpha"] && current.LC1_ENo1 == 217
				// || settings[vars.BN3BorW.ToString() + "KingManBeta"] && current.LC1_ENo1 == 218
				// || settings[vars.BN3BorW.ToString() + "KingManOmega"] && current.LC1_ENo1 == 219
				|| settings[vars.BN3BorW.ToString() + "MistMan"] && current.LC1_ENo1 == 220
				// || settings[vars.BN3BorW.ToString() + "MistManAlpha"] && current.LC1_ENo1 == 221
				// || settings[vars.BN3BorW.ToString() + "MistManBeta"] && current.LC1_ENo1 == 222
				// || settings[vars.BN3BorW.ToString() + "MistManOmega"] && current.LC1_ENo1 == 223
				|| settings[vars.BN3BorW.ToString() + "BowlMan"] && current.LC1_ENo1 == 224
				// || settings[vars.BN3BorW.ToString() + "BowlManAlpha"] && current.LC1_ENo1 == 225
				// || settings[vars.BN3BorW.ToString() + "BowlManBeta"] && current.LC1_ENo1 == 226
				// || settings[vars.BN3BorW.ToString() + "BowlManOmega"] && current.LC1_ENo1 == 227
				|| settings[vars.BN3BorW.ToString() + "DarkMan"] && current.LC1_ENo1 == 228
				// || settings[vars.BN3BorW.ToString() + "DarkManAlpha"] && current.LC1_ENo1 == 229
				// || settings[vars.BN3BorW.ToString() + "DarkManBeta"] && current.LC1_ENo1 == 230
				// || settings[vars.BN3BorW.ToString() + "DarkManOmega"] && current.LC1_ENo1 == 231
				|| settings[vars.BN3BorW.ToString() + "JapanMan"] && current.LC1_ENo1 == 232
				// || settings[vars.BN3BorW.ToString() + "JapanManAlpha"] && current.LC1_ENo1 == 233
				// || settings[vars.BN3BorW.ToString() + "JapanManBeta"] && current.LC1_ENo1 == 234
				// || settings[vars.BN3BorW.ToString() + "JapanManOmega"] && current.LC1_ENo1 == 235
				|| settings[vars.BN3BorW.ToString() + "Serenade"] && current.LC1_ENo1 == 236
				// || settings[vars.BN3BorW.ToString() + "SerenadeAlpha"] && current.LC1_ENo1 == 237
				// || settings[vars.BN3BorW.ToString() + "SerenadeBeta"] && current.LC1_ENo1 == 238
				// || settings[vars.BN3BorW.ToString() + "SerenadeOmega"] && current.LC1_ENo1 == 239
				|| settings[vars.BN3BorW.ToString() + "Bass"] && current.LC1_ENo1 == 241
				|| settings[vars.BN3BorW.ToString() + "BassGS"] && current.LC1_ENo1 == 242
				|| settings[vars.BN3BorW.ToString() + "BassOmega"] && current.LC1_ENo1 == 243)
				{
					vars.BossEncounter.Add(vars.BN3BorW.ToString() + current.LC1_ENo1.ToString());
				}

			if(current.LC1_GameChoice >= 3 && 
				(settings["BN1Floshell"] && current.LC1_ENo1 == 24))
				{
					vars.BossEncounter.Add("BN1" + current.LC1_ENo1.ToString());
				}
			
			if(current.LC1_AreaID != old.LC1_AreaID) print("LC1_AreaID: " + current.LC1_AreaID.ToString());
			if(current.LC1_SubAreaID != old.LC1_SubAreaID) print("LC1_SubAreaID: " + current.LC1_SubAreaID.ToString());
			if(current.LC1_GameState != old.LC1_GameState) print("LC1_GameState: " + current.LC1_GameState.ToString());

			if(current.LC1_GameChoice != old.LC1_GameChoice) print("LC1_GameChoice: " + current.LC1_GameChoice.ToString());
			if(current.LC1_GameSelected != old.LC1_GameSelected) print("LC1_GameSelected: " + current.LC1_GameSelected.ToString());
			if(current.LC1_ENo1 != old.LC1_ENo1) print("LC1_ENo1: " + current.LC1_ENo1.ToString());
			if(current.MMBN1_HigsMemo != old.MMBN1_HigsMemo) print("MMBN1_HigsMemo: " + current.MMBN1_HigsMemo.ToString());
			if(current.MMBN1_PaMemo != old.MMBN1_PaMemo) print("MMBN1_PaMemo: " + current.MMBN1_PaMemo.ToString());
			if(current.MMBN1_YuriMemo != old.MMBN1_YuriMemo) print("MMBN1_YuriMemo: " + current.MMBN1_YuriMemo.ToString());
			break;
		}
		case "MMBN_LC2":
			{
				vars.LC2GC = current.LC2_GameChoice;
				switch ( (byte) vars.LC2GC )
				{
				case 5:
					{ 
						vars.LC2Version = "BN4RS";
					}
					break;
				case 6:
					{
						vars.LC2Version = "BN4BM";
					}
					break;
				case 7:
					{
						vars.LC2Version = "BN5TM";
					}
					break; 
				case 8:
					{
						vars.LC2Version = "BN5TC";
					}
					break;
				case 9:
					{
						vars.LC2Version = "BN6CG";
					}
					break;
				case 10:
					{
						vars.LC2Version = "BN6CF";
					}
					break;
				}
			 	// print("test");
			}
			break;
		}
}

split
{
	// --- Mega Man Battle Network 1
	if (vars.BossEncounter.Contains("BN1" + current.LC1_ENo1.ToString()) 
		&& !vars.BossDefeated.Contains("BN1" + current.LC1_ENo1.ToString())
		&& old.LC1_GameState == 12 && current.LC1_GameState != 12)
		{
			vars.BossDefeated.Add("BN1" + current.LC1_ENo1.ToString());
			return true;
		}
	
	if (current.MMBN1_HigsMemo == 1 && current.MMBN1_LabMemo == 1
		&& current.MMBN1_YuriMemo == 1 & current.MMBN1_PaMemo == 1
		&& old.LC1_AreaID == 2 && old.LC1_SubAreaID == 5
		&& current.LC1_AreaID == 137 && current.LC1_SubAreaID == 0)
		{
			return true;
		}

	if (settings["BN1LifeVirusSplit"] && vars.LifeVirusDefeated.Contains("Defeated") 
		&& vars.WWWBaseEntered.Contains("Entered") 
		&& old.MMBN1_ResultScreen == 1 && current.MMBN1_ResultScreen == 15)
		{
			return true;
		}

	if (settings["BN1NoLifeVirusSplit"] 
		&& vars.WWWBaseEntered.Contains("Entered") 
		&& old.MMBN1_ResultScreen == 1 && current.MMBN1_ResultScreen == 15)
		{
			return true;
		}

	// --- Mega Man Battle Network 2
	// current.LC1_AreaID is not 133 for all other bosses as to not split in Boss Rushes
	if (current.LC1_AreaID != 133 && vars.BossEncounter.Contains("BN2" + current.LC1_ENo1.ToString()) 
		&& !vars.BossDefeated.Contains("BN2" + current.LC1_ENo1.ToString())
		&& old.LC1_GameState == 12 && current.LC1_GameState == 4)
		{
			vars.BossDefeated.Add("BN2" + current.LC1_ENo1.ToString());
			return true;
		}

	if (settings["BN2ZLicensePassed"] && old.LC1_Progress == 3 && current.LC1_Progress == 4
		|| settings["BN2BLicensePassed"] && old.MMBN2_BLicense == 0 && current.MMBN2_BLicense == 1
		|| settings["BN2ALicensePrelims"] && old.LC1_Progress == 18 && current.LC1_Progress == 19 
		|| settings["BN2ALicenseExam"] && old.LC1_Progress == 19 && current.LC1_Progress == 20
		|| settings["BN2EscapedYumland"] & old.LC1_Progress == 25 && current.LC1_Progress == 26
		|| settings["BN2HeatData"] & old.MMBN2_HeatData == 0 && current.MMBN2_HeatData == 1)
		{
			return true;
		}

	if (settings["BN2BossRush1"] && current.LC1_AreaID == 133 && current.LC1_SubAreaID == 3
		 && old.LC1_GameState == 12 && current.LC1_GameState == 4 && current.LC1_ENo1 == 134)
		{
			print("Boss Rush 1 Done");
			return true;
		}

	if (settings["BN2BossRush2"] && current.LC1_AreaID == 133 && current.LC1_SubAreaID == 4
		 && old.LC1_GameState == 12 && current.LC1_GameState == 4 && current.LC1_ENo1 == 146)
		{
			print("Boss Rush 2 Done");
			return true;
		}

	if (settings["BN2Bass"] && current.LC1_ENo1 == 182
		&& old.LC1_GameState == 12 && current.LC1_GameState != 12 )
		{
			print("Bass Defeated");
			return true;
		}

	if (settings["BN2Completed"] && current.LC1_ENo1 == 149
		&& old.LC1_GameState == 12 && current.LC1_GameState != 12)
		{
			print("Gospel Defeated");
			vars.BossDefeated.Add("BN2GospelDead");
		}

	if (settings["BN2Completed"] && vars.BossDefeated.Contains("BN2GospelDead")
		&& current.LC1_AreaID == 2 && current.LC1_SubAreaID == 4
		&& old.MMBN2_FinalSplit == 0 && current.MMBN2_FinalSplit == 50)
		{
			print("Completed");
			return true;
		}

	if (settings["BN2GospelSplit"] && current.LC1_ENo1 == 149
		&& old.LC1_GameState == 12 && current.LC1_GameState != 12)
		{
			print("Alt Gospel Split");
			return true;
		}

	if (settings["BN2Doghouse"] && (old.LC1_AreaID == 140 && old.LC1_SubAreaID == 2)
		&& (current.LC1_AreaID == 0 && current.LC1_SubAreaID == 0))
		{
			return true;
		}

	// Mega Man Battle Network 3 White & Blue
	if (vars.BossEncounter.Contains(vars.BN3BorW.ToString() + current.LC1_ENo1.ToString()) 
		&& !vars.BossDefeated.Contains(vars.BN3BorW.ToString() + current.LC1_ENo1.ToString())
		&& old.LC1_GameState == 12 && current.LC1_GameState != 12)
		{
			vars.BossDefeated.Add(vars.BN3BorW.ToString() + current.LC1_ENo1.ToString());
			return true;
		}
}

onSplit
{
    print("\nSplit\n-----\n");
}

onReset
{
	vars.BossEncounter.Clear();
	vars.BossDefeated.Clear();
	vars.WWWBaseEntered.Clear();
	vars.LifeVirusDefeated.Clear();
}
