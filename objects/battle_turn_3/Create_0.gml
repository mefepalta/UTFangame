_timer=0;
_start=false;
cang=false;
canga=0;

bluddy = -1;
smaaashready = 0

#macro T3_SLAM_HIZ    0.60
#macro T3_DALGA_SLOT    11
#macro T3_DALGA_ADIM     6
#macro T3_DALGA_BOY     88
#macro T3_DALGA_SONUM 0.20
#macro T3_DALGA_CIK      6
#macro T3_DALGA_KAL     24
#macro T3_DALGA_IN       8

#macro T3_ENKAZ_ARA      3
#macro T3_ENKAZ_GECIKME 22
#macro T3_ENKAZ_BOY     26
#macro T3_ENKAZ_HIZ    3.2

dalga_yon   = [ 1,-1, 1,-1];
dalga_enkaz = [ 0, 0, 2, 1];
dalga_no = 0;

dalga_on = false;
dalga_t = 0;
dalga_i = 0;
dalga_e = 0;
dalga_kemik = [];

DalgaX = function(_slot)
{
	var _w = battle_board.left+battle_board.right;
	return (battle_board.x-battle_board.left)+(_w/T3_DALGA_SLOT)*(_slot+0.5);
};

DalgaDiken = function(_bx,_boy)
{
	var _b = RegularBone(_bx,battle_board.y+battle_board.down-2,0,0,0,0,0,0,1,0,0,1,0,false);
	Anim_Create(_b,"_length",ANIM_TWEEN.QUAD,ANIM_EASE.OUT,0,_boy,T3_DALGA_CIK);
	Anim_Create(_b,"_length",ANIM_TWEEN.QUAD,ANIM_EASE.IN,_boy,-_boy,
		T3_DALGA_IN,T3_DALGA_CIK+T3_DALGA_KAL);
	array_push(dalga_kemik,_b);
	return _b;
};

DalgaEnkaz = function(_bx)
{
	return RegularBone(_bx,battle_board.y-battle_board.up-20,T3_ENKAZ_BOY,
		0,T3_ENKAZ_HIZ,0,0,0,1,0,1,0,0,true);
};

DalgaTemizle = function()
{
	for (var _i = 0; _i < array_length(dalga_kemik); _i++)
	{
		if (instance_exists(dalga_kemik[_i])) { instance_destroy(dalga_kemik[_i]); }
	}
	dalga_kemik = [];
};

DalgaBasla = function()
{
	DalgaTemizle();
	dalga_on = true;
	dalga_t = 0;
	dalga_i = 0;
	dalga_e = 0;
	dalga_no += 1;
};

DalgaAdim = function()
{
	if (!dalga_on) { return; }
	dalga_t += 1;

	var _n = (dalga_no-1) mod array_length(dalga_yon);
	var _yon = dalga_yon[_n];
	var _kay = dalga_enkaz[_n];

	while (dalga_i < T3_DALGA_SLOT) and (dalga_t >= dalga_i*T3_DALGA_ADIM)
	{
		var _slot = (_yon > 0) ? dalga_i : (T3_DALGA_SLOT-1-dalga_i);
		var _boy = T3_DALGA_BOY*(1-T3_DALGA_SONUM*(dalga_i/(T3_DALGA_SLOT-1)));
		DalgaDiken(DalgaX(_slot),_boy);
		dalga_i += 1;
	}

	while (dalga_e < T3_DALGA_SLOT) and (dalga_t >= dalga_e*T3_DALGA_ADIM+T3_ENKAZ_GECIKME)
	{
		if ((dalga_e mod T3_ENKAZ_ARA) == _kay)
		{
			var _es = (_yon > 0) ? dalga_e : (T3_DALGA_SLOT-1-dalga_e);
			DalgaEnkaz(DalgaX(_es));
		}
		dalga_e += 1;
	}

	if (dalga_i >= T3_DALGA_SLOT) and (dalga_e >= T3_DALGA_SLOT)
	and (dalga_t > (T3_DALGA_SLOT-1)*T3_DALGA_ADIM+T3_ENKAZ_GECIKME+60)
	{
		dalga_on = false;
	}
};
