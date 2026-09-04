///@desc Use
Player_Heal(40);
audio_play_sound(snd_item_heal,0,false);
Dialog_Add("* You eat Legendary Hero!{sleep 20}&* You have recovered 40 HP!")
instance_destroy();
Item_Remove(4);