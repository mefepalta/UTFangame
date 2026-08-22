/// @desc Yesil kemik
// Papyrus'un iyilestirme buyusu. Kemigi motorun kendi yontemiyle kuruyoruz:
// govde (spr_bone_body) gerilir, iki uca Papyrus tipi kapak konur.
// Renk battle_bullet_bone'daki BONE.GREEN ile ayni.
if (!bone_on) { exit; }

var _blend = make_colour_rgb(0,235,0);
var _len = 26;								// kisa kemik
var _hx = lengthdir_x(_len/2,bone_ang);
var _hy = lengthdir_x(_len/2,bone_ang-90);	// motorun kendi ofset yontemi

draw_sprite_ext(spr_bone_body,0,bone_x,bone_y,_len/2,1,bone_ang,_blend,1);
draw_sprite_ext(spr_bone_head_papyrus,0,bone_x-_hx,bone_y+_hy,1,1,bone_ang+180,_blend,1);
draw_sprite_ext(spr_bone_head_papyrus,1,bone_x+_hx,bone_y-_hy,1,1,bone_ang+180,_blend,1);
