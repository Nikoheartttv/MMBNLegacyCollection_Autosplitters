// Work in Progress Autosplitter by Nikoheart
// 0.2 - BN1 Mostly Done
// requires just-ero's asl-help in LiveSplit/Components
// https://github.com/just-ero/asl-help/raw/main/lib/asl-help

// 17.04.23 - things to do
// get id of results item win? (for All Chips run)
// re-organise settings of autosplitter with super mods
// test with speedrun community if WWW Comp 1 skip works
// add Memos split as some runners use this after doing all the WWW Memos and jacking into Dad's PC

// Thanks NMarko for help with Area/SubArea IDs

state("MMBN_LC1") 
{
	int MainMenuGameChoice : 0x989B384; // BN1 = 0, BN2 = 2, BN3W = 3, BN3B = 4
	int MainMenuGameSelected : 0x989BA88; // when chosen, value turns 0

	int GameStart : 0xD5D62B0, 0xD4; // revise
	int DialogueValue: 0x29F34C8, 0x28;
	int Zenny : 0x29EE840, 0xB8, 0x74;
	byte AreaID : 0x29EE840, 0xB8, 0x4;
	byte SubAreaID : 0x29EE840, 0xB8, 0x5;
	byte InBattle : 0x29EE840, 0xB8, 0x0; // 0 is hit when selecting "Return to Title Screen" - 28 on ng/continue select

	int EnemyNo1 : 0x29EE840, 0x50, 0x0;
	int EnemyNo2 : 0x29EE840, 0x50, 0x4;
	int EnemyNo3 : 0x29EE840, 0x50, 0x8;

	int MMB1_EHP1 : 0x29F21F8, 0x60;
	int MMB1_EHP2 : 0x29F21F8, 0x110;
	int MMB1_EHP3 : 0x29F21F8, 0x1C0;
	// int MMB1_InBattle : 0x29EF7B0, 0x68, 0x28, 0x8;
	int MMB1_ResultScreen : 0x29EF620, 0x68, 0x28, 0x8;
	int MMB1_FinalSplit : 0x29F21F8, 0x4;
	int MMB1_AreaID : 0x29EE840, 0xB8, 0x4;

	int MMB2_NGGameStart : 0x29EE840, 0xB8, 0x88;
	byte MMB2_EHP1 : 0x29F21F8, 0x1A4;
	byte MMB2_EHP2 : 0x29F21F8, 0x264;
	byte MMB2_EHP3 : 0x29F21F8, 0x264;
	byte MMB2_ChipSelectionMenu: 0x29EE840, 0xB8, 0x8;
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
	
	settings.Add("BN1Bosses", true, "Splits");
	settings.CurrentDefaultParent = "BN1Bosses";
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

	settings.Add("BN2Bosses", true, "Splits");
	settings.CurrentDefaultParent = "BN2Bosses";
	settings.Add("BN2AirMan", true, "AirMan");
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
	return old.GameStart == 0 && current.GameStart == 1 || old.MMB2_NGGameStart == 0 && current.MMB2_NGGameStart == 1;
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
	if(settings["BN2AirMan"] && current.EnemyNo1 == 128)
	{
		vars.BossEncounter.Add("BN2" + current.EnemyNo1.ToString());
	}

	//find area ID first - do a visited WWW1 - if can do fire set ID also (only if WWW skip works)
	//if(settings["BN1NoBN1LifeVirusSplit"])

	if(current.GameStart != old.GameStart) print("Start Value: " + current.GameStart.ToString());

	// if(current.MMB1_AreaID != old.MMB1_AreaID) print("MMB1_AreaID: " + current.MMB1_AreaID.ToString());
	if(current.AreaID != old.AreaID) print("AreaID: " + current.AreaID.ToString());
	if(current.SubAreaID != old.SubAreaID) print("SubAreaID: " + current.SubAreaID.ToString());
	if(current.InBattle != old.InBattle) print("InBattle: " + current.InBattle.ToString());

	if(current.MainMenuGameChoice != old.MainMenuGameChoice) print("MainMenuGameChoice: " + current.MainMenuGameChoice.ToString());
	if(current.MainMenuGameSelected != old.MainMenuGameSelected) print("MainMenuGameSelected: " + current.MainMenuGameSelected.ToString());
	if(current.EnemyNo1 != old.EnemyNo1) print("EnemyNo1: " + current.EnemyNo1.ToString());
	// if(current.EnemyNo2 != old.EnemyNo2) print("EnemyNo2: " + current.EnemyNo2.ToString());
	// if(current.EnemyNo3 != old.EnemyNo3) print("EnemyNo3: " + current.EnemyNo3.ToString());
	// if(current.MMB1_InBattle != old.MMB1_InBattle) print("MMB1_InBattle: " + current.MMB1_InBattle.ToString());
	// if(current.MMB1_ResultScreen != old.MMB1_ResultScreen) print("MMB1_ResultScreen: " + current.MMB1_ResultScreen.ToString());
	// print("\n-----vars.Boss: " + vars.Boss.ToString());
}

split
{
	// Mega Man Battle Network 1
	if (vars.BossEncounter.Contains("BN1" + current.EnemyNo1.ToString()) 
		&& !vars.BossDefeated.Contains("BN1" + current.EnemyNo1.ToString())
		&& old.MMB1_ResultScreen == 2 && current.MMB1_ResultScreen == 1)
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

	if (settings["BN1LifeVirusSplit"] && vars.LifeVirusDefeated.Contains("Defeated") && old.MMB1_FinalSplit == 1 && current.MMB1_FinalSplit == 15)
	{
		return true;
	}

	if (settings["BN1NoLifeVirusSplit"] && old.MMB1_FinalSplit == 1 && current.MMB1_FinalSplit == 15)
	{
		return true;
	}

	// Mega Man Battle Network 2
	if (vars.BossEncounter.Contains("BN2" + current.EnemyNo1.ToString()) 
		&& !vars.BossDefeated.Contains("BN2" + current.EnemyNo1.ToString())
		&& old.InBattle == 12 && current.InBattle == 4)
		{
			vars.BossDefeated.Add("BN2" + current.EnemyNo1.ToString());
			return true;
		}

	// test from secret station -> www base -> complete game from there
	// if (current.MMB1_AreaID == 55836673 && vars.LifeVirusDefeated.Contains("Entered") 
	// 		&& old.MMB1_FinalSplit == 1 && current.MMB1_FinalSplit == 15)
	// {
	// 	return true;
	// }
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