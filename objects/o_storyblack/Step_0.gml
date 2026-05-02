if (yesorno == true)
{
	target_alpha = target_alpha + 0.1;
	nextroomtimer++;
    audio_sound_gain(snd_balladofhteunderground, 0, 500);
}
if (yesorno == false) and (target_alpha > 0)
{
	target_alpha = target_alpha - 0.1;
}
if (Input_IsPressed(INPUT.CONFIRM))
{
	yesorno = true;
}
with (o_story)
{
	if (storypanelval > 6000)
	{
		other.yesorno = true;
	}
}
if (nextroomtimer == 80)
{
	audio_stop_all();
	room_goto(room_logo);
}
if (image_alpha < target_alpha) {
    image_alpha += fade_speed;
    if (image_alpha > target_alpha) {
        image_alpha = target_alpha;
    }
}
else if (image_alpha > target_alpha) {
    image_alpha -= fade_speed;
    if (image_alpha < target_alpha) {
        image_alpha = target_alpha;
    }
}