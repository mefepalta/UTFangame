///@desc Use
Player_Heal(45);
audio_play_sound(snd_item_heal,0,false);
Dialog_Add("* You eat Snowman Piece!{sleep 20}&* You have recovered 45 HP!")
instance_destroy();
Item_Remove(6);