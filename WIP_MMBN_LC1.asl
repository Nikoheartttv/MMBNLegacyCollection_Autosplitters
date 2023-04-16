// Work in Progress Autosplitter by Nikoheart
// 0.1 - current splits on dialogueID
// still trying to find changing values for major chapter changes etc.
// requires just-ero's asl-help in LiveSplit/Components
// https://github.com/just-ero/asl-help/raw/main/lib/asl-help

state("MMBN_LC1") 
{
	int GameStart : 0x29EE840, 0xB8, 0x0;
	int DialogueValue: 0x29F34C8, 0x28;
}

startup
{
	Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Basic");
    
	settings.Add("Splits", true, "Splits");
	settings.CurrentDefaultParent = "Splits";
	settings.Add("Day1", true, "Day 1");
	settings.Add("NumberMan", true, "After Class after defeating Numberman");
	settings.Add("Day2", true, "Day 2");
	settings.CurrentDefaultParent = null;
}

init
{
	// vars.completedSplits = new List<string>();
}

update
{
	if(current.GameStart != old.GameStart) print("Start Value: " + current.GameStart.ToString());
}

start
{
	if ((old.GameStart == 28 && current.GameStart == 0) || (old.GameStart == 8 && current.GameStart == 0))
	{
		return true;
	}
	// if (old.GameStart == 8 && current.GameStart == 4)
	// {
	// 		return true;
	// }
}

split
{
	// if (settings["Day1"] && old.DialogueValue == 269057590 && current.DialogueValue == 268463343)
	// {
	// 		vars.completedSplits.Add("Day1");
	// 		return true;
	// }
 
  // current splits on specific dialogue - hopefully over update these values stay the same 
	return (settings["Day1"] && old.DialogueValue == 269057590 && current.DialogueValue == 268463343)
	|| ((current.DialogueValue != old.DialogueValue) && (settings["NumberMan"] && current.DialogueValue == 268475036))
	|| (settings["Day2"] && old.DialogueValue == 269057597 && current.DialogueValue == 268478394);
}
