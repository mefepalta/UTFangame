///@desc Use
Player_Heal(99);
audio_play_sound(snd_item_heal,0,false);
Dialog_Add("* You drank the Sour Tea.{sleep 20}&* Your HP has maxed out!")
Dialog_Start();
global.checkornot = true;
instance_destroy();
Item_Remove(_item_slot);

if (global.no_heal == true)
{
	instance_destroy();
	Item_Remove(_item_slot);
}