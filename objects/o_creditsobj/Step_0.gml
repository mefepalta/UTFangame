if (yesorno == true)
{
	target_alpha = target_alpha + 0.1;
	nextroomtimer++;
}
if (Input_IsPressed(INPUT.CONFIRM))
{
	yesorno = true;
}
if (nextroomtimer == 70)
{
	audio_stop_all();
}
if (nextroomtimer == 80)
{
	room_goto(room_menu);
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