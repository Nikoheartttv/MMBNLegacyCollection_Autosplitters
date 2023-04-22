state("EmuHawk")
{
    byte WRAM : "mgba.dll", 0xF9448, 0x10, 0x28, 0x0;
    //int RAM_Offset : "mgba.dll", 0xF9448, 0x10, 0x28, 0x1550;
}

init
{
    current.main_area = (byte)0;
    current.sub_area = (byte)0;
    current.progress = (byte)0;
}

update
{
    // if(current.RAM_Offset != old.RAM_Offset) print("RAM_Offset: " + current.RAM_Offset.ToString());
    var roffset = new DeepPointer("mgba.dll", 0xF9448, 0x10, 0x28, 0x1550).Deref<int>(game);

    var main_area = new DeepPointer("mgba.dll", 0xF9448, 0x10, 0x28, 0x2134 + roffset).Deref<byte>(game);
    var sub_area = new DeepPointer("mgba.dll", 0xF9448, 0x10, 0x28, 0x2135 + roffset).Deref<byte>(game);
	var progress = new DeepPointer("mgba.dll", 0xF9448, 0x10, 0x28, 0x2136 + roffset).Deref<byte>(game);

    current.main_area = main_area;
    current.sub_area = sub_area;
    current.progress = progress;

    if (old.main_area != current.main_area) print("Main Area changed from: " + old.main_area + " to: " + current.main_area);
	if (old.sub_area != current.sub_area) print("Sub Area changed from: " + old.sub_area + " to: " + current.sub_area);
	if (old.progress != current.progress) print("Progress changed from: " + old.progress + " to: " + current.progress);
}