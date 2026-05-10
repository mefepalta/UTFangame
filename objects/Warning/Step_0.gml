PAUSEM+=-1
if PAUSEM = 2
{
    instance_create_depth(x,y,1,Flash)
	show_debug_message(PAUSEM);
}
if PAUSEM = 1
{
    instance_destroy()
}