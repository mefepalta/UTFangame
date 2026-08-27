_timer=0;
_start=false;
cang=false;
canga=0;

///Tabandan ve tavandan ayni anda birer kemik. Ortada kalan bosluk
///kutunun ici (130 px) eksi iki kemik boyu.
///@arg x	 dogum noktasi
///@arg alt	 taban kemiginin boyu
///@arg ust	 tavan kemiginin boyu
///@arg hiz	 yatay hiz (sola gitmesi icin negatif)
F25Cift = function(_x,_alt,_ust,_hiz)
{
	var _t = (battle_board.y-battle_board.up)+2;
	var _b = (battle_board.y+battle_board.down)-2;
	RegularBone(_x,_b,_alt,_hiz,0,0,0,0,1,0,0,0,0,true);
	RegularBone(_x,_t,_ust,_hiz,0,180,0,0,1,0,0,0,0,true);
};
