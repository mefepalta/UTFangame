event_inherited();
global.go_dodge = "block";

// FINAL PHASE: burada Sans artik blocklamiyor, gercekten hasar aliyor
// ("sans' attacks get slower, and you are able to hit him for real").
// Bu satir olmadan her vurusta yukaridaki "block" gecerli kaliyor ve
// ekranda BLOCKED yazisi cikiyordu.
if (global.p25phase >= 1) { global.go_dodge = "damage"; }

// FAZ 1'IN SON DUZLUGU: yenilgi diyalogundan sonra da Sans blocklamiyor,
// vurus GERCEKTEN iniyor -- faz 1.5'e gecisi bu vurus tetikliyor
// (battle_enemy_engage/Other_13 -> global.p1sanshp).
//
// Tur biterken go_dodge zaten "damage" yapiliyor (battle_turn_20 ve
// battle_skip_turn_0) AMA yukaridaki 2. satir her FIGHT'ta onu "block"a
// geri cekiyordu: ekranda BLOCKED cikiyor, hasar islenmiyor ve faz 1.5
// gecisi hic tetiklenmiyordu. Bu yuzden ayni istisna burada da lazim.
//
// finalstretch faz 1'e ozel: p05/p15/p25 kontrolculeri odaya girerken
// sifirliyor, o yuzden faz 2'yi etkilemiyor. Oda kontrolu yine de var.
if (global.finalstretch >= 1) and (room == room_battle) { global.go_dodge = "damage"; }

// Hedef Sans degilse onu gizlemeyelim: phase 2de Papyrus/Alphys de birer slot,
// birine vurunca Sans kaybolup blok sprite'i cikiyordu.
var _target_slot=Battle_ConvertMenuChoiceEnemyToEnemySlot(Battle_GetMenuChoiceEnemy());
var _hit_sans=(instance_exists(battle_enemy_engage) && _target_slot==battle_enemy_engage._enemy_slot);

_dir=choose(DIR.LEFT,DIR.RIGHT);
_input_acceptable=true;
_aim_x=0;
_aim_image=0;
image_xscale=1.3;
image_alpha=0;
image_yscale=2;

if(_dir==DIR.LEFT){
	if (_hit_sans) and (!global.finalstretch == 1) and (global.p25phase == 0)
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
	if (_hit_sans) and (!global.finalstretch == 1) and (global.p25phase == 0)
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