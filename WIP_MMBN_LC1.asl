// Work in Progress Autosplitter by Nikoheart
// 0.3 - BN1 Mostly Done & BN2 Mostly Done
// requires just-ero's asl-help in LiveSplit/Components
// https://github.com/just-ero/asl-help/raw/main/lib/asl-help

// 18.04.23
// ----- Things to do in BN1 
// get id of results item win? (for All Chips run)
// re-organise settings of autosplitter with super mods
// test with speedrun community if WWW Comp 1 skip works
// add Memos split as some runners use this after doing all the WWW Memos and jacking into Dad's PC
// ^ edit: will be achievable now with Progress and Key Items

// Thanks NMarko for help with Area/SubArea IDs

// ----- Things to do in BN2 
// look for addresses.battle_mode / battle_state to use maybe instead of InBattle (can be potentially unreliable)
// BN2 SSS Licence Exam - PlanetMan/Bass to test and post-game credits screen (the congratulations one)

state("MMBN_LC1") 
{
	int MainMenuGameChoice : 0x989B384; // BN1 = 0, BN2 = 2, BN3W = 3, BN3B = 4
	int MainMenuGameSelected : 0x989BA88; // when chosen, value turns 0

	int GameStart : 0xD5D62B0, 0xD4; // revise
	int DialogueValue: 0x29F34C8, 0x28;
	int Zenny : 0x29EE840, 0xB8, 0x74;
	byte GameMode : 0x29EE840, 0xB8, 0x0; // technical name, rename InBattle later
	byte AreaID : 0x29EE840, 0xB8, 0x4;
	byte SubAreaID : 0x29EE840, 0xB8, 0x5;
	byte Progress : 0x29EE840, 0xB8, 0x6;
	byte BattlePaused : 0x29EE840, 0xB8, 0x9;
	int KeyItems : 0x29EE840, 0xB8, 0xC0;
	byte InBattle : 0x29EE840, 0xB8, 0x0; // 0 is hit when selecting "Return to Title Screen" - 28 on ng/continue select
	

	int EnemyNo1 : 0x29EE840, 0x50, 0x0;
	int EnemyNo2 : 0x29EE840, 0x50, 0x4;
	int EnemyNo3 : 0x29EE840, 0x50, 0x8;

	int MMBN1_EHP1 : 0x29F21F8, 0x60;
	int MMBN1_EHP2 : 0x29F21F8, 0x110;
	int MMBN1_EHP3 : 0x29F21F8, 0x1C0;
	// int MMBN1_InBattle : 0x29EF7B0, 0x68, 0x28, 0x8;
	int MMBN1_ResultScreen : 0x29EF620, 0x68, 0x28, 0x8;
	int MMBN1_ResultScreen : 0x29F21F8, 0x4;

	int MMBN2_NGGameStart : 0x29EE840, 0xB8, 0x88;
	byte MMBN2_EHP1 : 0x29F21F8, 0x1A4;
	byte MMBN2_EHP2 : 0x29F21F8, 0x264;
	byte MMBN2_EHP3 : 0x29F21F8, 0x264;
	byte MMBN2_ChipSelectionMenu: 0x29EE840, 0xB8, 0x8;
	byte MMBN2_BLicense: 0x29EE840, 0xB8, 0x148;
	byte MMBN2_HeatData : 0x29EE840, 0xB8, 0x134;
	int MMBN2_FinalSplit: 0x29F4CD8, 0x4;
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
	settings.CurrentDefaultParent = "BN2";
}

init
{
	vars.BossEncounter = new List<string>();
	vars.GutsManEncounter = new List<string>();
	vars.BossDefeated = new List<string>();
	vars.WWWBaseEntered = new List<string>();
	vars.LifeVirusDefeated = new List<string>();
}

start
{
	return old.GameStart == 0 && current.GameStart == 1 || old.MMBN2_NGGameStart == 0 && current.MMBN2_NGGameStart == 1;
}

onStart
{
	print("\nNew run started!\n----------------\n");
}

update
{
	// Mega Man Battle Network 1
	if(settings["BN1Floshell"] && current.EnemyNo1 == 24
		|| settings["BN1ColdBear"] && current.EnemyNo1 == 41 && current.EnemyNo2 == 42
		|| settings["BN1GutsManV2"] && current.EnemyNo1 == 97
		|| settings["BN1GutsManV3"] && current.EnemyNo1 == 98
		|| settings["BN1ProtoMan"] && current.EnemyNo1 == 99
		|| settings["BN1ProtoManV2"] && current.EnemyNo1 == 100
		|| settings["BN1ProtoManV3"] && current.EnemyNo1 == 101
		|| settings["BN1WoodMan"] && current.EnemyNo1 == 102
		|| settings["BN1WoodManV2"] && current.EnemyNo1 == 103
		|| settings["BN1WoodManV3"] && current.EnemyNo1 == 104
		|| settings["BN1FireMan"] && current.EnemyNo1 == 105
		|| settings["BN1FireManV2"] && current.EnemyNo1 == 106
		|| settings["BN1FireManV3"] && current.EnemyNo1 == 107
		|| settings["BN1NumberMan"] && current.EnemyNo1 == 108
		|| settings["BN1NumberManV2"] && current.EnemyNo1 == 109
		|| settings["BN1NumberManV3"] && current.EnemyNo1 == 110
		|| settings["BN1StoneMan"] && current.EnemyNo1 == 111
		|| settings["BN1StoneManV2"] && current.EnemyNo1 == 112
		|| settings["BN1StoneManV3"] && current.EnemyNo1 == 113
		|| settings["BN1IceMan"] && current.EnemyNo1 == 114
		|| settings["BN1IceManV2"] && current.EnemyNo1 == 115
		|| settings["BN1IceManV3"] && current.EnemyNo1 == 116
		|| settings["BN1SkullMan"] && current.EnemyNo1 == 117
		|| settings["BN1SkullManV2"] && current.EnemyNo1 == 118
		|| settings["BN1SkullManV3"] && current.EnemyNo1 == 119
		|| settings["BN1ColorMan"] && current.EnemyNo1 == 120
		|| settings["BN1ColorManV2"] && current.EnemyNo1 == 121
		|| settings["BN1ColorManV3"] && current.EnemyNo1 == 122
		|| settings["BN1BombMan"] && current.EnemyNo1 == 123
		|| settings["BN1BombManV2"] && current.EnemyNo1 == 124
		|| settings["BN1BombManV3"] && current.EnemyNo1 == 124
		|| settings["BN1SharkMan"] && current.EnemyNo1 == 126
		|| settings["BN1SharkManV2"] && current.EnemyNo1 == 127
		|| settings["BN1SharkManV3"] && current.EnemyNo1 == 128
		|| settings["BN1ElecMan"] && (current.EnemyNo1 == 129 || current.EnemyNo1 == 154)
		|| settings["BN1ElecManV2"] && current.EnemyNo1 == 130
		|| settings["BN1ElecManV3"] && current.EnemyNo1 == 131
		|| settings["BN1PharaohMan"] && current.EnemyNo1 == 132
		|| settings["BN1PharaohManV2"] && current.EnemyNo1 == 133
		|| settings["BN1PharaohManV3"] && current.EnemyNo1 == 134
		|| settings["BN1ShadowMan"] && current.EnemyNo1 == 135
		|| settings["BN1ShadowManV2"] && current.EnemyNo1 == 136
		|| settings["BN1ShadowManV3"] && current.EnemyNo1 == 137
		|| settings["BN1MagicMan"] && current.EnemyNo1 == 141
		|| settings["BN1MagicManV2"] && current.EnemyNo1 == 142
		|| settings["BN1MagicManV3"] && current.EnemyNo1 == 143
		|| settings["BN1Bass"] && current.EnemyNo1 == 144)
	{
		vars.BossEncounter.Add("BN1" + current.EnemyNo1.ToString());
	}

	if(settings["BN1GutsMan"] && current.EnemyNo1 == 96)
	{
		vars.GutsManEncounter.Add("BN1" + current.EnemyNo1.ToString());
	}

	if(settings["BN1LifeVirus"] && current.EnemyNo1 == 147)
	{
		vars.LifeVirusDefeated.Add("Defeated");
	}

	// areaID is now global it seems to put into switch case for BN1
	if(current.AreaID == 5 && current.SubAreaID == 0)
	{
		vars.WWWBaseEntered.Add("Entered");
	}

	// Mega Man Battle Network 2
	// Bass Deluxe ID might be incorrect, haven't tested
	if(settings["BN2AirMan"] && current.EnemyNo1 == 128
		|| settings["BN2AirManV2"] && current.EnemyNo1 == 129
		|| settings["BN2AirManV3"] && current.EnemyNo1 == 130
		|| settings["BN2QuickMan"] && current.EnemyNo1 == 131
		|| settings["BN2QuickManV2"] && current.EnemyNo1 == 132
		|| settings["BN2QuickManV3"] && current.EnemyNo1 == 133
		|| settings["BN2CutMan"] && current.EnemyNo1 == 134
		|| settings["BN2CutManV2"] && current.EnemyNo1 == 135
		|| settings["BN2CutManV3"] && current.EnemyNo1 == 136
		|| settings["BN2ShadowMan"] && current.EnemyNo1 == 137
		|| settings["BN2ShadowManV2"] && current.EnemyNo1 == 138
		|| settings["BN2ShadowManV3"] && current.EnemyNo1 == 139
		|| settings["BN2KnightMan"] && current.EnemyNo1 == 140
		|| settings["BN2KnightManV2"] && current.EnemyNo1 == 141
		|| settings["BN2KnightManV3"] && current.EnemyNo1 == 142
		|| settings["BN2MagnetMan"] && current.EnemyNo1 == 143
		|| settings["BN2MagnetManV2"] && current.EnemyNo1 == 144
		|| settings["BN2MagnetManV3"] && current.EnemyNo1 == 145
		|| settings["BN2FreezeMan"] && current.EnemyNo1 == 146
		|| settings["BN2FreezeManV2"] && current.EnemyNo1 == 147
		|| settings["BN2FreezeManV3"] && current.EnemyNo1 == 148
		|| settings["BN2HeatMan"] && current.EnemyNo1 == 152
		|| settings["BN2HeatManV2"] && current.EnemyNo1 == 153
		|| settings["BN2HeatManV3"] && current.EnemyNo1 == 154
		|| settings["BN2ToadMan"] && current.EnemyNo1 == 155
		|| settings["BN2ToadManV2"] && current.EnemyNo1 == 156
		|| settings["BN2ToadManV3"] && current.EnemyNo1 == 157
		|| settings["BN2ThunderMan"] && current.EnemyNo1 == 158
		|| settings["BN2ThunderManV2"] && current.EnemyNo1 == 159
		|| settings["BN2ThunderManV3"] && current.EnemyNo1 == 160
		|| settings["BN2SnakeMan"] && current.EnemyNo1 == 161
		|| settings["BN2SnakeManV2"] && current.EnemyNo1 == 162
		|| settings["BN2SnakeManV3"] && current.EnemyNo1 == 163
		|| settings["BN2GutsMan"] && current.EnemyNo1 == 164
		|| settings["BN2GutsManV2"] && current.EnemyNo1 == 165
		|| settings["BN2GutsManV3"] && current.EnemyNo1 == 166
		|| settings["BN2ProtoMan"] && current.EnemyNo1 == 167
		|| settings["BN2ProtoManV2"] && current.EnemyNo1 == 168
		|| settings["BN2ProtoManV3"] && current.EnemyNo1 == 169
		|| settings["BN2GateMan"] && current.EnemyNo1 == 170
		|| settings["BN2GateManV2"] && current.EnemyNo1 == 171
		|| settings["BN2GateManV3"] && current.EnemyNo1 == 172
		|| settings["BN2PlanetMan"] && current.EnemyNo1 == 173
		|| settings["BN2PlanetManV2"] && current.EnemyNo1 == 174
		|| settings["BN2PlanetManV3"] && current.EnemyNo1 == 175
		|| settings["BN2NapalmMan"] && current.EnemyNo1 == 176
		|| settings["BN2NapalmManV2"] && current.EnemyNo1 == 177
		|| settings["BN2NapalmManV3"] && current.EnemyNo1 == 178
		|| settings["BN2PharaohMan"] && current.EnemyNo1 == 179
		|| settings["BN2PharaohManV2"] && current.EnemyNo1 == 180
		|| settings["BN2PharaohManV3"] && current.EnemyNo1 == 181
		|| settings["BN2BassDeluxe"] && current.EnemyNo1 == 184)
	{
		vars.BossEncounter.Add("BN2" + current.EnemyNo1.ToString());
	}

	//find area ID first - do a visited WWW1 - if can do fire set ID also (only if WWW skip works)
	//if(settings["BN1NoBN1LifeVirusSplit"])

	if(current.GameStart != old.GameStart) print("Start Value: " + current.GameStart.ToString());

	if(current.AreaID != old.AreaID) print("AreaID: " + current.AreaID.ToString());
	if(current.SubAreaID != old.SubAreaID) print("SubAreaID: " + current.SubAreaID.ToString());
	if(current.InBattle != old.InBattle) print("InBattle: " + current.InBattle.ToString());

	if(current.MainMenuGameChoice != old.MainMenuGameChoice) print("MainMenuGameChoice: " + current.MainMenuGameChoice.ToString());
	if(current.MainMenuGameSelected != old.MainMenuGameSelected) print("MainMenuGameSelected: " + current.MainMenuGameSelected.ToString());
	if(current.EnemyNo1 != old.EnemyNo1) print("EnemyNo1: " + current.EnemyNo1.ToString());
	// if(current.EnemyNo2 != old.EnemyNo2) print("EnemyNo2: " + current.EnemyNo2.ToString());
	// if(current.EnemyNo3 != old.EnemyNo3) print("EnemyNo3: " + current.EnemyNo3.ToString());
	// if(current.MMBN1_InBattle != old.MMBN1_InBattle) print("MMBN1_InBattle: " + current.MMBN1_InBattle.ToString());
	// if(current.MMBN1_ResultScreen != old.MMBN1_ResultScreen) print("MMBN1_ResultScreen: " + current.MMBN1_ResultScreen.ToString());
	// print("\n-----vars.Boss: " + vars.Boss.ToString());
}

split
{
	// Mega Man Battle Network 1
	if (vars.BossEncounter.Contains("BN1" + current.EnemyNo1.ToString()) 
		&& !vars.BossDefeated.Contains("BN1" + current.EnemyNo1.ToString())
		&& old.MMBN1_ResultScreen == 2 && current.MMBN1_ResultScreen == 1)
		{
			vars.BossDefeated.Add("BN1" + current.EnemyNo1.ToString());
			return true;
		}

	if (vars.GutsManEncounter.Contains("BN1" + current.EnemyNo1.ToString()) 
		&& !vars.BossDefeated.Contains("BN1" + current.EnemyNo1.ToString())
		&& old.InBattle == 12 && current.InBattle == 4)
		{
			vars.BossDefeated.Add("BN1" + current.EnemyNo1.ToString());
			return true;
		}

	if (settings["BN1LifeVirusSplit"] && vars.LifeVirusDefeated.Contains("Defeated") && old.MMBN1_ResultScreen == 1 && current.MMBN1_ResultScreen == 15)
	{
		return true;
	}

	if (settings["BN1NoLifeVirusSplit"] && old.MMBN1_ResultScreen == 1 && current.MMBN1_ResultScreen == 15)
	{
		return true;
	}

	// Mega Man Battle Network 2
	// current.AreaID is not 133 for all other bosses as to not split in Boss Rushes
	if (current.AreaID != 133 && vars.BossEncounter.Contains("BN2" + current.EnemyNo1.ToString()) 
		&& !vars.BossDefeated.Contains("BN2" + current.EnemyNo1.ToString())
		&& old.InBattle == 12 && current.InBattle == 4)
		{
			vars.BossDefeated.Add("BN2" + current.EnemyNo1.ToString());
			return true;
		}

	if (settings["BN2ZLicensePassed"] && old.Progress == 3 && current.Progress == 4
		|| settings["BN2BLicensePassed"] && old.MMBN2_BLicense == 0 && current.MMBN2_BLicense == 1
		|| settings["BN2ALicensePrelims"] && old.Progress == 18 && current.Progress == 19 
		|| settings["BN2ALicenseExam"] && old.Progress == 19 && current.Progress == 20
		|| settings["BN2EscapedYumland"] & old.Progress == 25 && current.Progress == 26
		|| settings["BN2HeatData"] & old.MMBN2_HeatData == 0 && current.MMBN2_HeatData == 1)
		{
			return true;
		}

	if (settings["BN2BossRush1"] && current.AreaID == 133 && current.SubAreaID == 3
		 && old.InBattle == 12 && current.InBattle == 4 && current.EnemyNo1 == 134)
		{
			print("Boss Rush 1 Done");
			return true;
		}

	if (settings["BN2BossRush2"] && current.AreaID == 133 && current.SubAreaID == 4
		 && old.InBattle == 12 && current.InBattle == 4 && current.EnemyNo1 == 146)
		{
			print("Boss Rush 2 Done");
			return true;
		}

	if (settings["BN2Bass"] && current.EnemyNo1 == 182
		&& old.InBattle == 12 && current.InBattle != 12 )
		{
			print("Bass Defeated");
			return true;
		}

	if (settings["BN2Completed"] && current.EnemyNo1 == 149
		&& old.InBattle == 12 && current.InBattle != 12)
		{
			print("Gospel Defeated");
			vars.BossDefeated.Add("BN2GospelDead");
		}

	if (settings["BN2Completed"] && vars.BossDefeated.Contains("BN2GospelDead")
		&& current.AreaID == 2 && current.SubAreaID == 4
		&& old.MMBN2_FinalSplit == 0 && current.MMBN2_FinalSplit == 50)
		{
			print("Completed");
			return true;
		}

	if (settings["BN2GospelSplit"] && current.EnemyNo1 == 149
		&& old.InBattle == 12 && current.InBattle != 12)
		{
			print("Alt Gospel Split");
			return true;
		}

	if (settings["BN2Doghouse"] && (old.AreaID == 140 && old.SubAreaID == 2)
		&& (current.AreaID == 0 && current.SubAreaID == 0))
		{
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
	vars.GutsManEncounter.Clear();
	vars.BossDefeated.Clear();
	vars.WWWBaseEntered.Clear();
	vars.LifeVirusDefeated.Clear();
}