///@desc Use
Player_Heal(99);
audio_play_sound(snd_item_heal,0,false);
Dialog_Add("* You eat Pie!{sleep 20}&* Your HP has maxed out!")
instance_destroy();
Item_Remove(0);