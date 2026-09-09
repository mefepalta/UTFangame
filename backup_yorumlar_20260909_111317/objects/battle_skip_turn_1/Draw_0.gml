
if (SAP_TESHIS)
{
	var _vx = camera_get_view_x(view_camera[0]);
	var _vy = camera_get_view_y(view_camera[0]);
	var _ex = instance_exists(battle_enemy_engage);

	draw_set_alpha(0.72);
	draw_set_colour(c_black);
	draw_rectangle(_vx+2,_vy+2,_vx+330,_vy+128,false);
	draw_set_alpha(1);
	draw_set_colour(c_lime);
	draw_set_font(fnt_small);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);

	var _s = "SAP TESHIS  t=" + string(_timer)
	       + "  on=" + string(sap_on) + " kip=" + string(sap_kip)
	       + " faz=" + string(sap_faz) + "\n";
	_s += "engage var=" + string(_ex)
	    + "  adet=" + string(instance_number(battle_enemy_engage)) + "\n";
	if (_ex)
	{
		_s += "head_a = " + string(battle_enemy_engage._head_alpha)
		    + "   (yazilan " + string(sap_dbg_hedef) + ")\n";
		_s += "legs_a = " + string(battle_enemy_engage._legs_alpha)
		    + "   arml_a = " + string(battle_enemy_engage._armleft_alpha) + "\n";
		_s += "spear_a = " + string(battle_enemy_engage._spear_alpha)
		    + "   spear_spr = " + string(battle_enemy_engage._spear_sprite) + "\n";
	}
	_s += "kayit_var=" + string(sap_kayit_var)
	    + "  k_head=" + string(sap_k_head)
	    + "  block_a=" + (instance_exists(o_sans_blockp1)
	                      ? string(o_sans_blockp1.image_alpha) : "YOK") + "\n";
	_s += "bg on=" + string(sap_bg_on) + " t=" + string(sap_bg_t)
	    + " yazilan=" + string(sap_bg_a)
	    + " gercek=" + (instance_exists(o_phase_bg) ? string(o_phase_bg.alpha) : "YOK") + "\n";
	_s += "goz=" + string(sap_goz) + "  alpha=" + string(sap_alpha);

	draw_text(_vx+8,_vy+6,_s);

	draw_set_colour(c_white);
	draw_set_alpha(1);
	draw_set_font(-1);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}

if (!sap_on) or (sap_alpha <= 0) { exit; }

if (sap_goz > 0)
{
	var _g = SapGoz();
	draw_sprite_ext(s_sans_spear_eye,0,_g.x+10,_g.y,SAP_OLCEK,SAP_OLCEK,0,
		c_white,sap_goz*sap_alpha);
}

if (sap_kip <= 1) { exit; }

var _tx = (sap_sars > 0) ? irandom_range(-sap_sars,sap_sars) : 0;
var _ty = (sap_sars > 0) ? irandom_range(-sap_sars,sap_sars) : 0;

if (sap_kip == 2)
{
	var _p = SapNokta(SAP_UC_DUR);
	if (sap_don < SAP_DON_ESIK)
	{
		draw_sprite_ext(s_sans_spear_up,0,_p.x,_p.y,SAP_OLCEK,SAP_OLCEK,
			sap_don-SAP_DON_ILK,c_white,sap_alpha);
	}
	else
	{
		draw_sprite_ext(s_sans_spear_vert,0,_p.x,_p.y,SAP_OLCEK,SAP_OLCEK,
			sap_don-SAP_DON_SON,c_white,sap_alpha);
	}
	SapKalp();
	exit;
}
if (sap_kip != 3) { exit; }

if (sap_faz == 2)
{
	var _p = SapNokta(SAP_UC_DUR);
	draw_sprite_ext(s_sans_spear_impact,0,
		_p.x+_tx,
		_p.y-SAP_UST_Y+(1-sap_ust_o)*SAP_UST_OTUR+_ty,
		SAP_OLCEK,SAP_OLCEK,0,c_white,sap_alpha);
	SapKalp();
	exit;
}

var _spr = (sap_faz == 3) ? s_sans_spear_stab : s_sans_spear_vert;
var _p = SapNokta(sap_uc);
draw_sprite_ext(_spr,0,_p.x+_tx,_p.y+_ty,SAP_OLCEK,SAP_OLCEK,0,c_white,sap_alpha);

if (sap_faz < 3) { SapKalp(); }
