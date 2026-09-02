_timer=0;
_start=false;
cang=false;
canga=0;
global.checkornot = false;

// Mizrak kutunun ve kalbin ONUNE cizilsin (DEPTH_BATTLE: kucuk = onde).
depth = DEPTH_BATTLE.BULLET_OUTSIDE_HIGH;

//==========================================================================
// MERHAMET CEZASI -- MIZRAK SAPLAMASI (faz 1)
// Sans merhameti hakaret sayiyor ve tek darbede bitiriyor.
//
// s_sans_spearstab bir SAYFA (420x210); tek tek sprite'lar yok, o yuzden
// parcalar draw_sprite_part_ext ile kesilerek ciziliyor:
//   duran mizrak    x 101, y 1, 24x108
//   saplayan mizrak x 131, y 1, 30x129  (etrafinda hiz cizgileri var)
//
// KONUM: her sey mizragin UCUNUN kalbe gore y farkiyla anlatiliyor
// (sap_uc). Degerler konsept gif'inden olculdu:
//   duruyor   : uc kalbin 77 px ALTINDA (mizrak kalbin arkasindan gecer)
//   gerilmis  : uc kalbin 15 px USTUNDE (mizrak yukari cekilmis, sadece
//               ucu gorunuyor)
//   saplanmis : uc kalbin 86 px ALTINDA (kalbi delip gecmis)
//==========================================================================
#macro SAP_DUR_X   101	/// duran mizragin sayfadaki yeri
#macro SAP_DUR_Y     1
#macro SAP_DUR_G    24
#macro SAP_DUR_Y2  108
#macro SAP_VUR_X   131	/// saplayan (hiz cizgili) mizrak
#macro SAP_VUR_Y     1
#macro SAP_VUR_G    30
#macro SAP_VUR_Y2  129

#macro SAP_BAS       5	/// merhamet diyalogu bitti, mizrak beliriyor
#macro SAP_ACIL     12	/// belirme suresi
#macro SAP_CEK      39	/// mizrak yukari cekiliyor
#macro SAP_CEK_SURE  6
#macro SAP_VUR     103	/// saplama
#macro SAP_VUR_SURE  6
#macro SAP_SON     165	/// mizrak soluyor
#macro SAP_BITIS   190	/// emniyet: oyuncu olmediyse tur yine de bitsin

#macro SAP_UC_DUR   77	/// ucun kalbe gore y farki -- duruyor
#macro SAP_UC_GERI -15	/// gerilmis
#macro SAP_UC_SAP   86	/// saplanmis

sap_on = false;
sap_faz = 0;		/// 0 duruyor | 1 cekiliyor | 2 gerilmis | 3 sapliyor | 4 bitti
sap_alpha = 0;
sap_x = 320;		/// mizragin merkezi -- saplama baslayana kadar kalbi takip eder
sap_y = 320;
sap_uc = SAP_UC_DUR;
sap_sars = 0;		/// cizimdeki titreme genligi (px)

///Mizragi cagirir.
SapBasla = function()
{
	sap_on = true;
	sap_faz = 0;
	sap_alpha = 0;
	sap_uc = SAP_UC_DUR;
	sap_sars = 1;
	audio_play_sound(snd_pullback,3,false);
};

///Her adim. _t turun sayaci.
SapAdim = function(_t)
{
	if (!sap_on) { return; }

	// Saplama baslayana kadar mizrak kalbi takip ediyor: nereye kacarsan
	// kac, tepende duruyor. Saplama aninda konum KILITLENIYOR.
	if (_t < SAP_VUR) and (instance_exists(battle_soul))
	{
		sap_x = battle_soul.x;
		sap_y = battle_soul.y;
	}

	if (_t < SAP_BAS+SAP_ACIL) { sap_alpha = min(1,(_t-SAP_BAS)/SAP_ACIL); }
	else if (_t > SAP_SON) { sap_alpha = max(0,sap_alpha-0.04); }
	else { sap_alpha = 1; }

	if (_t < SAP_CEK)
	{
		// Duruyor: kalbin arkasinda, ucu asagida, hafifce titriyor.
		sap_faz = 0;
		sap_uc = SAP_UC_DUR;
		sap_sars = 1;
	}
	else if (_t < SAP_CEK+SAP_CEK_SURE)
	{
		// Yukari cekiliyor: artik hiz cizgili sprite kullaniliyor.
		sap_faz = 1;
		var _o = (_t-SAP_CEK)/SAP_CEK_SURE;
		sap_uc = SAP_UC_DUR+(SAP_UC_GERI-SAP_UC_DUR)*(1-power(1-_o,2));
		sap_sars = 2;
	}
	else if (_t < SAP_VUR)
	{
		// Gerilmis bekliyor. Titreme ve ekran sarsintisi son ana dogru artiyor:
		// gerilim burada kuruluyor.
		sap_faz = 2;
		sap_uc = SAP_UC_GERI;
		var _g = (_t-(SAP_CEK+SAP_CEK_SURE))/max(1,SAP_VUR-(SAP_CEK+SAP_CEK_SURE));
		sap_sars = 1+_g*3;
		if ((_t mod 6) == 0) { Camera_Shake(1+_g*3,1+_g*3,2,2); }
	}
	else if (_t < SAP_VUR+SAP_VUR_SURE)
	{
		// SAPLAMA: hizlanarak asagi. Mesafe t^2 ile artiyor.
		sap_faz = 3;
		var _o = (_t-SAP_VUR)/SAP_VUR_SURE;
		sap_uc = SAP_UC_GERI+(SAP_UC_SAP-SAP_UC_GERI)*_o*_o;
		sap_sars = 0;
	}
	else
	{
		sap_faz = 4;
		sap_uc = SAP_UC_SAP;
		sap_sars = 0;
	}
};

///Carpma ani: tek darbede oldurur.
///Normal oldurucu vurusla ayni yoldan gidiyor -- cani 1'e cekip HURT
///olayini cagiriyoruz, Player_Hurt(4) onu 0'a indiriyor. Boylece olum
///makinasinin tamami (ses, sarsinti, oyun sonu) kendiliginden isliyor.
SapVur = function()
{
	audio_play_sound(snd_smash_impact,4,false);
	audio_play_sound(snd_bighit,4,false);
	Camera_Shake(14,14,6,6,4,4,0.3,0.3);
	Player_SetHp(1);
	Battle_CallSoulEventHurt();
};
