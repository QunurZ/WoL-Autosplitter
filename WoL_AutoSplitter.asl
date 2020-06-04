//Originally created by TheFuncannon
//Updated by Phantom
//Updated by Qunur

//The recently updated version is made for v1.22 of Wizard of Legend
//This auto-splitter does not work on Boss Rush.

state("WizardOfLegend")
{
	float gameTime: "mono.dll", 0x00266180, 0x50, 0x428, 0x18, 0x30, 0x8, 0x18, 0xF10;
	
	byte stage: "mono.dll", 0x00265618, 0x148, 0xC0, 0xE8, 0x38, 0xA0, 0x50, 0xDF0;
	byte level: "mono.dll", 0x00262A68, 0x2A8, 0xDA0, 0x60, 0x10, 0xA0, 0x960, 0xE8C;
}

start
{
	if(old.stage == 0 && current.stage == 0 && old.level == 0 && current.level == 1)
		return true;
}

reset
{
	if(current.stage == 0 && current.level == 0)
		return true;
}

split
{
	if(old.stage == current.stage && old.level == current.level - 1)
		return true;
}

isLoading
{
	return true;
}

gameTime
{
	return TimeSpan.FromSeconds(current.gameTime);
}