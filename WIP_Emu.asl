state("EmuHawk", "2.6.1"){}
state("EmuHawk", "2.6.2"){}
state("EmuHawk", "2.6.3"){}
state("EmuHawk", "2.7"){}
state("EmuHawk", "2.8"){}
state("EmuHawk", "2.9"){}

startup 
{
	vars.baseRAMAddress = IntPtr.Zero;
}

init
{
	refreshRate = 30;

	// IntPtr memoryOffset = IntPtr.Zero;
	// long wramAddr;
	// IntPtr codeOffset;

	
	ulong memoryOffset = 0, smsMemoryOffset = 0;
    ulong baseAddress;
    IntPtr codeOffset;
	baseAddress = (ulong) modules.First().BaseAddress;

	//  if (versions.TryGetValue(modules.First().ModuleMemorySize, out wramAddr)) {
    //         memoryOffset = (IntPtr)wramAddr;
    //     }

	var mms = modules.First().ModuleMemorySize;
	var mainModule = modules.First();
	print("0x" + mms.ToString("X"));

	var mms2 = modules.First(x => x.ModuleName == "mgba.dll").BaseAddress;
	print(mms2.ToString("X"));

	switch (mainModule.ModuleMemorySize){
		//Bizhawk
		case 0x456000:
			version = "2.6.1";
			// vars.baseRAMAddress = modules.Where (x => x.ModuleName == "mgba.dll").First().BaseAddress + 0x310f80;
			break;
		case 0x454000:
			version = "2.6.2";
			// vars.baseRAMAddress = modules.Where (x => x.ModuleName == "mgba.dll").First().BaseAddress + 0x30df80;
			break;
		case 0x45a000:
			version = "2.6.3";
			// vars.baseRAMAddress = modules.Where (x => x.ModuleName == "mgba.dll").First().BaseAddress + 0x30df80;
			break;
		case 0x45C000:
			version = "2.8";
			print("BizHawk 2.8");
			break;
		case 0x482000:
			version = "2.9";
			print("BizHawk 2.9lol");
			break;
		default:
			break;	
	}
}