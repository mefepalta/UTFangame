///@desc Turn Preparation Start
Battle_SetBoardSizeCubic(65,65,150,150);
sansy=instance_create_depth(0,0,0,battle_dialog_enemy);
with (battle_enemy_engage)
{
	_head_alpha = 1;
	_spear_alpha = 1;
	_armleft_alpha = 1;
	_armright_alpha = 1;
	_legs_alpha = 1;
}
global.checkornot = false;
sansy.text="{font 3}{voice 3}{squish 1.2}{head 13}But twiddling my&thumbs while my&captain sticks her&neck out for us?{pause}{clear}{head 4}Yeah, there's no way&I could sit still.{pause}{clear}{head 8}''That's it,'' I&thought.{pause}{clear}{head 9}I'm going.{pause}{clear}{head 0}Whether she wants me&to or not...{pause}{clear}{head 13}I'll stand by my&captain's side if it's&the last thing I do!";
