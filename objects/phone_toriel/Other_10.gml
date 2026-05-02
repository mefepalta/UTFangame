///@desc Call
audio_play_sound(snd_phone_call,0,false);
Dialog_Add("* Dialing...{pause}{clear}* ...{pause}{clear}* Nohead picked up.");
Dialog_Start();

event_inherited();