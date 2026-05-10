gop=false;
gop1=0;
gare=0;
go_battle=0;
_blackus=1;
destroysprites = false;
_dialog_part = 0;
_dialog_done = false;
_dialog_part1 = 0;
_dialog_done1 = false;
instance_create_depth(0,0,0,spor);
Anim_Create(id,"_blackus",0,1,1,-1,90);
if (global.death_count == 0)
{
	obj_snas.image_index = 2;
}
if (global.death_count == 1)
{
	obj_snas.image_index = 1;
}