// Work in Progress Autosplitter by Nikoheart
// 0.4 - BN1/BN2 Mostly Done, BN5/6 Pointers found
// requires just-ero's asl-help in LiveSplit/Components
// https://github.com/just-ero/asl-help/raw/main/lib/asl-help
// Thanks NMarko for help with Area/SubArea ID

// 23.04.22
// BN1/3 autosplitters which uphold current Any%'s on SR.C
// Major testing needed

// ----- Things to do in BN1 
// get id of results item win? (for All Chips run)
// re-organise settings of autosplitter with super mods
// test with speedrun community if WWW Comp 1 skip works

// ----- Things to do in BN2 
// look for addresses.battle_mode / battle_state to use maybe instead of InBattle (can be potentially unreliable)
// BN2 SSS Licence Exam - PlanetMan/Bass to test and post-game credits screen (the congratulations one)

// ----- Things to do in BN3
// Double check what Japanese versions of Omega are represented as - V4 or SP?

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
	short MMBN1_HP : 0x29F3148, 0x20;
	short MMBN1_ENoHP1 : 0x29F21F8, 0x60;
	short MMBN1_ENoHP2 : 0x29F21F8, 0x110;
	short MMBN1_ENoHP3 : 0x29F21F8, 0x1C0;
	byte MMBN1_HigsMemo : 0x29EE840, 0xB8, 0xF4;
	byte MMBN1_LabMemo : 0x29EE840, 0xB8, 0xF5;
	byte MMBN1_YuriMemo : 0x29EE840, 0xB8, 0xF6;
	byte MMBN1_PaMemo : 0x29EE840, 0xB8, 0xF7;
	short MMBN1_FinalSplit : 0x29F21F8, 0x4;

	// --- Mega Man Battle Network 2 Pointers
	short MMBN2_HP : 0x29F5988, 0x24;
	short MMBN2_ENoHP1 : 0x29F21F8, 0x1A4;
	short MMBN2_ENoHP2 : 0x29F21F8, 0x264;
	short MMBN2_ENoHP3 : 0x29F21F8, 0x264;
	byte MMBN2_BLicense: 0x29EE840, 0xB8, 0x148;
	byte MMBN2_HeatData : 0x29EE840, 0xB8, 0x134;
	int MMBN2_FinalSplit: 0x29F4CD8, 0x4;

	// --- Mega Man Battle Network 3 White/Blue Pointers
	short MMBN3_HP : 0x29F9748, 0x34;
	byte MMBN3_ENoHP1 : 0x29F9748, 0x108;
	byte MMBN3_ENoHP2 : 0x29F9748, 0x1DC;
	byte MMBN3_ENoHP3 : 0x29F9748, 0x2B0;
	int MMBN3_MainRNG : 0x16485EAA, 0x897;
	int MMBN3_LazyRNG : 0x16485EAA, 0x89B;
	byte MMBN3_WindStarChip : 0x29EE840, 0xB8, 0xE13;
	byte MMBN3_N1Prelim3Win : 0x29FA938, 0x94;
	short MMBN3_Tally : 0x29EE840, 0xB8, 0x104;
	short MMBN3_ToraJobsFinished : 0x29EE840, 0xB8, 0x69C;
	byte MMBN3_Rank10OnScreen : 0x29F0938;
	byte MMBN3_CompletedSplit : 0x29FA938, 0x60;
}

state("MMBN_LC2") 
{
	// --- Main Menu of Legacy Collection
	byte LC2_GameChoice : 0xAC13F84; // BN4RS - 5/BM - 6,  BN5TM - 7/TC - 8, BN6CG - 9/CF - 10
	byte LC2_GameSelected : 0xAC14688; // when chosen, value turns 0
	
	// --- Mega Man Battle Network 4
	byte MMBN4_GameState : 0x03D617C8, 0xF52;
	byte MMBN4_AreaID : 0x3D53B28, 0x158;
	byte MMBN4_SubAreaID : 0x3D53B28, 0x160;
	byte MMBN4_ENo1 : 0x142CC291, 0xB4F;
	byte MMBN4_ENo1HP : 0x1169D9E6, 0x75C;
	byte MMBN4_ENo2 : 0x142CC291, 0xB53;
	byte MMBN4_ENo2HP : 0x1169D9E6, 0x834;
	byte MMBN4_ENo3 : 0x142CC291, 0xB57;
	byte MMBN4_ENo3HP : 0x1169D9E6, 0x90C;
	byte MMBN4_HP : 0x1169D9E6, 0x684;

	// Progress hard to find - if absolutely needed, more delving into ram_offset
	// Battle_Paused & Zenny also affected by RAM_Offset
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
	settings.Add("Vol1", true, "Legacy Collection 1");
	settings.CurrentDefaultParent = "Vol1";

	settings.Add("Vol1Logging", false, "Global Logging");
	settings.CurrentDefaultParent = "Vol1Logging";
	settings.Add("Vol1GameChoice", false, "Game Choice");
	settings.Add("Vol1GameSelected", false, "Game Selected");
	settings.Add("Vol1GameState", false, "Game State");
	settings.Add("Vol1AreaID", false, "Area ID");
	settings.Add("Vol1SubAreaID", false, "Sub Area ID");
	settings.Add("Vol1Progress", false, "Progress");
	settings.Add("Vol1ENo1", false, "Enemy Number 1 ID");
	settings.Add("Vol1ENo2", false, "Enemy Number 2 ID");
	settings.Add("Vol1ENo3", false, "Enemy Number 3 ID");
	settings.CurrentDefaultParent = "Vol1";

	settings.Add("BN1", true, "Mega Man Battle Network 1");
	settings.CurrentDefaultParent = "BN1";

	settings.Add("BN1Logging", false, "BN1 Logging");
	settings.CurrentDefaultParent = "BN1Logging";
	settings.Add("BN1HigsMemoLog", false, "Higs Memo Get");
	settings.Add("BN1LabMemoLog", false, "Lab Memo Get");
	settings.Add("BN1YuriMemoLog", false, "Yuri Memo Get");
	settings.Add("BN1PaMemoLog", false, "Pa Memo Get");
	settings.CurrentDefaultParent = "BN1";


	settings.Add("BN1FinalSplit", true, "Final Split");
	settings.CurrentDefaultParent = "BN1FinalSplit";
	settings.Add("BN1LifeVirusSplit", true, "Life Virus Kill + End Split");
	settings.Add("BN1NoLifeVirusSplit", false, "Skip Life Virus + End Split");
	settings.CurrentDefaultParent = "BN1";
	
	settings.Add("BN1MainSplits", true, "Main Splits");
	settings.CurrentDefaultParent = "BN1MainSplits";
	settings.Add("0FireMan", true, "FireMan");
	settings.Add("0NumberMan", true, "NumberMan");
	settings.Add("0GutsMan", true, "GutsMan");
	settings.Add("0StoneMan", true, "StoneMan");
	settings.Add("0ColdBear", true, "ColdBear");
	settings.Add("0IceMan", true, "IceMan");
	settings.Add("0SkullMan", true, "SkullMan");
	settings.Add("0ColorMan", true, "ColorMan");
	settings.Add("0ElecMan", false, "ElecMan");
	settings.Add("0ProtoMan", true, "ProtoMan");
	settings.Add("0Memos", true, "Memos");
	settings.Add("0BombMan", true, "BombMan");
	settings.Add("0MagicMan", true, "MagicMan");
	settings.Add("0LifeVirus", true, "LifeVirus");
	settings.CurrentDefaultParent = "BN1";

	settings.Add("BN1MBosses", true, "Mini-Bosses");
	settings.CurrentDefaultParent = "BN1MBosses";
	settings.Add("0Floshell", true, "Floshell");
	settings.CurrentDefaultParent = "BN1";

	settings.Add("BN1OBosses", false, "Optional Bosses");
	settings.CurrentDefaultParent = "BN1OBosses";
	settings.Add("0GutsManV2", false, "GutsManV2");
	settings.Add("0GutsManV3", false, "GutsManV3");
	settings.Add("0ProtoManV2", false, "ProtoManV2");
	settings.Add("0ProtoManV3", false, "ProtoManV3");
	settings.Add("0WoodMan", false, "WoodMan");
	settings.Add("0WoodManV2", false, "WoodManV2");
	settings.Add("0WoodManV3", false, "WoodManV3");
	settings.Add("0FireManV2", false, "FireManV2");
	settings.Add("0FireManV3", false, "FireManV3");
	settings.Add("0NumberManV2", false, "NumberManV2");
	settings.Add("0NumberManV3", false, "NumberManV3");
	settings.Add("0StoneManV2", false, "StoneManV2");
	settings.Add("0StoneManV3", false, "StoneManV3");
	settings.Add("0IceManV2", false, "IceManV2");
	settings.Add("0IceManV3", false, "IceManV3");
	settings.Add("0SkullManV2", false, "SkullManV2");
	settings.Add("0SkullManV3", false, "SkullManV3");
	settings.Add("0ColorManV2", false, "ColorManV2");
	settings.Add("0ColorManV3", false, "ColorManV3");
	settings.Add("0BombManV2", false, "BombManV2");
	settings.Add("0BombManV3", false, "BombManV3");
	settings.Add("0SharkMan", false, "SharkMan");
	settings.Add("0SharkManV2", false, "SharkManV2");
	settings.Add("0SharkManV3", false, "SharkManV3");
	settings.Add("0ElecManV2", false, "ElecManV2");
	settings.Add("0ElecManV3", false, "ElecManV3");
	settings.Add("0PharaohMan", false, "PharaohMan");
	settings.Add("0PharaohManV2", false, "PharaohManV2");
	settings.Add("0PharaohManV3", false, "PharaohManV3");
	settings.Add("0ShadowMan", false, "ShadowMan");
	settings.Add("0ShadowManV2", false, "ShadowManV2");
	settings.Add("0ShadowManV3", false, "ShadowManV3");
	settings.Add("0MagicManV2", false, "MagicManV2");
	settings.Add("0MagicManV3", false, "MagicManV3");
	settings.Add("0Bass", false, "Bass");
	settings.CurrentDefaultParent = "Vol1";

	settings.Add("BN2", true, "Mega Man Battle Network 2");
	settings.CurrentDefaultParent = "BN2";

	settings.Add("BN2MainSplits", true, "Main Splits");
	settings.CurrentDefaultParent = "BN2MainSplits";
	settings.Add("2ZLicensePassed", false, "Z License Passed");
	settings.Add("2AirMan", true, "AirMan");
	settings.Add("2BLicensePassed", true, "B License Passed");
	settings.Add("2GutsMan", true, "GutsMan");
	settings.Add("2QuickMan", true, "QuickMan");
	settings.Add("2ALicensePrelims", true, "A License Prelimiaries Passed");
	settings.Add("2ALicenseExam", true, "A License Exam Passed");
	settings.Add("2CutMan", true, "CutMan");
	settings.Add("2EscapedYumland", true, "Escaped Yumland");
	settings.Add("2ShadowMan", true, "ShadowMan");
	settings.Add("2ThunderMan", true, "ThunderMan");
	settings.Add("2SnakeMan", true, "SnakeMan");
	settings.Add("2ProtoMan", true, "ProtoMan");
	settings.Add("2KnightMan", true, "KnightMan");
	settings.Add("2MagnetMan", true, "MagnetMan");
	settings.Add("2HeatData", true, "HeatData Acquired");
	settings.Add("2FreezeMan", true, "FreezeMan");
	settings.Add("2BossRush1", true, "Bosh Rush 1");
	settings.Add("2BossRush2", true, "Bosh Rush 2");
	settings.Add("2Bass", true, "Bass");
	settings.Add("2Completed", true, "Completed");
	settings.CurrentDefaultParent = "BN2";

	settings.Add("BN2AltSplits", false, "Alternative Splits");
	settings.CurrentDefaultParent = "BN2AltSplits";
	settings.Add("2Doghouse", false, "Doghouse");
	settings.Add("2GospelSplit", false, "Gospel");
	settings.CurrentDefaultParent = "BN2";

	settings.Add("BN2OBosses", false, "Optional Bosses");
	settings.CurrentDefaultParent = "BN2OBosses";
	settings.Add("2AirManV2", true, "AirManV2");
	settings.Add("2AirManV3", true, "AirManV3");
	settings.Add("2QuickManV2", false, "QuickManV2");
	settings.Add("2QuickManV3", false, "QuickManV3");
	settings.Add("2CutManV2", false, "CutManV2");
	settings.Add("2CutManV3", false, "CutManV3");
	settings.Add("2ShadowManV2", false, "ShadowManV2");
	settings.Add("2ShadowManV3", false, "ShadowManV3");
	settings.Add("2KnightManV2", false, "KnightManV2");
	settings.Add("2KnightManV3", false, "KnightManV3");
	settings.Add("2MagnetManV2", false, "MagnetManV2");
	settings.Add("2MagnetManV3", false, "MagnetManV3");
	settings.Add("2FreezeManV2", false, "FreezeManV2");
	settings.Add("2FreezeManV3", false, "FreezeManV3");
	settings.Add("2HeatMan", false, "HeatMan");
	settings.Add("2HeatManV2", false, "HeatManV2");
	settings.Add("2HeatManV3", false, "HeatManV3");
	settings.Add("2ToadMan", false, "ToadMan");
	settings.Add("2ToadManV2", false, "ToadManV2");
	settings.Add("2ToadManV3", false, "ToadManV3");
	settings.Add("2ThunderManV2", false, "ThunderManV2");
	settings.Add("2ThunderManV3", false, "ThunderManV3");
	settings.Add("2SnakeManV2", false, "SnakeManV2");
	settings.Add("2SnakeManV3", false, "SnakeManV3");
	settings.Add("2GutsManV2", false, "GutsManV2");
	settings.Add("2GutsManV3", false, "GutsManV3");
	settings.Add("2ProtoManV2", false, "ProtoManV2");
	settings.Add("2ProtoManV3", false, "ProtoManV3");
	settings.Add("2GateMan", false, "GateMan");
	settings.Add("2GateManV2", false, "GateManV2");
	settings.Add("2GateManV3", false, "GateManV3");
	settings.Add("2PlanetMan", false, "PlanetMan");
	settings.Add("2PlanetManV2", false, "PlanetManV2");
	settings.Add("2PlanetManV3", false, "PlanetManV3");
	settings.Add("2NapalmMan", false, "NapalmMan");
	settings.Add("2NapalmManV2", false, "NapalmManV2");
	settings.Add("2NapalmManV3", false, "NapalmManV3");
	settings.Add("2PharaohMan", false, "NapalmMan");
	settings.Add("2PharaohManV2", false, "PharaohManV2");
	settings.Add("2PharaohManV3", false, "PharaohManV3");
	settings.Add("2BassDeluxe", false, "Bass Deluxe");
	settings.CurrentDefaultParent = "Vol1";

	settings.Add("BN3W", true, "Mega Man Battle Network 3 White");
	settings.CurrentDefaultParent = "BN3W";

	settings.Add("BN3WLogging", false, "BN3W Logging");
	settings.CurrentDefaultParent = "BN3WLogging";
	settings.Add("3MainRNG", false, "Main RNG Hexidecimal");
	settings.Add("3LazyRNG", false, "Lazy RNG Hexidecimal");
	settings.CurrentDefaultParent = "BN3W";

	settings.Add("BN3WMainSplits", true, "Main Splits");
	settings.CurrentDefaultParent = "BN3WMainSplits";
	settings.Add("3N1Prelim1", true, "N1 Prelim 1");
	settings.Add("3FlashMan", true, "FlashMan");
	settings.Add("3N1Prelim2", true, "N1 Prelim 2");
	settings.Add("3BeastMan", true, "BeastMan");
	settings.Add("3Wind", true, "Wind *");
	settings.Add("3N1Prelim3", true, "N1 Prelim 3");
	settings.Add("3BubbleMan", true, "BubbleMan");
	settings.Add("3MetalManAlpha", true, "MetalMan Alpha / V2");
	settings.Add("3DesertMan", true, "DesertMan");
	settings.Add("3ToraJobs", true, "Tora Jobs");
	settings.Add("3PlantMan", true, "PlantMan");
	settings.Add("3FiresStarted", true, "Fires Started - SciLab Train Stairs End Convo");
	settings.Add("3FlamMan", true, "FlamMan");
	settings.Add("3Rank10", true, "Rank 10");
	settings.Add("3DrillMan", true, "DrillMan");
	settings.Add("3BubbleManAlpha", true, "BubbleMan Alpha V2");
	settings.Add("3Completion", true, "Completion");
	settings.CurrentDefaultParent = "BN3W";

	settings.Add("BN3WOBosses", false, "Optional Bosses");
	settings.CurrentDefaultParent = "BN3WOBosses";
	settings.Add("3FlashManAlpha", true, "FlashMan Alpha / V2");
	settings.Add("3FlashManBeta", true, "FlashMan Beta / V3");
	settings.Add("3FlashManOmega", true, "FlashMan Omega / SP");
	settings.Add("3BeastManAlpha", true, "BeastMan Alpha / V2");
	settings.Add("3BeastManBeta", true, "BeastMan Beta / V3");
	settings.Add("3BeastManOmega", true, "BeastMan Omega / SP");
	settings.Add("3BubbleManBeta", true, "BubbleMan Beta / V3");
	settings.Add("3BubbleManOmega", true, "BubbleMan Omega / SP");
	settings.Add("3DesertManAlpha", true, "DesertMan Alpha / V2");
	settings.Add("3DesertManBeta", true, "DesertMan Beta / V3");
	settings.Add("3DesertManOmega", true, "DesertMan Omega / SP");
	settings.Add("3PlantManAlpha", true, "PlantMan Alpha / V2");
	settings.Add("3PlantManBeta", true, "PlantMan Beta / V3");
	settings.Add("3PlantManOmega", true, "PlantMan Omega / SP");
	settings.Add("3FlamManAlpha", true, "FlamMan Alpha / V2");
	settings.Add("3FlamManBeta", true, "FlamMan Beta / V3");
	settings.Add("3FlamManOmega", true, "FlamMan Omega / SP");
	settings.Add("3DrillManAlpha", true, "DrillMan Alpha / V2");
	settings.Add("3DrillManBeta", true, "DrillMan Beta / V3");
	settings.Add("3DrillManOmega", true, "DrillMan Omega / SP");
	settings.Add("3Alpha", true, "Alpha");
	settings.Add("3AlphaOmega", true, "Alpha Omega");
	settings.Add("3GutsMan", true, "GutsMan");
	settings.Add("3GutsManAlpha", true, "GutsMan Alpha / V2");
	settings.Add("3GutsManBeta", true, "GutsMan Beta / V3");
	settings.Add("3GutsManOmega", true, "GutsMan Omega / SP");
	settings.Add("3ProtoMan", true, "ProtoMan");
	settings.Add("3ProtoManAlpha", true, "ProtoMan Alpha / V2");
	settings.Add("3ProtoManBeta", true, "ProtoMan Beta / V3");
	settings.Add("3ProtoManOmega", true, "ProtoMan Omega / SP");
	settings.Add("3MetalMan", true, "MetalMan");
	settings.Add("3MetalManBeta", true, "MetalMan Beta / V3");
	settings.Add("3MetalManOmega", true, "MetalMan Omega / SP");
	settings.Add("3Punk", true, "Punk");
	settings.Add("3PunkAlpha", true, "Punk Alpha / V2");
	settings.Add("3PunkBeta", true, "Punk Beta / V3");
	settings.Add("3PunkOmega", true, "Punk Omega / SP");
	settings.Add("3KingMan", true, "KingMan");
	settings.Add("3KingManAlpha", true, "KingMan Alpha / V2");
	settings.Add("3KingManBeta", true, "KingMan Beta / V3");
	settings.Add("3KingManOmega", true, "KingMan Omega / SP");
	settings.Add("3MistMan", true, "MistMan");
	settings.Add("3MistManAlpha", true, "MistMan Alpha / V2");
	settings.Add("3MistManBeta", true, "MistMan Beta / V3");
	settings.Add("3MistManOmega", true, "MistMan Omega / SP");
	settings.Add("3BowlMan", true, "BowlMan");
	settings.Add("3BowlManAlpha", true, "BowlMan Alpha / V2");
	settings.Add("3BowlManBeta", true, "BowlMan Beta / V3");
	settings.Add("3BowlManOmega", true, "BowlMan Omega / SP");
	settings.Add("3DarkMan", true, "DarkMan");
	settings.Add("3DarkManAlpha", true, "DarkMan Alpha / V2");
	settings.Add("3DarkManBeta", true, "DarkMan Beta / V3");
	settings.Add("3DarkManOmega", true, "DarkMan Omega / SP");
	settings.Add("3JapanMan", true, "JapanMan");
	settings.Add("3JapanManAlpha", true, "JapanMan Alpha / V2");
	settings.Add("3JapanManBeta", true, "JapanMan Beta / V3");
	settings.Add("3JapanManOmega", true, "JapanMan Omega / SP");
	settings.Add("3Serenade", true, "Serenade");
	settings.Add("3SerenadeAlpha", true, "Serenade Alpha / V2");
	settings.Add("3SerenadeBeta", true, "Serenade Beta / V3");
	settings.Add("3SerenadeOmega", true, "Serenade Alpha / SP");
	settings.Add("3Bass", true, "Bass");
	settings.Add("3BassGS", true, "Bass GS");
	settings.Add("3BassOmega", true, "Bass Omega");
	settings.CurrentDefaultParent = "Vol1";

	settings.Add("BN3B", true, "Mega Man Battle Network 3 Blue");
	settings.CurrentDefaultParent = "BN3B";

	settings.Add("BN3BLogging", false, "BN3B Logging");
	settings.CurrentDefaultParent = "BN3BLogging";
	settings.Add("4MainRNG", false, "Main RNG Hexidecimal");
	settings.Add("4LazyRNG", false, "Lazy RNG Hexidecimal");
	settings.CurrentDefaultParent = "BN3B";

	settings.Add("BN3BMainSplits", true, "Main Splits");
	settings.CurrentDefaultParent = "BN3BMainSplits";
	settings.Add("4N1Prelim1", true, "N1 Prelim 1");
	settings.Add("4FlashMan", true, "FlashMan");
	settings.Add("4N1Prelim2", true, "N1 Prelim 2");
	settings.Add("4BeastMan", true, "BeastMan");
	settings.Add("4Wind", true, "Wind *");
	settings.Add("4N1Prelim3", true, "N1 Prelim 3");
	settings.Add("4BubbleMan", true, "BubbleMan");
	settings.Add("4MetalManAlpha", true, "Metal Man Alpha / V2");
	settings.Add("4DesertMan", true, "DesertMan");
	settings.Add("4ToraJobs", true, "Tora Jobs");
	settings.Add("4PlantMan", true, "PlantMan");
	settings.Add("4FiresStarted", true, "Fires Started - SciLab Train Stairs End Convo");
	settings.Add("4FlamMan", true, "FlamMan");
	settings.Add("4Rank10", true, "Rank 10");
	settings.Add("4DrillMan", true, "FlamMan");
	settings.Add("4BubbleManV2", true, "BubbleMan V2");
	settings.Add("4Completion", true, "Completion");
	settings.CurrentDefaultParent = "BN3B";

	settings.Add("BN3BOBosses", false, "Optional Bosses");
	settings.CurrentDefaultParent = "BN3BOBosses";
	settings.Add("4FlashManAlpha", true, "FlashMan Alpha / V2");
	settings.Add("4FlashManBeta", true, "FlashMan Beta / V3");
	settings.Add("4FlashManOmega", true, "FlashMan Omega / SP");
	settings.Add("4BeastManAlpha", true, "BeastMan Alpha / V2");
	settings.Add("4BeastManBeta", true, "BeastMan Beta / V3");
	settings.Add("4BeastManOmega", true, "BeastMan Omega / SP");
	settings.Add("4BubbleManBeta", true, "BubbleMan Beta / V3");
	settings.Add("4BubbleManOmega", true, "BubbleMan Omega / SP");
	settings.Add("4DesertManAlpha", true, "DesertMan Alpha / V2");
	settings.Add("4DesertManBeta", true, "DesertMan Beta / V3");
	settings.Add("4DesertManOmega", true, "DesertMan Omega / SP");
	settings.Add("4PlantManAlpha", true, "PlantMan Alpha / V2");
	settings.Add("4PlantManBeta", true, "PlantMan Beta / V3");
	settings.Add("4PlantManOmega", true, "PlantMan Omega / SP");
	settings.Add("4FlamManAlpha", true, "FlamMan Alpha / V2");
	settings.Add("4FlamManBeta", true, "FlamMan Beta / V3");
	settings.Add("4FlamManOmega", true, "FlamMan Omega / SP");
	settings.Add("4DrillManAlpha", true, "DrillMan Alpha / V2");
	settings.Add("4DrillManBeta", true, "DrillMan Beta / V3");
	settings.Add("4DrillManOmega", true, "DrillMan Omega / SP");
	settings.Add("4Alpha", true, "Alpha");
	settings.Add("4AlphaOmega", true, "Alpha Omega");
	settings.Add("4GutsMan", true, "GutsMan");
	settings.Add("4GutsManAlpha", true, "GutsMan Alpha / V2");
	settings.Add("4GutsManBeta", true, "GutsMan Beta / V3");
	settings.Add("4GutsManOmega", true, "GutsMan Omega / SP");
	settings.Add("4ProtoMan", true, "ProtoMan");
	settings.Add("4ProtoManAlpha", true, "ProtoMan Alpha / V2");
	settings.Add("4ProtoManBeta", true, "ProtoMan Beta / V3");
	settings.Add("4ProtoManOmega", true, "ProtoMan Omega / SP");
	settings.Add("4MetalMan", true, "MetalMan");
	settings.Add("4MetalManBeta", true, "MetalMan Beta / V3");
	settings.Add("4MetalManOmega", true, "MetalMan Omega / SP");
	settings.Add("4Punk", true, "Punk");
	settings.Add("4PunkAlpha", true, "Punk Alpha / V2");
	settings.Add("4PunkBeta", true, "Punk Beta / V3");
	settings.Add("4PunkOmega", true, "Punk Omega / SP");
	settings.Add("4KingMan", true, "KingMan");
	settings.Add("4KingManAlpha", true, "KingMan Alpha / V2");
	settings.Add("4KingManBeta", true, "KingMan Beta / V3");
	settings.Add("4KingManOmega", true, "KingMan Omega / SP");
	settings.Add("4MistMan", true, "MistMan");
	settings.Add("4MistManAlpha", true, "MistMan Alpha / V2");
	settings.Add("4MistManBeta", true, "MistMan Beta / V3");
	settings.Add("4MistManOmega", true, "MistMan Omega / SP");
	settings.Add("4BowlMan", true, "BowlMan");
	settings.Add("4BowlManAlpha", true, "BowlMan Alpha / V2");
	settings.Add("4BowlManBeta", true, "BowlMan Beta / V3");
	settings.Add("4BowlManOmega", true, "BowlMan Omega / SP");
	settings.Add("4DarkMan", true, "DarkMan");
	settings.Add("4DarkManAlpha", true, "DarkMan Alpha / V2");
	settings.Add("4DarkManBeta", true, "DarkMan Beta / V3");
	settings.Add("4DarkManOmega", true, "DarkMan Omega / SP");
	settings.Add("4JapanMan", true, "JapanMan");
	settings.Add("4JapanManAlpha", true, "JapanMan Alpha / V2");
	settings.Add("4JapanManBeta", true, "JapanMan Beta / V3");
	settings.Add("4JapanManOmega", true, "JapanMan Omega / SP");
	settings.Add("4Serenade", true, "Serenade");
	settings.Add("4SerenadeAlpha", true, "Serenade Alpha / V2");
	settings.Add("4SerenadeBeta", true, "Serenade Beta / V3");
	settings.Add("4SerenadeOmega", true, "Serenade Alpha / SP");
	settings.Add("4Bass", true, "Bass");
	settings.Add("4BassGS", true, "Bass GS");
	settings.Add("4BassOmega", true, "Bass Omega");
	settings.CurrentDefaultParent = null;

	settings.Add("Vol2", true, "(TEMPORARY PLACEHOLDER) Legacy Collection 2");
	settings.CurrentDefaultParent = "Vol2";

	settings.Add("BN4RS", true, "(TEMPORARY PLACEHOLDER) Mega Man Battle Network 4 Red Sun");
	settings.CurrentDefaultParent = "Vol2";

	settings.Add("BN4BM", true, "(TEMPORARY PLACEHOLDER) Mega Man Battle Network 4 Blue Moon");
	settings.CurrentDefaultParent = "Vol2";

	settings.Add("BN5TP", true, "(TEMPORARY PLACEHOLDER) Mega Man Battle Network 5 Team Protocol");
	settings.CurrentDefaultParent = "Vol2";

	settings.Add("BN5TC", true, "(TEMPORARY PLACEHOLDER) Mega Man Battle Network 5 Team Colonel");
	settings.CurrentDefaultParent = "Vol2";

	settings.Add("BN6CG", true, "(TEMPORARY PLACEHOLDER) Mega Man Battle Network 5 Cybeast Gregar");
	settings.CurrentDefaultParent = "Vol2";

	settings.Add("BN6CF", true, "(TEMPORARY PLACEHOLDER) Mega Man Battle Network 5 Cybeast Falzar");
	settings.CurrentDefaultParent = "Vol2";
}

init
{
	vars.BossEncounter = new List<string>();
	vars.BossDefeated = new List<string>();
	vars.BN1WWWBaseEntered = new List<string>();
	vars.LifeVirusDefeated = new List<string>();
	vars.MMBN3_N1Prelim3 = 0;
	vars.MMBN3_ToraJobDone = 0;
	vars.MMBN3_Rank10 = 0;
}

start
{
	switch(game.ProcessName.ToLower())
	{
		case "mmbn_lc1":
		{
			return old.LC1_GameState == 28 && current.LC1_GameState != 28;
			break;
		}
		case "mmbn_lc2":
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
	switch(game.ProcessName.ToLower())
	{
		case "mmbn_lc1":
		{
			// Resetting Lists/vars returning to Main Menu
			if (old.LC1_GameSelected == 0 && current.LC1_GameSelected == 1)
			{
				vars.BossEncounter.Clear();
				vars.BossDefeated.Clear();
				vars.BN1WWWBaseEntered.Clear();
				vars.LifeVirusDefeated.Clear();
				vars.MMBN3_N1Prelim3 = 0;
				vars.MMBN3_ToraJobDone = 0;
				vars.MMBN3_Rank10 = 0;
			}
			// BN1 = 0, BN2 = 2, BN3W = 3, BN3B = 4
			switch ( (byte) current.LC1_GameChoice ) 
			{
				case 0:
					{
					// --- Mega Man Battle Network 1
					// - Logging
					if(settings["BN1HigsMemoLog"] && current.MMBN1_HigsMemo != old.MMBN1_HigsMemo) print("MMBN1_HigsMemo: " + current.MMBN1_HigsMemo.ToString());
					if(settings["BN1LabMemoLog"] && current.MMBN1_LabMemo != old.MMBN1_LabMemo) print("MMBN1_LabMemo: " + current.MMBN1_LabMemo.ToString());
					if(settings["BN1YuriMemoLog"] && current.MMBN1_YuriMemo != old.MMBN1_YuriMemo) print("MMBN1_YuriMemo: " + current.MMBN1_YuriMemo.ToString());
					if(settings["BN1PaMemoLog"] && current.MMBN1_PaMemo != old.MMBN1_PaMemo) print("MMBN1_PaMemo: " + current.MMBN1_PaMemo.ToString());
					// - Boss Splits
					if((old.LC1_ENo1 != current.LC1_ENo1) && 
						(settings["0Floshell"] && current.LC1_ENo1 == 24
						|| settings["0ColdBear"] && current.LC1_ENo1 == 41 && current.LC1_ENo2 == 42
						|| settings["0GutsMan"] && current.LC1_ENo1 == 96
						|| settings["0GutsManV2"] && current.LC1_ENo1 == 97
						|| settings["0GutsManV3"] && current.LC1_ENo1 == 98
						|| settings["0ProtoMan"] && current.LC1_ENo1 == 99
						|| settings["0ProtoManV2"] && current.LC1_ENo1 == 100
						|| settings["0ProtoManV3"] && current.LC1_ENo1 == 101
						|| settings["0WoodMan"] && current.LC1_ENo1 == 102
						|| settings["0WoodManV2"] && current.LC1_ENo1 == 103
						|| settings["0WoodManV3"] && current.LC1_ENo1 == 104
						|| settings["0FireMan"] && current.LC1_ENo1 == 105
						|| settings["0FireManV2"] && current.LC1_ENo1 == 106
						|| settings["0FireManV3"] && current.LC1_ENo1 == 107
						|| settings["0NumberMan"] && current.LC1_ENo1 == 108
						|| settings["0NumberManV2"] && current.LC1_ENo1 == 109
						|| settings["0NumberManV3"] && current.LC1_ENo1 == 110
						|| settings["0StoneMan"] && current.LC1_ENo1 == 111
						|| settings["0StoneManV2"] && current.LC1_ENo1 == 112
						|| settings["0StoneManV3"] && current.LC1_ENo1 == 113
						|| settings["0IceMan"] && current.LC1_ENo1 == 114
						|| settings["0IceManV2"] && current.LC1_ENo1 == 115
						|| settings["0IceManV3"] && current.LC1_ENo1 == 116
						|| settings["0SkullMan"] && current.LC1_ENo1 == 117
						|| settings["0SkullManV2"] && current.LC1_ENo1 == 118
						|| settings["0SkullManV3"] && current.LC1_ENo1 == 119
						|| settings["0ColorMan"] && current.LC1_ENo1 == 120
						|| settings["0ColorManV2"] && current.LC1_ENo1 == 121
						|| settings["0ColorManV3"] && current.LC1_ENo1 == 122
						|| settings["0BombMan"] && current.LC1_ENo1 == 123
						|| settings["0BombManV2"] && current.LC1_ENo1 == 124
						|| settings["0BombManV3"] && current.LC1_ENo1 == 124
						|| settings["0SharkMan"] && current.LC1_ENo1 == 126
						|| settings["0SharkManV2"] && current.LC1_ENo1 == 127
						|| settings["0SharkManV3"] && current.LC1_ENo1 == 128
						|| settings["0ElecMan"] && (current.LC1_ENo1 == 129 || current.LC1_ENo1 == 154)
						|| settings["0ElecManV2"] && current.LC1_ENo1 == 130
						|| settings["0ElecManV3"] && current.LC1_ENo1 == 131
						|| settings["0PharaohMan"] && current.LC1_ENo1 == 132
						|| settings["0PharaohManV2"] && current.LC1_ENo1 == 133
						|| settings["0PharaohManV3"] && current.LC1_ENo1 == 134
						|| settings["0ShadowMan"] && current.LC1_ENo1 == 135
						|| settings["0ShadowManV2"] && current.LC1_ENo1 == 136
						|| settings["0ShadowManV3"] && current.LC1_ENo1 == 137
						|| settings["0MagicMan"] && current.LC1_ENo1 == 141
						|| settings["0MagicManV2"] && current.LC1_ENo1 == 142
						|| settings["0MagicManV3"] && current.LC1_ENo1 == 143
						|| settings["0Bass"] && current.LC1_ENo1 == 144))
						{
							vars.BossEncounter.Add("0" + current.LC1_ENo1.ToString());
						}
					// - Final Split
					if(settings["0LifeVirus"] && current.LC1_ENo1 == 147)
						{
							vars.LifeVirusDefeated.Add("Defeated");
						}
					// - WWW Base Entered List Entry
					if(current.LC1_AreaID == 5 && current.LC1_SubAreaID == 0)
						{
							vars.BN1WWWBaseEntered.Add("Entered");
						}
					break;
					}
				case 2:
					{
					// --- Mega Man Battle Network 2
					// - Boss Splits (Bass Deluxe ID might be incorrect, haven't tested)
					if((old.LC1_ENo1 != current.LC1_ENo1) && 
						(settings["2AirMan"] && current.LC1_ENo1 == 128
						|| settings["2AirManV2"] && current.LC1_ENo1 == 129
						|| settings["2AirManV3"] && current.LC1_ENo1 == 130
						|| settings["2QuickMan"] && current.LC1_ENo1 == 131
						|| settings["2QuickManV2"] && current.LC1_ENo1 == 132
						|| settings["2QuickManV3"] && current.LC1_ENo1 == 133
						|| settings["2CutMan"] && current.LC1_ENo1 == 134
						|| settings["2CutManV2"] && current.LC1_ENo1 == 135
						|| settings["2CutManV3"] && current.LC1_ENo1 == 136
						|| settings["2ShadowMan"] && current.LC1_ENo1 == 137
						|| settings["2ShadowManV2"] && current.LC1_ENo1 == 138
						|| settings["2ShadowManV3"] && current.LC1_ENo1 == 139
						|| settings["2KnightMan"] && current.LC1_ENo1 == 140
						|| settings["2KnightManV2"] && current.LC1_ENo1 == 141
						|| settings["2KnightManV3"] && current.LC1_ENo1 == 142
						|| settings["2MagnetMan"] && current.LC1_ENo1 == 143
						|| settings["2MagnetManV2"] && current.LC1_ENo1 == 144
						|| settings["2MagnetManV3"] && current.LC1_ENo1 == 145
						|| settings["2FreezeMan"] && current.LC1_ENo1 == 146
						|| settings["2FreezeManV2"] && current.LC1_ENo1 == 147
						|| settings["2FreezeManV3"] && current.LC1_ENo1 == 148
						|| settings["2HeatMan"] && current.LC1_ENo1 == 152
						|| settings["2HeatManV2"] && current.LC1_ENo1 == 153
						|| settings["2HeatManV3"] && current.LC1_ENo1 == 154
						|| settings["2ToadMan"] && current.LC1_ENo1 == 155
						|| settings["2ToadManV2"] && current.LC1_ENo1 == 156
						|| settings["2ToadManV3"] && current.LC1_ENo1 == 157
						|| settings["2ThunderMan"] && current.LC1_ENo1 == 158
						|| settings["2ThunderManV2"] && current.LC1_ENo1 == 159
						|| settings["2ThunderManV3"] && current.LC1_ENo1 == 160
						|| settings["2SnakeMan"] && current.LC1_ENo1 == 161
						|| settings["2SnakeManV2"] && current.LC1_ENo1 == 162
						|| settings["2SnakeManV3"] && current.LC1_ENo1 == 163
						|| settings["2GutsMan"] && current.LC1_ENo1 == 164
						|| settings["2GutsManV2"] && current.LC1_ENo1 == 165
						|| settings["2GutsManV3"] && current.LC1_ENo1 == 166
						|| settings["2ProtoMan"] && current.LC1_ENo1 == 167
						|| settings["2ProtoManV2"] && current.LC1_ENo1 == 168
						|| settings["2ProtoManV3"] && current.LC1_ENo1 == 169
						|| settings["2GateMan"] && current.LC1_ENo1 == 170
						|| settings["2GateManV2"] && current.LC1_ENo1 == 171
						|| settings["2GateManV3"] && current.LC1_ENo1 == 172
						|| settings["2PlanetMan"] && current.LC1_ENo1 == 173
						|| settings["2PlanetManV2"] && current.LC1_ENo1 == 174
						|| settings["2PlanetManV3"] && current.LC1_ENo1 == 175
						|| settings["2NapalmMan"] && current.LC1_ENo1 == 176
						|| settings["2NapalmManV2"] && current.LC1_ENo1 == 177
						|| settings["2NapalmManV3"] && current.LC1_ENo1 == 178
						|| settings["2PharaohMan"] && current.LC1_ENo1 == 179
						|| settings["2PharaohManV2"] && current.LC1_ENo1 == 180
						|| settings["2PharaohManV3"] && current.LC1_ENo1 == 181
						|| settings["2BassDeluxe"] && current.LC1_ENo1 == 184))
						{
							vars.BossEncounter.Add("2" + current.LC1_ENo1.ToString());
						}
					break;
					}
				case 3: case 4:
				{
					// --- Mega Man Battle Network 3 White & Blue
					// - Logging
					if(settings["3MainRNG"] && current.MMBN3_MainRNG != old.MMBN3_MainRNG) print("BN3W_MainRNG: " + current.MMBN3_MainRNG.ToString("X"));
					if(settings["3LazyRNG"] && current.MMBN3_LazyRNG != old.MMBN3_LazyRNG) print("BN3W_LazyRNG: " + current.MMBN3_LazyRNG.ToString("X"));
					if(settings["4MainRNG"] && current.MMBN3_MainRNG != old.MMBN3_MainRNG) print("BN3B_MainRNG: " + current.MMBN3_MainRNG.ToString("X"));
					if(settings["4LazyRNG"] && current.MMBN3_LazyRNG != old.MMBN3_LazyRNG) print("BN3B_LazyRNG: " + current.MMBN3_LazyRNG.ToString("X"));
					// Boss Splits
					if ((old.LC1_ENo1 != current.LC1_ENo1) && 
						(settings[current.LC1_GameChoice.ToString() + "FlashMan"] && current.LC1_ENo1 == 168
						|| settings[current.LC1_GameChoice.ToString() + "FlashManAlpha"] && current.LC1_ENo1 == 169
						|| settings[current.LC1_GameChoice.ToString() + "FlashManBeta"] && current.LC1_ENo1 == 170
						|| settings[current.LC1_GameChoice.ToString() + "FlashManOmega"] && current.LC1_ENo1 == 171
						|| settings[current.LC1_GameChoice.ToString() + "BeastMan"] && current.LC1_ENo1 == 172
						|| settings[current.LC1_GameChoice.ToString() + "BeastManAlpha"] && current.LC1_ENo1 == 173
						|| settings[current.LC1_GameChoice.ToString() + "BeastManBeta"] && current.LC1_ENo1 == 174
						|| settings[current.LC1_GameChoice.ToString() + "BeastManOmega"] && current.LC1_ENo1 == 175
						|| settings[current.LC1_GameChoice.ToString() + "BubbleMan"] && current.LC1_ENo1 == 176
						|| settings[current.LC1_GameChoice.ToString() + "BubbleManAlpha"] && current.LC1_ENo1 == 177
						|| settings[current.LC1_GameChoice.ToString() + "BubbleManBeta"] && current.LC1_ENo1 == 178
						|| settings[current.LC1_GameChoice.ToString() + "BubbleManOmega"] && current.LC1_ENo1 == 179
						|| settings[current.LC1_GameChoice.ToString() + "DesertMan"] && current.LC1_ENo1 == 180
						|| settings[current.LC1_GameChoice.ToString() + "DesertManAlpha"] && current.LC1_ENo1 == 181
						|| settings[current.LC1_GameChoice.ToString() + "DesertManBeta"] && current.LC1_ENo1 == 182
						|| settings[current.LC1_GameChoice.ToString() + "DesertManOmega"] && current.LC1_ENo1 == 183
						|| settings[current.LC1_GameChoice.ToString() + "PlantMan"] && current.LC1_ENo1 == 184
						|| settings[current.LC1_GameChoice.ToString() + "PlantManAlpha"] && current.LC1_ENo1 == 185
						|| settings[current.LC1_GameChoice.ToString() + "PlantManBeta"] && current.LC1_ENo1 == 186
						|| settings[current.LC1_GameChoice.ToString() + "PlantManOmega"] && current.LC1_ENo1 == 187
						|| settings[current.LC1_GameChoice.ToString() + "FlamMan"] && current.LC1_ENo1 == 188
						|| settings[current.LC1_GameChoice.ToString() + "FlamManAlpha"] && current.LC1_ENo1 == 189
						|| settings[current.LC1_GameChoice.ToString() + "FlamManBeta"] && current.LC1_ENo1 == 190
						|| settings[current.LC1_GameChoice.ToString() + "FlamManOmega"] && current.LC1_ENo1 == 191
						|| settings[current.LC1_GameChoice.ToString() + "DrillMan"] && current.LC1_ENo1 == 192
						|| settings[current.LC1_GameChoice.ToString() + "DrillManAlpha"] && current.LC1_ENo1 == 193
						|| settings[current.LC1_GameChoice.ToString() + "DrillManBeta"] && current.LC1_ENo1 == 194
						|| settings[current.LC1_GameChoice.ToString() + "DrillManOmega"] && current.LC1_ENo1 == 195
						|| settings[current.LC1_GameChoice.ToString() + "Alpha"] && current.LC1_ENo1 == 196
						|| settings[current.LC1_GameChoice.ToString() + "AlphaOmega"] && current.LC1_ENo1 == 197
						|| settings[current.LC1_GameChoice.ToString() + "GutsMan"] && current.LC1_ENo1 == 200
						|| settings[current.LC1_GameChoice.ToString() + "GutsManAlpha"] && current.LC1_ENo1 == 201
						|| settings[current.LC1_GameChoice.ToString() + "GutsManBeta"] && current.LC1_ENo1 == 202
						|| settings[current.LC1_GameChoice.ToString() + "GutsManOmega"] && current.LC1_ENo1 == 203
						|| settings[current.LC1_GameChoice.ToString() + "ProtoMan"] && current.LC1_ENo1 == 204
						|| settings[current.LC1_GameChoice.ToString() + "ProtoManAlpha"] && current.LC1_ENo1 == 205
						|| settings[current.LC1_GameChoice.ToString() + "ProtoManBeta"] && current.LC1_ENo1 == 206
						|| settings[current.LC1_GameChoice.ToString() + "ProtoManOmega"] && current.LC1_ENo1 == 207
						|| settings[current.LC1_GameChoice.ToString() + "MetalMan"] && current.LC1_ENo1 == 208
						|| settings[current.LC1_GameChoice.ToString() + "MetalManAlpha"] && current.LC1_ENo1 == 209
						|| settings[current.LC1_GameChoice.ToString() + "MetalManBeta"] && current.LC1_ENo1 == 210
						|| settings[current.LC1_GameChoice.ToString() + "MetalManOmega"] && current.LC1_ENo1 == 211
						|| settings[current.LC1_GameChoice.ToString() + "Punk"] && current.LC1_ENo1 == 212
						|| settings[current.LC1_GameChoice.ToString() + "PunkAlpha"] && current.LC1_ENo1 == 213
						|| settings[current.LC1_GameChoice.ToString() + "PunkBeta"] && current.LC1_ENo1 == 214
						|| settings[current.LC1_GameChoice.ToString() + "PunkOmega"] && current.LC1_ENo1 == 215
						|| settings[current.LC1_GameChoice.ToString() + "KingMan"] && current.LC1_ENo1 == 216
						|| settings[current.LC1_GameChoice.ToString() + "KingManAlpha"] && current.LC1_ENo1 == 217
						|| settings[current.LC1_GameChoice.ToString() + "KingManBeta"] && current.LC1_ENo1 == 218
						|| settings[current.LC1_GameChoice.ToString() + "KingManOmega"] && current.LC1_ENo1 == 219
						|| settings[current.LC1_GameChoice.ToString() + "MistMan"] && current.LC1_ENo1 == 220
						|| settings[current.LC1_GameChoice.ToString() + "MistManAlpha"] && current.LC1_ENo1 == 221
						|| settings[current.LC1_GameChoice.ToString() + "MistManBeta"] && current.LC1_ENo1 == 222
						|| settings[current.LC1_GameChoice.ToString() + "MistManOmega"] && current.LC1_ENo1 == 223
						|| settings[current.LC1_GameChoice.ToString() + "BowlMan"] && current.LC1_ENo1 == 224
						|| settings[current.LC1_GameChoice.ToString() + "BowlManAlpha"] && current.LC1_ENo1 == 225
						|| settings[current.LC1_GameChoice.ToString() + "BowlManBeta"] && current.LC1_ENo1 == 226
						|| settings[current.LC1_GameChoice.ToString() + "BowlManOmega"] && current.LC1_ENo1 == 227
						|| settings[current.LC1_GameChoice.ToString() + "DarkMan"] && current.LC1_ENo1 == 228
						|| settings[current.LC1_GameChoice.ToString() + "DarkManAlpha"] && current.LC1_ENo1 == 229
						|| settings[current.LC1_GameChoice.ToString() + "DarkManBeta"] && current.LC1_ENo1 == 230
						|| settings[current.LC1_GameChoice.ToString() + "DarkManOmega"] && current.LC1_ENo1 == 231
						|| settings[current.LC1_GameChoice.ToString() + "JapanMan"] && current.LC1_ENo1 == 232
						|| settings[current.LC1_GameChoice.ToString() + "JapanManAlpha"] && current.LC1_ENo1 == 233
						|| settings[current.LC1_GameChoice.ToString() + "JapanManBeta"] && current.LC1_ENo1 == 234
						|| settings[current.LC1_GameChoice.ToString() + "JapanManOmega"] && current.LC1_ENo1 == 235
						|| settings[current.LC1_GameChoice.ToString() + "Serenade"] && current.LC1_ENo1 == 236
						|| settings[current.LC1_GameChoice.ToString() + "SerenadeAlpha"] && current.LC1_ENo1 == 237
						|| settings[current.LC1_GameChoice.ToString() + "SerenadeBeta"] && current.LC1_ENo1 == 238
						|| settings[current.LC1_GameChoice.ToString() + "SerenadeOmega"] && current.LC1_ENo1 == 239
						|| settings[current.LC1_GameChoice.ToString() + "Bass"] && current.LC1_ENo1 == 241
						|| settings[current.LC1_GameChoice.ToString() + "BassGS"] && current.LC1_ENo1 == 242
						|| settings[current.LC1_GameChoice.ToString() + "BassOmega"] && current.LC1_ENo1 == 243))
						{
							vars.BossEncounter.Add(current.LC1_GameChoice.ToString() + current.LC1_ENo1.ToString());
						}
					// - Tally for Tora Jobs
					if(old.MMBN3_Tally == 0 && current.MMBN3_Tally == 256)
						{
							vars.MMBN3_ToraJobDone = 1;
						}
					// - Tora Jobs Split Setup
					if(vars.MMBN3_ToraJobDone == 1 && old.MMBN3_ToraJobsFinished == 0 && current.MMBN3_ToraJobsFinished == 256)
						{
							vars.MMBN3_ToraJobDone = 2;
						}
					break;
				}
			}
			// --- Global Logging
			if(settings["Vol1GameState"] && current.LC1_GameState != old.LC1_GameState) print("LC1_GameState: " + current.LC1_GameState.ToString());
			if(settings["Vol1AreaID"] && current.LC1_AreaID != old.LC1_AreaID) print("LC1_AreaID: " + current.LC1_AreaID.ToString());
			if(settings["Vol1SubAreaID"] && current.LC1_SubAreaID != old.LC1_SubAreaID) print("LC1_SubAreaID: " + current.LC1_SubAreaID.ToString());
			if(settings["Vol1ENo1"] && current.LC1_ENo1 != old.LC1_ENo1) print("LC1_ENo1: " + current.LC1_ENo1.ToString());
			if(settings["Vol1ENo2"] && current.LC1_ENo2 != old.LC1_ENo2) print("LC1_ENo2: " + current.LC1_ENo2.ToString());
			if(settings["Vol1ENo3"] && current.LC1_ENo3 != old.LC1_ENo3) print("LC1_ENo3: " + current.LC1_ENo3.ToString());
			if(settings["Vol1GameChoice"] && current.LC1_GameChoice != old.LC1_GameChoice) print("LC1_GameChoice: " + current.LC1_GameChoice.ToString());
			if(settings["Vol1GameSelected"] && current.LC1_GameSelected != old.LC1_GameSelected) print("LC1_GameSelected: " + current.LC1_GameSelected.ToString());
			if(settings["Vol1Progress"] && current.LC1_Progress != old.LC1_Progress) print("LC1_Progress: " + current.LC1_Progress.ToString());
			break;
		}
		case "mmbn_lc2":
			{
				if(current.LC2_GameChoice != old.LC2_GameChoice) print("LC2_GameChoice: " + current.LC2_GameChoice.ToString());
				// BN4RS - 5/BM - 6,  BN5TP - 7/TC - 8, BN6CG - 9/CF - 10
				switch ( (byte) current.LC2_GameChoice )
				{
				case 5:
					{}
					break;
				case 6:
					{}
					break;
				case 7:
					{}
					break; 
				case 8:
					{}
					break;
				case 9:
					{}
					break;
				case 10:
					{}
					break;
				}
			 	
			}
			break;
		}
}

split
{
	// --- Mega Man Battle Network 1
	switch(game.ProcessName.ToLower())
	{
		case "mmbn_lc1":
		{
			switch ( (byte) current.LC1_GameChoice )
			{
				case 0:
				{
					if (current.LC1_GameChoice == 0 && vars.BossEncounter.Contains("0" + current.LC1_ENo1.ToString()) 
						&& !vars.BossDefeated.Contains("0" + current.LC1_ENo1.ToString())
						&& old.LC1_GameState == 12 && current.LC1_GameState != 12)
						{
							vars.BossDefeated.Add("0" + current.LC1_ENo1.ToString());
							return true;
						}
			
					if (current.LC1_GameChoice == 0 && current.MMBN1_HigsMemo == 1 && current.MMBN1_LabMemo == 1
						&& current.MMBN1_YuriMemo == 1 & current.MMBN1_PaMemo == 1
						&& old.LC1_AreaID == 2 && old.LC1_SubAreaID == 5
						&& current.LC1_AreaID == 137 && current.LC1_SubAreaID == 0)
						{
							return true;
						}

					if (current.LC1_GameChoice == 0 && settings["BN1LifeVirusSplit"] && vars.LifeVirusDefeated.Contains("Defeated") 
						&& vars.BN1WWWBaseEntered.Contains("Entered") 
						&& old.MMBN1_ResultScreen == 1 && current.MMBN1_ResultScreen == 15)
						{
							return true;
						}

					if (current.LC1_GameChoice == 0 && settings["BN1NoLifeVirusSplit"] 
						&& vars.BN1WWWBaseEntered.Contains("Entered") 
						&& old.MMBN1_ResultScreen == 1 && current.MMBN1_ResultScreen == 15)
						{
							return true;
						}
					break;
					}
				case 2:
				{
					// --- Mega Man Battle Network 2
					// current.LC1_AreaID is not 133 for all other bosses as to not split in Boss Rushes
					if (current.LC1_AreaID != 133 && vars.BossEncounter.Contains("2" + current.LC1_ENo1.ToString()) 
						&& !vars.BossDefeated.Contains("2" + current.LC1_ENo1.ToString())
						&& old.LC1_GameState == 12 && current.LC1_GameState == 4)
						{
							vars.BossDefeated.Add("2" + current.LC1_ENo1.ToString());
							return true;
						}

					if (current.LC1_GameChoice == 2 && 
						(settings["2ZLicensePassed"] && old.LC1_Progress == 3 && current.LC1_Progress == 4
						|| settings["2BLicensePassed"] && old.MMBN2_BLicense == 0 && current.MMBN2_BLicense == 1
						|| settings["2ALicensePrelims"] && old.LC1_Progress == 18 && current.LC1_Progress == 19 
						|| settings["2ALicenseExam"] && old.LC1_Progress == 19 && current.LC1_Progress == 20
						|| settings["2EscapedYumland"] & old.LC1_Progress == 25 && current.LC1_Progress == 26
						|| settings["2HeatData"] & old.MMBN2_HeatData == 0 && current.MMBN2_HeatData == 1))
						{
							return true;
						}

					if (current.LC1_GameChoice == 2 && settings["2BossRush1"] && current.LC1_AreaID == 133 && current.LC1_SubAreaID == 3
						&& old.LC1_GameState == 12 && current.LC1_GameState == 4 && current.LC1_ENo1 == 134)
						{
							return true;
						}

					if (current.LC1_GameChoice == 2 && settings["2BossRush2"] && current.LC1_AreaID == 133 && current.LC1_SubAreaID == 4
						&& old.LC1_GameState == 12 && current.LC1_GameState == 4 && current.LC1_ENo1 == 146)
						{
							return true;
						}

					if (current.LC1_GameChoice == 2 && settings["2Bass"] && current.LC1_ENo1 == 182
						&& old.LC1_GameState == 12 && current.LC1_GameState != 12 )
						{
							return true;
						}

					if (current.LC1_GameChoice == 2 && settings["2Completed"] && current.LC1_ENo1 == 149
						&& old.LC1_GameState == 12 && current.LC1_GameState != 12)
						{
							vars.BossDefeated.Add("2GospelDead");
						}

					if (current.LC1_GameChoice == 2 && settings["2Completed"] 
						&& vars.BossDefeated.Contains("2GospelDead")
						&& current.LC1_AreaID == 2 && current.LC1_SubAreaID == 4
						&& old.MMBN2_FinalSplit == 0 && current.MMBN2_FinalSplit == 50)
						{
							return true;
						}

					if (current.LC1_GameChoice == 2 && settings["2GospelSplit"] 
						&& current.LC1_ENo1 == 149 && old.LC1_GameState == 12 
						&& current.LC1_GameState != 12)
						{
							return true;
						}

					if (current.LC1_GameChoice == 2 && settings["2Doghouse"] && 
						(old.LC1_AreaID == 140 && old.LC1_SubAreaID == 2)
						&& (current.LC1_AreaID == 0 && current.LC1_SubAreaID == 0))
						{
							return true;
						}
					break;
					}
				case 3: case 4:
				{
					// Mega Man Battle Network 3 White & Blue
					if ((vars.BossEncounter.Contains("3" + current.LC1_ENo1.ToString()) || vars.BossEncounter.Contains("4" + current.LC1_ENo1.ToString()))
						&& (!vars.BossDefeated.Contains("3" + current.LC1_ENo1.ToString()) || !vars.BossDefeated.Contains("4" + current.LC1_ENo1.ToString()))
						&& old.LC1_GameState == 12 && current.LC1_GameState != 12)
						{
							vars.BossDefeated.Add(current.LC1_GameChoice.ToString() + current.LC1_ENo1.ToString());
							return true;
						}

					if (current.LC1_GameChoice >= 3 && (((settings["3N1Prelim1"] || settings["4N1Prelim1"]) && old.LC1_Progress == 2 && current.LC1_Progress == 3)
							|| ((settings["3N1Prelim2"] || (settings["4N1Prelim2"])) && old.LC1_Progress == 21 && current.LC1_Progress == 22)
							|| ((settings["3Wind"] || settings["4Wind"]) && old.MMBN3_WindStarChip == 65280 && current.MMBN3_WindStarChip == 65281)
							|| ((settings["3FiresStarted"] || settings["4FiresStarted"]) && old.LC1_Progress == 84 && current.LC1_Progress == 85)))
						{
							return true;
						}
					
					if (current.LC1_GameChoice >= 3 && vars.MMBN3_N1Prelim3 != 1
						&& ((settings["3N1Prelim3"] || settings["4N1Prelim3"]) 
						&& current.LC1_Progress == 34 && old.MMBN3_N1Prelim3Win == 0 && current.MMBN3_N1Prelim3Win == 3))
								{
									return true;
									vars.MMBN3_N1Prelim3 = 1;
								}

					if (current.LC1_GameChoice >= 3 && vars.MMBN3_ToraJobDone == 2
						&& (settings["3ToraJobs"] || settings["4ToraJobs"]) && current.LC1_Progress == 66)
						{
							vars.MMBN3_ToraJobDone = 3;
							return true;
						}

					if (current.LC1_GameChoice >= 3 && current.MMBN3_Rank10OnScreen == 10
						&& vars.MMB3_Rank10 == 0 && (settings["3Rank10"] || settings["4Rank10"]) && current.LC1_Progress == 98)
						{
							vars.MMB3_Rank10 = 1;
							return true;
						}
					
					if (current.LC1_GameChoice >= 3 && current.LC1_Progress == 122
						&& old.MMBN3_CompletedSplit == 0 && current.MMBN3_CompletedSplit == 1)
						{
							return true;
						}
					break;
				}
			}
		break;
		}
		case "mmbn_lc2":
		{

		break;
		}
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
	vars.BN1WWWBaseEntered.Clear();
	vars.LifeVirusDefeated.Clear();
	vars.MMBN3_N1Prelim3 = 0;
	vars.MMBN3_ToraJobDone = 0;
	vars.MMBN3_Rank10 = 0;
}
