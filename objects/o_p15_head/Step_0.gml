if (!variable_global_exists("bob_timer")) global.bob_timer = 0;
if (!variable_global_exists("p15_sx"))    { global.p15_sx = 0; global.p15_sy = 0; }

var _p    = 0;
var _line = -1;
var _beat = 0;
if (instance_exists(o_textcontroller_p15)) {
    _p    = o_textcontroller_p15.p15;
    _line = o_textcontroller_p15.current_line;
    _beat = o_textcontroller_p15.beat;
}

pure_y = base_y + sin(global.bob_timer) * 1 - _beat * 2.2;

with (o_p15_legs) { other.pure_x = pure_x; }

// Kambur duruşta kafa govdeye gore daha asagida
with (o_p15_body)
{
	if (sprite_index == s_p15sanssheet_6) { other.pure_y = pure_y - 36; }
}

x = pure_x + global.p15_sx;
y = pure_y + global.p15_sy;

// =====================================================================
//  Yuz ifadeleri - s_p15_headraise_2 kare rehberi
//  (goz rengi olculdu: 135,0,135 mor-magenta)
//   0  gozler kapali, sakin
//   1  gozler kapali, ince cizgi
//   2  gozler kapali, asagi bakiyor (bitkin)
//   3  IKI GOZ de kizil + magenta yaniyor (en siddetli)
//   4  gozler duz kapali
//   5  gozler kapali, kapakli
//   6  goz cukurlari tamamen SIYAH ve bos
//   7  sadece SAG goz yaniyor (asimetrik, sinsi)
//   8  IKI GOZ de magenta yaniyor
//
//  Ilk 5.5 saniye kafa hasar/kalkis animasyonunun; ona dokunulmuyor.
//  (Kalkis 240'ta basliyor, 15 adimda bir kare, 330'da bitiyor.)
// =====================================================================
if (_p > 335 && _line >= 1)
{
	// ONEMLI: kafa kalkisi gozler TAM YANMIS halde bitiyor
	// (s_p15_headraise son karesi). Eskiden hemen ardindan gozleri kapali
	// bir kareye geciliyordu; gozler yanip aninda sonuyordu. Artik yanik
	// hal varsayilan, sonuk kareler sadece metnin gerektirdigi yerde.
	sprite_index = s_p15_headraise_2;
	switch (_line)
	{
		case  1: image_index = 7; break;   // "*huff* *puff*"   tek goz, hala toparlaniyor
		case  2: image_index = 7; break;   // "..."
		case  3: image_index = 8; break;   // "Heh..."          iki goz  <- tema basliyor
		case  4: image_index = 8; break;   // "Heheheh..."
		case  5: image_index = 8; break;   // "Man..."
		case  6: image_index = 7; break;   // "I can't remember..."  alayci
		case  7: image_index = 7; break;   // "Well, perhaps ''decisive'' isn't right..."
		case  8: image_index = 8; break;   // "You've yet to knock me off my feet..."
		case  9: image_index = 3; break;   // "Come on..."      dogruluyor, kizil aleve donuyor
		case 10: image_index = 3; break;   // "Where's that EXPLOSIVE power of yours?!"
		case 11: image_index = 8; break;   // "You can't POSSIBLY..."
		case 12: image_index = 3; break;   // "And that fight against Alphys?!"
		case 13: image_index = 3; break;   // "Don't tell me it was just a FLUKE!"
		case 14: image_index = 6; break;   // "..."   GOZLER SONUYOR - ani sessizlik
		case 15: image_index = 7; break;   // "Heh..."          tek goz yeniden yaniyor
		case 16: image_index = 8; break;   // "But you know..."
		case 17: image_index = 8; break;   // "The thought of you..."  <- finale
		case 18: image_index = 3; break;   // "...while STILL holding back..."
		case 19: image_index = 8; break;   // "Man..."
		case 20: image_index = 3; break;   // "I'VE NEVER BEEN MORE EXCITED!"
	}
}
