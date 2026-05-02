if (yesorno == true)
{
	target_alpha = target_alpha + 0.1;
	nextroomtimer++;
}
with (o_gameover_heart)
{
	if (val_ == 350)
	{
		other.readyornot = true;
	}
}									   
if (Input_IsPressed(INPUT.CONFIRM)) and (readyornot = true)
{
	yesorno = true;
}
if (nextroomtimer == 80)
{
	audio_stop_all();
	room_goto(room_area_0);
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