depth=DEPTH_BATTLE.FADER;

color=c_black;
alpha=0;

bloom     = 0;
bloom_col = c_white;

if (variable_global_exists("battle_fadein")) and (global.battle_fadein)
{
	global.battle_fadein = 0;
	alpha     = 1;
	bloom     = 0.55;
	bloom_col = variable_global_exists("battle_fadein_col") ? global.battle_fadein_col : c_white;
}
