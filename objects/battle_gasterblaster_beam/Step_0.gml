timer++

var _gorsel_ys = image_yscale;
var _bant      = BLASTER_ISIN_BANT * abs(_gorsel_ys);
var _oran      = (_bant > 0) ? clamp(1 - (2 * BLASTER_HITBOX_PAY) / _bant, 0, 1) : 0;

image_yscale = _gorsel_ys * _oran;
var _degdi   = place_meeting(x, y, battle_soul);
image_yscale = _gorsel_ys;

if (_degdi) {
	if image_alpha > 0.2{
	if(global.kr){
		if (!instance_exists(hurtkr)){
			instance_create_depth(0, 0, 0, hurtkr)
			}
		}else{
			Battle_HurtNormal(DMG_BLASTER);
		}
	}
}
