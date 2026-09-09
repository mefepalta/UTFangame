_timer=0;
_start=false;
cang=false;
canga=0;

s1_next = -1;
s1_n = 0;
s1_ang = 0;

sari_on = false;
sari_t = 0;
sari_son = 1010;

SariBasla = function()
{
	instance_create_depth(0,0,0,battle_soul_red_effect);
	Anim_Destroy(battle_board,"up");
	Anim_Destroy(battle_board,"down");
	Anim_Destroy(battle_board,"left");
	Anim_Destroy(battle_board,"right");
	Battle_SetBoardSizeCubic(40,40,40,40,45);
	battle_board.angle = 0;
	Battle_SetSoul(battle_soul_yellow_dr);
	Camera_Shake(4,4,3,3);

	sari_on = true;
	sari_t = 0;
};


kir_on = false;
kir_t = 0;

KirmiziBasla = function()
{
	kir_on = true;
	kir_t = 0;
};
