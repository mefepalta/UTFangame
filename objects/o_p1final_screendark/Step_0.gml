if (yesorno == true)
{
	target_alpha = target_alpha + 0.1;
	nextroomtimer++;
}
if (nextroomtimer == 80)
{
	audio_stop_all();
	room_goto(room_area_1);
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