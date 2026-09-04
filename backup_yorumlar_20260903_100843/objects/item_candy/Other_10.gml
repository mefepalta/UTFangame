///@desc Use
Player_Heal(10);
audio_play_sound(snd_item_heal,0,false);
Dialog_Add("* You eat Candy!{sleep 20}&* You have recovered 10 HP!")
instance_destroy();
Item_Remove(7);