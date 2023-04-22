state("MMBN_LC2") 
{
    int WRAM : 0x140F0B68, 0xC0;
}

init
{
    // current.roffset = (byte)0;
    current.main_area = (byte)0;
    current.sub_area = (byte)0;
    current.progress = (byte)0;
}

update
{
    var roffset = new DeepPointer(0x140F0B68, 0xC0 + 0x1550).Deref<int>(game);

    // current.roffset = roffset;

    // if (old.roffset != current.roffset) print("RAM Offset changed from: " + old.roffset + " to: " + current.roffset);

    var main_area = new DeepPointer(0x140F0B68, 0xC0 + 0x2134 + roffset).Deref<byte>(game);
    var sub_area = new DeepPointer(0x140F0B68, 0xC0 + 0x2135 + roffset).Deref<byte>(game);
	var progress = new DeepPointer(0x140F0B68, 0xC0 + 0x2136 + roffset).Deref<byte>(game);

    current.main_area = main_area;
    current.sub_area = sub_area;
    current.progress = progress;

    if (old.main_area != current.main_area) print("Main Area changed from: " + old.main_area + " to: " + current.main_area);
	if (old.sub_area != current.sub_area) print("Sub Area changed from: " + old.sub_area + " to: " + current.sub_area);
	if (old.progress != current.progress) print("Progress changed from: " + old.progress + " to: " + current.progress);

}