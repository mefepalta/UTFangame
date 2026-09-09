event_inherited();
global.go_dodge = "block";

if (global.p25phase >= 1) { global.go_dodge = "damage"; }

if (global.finalstretch >= 1) and (room == room_battle) { global.go_dodge = "damage"; }

var _target_slot=Battle_ConvertMenuChoiceEnemyToEnemySlot(Battle_GetMenuChoiceEnemy());
var _hit_sans=(instance_exists(battle_enemy_engage) && _target_slot==battle_enemy_engage._enemy_slot);

// FAZ 1 BITIS PENCERESI.
// global.p1sanshp true olunca battle_enemy_engage/Step_0 room_battle'i 125
// kare (~2 sn) daha ekranda tutup room_p15'e geciyor. O pencerede Step her
// karede _head_alpha/_body_alpha/_legs_alpha1'i 1'e zorluyor ama kollari,
// mizragi ve _legs_alpha'yi zorlamiyor. Oyuncu o 2 saniyede saldirirsa
// asagidaki gizleme kollari ve mizragi dusuruyor, Step de onlari geri
// getirmiyor: Sans kolsuz kaliyor. Checkpoint kapaliyken p1sanshp olumden
// sonra sifirlanmadigi icin tekrar oynayista bu pencere her seferinde aciliyor.
// O pencerede savas zaten bitti, bloklama pozuna hic gerek yok.
// Ayni koruma battle_enemy_engage/Other_18'de de var.
var _p1_bitis = (global.p1sanshp and room == room_battle);

_dir=choose(DIR.LEFT,DIR.RIGHT);
_input_acceptable=true;
_aim_x=0;
_aim_image=0;
image_xscale=1.3;
image_alpha=0;
image_yscale=2;

if(_dir==DIR.LEFT){
	if (_hit_sans) and (!global.finalstretch == 1) and (global.p25phase == 0) and (!_p1_bitis)
	{
		with (battle_enemy_engage)
		{
			_head_alpha = 0;
			_spear_alpha = 0;
			_armleft_alpha = 0;
			_armright_alpha = 0;
			_legs_alpha = 0;
			_legs_alpha1 = 0;
			p2_armleft_alpha = 0;
			p2_armright_alpha = 0;
			p2_body_alpha = 0;
			p2_cape_alpha = 0;
			p2_legs_alpha = 0;
			p2_head_alpha = 0;
			p2_thingy_alpha = 0;
		}
	}
	else if (_hit_sans)
	{
		with(battle_enemy_engage)
		{
			_head_image = 15;
		}
	}
	Anim_Create(id,"image_alpha",0,0,0.5,0.5,10);
	_aim_x=x+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim)/2;
	Anim_Create(id,"image_xscale",ANIM_TWEEN.QUINT,ANIM_EASE.OUT,1.3,0.7,40);
	Anim_Create(id,"_aim_x",ANIM_TWEEN.SINE,ANIM_EASE.IN,_aim_x,-(battle_board.left+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim)),75);
}else{
	if (_hit_sans) and (!global.finalstretch == 1) and (global.p25phase == 0) and (!_p1_bitis)
	{
		with (battle_enemy_engage)
		{
			_head_alpha = 0;
			_spear_alpha = 0;
			_armleft_alpha = 0;
			_armright_alpha = 0;
			_legs_alpha = 0;
			_legs_alpha1 = 0;
			p2_armleft_alpha = 0;
			p2_armright_alpha = 0;
			p2_body_alpha = 0;
			p2_cape_alpha = 0;
			p2_legs_alpha = 0;
			p2_head_alpha = 0;
			p2_thingy_alpha = 0;
		}
	}
	else if (_hit_sans)
	{
		with(battle_enemy_engage)
		{
			_head_image = 15;
		}
	}
	Anim_Create(id,"image_alpha",0,0,0.5,0.5,10);
	Anim_Create(id,"image_xscale",ANIM_TWEEN.QUINT,ANIM_EASE.OUT,1.3,0.7,40);
	_aim_x=x-battle_board.left-sprite_get_width(spr_battle_menu_fight_aim)/2;
	Anim_Create(id,"_aim_x",ANIM_TWEEN.SINE,ANIM_EASE.IN,_aim_x,battle_board.left+battle_board.right+sprite_get_width(spr_battle_menu_fight_aim),75);
}