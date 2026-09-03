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

	//Sarı ruh atağındaki hedef türleri
	enum DR_TARGET{
		NORMAL,		//hem küçük hem büyük mermi yok eder
		BIG,		//sadece büyük mermi yok eder
		MIRROR		//mermiyi yansıtır, ruha hasar vermez
	};


}

//==========================================================================
//  FAZ 2 -- NORMAL HASAR SISTEMI
//==========================================================================
//  Faz 1 KARMA (KR) ile oynuyor: hurtkr nesnesi her ~3 karede 2 hasar
//  vuruyor, hasarin yarisi mor bar olarak geri geliyor. Faz 2 ise KLASIK
//  hasar kullaniyor: her mermi turunun KENDI sabit degeri var, vurus
//  aninda dokunulmazlik penceresi aciliyor ve can geri gelmiyor.
//
//  Anahtar global.kr:
//    true  -> KR yolu   (faz 1, room_battle)
//    false -> normal yol (faz 2, room_battle_1)
//  Odaya gore kurulumu battle_ui/Create_0 ve battle_enemy_engage/Step_0
//  yapiyor; mermilerin icindeki "else" dallari bu fonksiyona giriyor.
//
//  BALANS: asagidaki sayilari degistirmek yeter, mermi kodlarina dokunmaya
//  gerek yok. Faz 2'de can 92 (LV 19).
//==========================================================================

/// Vurustan sonraki dokunulmazlik (kare). Oyun 60 fps -> 60 = 1 saniye.
/// Isin gibi surekli temas eden mermiler bu sure dolunca yeniden vuruyor:
/// isinin icinde durursan saniyede bir kez, tam degeri kadar hasar alirsin.
#macro DMG_INV            60

// --- kemikler (battle_regularbone: butun kemikler, duvarlar, hancerler) --
#macro DMG_BONE            7	/// beyaz kemik
#macro DMG_BONE_BLUE       9	/// mavi kemik -- dururken guvenli, hareket cezali
#macro DMG_BONE_ORANGE     9	/// turuncu kemik -- hareket ederken guvenli

// --- blasterlar ---------------------------------------------------------
#macro DMG_BLASTER        12	/// normal gaster blaster isini
#macro DMG_BLASTER_BIG    22	/// 20. atagin dev blaster isini

// --- Sans ---------------------------------------------------------------
#macro DMG_SLASH          18	/// Sans'in firlattigi kesik

// --- Alphys -------------------------------------------------------------
#macro DMG_BOLT            6	/// kucuk yildirim
#macro DMG_BOLT_BIG       11	/// buyuk yildirim (Yildirim / AlphysBigBolt)
#macro DMG_SHOCKER        10	/// sok alani
#macro DMG_SPEAR          10	/// mizrak

// --- sari ruh (DR) bolumu -----------------------------------------------
#macro DMG_DR_TARGET       7	/// uzerine gelen hedef
#macro DMG_DR_BAR          6	/// mavi kemik bari
#macro DMG_DR_REFLECT     18	/// aynadan sekip donen KENDI mermin -- CEZA: aynaya
								/// atmak oyuncunun kendi hatasi, ucuz olmamali

// --- turuncu ruh parkuru ------------------------------------------------
#macro DMG_CAR            15	/// bileklik carousel (turn 16 / 18 / 20) -- CEZA:
								/// sadece HAVADAKI kalp carpiyor, yani yanlis
								/// zamanda ziplamanin bedeli
#macro DMG_GUEST          11	/// Konuk'un atilisi (turn 18 / 20)

///@arg damage
///@arg [inv_frames]
///@desc Faz 2'nin normal hasar yolu. Dokunulmazlik penceresi acikken
///      hicbir sey yapmaz. Gercekten vurduysa true doner.
function Battle_HurtNormal(_dmg,_inv = DMG_INV)
{
	if (global._inv > 0) { return false; }

	// Dokunulmazlik her halukarda aciliyor: kacinma (dodge) sirasinda bile
	// mermi "degdi" sayiliyor, sadece hasar islenmiyor.
	global._inv = _inv;
	if (global.dodge) { return false; }

	audio_play_sound(snd_hurt,0,false);
	Camera_Shake(2,2,4,4);
	Player_Hurt(_dmg);
	return true;
}
