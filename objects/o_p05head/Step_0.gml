if (!variable_global_exists("bob_timer")) global.bob_timer = 0;
if (!variable_global_exists("p05_sx"))    { global.p05_sx = 0; global.p05_sy = 0; }

var _p    = 0;
var _line = -1;
if (instance_exists(o_textcontroller_p05)) {
    _p    = o_textcontroller_p05.p05;
    _line = o_textcontroller_p05.current_line;
}

// Govdeyle ayni cokme / geri tepme egrisi
var _crouch = 0;
if (_p > 2640 && _p <= 2705)  _crouch = ((_p - 2640) / 65) * 5;
else if (_p > 2705)           _crouch = max(0, 5 - (_p - 2705) * 0.55);

var _rec = 0;
if (_p >= 2730) {
    var _t = _p - 2730;
    _rec = 7.5 * exp(-_t / 10) * cos(_t * 0.40);
}

with (o_p05legs) { other.pure_x = pure_x; }

pure_y = base_y + sin(global.bob_timer) * 1 + _crouch + _rec;

x = pure_x + global.p05_sx;
y = pure_y + global.p05_sy;

// =====================================================================
//  Yuz ifadeleri - s_p05sanshead kare rehberi
//   0  pembe gozler + sert catik kaslar   (ofkenin doruk noktasi)
//   1  tek goz kapali / alayci
//   2  pembe gozler, ciddi anlatim
//   3  pembe gozler, yumusak
//   4  pembe gozler, iri ve vurgulu
//   5  pembe gozler, kaslar cikik (kirgin)
//   6  pembe gozler, dar bakis
//   7  asimetrik pembe alev, sert bakis
//   8  gozler kapali, kederli
//   9  gozler kapali, catik / aci
//  10  gozler kapali, sakin
//  11  tek goz araliyor
//  12  goz cukurlari golgede
//  13  goz cukurlari bos ve siyah
//  14  goz cukurlari tamamen bosluk
//
//  Ark: sessiz keder -> anlatim -> Papyrus anisi -> soguk tehdit ->
//       gozlerin sonmesi -> son replikte pembe alevin patlamasi.
// =====================================================================
switch (_line)
{
    case  0: image_index = 10; break;   // "Everyone..."
    case  1: image_index = 11; break;   // "...crushed beneath your hands..."
    case  2: image_index =  2; break;   // "Heartless criminals, and innocent bystanders alike."
    case  3: image_index =  3; break;   // "They weren't just... obstacles."
    case  4: image_index =  4; break;   // "They were people."
    case  5: image_index =  9; break;   // "People like my brother..."
    case  6: image_index =  8; break;   // "I wanted this life."
    case  7: image_index =  5; break;   // "HE should've never been dragged into all this."
    case  8: image_index = 12; break;   // "So it goes without saying..."
    case  9: image_index = 13; break;   // "That you aren't the only one..."
    case 10: image_index =  7; break;   // "The name's Sans! I wear it like a badge!"
    case 11: image_index = 14; break;   // "Prepare yourself..."
    case 12: image_index =  0; break;   // "Because now, the REAL monster bares its teeth!"
}
