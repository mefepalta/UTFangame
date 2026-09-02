///@desc Mizrak saplamasi

// Mizrak s_sans_spearstab SAYFASINDAN kesilerek ciziliyor: sayfada tek tek
// sprite'lar degil, yan yana duran parcalar var.
//
// Duran mizrak ile saplayan mizragin BOYLARI farkli (108 / 129), o yuzden
// konum ucun yerinden geri hesaplaniyor: cizim y'si = uc - parcanin boyu.
// Boylece iki parca arasinda gecerken uc yerinden oynamiyor.
if (!sap_on) or (sap_alpha <= 0) { exit; }

var _duruyor = (sap_faz == 0);
var _sx = _duruyor ? SAP_DUR_X : SAP_VUR_X;
var _sy = _duruyor ? SAP_DUR_Y : SAP_VUR_Y;
var _sg = _duruyor ? SAP_DUR_G : SAP_VUR_G;
var _sh = _duruyor ? SAP_DUR_Y2 : SAP_VUR_Y2;

var _tx = (sap_sars > 0) ? irandom_range(-sap_sars,sap_sars) : 0;
var _ty = (sap_sars > 0) ? irandom_range(-sap_sars,sap_sars) : 0;

draw_sprite_part_ext(s_sans_spearstab,0,_sx,_sy,_sg,_sh,
	sap_x-_sg/2+_tx,sap_y+sap_uc-_sh+_ty,1,1,c_white,sap_alpha);

// Mizrak kalbin ONUNDE cizildigi icin (tur nesnesi BULLET_OUTSIDE_HIGH,
// ruh SOUL) beklerken kalbi ustune yeniden ciziyoruz -- gif'te de mizrak
// kalbin ARKASINDAN geciyor. Saplama aninda bunu yapmiyoruz: orada
// mizragin kalbi ortmesi gerekiyor.
if (sap_faz < 3) and (instance_exists(battle_soul))
{
	draw_sprite_ext(battle_soul.sprite_index,battle_soul.image_index,
		battle_soul.x,battle_soul.y,
		battle_soul.image_xscale,battle_soul.image_yscale,
		battle_soul.image_angle,c_white,battle_soul.image_alpha);
}
