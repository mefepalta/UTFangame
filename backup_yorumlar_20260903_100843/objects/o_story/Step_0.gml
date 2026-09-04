storypanelval++;
var _t = storypanelval;

//------------------------------------------------------------- panel sirasi
// Tabloda bir sonraki panelin zamani geldiyse ona geciliyor.
if (pn_i+1 < array_length(paneller)) and (_t >= paneller[pn_i+1].t)
{
	pn_i += 1;
}

var _p = paneller[pn_i];

if (_t == _p.t)
{
	// Panel tam bu karede degisiyor -- ekran o sirada zaten kararmis oluyor.
	if (_p.spr != -1) { sprite_index = _p.spr; }
	// Papyrus'un olum karesi: kararma yok, bir anda basiyor.
	if (_p.ani) { image_alpha = 1; }
}

// Panel ici olaylar: ani kare degisimi, ses ve sarsinti.
for (var _o = 0; _o < array_length(_p.olay); _o++)
{
	var _e = _p.olay[_o];
	if (_t == _p.t+_e.d)
	{
		if (_e.spr != -1) { sprite_index = _e.spr; }
		if (_e.ses != -1) { audio_play_sound(_e.ses,1,0); }
		if (_e.sars > 0) { Camera_Shake(_e.sars,_e.sars,2,2,5,5,0.3,0.3); }
	}
}

//------------------------------------------------------------------ gecis
// Panel gorunur araligindaysa acik, degilse siyah. sure = 0 olan satirlar
// panelsiz bolumler: metin duz siyah uzerinde akiyor.
target_alpha = ((_t >= _p.t) and (_t < _p.t+_p.sure)) ? 1 : 0;

if (image_alpha < target_alpha) {
	image_alpha += fade_speed;
	if (image_alpha > target_alpha) image_alpha = target_alpha;
} else if (image_alpha > target_alpha) {
	image_alpha -= fade_speed;
	if (image_alpha < target_alpha) image_alpha = target_alpha;
}
