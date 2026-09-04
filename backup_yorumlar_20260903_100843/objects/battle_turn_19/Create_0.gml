_timer=0;
_start=false;
cang=false;
canga=0;

T19Sol = function() { return (battle_board.x-battle_board.left)-5; };
T19Sag = function() { return (battle_board.x+battle_board.right)+5; };
T19Dip = function() { return (battle_board.y+battle_board.down)-2; };
T19Tep = function() { return (battle_board.y-battle_board.up)+2; };

DusenKemik = function(_ox)
{
	return RegularBone(battle_board.x+_ox,T19Tep()-20,30,0,2,0,0,0,1,0,1,0,0,true);
};

OrtaBlaster = function()
{
	return RegularBlaster(battle_board.x,-60,battle_board.x,T19Tep()-70,270,270,60,1,3,3,50);
};

YanDuvar = function(_sag)
{
	var _yuk = battle_board.up+battle_board.down+20;
	if (_sag)
	{
		RegularBoneWall(DIR.RIGHT,_yuk,10,65,T19Sag(),T19Tep(),40,60,0,false);
	}
	else
	{
		RegularBoneWall(DIR.LEFT,_yuk,10,65,T19Sol(),T19Tep(),40,60,0,false);
	}
};

KucukKemik = function()
{
	return RegularBone(T19Sol()-10,T19Dip(),26,4,0,0,0,0,1,0,0,0,0,true);
};

#macro T19_SUTUN_SOL   -157
#macro T19_SUTUN_ORTA    -6
#macro T19_SUTUN_SAG    145

Platform = function(_ox)
{
	var _p = instance_create_depth(battle_board.x+_ox,T19Dip()-37,DEPTH_BATTLE.BULLET,battle_platform1);
	_p.width = 72;
	_p.sticky = 0;
	_p.move_x = 0;
	_p.move_y = 0;
	_p.bounce_x = false;
	_p.auto_destroy = false;
	return _p;
};

SutunBlaster = function(_ox)
{
	return RegularBlaster(battle_board.x+_ox,-60,battle_board.x+_ox,T19Tep()-70,270,270,25,1,3,3,50);
};

BlasterCifti = function()
{
	var _s = [T19_SUTUN_SOL,T19_SUTUN_ORTA,T19_SUTUN_SAG];
	var _bos = irandom(2);
	for (var _i = 0; _i < 3; _i++)
	{
		if (_i != _bos) { SutunBlaster(_s[_i]); }
	}
	return _bos;
};

#macro T19_ARA_SOL   -82
#macro T19_ARA_SAG    70

AraKemik = function(_sag)
{
	return DusenKemik(_sag ? T19_ARA_SAG : T19_ARA_SOL);
};
