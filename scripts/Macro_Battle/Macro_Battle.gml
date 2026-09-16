function Macro_Battle() {
	enum BATTLE_STATE{
		MENU,
		DIALOG,
		TURN_PREPARATION,
		IN_TURN,
		BOARD_RESETTING,
		RESULT
	};

	enum BATTLE_MENU{
		BUTTON,
		FIGHT_TARGET,
		FIGHT_AIM,
		FIGHT_ANIM,
		FIGHT_DAMAGE,
		ACT_TARGET,
		ACT_ACTION,
		ITEM,
		MERCY
	};

	enum BATTLE_MENU_CHOICE_BUTTON{
		FIGHT,
		ACT,
		ITEM,
		MERCY
	};

	enum BATTLE_MENU_CHOICE_MERCY{
		SPARE,
		FLEE
	};

	enum BATTLE_ENEMY_EVENT{
		INIT,
		BATTLE_START,
		MENU_START,
		MENU_SWITCH,
		MENU_CHOICE_SWITCH,
		MENU_END,
		DIALOG_START,
		DIALOG_END,
		TURN_PREPARATION_START,
		TURN_PREPARATION_END,
		TURN_START,
		TURN_END,
		BOARD_RESETTING_START,
		BOARD_RESETTING_END
	};

	enum BATTLE_SOUL_EVENT{
		BULLET_COLLISION,
		HURT
	};

	enum BATTLE_BULLET_EVENT{
		SOUL_COLLISION,
		TURN_END
	};

	enum BATTLE_TURN_EVENT{
		TURN_PREPARATION_START,
		TURN_PREPARATION_END,
		TURN_START,
		TURN_END
	};

	enum BATTLE_MENU_FIGHT_EVENT{
		ANIM,
		DAMAGE,
		END
	};

	enum BATTLE_BOARD{
		X=320,
		Y=320,
		UP=65,
		DOWN=65,
		LEFT=283,
		RIGHT=283
	};

	enum BATTLE_TURN{
		TIME,
		BOARD_X,
		BOARD_Y,
		BOARD_UP,
		BOARD_DOWN,
		BOARD_LEFT,
		BOARD_RIGHT,
		BOARD_MOVE_TWEEN,
		BOARD_MOVE_EASE,
		BOARD_MOVE_MODE,
		BOARD_MOVE_SPEED,
		BOARD_MOVE_DURATION,
		BOARD_SIZE_TWEEN,
		BOARD_SIZE_EASE,
		BOARD_SIZE_MODE,
		BOARD_SIZE_SPEED,
		BOARD_SIZE_DURATION,
		BOARD_RESET_X,
		BOARD_RESET_Y,
		BOARD_RESET_UP,
		BOARD_RESET_DOWN,
		BOARD_RESET_LEFT,
		BOARD_RESET_RIGHT,
		BOARD_RESET_MOVE_TWEEN,
		BOARD_RESET_MOVE_EASE,
		BOARD_RESET_MOVE_MODE,
		BOARD_RESET_MOVE_SPEED,
		BOARD_RESET_MOVE_DURATION,
		BOARD_RESET_SIZE_TWEEN,
		BOARD_RESET_SIZE_EASE,
		BOARD_RESET_SIZE_MODE,
		BOARD_RESET_SIZE_SPEED,
		BOARD_RESET_SIZE_DURATION,
		SOUL_X,
		SOUL_Y
	};

	enum BATTLE_TURN_BOARD_TRANSFORM_MODE{
		SPEED,
		DURATION
	};

	enum DR_TARGET{
		NORMAL,
		BIG,
		MIRROR
	};


}


#macro DMG_INV            60

#macro DMG_BONE            7
#macro DMG_BONE_BLUE       9
#macro DMG_BONE_ORANGE     9

#macro BLASTER_HITBOX_PAY   2
#macro BLASTER_ISIN_BANT   12

// Tavandan/tabandan kurulan kemik duvarlari (battle_turn_11/12/14 WallMake)
// kemik sayisini cagrildiklari ANDAKI tahta genisliginden hesapliyor ve
// kemikleri sabit konumda yaratiyor. Tahta o an hala animasyondaysa ya da
// sonradan genislerse duvar tahtayi kaplamayi birakip guvenli bosluk
// biraktiriyordu. Kemikler tahta yuzeyine ciziliyor (RegularBone Inside=0),
// yani tasan kemikler GORUNMUYOR -- duvari her zaman bu kadar piksel genis
// kurmak bedava.
#macro KEMIK_DUVAR_MARJ   120

#macro DMG_BLASTER        12
#macro DMG_BLASTER_BIG    22

#macro DMG_SLASH          18

#macro DMG_BOLT            6
#macro DMG_BOLT_BIG       11
#macro DMG_SHOCKER        10
#macro DMG_SPEAR          10

#macro DMG_DR_TARGET       7
#macro DMG_DR_BAR          6
#macro DMG_DR_REFLECT     18

#macro DMG_CAR            15
#macro DMG_GUEST          11

#macro DMG_FAZ2_NORMAL_INDIRIM   4
#macro DMG_FAZ2_NORMAL_TABAN     2

// Turuncu ruhun (battle_soul_orange_dr) BUYUK dash'i: CONFIRM basili
// tutulunca charge her karede 1 artiyor, charge_max'a ulasinca "ding" calip
// birakildiginda do_strike(2) tetikleniyor. Yani bu deger dogrudan "buyuk
// dash'i cikarmak icin kac kare beklemek gerekiyor" demek. 60 fps.
// HARD tabani degismiyor; HARD disi zorluklarda kisaltiliyor.
#macro DASH_SARJ_HARD           40
#macro DASH_SARJ_KOLAY          24

// Kalbin ustundeki CAN / MAX_CAN gostergesi (turuncu kalp ataklari).
// Hasar alininca alfa 1'e ziplar, CAN_GOSTERGE_BEKLE kare sabit durur,
// sonra kare basina CAN_GOSTERGE_SONME kadar soner.
// battle_turn_20 ayni gostergeyi dev kutu sahnesinde KENDI instance
// degiskenleriyle kullaniyor; oraya dokunulmadi.
#macro CAN_GOSTERGE_BEKLE       45
#macro CAN_GOSTERGE_SONME     0.03

function Battle_HurtNormal(_dmg,_inv = DMG_INV)
{
	if (global._inv > 0) { return false; }

	global._inv = _inv;
	if (global.dodge) { return false; }

	audio_play_sound(snd_hurt,0,false);
	Camera_Shake(2,2,4,4);
	Player_Hurt(_dmg);
	return true;
}
