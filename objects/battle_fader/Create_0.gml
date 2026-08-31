depth=DEPTH_BATTLE.FADER;

color=c_black;
alpha=0;

// ---------------------------------------------------------------------
//  Ara fazdan gelis (room_p05 -> room_battle, room_p15 -> room_battle_1)
//
//  Ara fazlar siyaha kararak bitiyordu ama savas odasi aninda, tam
//  parlaklikta aciliyordu. Artik ara faz bir bayrak birakiyor, oda da
//  siyahin icinden aciliyor: uzerine, biten sahnenin renginde sonup
//  giden bir parlama biniyor - Faz 1'e mor, Faz 2'ye turuncu.
//  Bayragi burada tuketiyoruz ki sonraki savaslar etkilenmesin.
// ---------------------------------------------------------------------
bloom     = 0;
bloom_col = c_white;

if (variable_global_exists("battle_fadein")) and (global.battle_fadein)
{
	global.battle_fadein = 0;
	alpha     = 1;
	bloom     = 0.55;
	bloom_col = variable_global_exists("battle_fadein_col") ? global.battle_fadein_col : c_white;
}
