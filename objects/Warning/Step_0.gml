PAUSEM+=-1

if PAUSEM = 2
{
	instance_create_depth(Warning.x,Warning.y,1,Flash)
}

if PAUSEM = 1
{
	instance_destroy()
}