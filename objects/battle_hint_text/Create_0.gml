// Gri, yanip sonen ipucu yazisi ("Hold [Z] to make a POWER SHOT!" vb).
// mode 0: kutunun hemen ustunde (disinda), satirlar kutu genisligine gore
//         kirilir ve font kutuya sigacak sekilde olceklenir.
// mode 1: ruhun ustunde (battle_soul), sabit genislik.
// mode 2: sabit bir hedefin (hx,hy) sag ustunde + hedefe bakan ok
//         (carousel "Don't jump!" uyarisi). hx/hy her adim disaridan guncellenir
//         ya da takip != noone ise o nesneden okunur (ayna "Don't shoot at these!").
// isaret: metnin solunda unlem isaretli ucgen uyari levhasi.
depth=DEPTH_BATTLE.BULLET_OUTSIDE_HIGH-5;

text="";
mode=0;
life=240;
t=0;
blink=14;
col=make_color_rgb(150,150,150);
fnt=font_determination_sans;
pad=8;
max_w=140;
ok=false;
ok_dx=0;
ok_dy=0;
hx=0;
hy=0;
takip=noone;
isaret=false;
gizli=false;
alpha=1;

lines=[];
sc_taban=0.5;
sc=0.5;
line_h=0;

// Metni max genislige gore kelime kelime sarar. En uzun kelime sigmiyorsa
// olcek kuculur.
Hazirla = function(_w)
{
	draw_set_font(fnt);
	var _kel = string_split(text," ");
	var _en = 0;
	for (var _i = 0; _i < array_length(_kel); _i++)
	{
		_en = max(_en,string_width(_kel[_i]));
	}
	sc = sc_taban;
	if (_en*sc > _w) { sc = _w/_en; }

	lines = [];
	var _sat = "";
	for (var _i = 0; _i < array_length(_kel); _i++)
	{
		var _dene = (_sat == "") ? _kel[_i] : _sat+" "+_kel[_i];
		if (string_width(_dene)*sc <= _w) or (_sat == "")
		{
			_sat = _dene;
		}
		else
		{
			array_push(lines,_sat);
			_sat = _kel[_i];
		}
	}
	if (_sat != "") { array_push(lines,_sat); }
	line_h = string_height("Ay")*sc;
};
