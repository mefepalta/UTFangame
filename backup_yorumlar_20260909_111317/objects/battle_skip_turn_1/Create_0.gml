_timer=0;
_start=false;
cang=false;
canga=0;
global.checkornot = false;

depth = DEPTH_BATTLE.BULLET_OUTSIDE_HIGH;


#macro SAP_KUTU        5
#macro SAP_KUTU_SURE  45
#macro SAP_KUTU_YARI  10
#macro SAP_BG_SURE   120
#macro SAP_BG_TUR     44

#macro SAP_YAVAS     1.6

#macro SAP_SAVUR      40
#macro SAP_BIRAK      44
#macro SAP_BAS        90

#macro SAP_CEK       120
#macro SAP_UST       123
#macro SAP_VUR       152
#macro SAP_OLUM      172
#macro SAP_SON       200
#macro SAP_BITIS     225

#macro SAP_OLCEK       2
#macro SAP_DON_ILK   154
#macro SAP_DON_SON   270
#macro SAP_DON_ESIK  225

#macro SAP_UC_OFS_X   -2
#macro SAP_UC_OFS_Y  102

#macro SAP_UC_DUR      6
#macro SAP_UC_GERI   -14
#macro SAP_UC_SAP     24

#macro SAP_UST_Y     130
#macro SAP_UST_OTUR    8

sap_don_tablo =
[
	[12.0,154.00],
	[14.4,155.09],
	[16.8,156.60],
	[19.2,180.53],
	[21.6,265.55],
	[24.0,268.01],
	[26.4,269.26],
	[28.8,270.00],
];

sap_sol_tablo =
[
	[ 0.0,1.00],
	[ 4.8,0.60],
	[ 9.6,0.23],
	[12.0,0.00],
];

sap_on = false;
sap_kip = 0;
sap_faz = 0;
sap_alpha = 0;
sap_x = 320;
sap_y = 320;
sap_uc = SAP_UC_DUR;
sap_sars = 0;
sap_don = SAP_DON_ILK;
sap_goz = 0;
sap_ust_o = 0;
sap_bg_on = false;
sap_bg_t = 0;
sap_bg_a = 1;
sap_dbg_hedef = -1;

#macro SAP_TESHIS false

sap_kayit_var = false;
sap_k_head = 1; sap_k_legs = 1; sap_k_legs1 = 0;
sap_k_al = 1;   sap_k_ar = 1;   sap_k_al1 = 0;   sap_k_ar1 = 0;

SapGoz = function()
{
	if (!instance_exists(battle_enemy_engage)) { return { x : 320, y : 120 }; }
	var _ex, _ey;
	with (battle_enemy_engage)
	{
		_ex = x+_body_init_x*2+_body_x*2+_head_init_x*2+_head_x*2+11;
		_ey = y+_body_init_y*2+_body_y*2+_head_init_y*2+_head_y*2-29;
	}
	return { x : _ex, y : _ey };
};

SapNokta = function(_uc)
{
	return { x : sap_x-SAP_UC_OFS_X, y : sap_y+_uc-SAP_UC_OFS_Y };
};

SapKalp = function()
{
	if (!instance_exists(battle_soul)) { return; }
	draw_sprite_ext(battle_soul.sprite_index,battle_soul.image_index,
		battle_soul.x,battle_soul.y,
		battle_soul.image_xscale,battle_soul.image_yscale,
		battle_soul.image_angle,c_white,battle_soul.image_alpha);
};

SapTablo = function(_t,_tab)
{
	var _n = array_length(_tab);
	if (_t <= _tab[0][0])    { return _tab[0][1]; }
	if (_t >= _tab[_n-1][0]) { return _tab[_n-1][1]; }
	for (var i = 1; i < _n; i++)
	{
		if (_t <= _tab[i][0])
		{
			var _a = _tab[i-1], _b = _tab[i];
			return _a[1]+(_b[1]-_a[1])*((_t-_a[0])/(_b[0]-_a[0]));
		}
	}
	return _tab[_n-1][1];
};

SapSansAlpha = function(_f)
{
	if (!instance_exists(battle_enemy_engage)) { return; }
	if (!sap_kayit_var)
	{
		sap_k_head  = battle_enemy_engage._head_alpha;
		sap_k_legs  = battle_enemy_engage._legs_alpha;
		sap_k_legs1 = battle_enemy_engage._legs_alpha1;
		sap_k_al    = battle_enemy_engage._armleft_alpha;
		sap_k_ar    = battle_enemy_engage._armright_alpha;
		sap_k_al1   = battle_enemy_engage._armleft_alpha1;
		sap_k_ar1   = battle_enemy_engage._armright_alpha1;
		sap_kayit_var = true;
	}
	var _h = sap_k_head * _f;
	if (_f < 1) { _h = max(_h,0.001); }
	battle_enemy_engage._head_alpha      = _h;
	battle_enemy_engage._legs_alpha      = sap_k_legs  * _f;
	battle_enemy_engage._legs_alpha1     = sap_k_legs1 * _f;
	battle_enemy_engage._armleft_alpha   = sap_k_al    * _f;
	battle_enemy_engage._armright_alpha  = sap_k_ar    * _f;
	battle_enemy_engage._armleft_alpha1  = sap_k_al1   * _f;
	battle_enemy_engage._armright_alpha1 = sap_k_ar1   * _f;
	sap_dbg_hedef = _h;

	if (_f < 1) { with (o_sans_blockp1) { image_alpha = 0; } }
	battle_enemy_engage._body_alpha      = _f;
};

SapBgAdim = function()
{
	if (!sap_bg_on) { return; }
	sap_bg_t++;
	var _a = 1-clamp(sap_bg_t/SAP_BG_SURE,0,1);
	_a = min(_a,1-clamp(_timer/SAP_BG_TUR,0,1));
	sap_bg_a = _a;
	with (o_phase_bg) { alpha = _a; }
};

SapBasla = function()
{
	sap_on = true;
	sap_kip = 0;
	sap_faz = 0;
	sap_alpha = 1;
	sap_uc = SAP_UC_DUR;
	sap_sars = 0;
	Battle_SetBoardSizeCubic(SAP_KUTU_YARI,SAP_KUTU_YARI,SAP_KUTU_YARI,SAP_KUTU_YARI,
		SAP_KUTU_SURE);
	audio_play_sound(snd_pullback,3,false);
};

SapSavur = function()
{
	sap_kip = 1;
	with (battle_enemy_engage) { _spear_sprite = s_sans_spear_swing; }
	audio_play_sound(snd_swift,3,false);
};

SapBirak = function()
{
	sap_kip = 2;
	sap_don = SAP_DON_ILK;
	with (battle_enemy_engage) { _spear_alpha = 0; }
	audio_play_sound(snd_pullback,3,false);
};

SapOtur = function()
{
	sap_kip = 3;
	sap_faz = 0;
	sap_don = SAP_DON_SON;
	audio_play_sound(snd_impact,3,false);
	Camera_Shake(4,4,3,3);
};

SapAdim = function(_t)
{
	if (!sap_on) { return; }

	if (_t >= SAP_BIRAK) and (instance_exists(battle_enemy_engage))
	{
		var _gor = SapTablo((_t-SAP_BIRAK)/SAP_YAVAS,sap_sol_tablo);
		SapSansAlpha(_gor);
		sap_goz = 0.8*(1-_gor);
		battle_enemy_engage._spear_alpha = 0;
	}

	if (_t < SAP_VUR) and (instance_exists(battle_soul))
	{
		sap_x = battle_soul.x;
		sap_y = battle_soul.y;
	}

	if (sap_kip <= 1) { return; }

	if (sap_kip == 2)
	{
		sap_don = SapTablo((_t-SAP_BIRAK)/SAP_YAVAS,sap_don_tablo);
		return;
	}
	if (sap_kip != 3) { return; }

	if (_t > SAP_SON) { sap_alpha = max(0,sap_alpha-0.04); }
	else { sap_alpha = 1; }

	if (_t < SAP_CEK)
	{
		sap_faz = 0;
		sap_uc = SAP_UC_DUR;
		sap_sars = 1;
	}
	else if (_t < SAP_UST)
	{
		sap_faz = 1;
		var _o = (_t-SAP_CEK)/max(1,SAP_UST-SAP_CEK);
		sap_uc = SAP_UC_DUR+(SAP_UC_GERI-SAP_UC_DUR)*_o;
		sap_sars = 2;
	}
	else if (_t < SAP_VUR)
	{
		sap_faz = 2;
		var _o = clamp((_t-SAP_UST)/12,0,1);
		sap_ust_o = _o;
		var _g = (_t-SAP_UST)/max(1,SAP_VUR-SAP_UST);
		sap_sars = 1+_g*3;
		if ((_t mod 6) == 0) { Camera_Shake(1+_g*3,1+_g*3,2,2); }
	}
	else
	{
		sap_faz = 3;
		sap_uc = SAP_UC_SAP;
		sap_sars = 0;
	}
};

SapCarp = function()
{
	audio_play_sound(snd_smash_impact,4,false);
	audio_play_sound(snd_bighit,4,false);
	Camera_Shake(14,14,6,6,4,4,0.3,0.3);
};

SapVur = function()
{
	Player_SetHp(1);
	Battle_CallSoulEventHurt();
};

SapTemizle = function()
{
	if (sap_bg_on) { with (o_phase_bg) { alpha = 1; } }
	if (!sap_on) { return; }
	if (sap_kayit_var) { SapSansAlpha(1); }
	with (battle_enemy_engage)
	{
		_spear_alpha = 1;
		_spear_sprite = spr_spearp1;
	}
	with (o_phase_bg) { alpha = 1; }
};
