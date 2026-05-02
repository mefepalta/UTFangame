///@desc Use
Player_Heal(60);
audio_play_sound(snd_item_heal,0,false);
Dialog_Add("* You eat Face Steak!{sleep 20}&* You have recovered 60 HP!")
instance_destroy();
Item_Remove(1);