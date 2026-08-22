// Canlandirma sahnesi oynarken metin bos oldugu icin balon bombos duruyordu.
// Tam karanlikta zaten ustu ortuluyor ama kararma ve acilma anlarinda
// goruniyordu; sahne boyunca hic cizmiyoruz.
if (instance_exists(o_monster_soul))
{
	if (o_monster_soul.active) { exit; }
}

draw_sprite_ext(spr_sizeable_dialouge_box_bubble,MODE,x_box,y_box,xscale_box,yscale_box,ANGLE_BUBBLE,global.battleTheme,1)
draw_sprite_ext(spr_sizeable_dialouge_box_spike,MODE,x_box+_spike_extra_x,y_box+(_spike_extra_y),1,1,ANGLE_SPIKE,global.battleTheme,_spike_alpha)
