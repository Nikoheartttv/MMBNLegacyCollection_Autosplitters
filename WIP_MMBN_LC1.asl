// Work in Progress Autosplitter by Nikoheart
// 0.2 - BN1 Mostly Done
// requires just-ero's asl-help in LiveSplit/Components
// https://github.com/just-ero/asl-help/raw/main/lib/asl-help

// 17.04.23 - things to do
// get id of results item win? (for All Chips run)
// re-organise settings of autosplitter with super mods
// test with speedrun community if WWW Comp 1 skip works

state("MMBN_LC1") 
{
	int MainMenuGameChoice : 0x989B384; // BN1 = 0, BN2 = 2, BN3W = 3, BN3B = 4
	int MainMenuGameSelected : 0x989BA88; // when chosen, value turns 0

	int GameStart : 0xD5D62B0, 0xD4;
	int DialogueValue: 0x29F34C8, 0x28;
	int Zenny : 0x29EE840, 0xB8, 0x74;
	
	int MMB1_ENo1 : 0x29EE840, 0x50, 0x0;
	int MMB1_ENo2 : 0x29EE840, 0x50, 0x4;
	int MMB1_ENo3 : 0x29EE840, 0x50, 0x8;
	int MMB1_EHP1 : 0x29F21F8, 0x60;
	int MMB1_EHP2 : 0x29F21F8, 0x110;
	int MMB1_EHP3 : 0x29F21F8, 0x1C0;
	int MMB1_InBattle : 0x29EF7B0, 0x68, 0x28, 0x8;
	int MMB1_ResultScreen : 0x29EF620, 0x68, 0x28, 0x8;
	int MMB1_FinalSplit : 0x29F21F8, 0x4;
	int MMB1_AreaID : 0x29EE840, 0xB8, 0x4;
}

startup
{
	Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Basic");
    
	settings.Add("BN1", true, "Mega Man Battle Network 1");
	settings.CurrentDefaultParent = "BN1";

	settings.Add("FinalSplit", true, "Final Split");
	settings.CurrentDefaultParent = "FinalSplit";
	settings.Add("LifeVirusSplit", true, "Life Virus Kill + End Split");
	settings.Add("NoLifeVirusSplit", false, "Skip Life Virus + End Split");
	settings.CurrentDefaultParent = "BN1";
	
	settings.Add("Bosses", true, "Splits");
	settings.CurrentDefaultParent = "Bosses";
	settings.Add("FireMan", true, "FireMan");
	settings.Add("NumberMan", true, "NumberMan");
	settings.Add("GutsMan", true, "GutsMan");
	settings.Add("StoneMan", true, "StoneMan");
	settings.Add("ColdBear", true, "ColdBear");
	settings.Add("IceMan", true, "IceMan");
	settings.Add("SkullMan", true, "SkullMan");
	settings.Add("ColorMan", true, "ColorMan");
	settings.Add("ElecMan", false, "ElecMan");
	settings.Add("ProtoMan", true, "ProtoMan");
	settings.Add("Memos", true, "Memos");
	settings.Add("BombMan", true, "BombMan");
	settings.Add("MagicMan", true, "MagicMan");
	settings.Add("LifeVirus", true, "LifeVirus");
	settings.CurrentDefaultParent = "BN1";

	settings.Add("MBosses", true, "Mini-Bosses");
	settings.CurrentDefaultParent = "MBosses";
	settings.Add("Floshell", true, "Floshell");
	settings.CurrentDefaultParent = "BN1";

	settings.Add("OBosses", false, "Optional Bosses");
	settings.CurrentDefaultParent = "OBosses";
	settings.Add("GutsManV2", false, "GutsManV2");
	settings.Add("GutsManV3", false, "GutsManV3");
	settings.Add("ProtoManV2", false, "ProtoManV2");
	settings.Add("ProtoManV3", false, "ProtoManV3");
	settings.Add("WoodMan", false, "WoodMan");
	settings.Add("WoodManV2", false, "WoodManV2");
	settings.Add("WoodManV3", false, "WoodManV3");
	settings.Add("FireManV2", false, "FireManV2");
	settings.Add("FireManV3", false, "FireManV3");
	settings.Add("NumberManV2", false, "NumberManV2");
	settings.Add("NumberManV3", false, "NumberManV3");
	settings.Add("StoneManV2", false, "StoneManV2");
	settings.Add("StoneManV3", false, "StoneManV3");
	settings.Add("IceManV2", false, "IceManV2");
	settings.Add("IceManV3", false, "IceManV3");
	settings.Add("SkullManV2", false, "SkullManV2");
	settings.Add("SkullManV3", false, "SkullManV3");
	settings.Add("ColorManV2", false, "ColorManV2");
	settings.Add("ColorManV3", false, "ColorManV3");
	settings.Add("BombManV2", false, "BombManV2");
	settings.Add("BombManV3", false, "BombManV3");
	settings.Add("SharkMan", false, "SharkMan");
	settings.Add("SharkManV2", false, "SharkManV2");
	settings.Add("SharkManV3", false, "SharkManV3");
	settings.Add("ElecManV2", false, "ElecManV2");
	settings.Add("ElecManV3", false, "ElecManV3");
	settings.Add("PharaohMan", false, "PharaohMan");
	settings.Add("PharaohManV2", false, "PharaohManV2");
	settings.Add("PharaohManV3", false, "PharaohManV3");
	settings.Add("ShadowMan", false, "ShadowMan");
	settings.Add("ShadowManV2", false, "ShadowManV2");
	settings.Add("ShadowManV3", false, "ShadowManV3");
	settings.Add("MagicManV2", false, "MagicManV2");
	settings.Add("MagicManV3", false, "MagicManV3");
	settings.Add("Bass", false, "Bass");
	settings.CurrentDefaultParent = "BN1";
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
	return old.GameStart == 0 && current.GameStart == 1;
}

onStart
{
	print("\nNew run started!\n----------------\n");
}

update
{
	if(settings["Floshell"] && current.MMB1_ENo1 == 24
		|| settings["ColdBear"] && current.MMB1_ENo1 == 41 && current.MMB1_ENo2 == 42
		|| settings["GutsManV2"] && current.MMB1_ENo1 == 97
		|| settings["GutsManV3"] && current.MMB1_ENo1 == 98
		|| settings["ProtoMan"] && current.MMB1_ENo1 == 99
		|| settings["ProtoManV2"] && current.MMB1_ENo1 == 100
		|| settings["ProtoManV3"] && current.MMB1_ENo1 == 101
		|| settings["WoodMan"] && current.MMB1_ENo1 == 102
		|| settings["WoodManV2"] && current.MMB1_ENo1 == 103
		|| settings["WoodManV3"] && current.MMB1_ENo1 == 104
		|| settings["FireMan"] && current.MMB1_ENo1 == 105
		|| settings["FireManV2"] && current.MMB1_ENo1 == 106
		|| settings["FireManV3"] && current.MMB1_ENo1 == 107
		|| settings["NumberMan"] && current.MMB1_ENo1 == 108
		|| settings["NumberManV2"] && current.MMB1_ENo1 == 109
		|| settings["NumberManV3"] && current.MMB1_ENo1 == 110
		|| settings["StoneMan"] && current.MMB1_ENo1 == 111
		|| settings["StoneManV2"] && current.MMB1_ENo1 == 112
		|| settings["StoneManV3"] && current.MMB1_ENo1 == 113
		|| settings["IceMan"] && current.MMB1_ENo1 == 114
		|| settings["IceManV2"] && current.MMB1_ENo1 == 115
		|| settings["IceManV3"] && current.MMB1_ENo1 == 116
		|| settings["SkullMan"] && current.MMB1_ENo1 == 117
		|| settings["SkullManV2"] && current.MMB1_ENo1 == 118
		|| settings["SkullManV3"] && current.MMB1_ENo1 == 119
		|| settings["ColorMan"] && current.MMB1_ENo1 == 120
		|| settings["ColorManV2"] && current.MMB1_ENo1 == 121
		|| settings["ColorManV3"] && current.MMB1_ENo1 == 122
		|| settings["BombMan"] && current.MMB1_ENo1 == 123
		|| settings["BombManV2"] && current.MMB1_ENo1 == 124
		|| settings["BombManV3"] && current.MMB1_ENo1 == 124
		|| settings["SharkMan"] && current.MMB1_ENo1 == 126
		|| settings["SharkManV2"] && current.MMB1_ENo1 == 127
		|| settings["SharkManV3"] && current.MMB1_ENo1 == 128
		|| settings["ElecMan"] && (current.MMB1_ENo1 == 129 || current.MMB1_ENo1 == 154)
		|| settings["ElecManV2"] && current.MMB1_ENo1 == 130
		|| settings["ElecManV3"] && current.MMB1_ENo1 == 131
		|| settings["PharaohMan"] && current.MMB1_ENo1 == 132
		|| settings["PharaohManV2"] && current.MMB1_ENo1 == 133
		|| settings["PharaohManV3"] && current.MMB1_ENo1 == 134
		|| settings["ShadowMan"] && current.MMB1_ENo1 == 135
		|| settings["ShadowManV2"] && current.MMB1_ENo1 == 136
		|| settings["ShadowManV3"] && current.MMB1_ENo1 == 137
		|| settings["MagicMan"] && current.MMB1_ENo1 == 141
		|| settings["MagicManV2"] && current.MMB1_ENo1 == 142
		|| settings["MagicManV3"] && current.MMB1_ENo1 == 143
		|| settings["Bass"] && current.MMB1_ENo1 == 144)
	{
		vars.BossEncounter.Add(current.MMB1_ENo1.ToString());
	}

	if(settings["GutsMan"] && current.MMB1_ENo1 == 96)
	{
		vars.GutsManEncounter.Add(current.MMB1_ENo1.ToString());
	}

	if(settings["LifeVirus"] && current.MMB1_ENo1 == 147)
	{
		vars.LifeVirusDefeated.Add("Defeated");
	}

	if(current.MMB1_AreaID == 55836677)
	{
		vars.WWWBaseEntered.Add("Entered");
	}

	//find area ID first - do a visited WWW1 - if can do fire set ID also (only if WWW skip works)
	//if(settings["NoLifeVirusSplit"])

	// if(current.GameStart != old.GameStart) print("Start Value: " + current.GameStart.ToString());
	// if(current.MMB1_ResultScreen != old.MMB1_ResultScreen) print("MMB1_ResultScreen: " + current.MMB1_ResultScreen.ToString());
	if(current.MMB1_AreaID != old.MMB1_AreaID) print("MMB1_AreaID: " + current.MMB1_AreaID.ToString());

	// if(current.MainMenuGameChoice != old.MainMenuGameChoice) print("MainMenuGameChoice: " + current.MainMenuGameChoice.ToString());
	// if(current.MainMenuGameSelected != old.MainMenuGameSelected) print("MainMenuGameSelected: " + current.MainMenuGameSelected.ToString());
	if(current.MMB1_ENo1 != old.MMB1_ENo1) print("BN1 Enemy1 ID: " + current.MMB1_ENo1.ToString());
	if(current.MMB1_ENo2 != old.MMB1_ENo2) print("BN1 Enemy2 ID: " + current.MMB1_ENo2.ToString());
	if(current.MMB1_ENo3 != old.MMB1_ENo3) print("BN3 Enemy1 ID: " + current.MMB1_ENo3.ToString());
	// if(current.MMB1_InBattle != old.MMB1_InBattle) print("B1_InBattle: " + current.MMB1_InBattle.ToString());
	// print("\n-----vars.Boss: " + vars.Boss.ToString());
}

split
{
	if (vars.BossEncounter.Contains(current.MMB1_ENo1.ToString()) 
		&& !vars.BossDefeated.Contains(current.MMB1_ENo1.ToString())
		&& old.MMB1_ResultScreen == 2 && current.MMB1_ResultScreen == 1)
		{
			vars.BossDefeated.Add(current.MMB1_ENo1.ToString());
			return true;
		}

	if (vars.GutsManEncounter.Contains(current.MMB1_ENo1.ToString()) 
		&& !vars.BossDefeated.Contains(current.MMB1_ENo1.ToString())
		&& old.MMB1_InBattle == 2 && current.MMB1_InBattle == 1)
		{
			vars.BossDefeated.Add(current.MMB1_ENo1.ToString());
			return true;
		}

	if (settings["LifeVirusSplit"] && vars.LifeVirusDefeated.Contains("Defeated") && old.MMB1_FinalSplit == 1 && current.MMB1_FinalSplit == 15)
	{
		return true;
	}

	if (settings["NoLifeVirusSplit"] && old.MMB1_FinalSplit == 1 && current.MMB1_FinalSplit == 15)
	{
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
