Player_Heal(999);
audio_play_sound(snd_item_heal,0,false);
if(text!=""){
    event_inherited();
}
instance_create_depth(0,0,0,ui_save);