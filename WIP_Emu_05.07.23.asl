state("EmuHawk", "2.3.1"){}
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
	var mainModule = modules.First();

	switch (mainModule.ModuleMemorySize){
		//Bizhawk
		case 0x6EA000:
			version = "2.3.1";
			vars.baseRAMaddress = new DeepPointer("mgba.dll", 0xC3050, 0x10, 0x28, 0x0);
			// current.baseRAMaddress.DerefOffsets(game, out ip);
			// print(current.baseRAMaddress.ToString("X"));
			// base address = 6F880000
			break;
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
			vars.baseRAMaddress = new DeepPointer("mgba.dll", 0xF9448, 0x10, 0x28, 0x0);
			// current.baseRAMaddress.DerefOffsets(game, out ip);
			// print(current.baseRAMaddress.ToString("X"));
			// vars.baseRAMAddress = (ulong) modules.Where (x => x.ModuleName == "mgba.dll").First().BaseAddress;
			// refLocation = (ulong) IntPtr.Add((IntPtr) baseAddress, 0xF9448 + 0x10 + 0x28 + 0x0);
			// var dp = new DeepPointer("mgba.dll", 0xf9448, 0x10, 0x28, 0x0);
			// dp.DerefOffsets(game, out ip);
  			// print(ip.ToString("X"));
			// Outputs 26416E49480 - Needs to be 28DB1830000 for WRAM
			break;
		case 0x482000:
			version = "2.9";
			print("BizHawk 2.9lol");
			break;
		default:
			break;	
	}

	// if (!modules.Any(m => m.ModuleName.Contains("mgba.dll")))
    //     throw new Exception("No mGBA module found!");

	// IntPtr memoryOffset = IntPtr.Zero;
	// long wramAddr;
	// IntPtr codeOffset;

	// var gbaModule = modules.First(x => x.ModuleName == "mgba.dll")

	// int cWRAM = memory.ReadValue<int>(gbaModule.BaseAddress + 0xF9448);

	// int offset = 

	// ulong memoryOffset = 0, smsMemoryOffset = 0;
    // ulong baseAddress;
    // IntPtr codeOffset;
	// baseAddress = (ulong) modules.First().BaseAddress;

	//  if (versions.TryGetValue(modules.First().ModuleMemorySize, out wramAddr)) {
    //         memoryOffset = (IntPtr)wramAddr;
    //     }

	var mms = modules.First().ModuleMemorySize;
	print("ModuleMemorySize: " + "0x" + mms.ToString("X"));
	
	var mms2 = modules.First(x => x.ModuleName == "mgba.dll").BaseAddress;
	print(mainModule + " - Base Address: " + mms2.ToString("X"));

	var baseRAMAddress = modules.Where(x => x.ModuleName == "mgba.dll").First().BaseAddress;

	ulong memoryOffset = 0;
	ulong baseAddress;
	IntPtr codeOffset;

	ulong refLocation = 0;
	baseAddress = (ulong) modules.First().BaseAddress;
	SigScanTarget target;

	var ip = IntPtr.Zero;

	// switch (mainModule.ModuleMemorySize){
	// 	//Bizhawk
	// 	case 0x6EA000:
	// 		version = "2.3.1";
	// 		vars.baseRAMaddress = new DeepPointer("mgba.dll", 0xC3050, 0x10, 0x28, 0x0);
	// 		// current.baseRAMaddress.DerefOffsets(game, out ip);
	// 		// print(current.baseRAMaddress.ToString("X"));
	// 		// base address = 6F880000
	// 		break;
	// 	case 0x456000:
	// 		version = "2.6.1";
	// 		// vars.baseRAMAddress = modules.Where (x => x.ModuleName == "mgba.dll").First().BaseAddress + 0x310f80;
	// 		break;
	// 	case 0x454000:
	// 		version = "2.6.2";
	// 		// vars.baseRAMAddress = modules.Where (x => x.ModuleName == "mgba.dll").First().BaseAddress + 0x30df80;
	// 		break;
	// 	case 0x45a000:
	// 		version = "2.6.3";
	// 		// vars.baseRAMAddress = modules.Where (x => x.ModuleName == "mgba.dll").First().BaseAddress + 0x30df80;
	// 		break;
	// 	case 0x45C000:
	// 		version = "2.8";
	// 		print("BizHawk 2.8");
	// 		vars.baseRAMaddress = new DeepPointer("mgba.dll", 0xF9448, 0x10, 0x28, 0x0);
	// 		current.baseRAMaddress.DerefOffsets(game, out ip);
	// 		print(current.baseRAMaddress.ToString("X"));
	// 		// vars.baseRAMAddress = (ulong) modules.Where (x => x.ModuleName == "mgba.dll").First().BaseAddress;
	// 		// refLocation = (ulong) IntPtr.Add((IntPtr) baseAddress, 0xF9448 + 0x10 + 0x28 + 0x0);
	// 		// var dp = new DeepPointer("mgba.dll", 0xf9448, 0x10, 0x28, 0x0);
	// 		// dp.DerefOffsets(game, out ip);
  	// 		// print(ip.ToString("X"));
	// 		// Outputs 26416E49480 - Needs to be 28DB1830000 for WRAM
	// 		break;
	// 	case 0x482000:
	// 		version = "2.9";
	// 		print("BizHawk 2.9lol");
	// 		break;
	// 	default:
	// 		break;	
	// }
}

update
{
	switch ()
}