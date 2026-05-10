///@desc Use
Player_Heal(90);
audio_play_sound(snd_item_heal,0,false);
Dialog_Add("* You eat the Ramen!{sleep 20}&* You have recovered 90 HP!")
Dialog_Start();
global.checkornot = true;
instance_destroy();
Item_Remove(_item_slot);

if (global.no_heal == true)
{
	instance_destroy();
	Item_Remove(_item_slot);
}