storypanelval++;

if (image_alpha < target_alpha) {
    image_alpha += fade_speed;
    if (image_alpha > target_alpha) image_alpha = target_alpha;
} else if (image_alpha > target_alpha) {
    image_alpha -= fade_speed;
    if (image_alpha < target_alpha) image_alpha = target_alpha;
}

if (storypanelval < 300)
{
	target_alpha = 0;
}
if (storypanelval > 300) and (storypanelval < 350) and (target_alpha < 1)
{
	target_alpha = target_alpha + 0.1;
}
if (storypanelval > 550) and (storypanelval < 600) and (target_alpha > 0)
{
	target_alpha = target_alpha - 0.1;
}
if (storypanelval == 610)
{
	sprite_index = storypanel_2;
}
if (storypanelval > 720) and (storypanelval < 770) and (target_alpha < 1)
{
	target_alpha = target_alpha + 0.1;
}
if (storypanelval > 930) and (storypanelval < 980) and (target_alpha > 0)
{
	target_alpha = target_alpha - 0.1;
}
if (storypanelval == 980)
{
	sprite_index = storypanel_6;
}
if (storypanelval > 980) and (storypanelval < 1030) and (target_alpha < 1)
{
	target_alpha = target_alpha + 0.1;
}
if (storypanelval > 1150) and (storypanelval < 1200) and (target_alpha > 0)
{
	target_alpha = target_alpha - 0.1;
}
if (storypanelval == 1200)
{
	sprite_index = storypanel_3;
}
if (storypanelval > 1200) and (storypanelval < 1250) and (target_alpha < 1)
{
	target_alpha = target_alpha + 0.1;
}
if (storypanelval > 1400) and (storypanelval < 1450) and (target_alpha > 0)
{
	target_alpha = target_alpha - 0.1;
}
if (storypanelval == 1450)
{
	sprite_index = storypanel_7;
}
if (storypanelval > 1450) and (storypanelval < 1500) and (target_alpha < 1)
{
	target_alpha = target_alpha + 0.1;
}
if (storypanelval > 1700) and (storypanelval < 1750) and (target_alpha > 0)
{
	target_alpha = target_alpha - 0.1;
}
if (storypanelval == 1750)
{
	sprite_index = storypanel_5;
}
if (storypanelval > 1750) and (storypanelval < 1800) and (target_alpha < 1)
{
	target_alpha = target_alpha + 0.1;
}
if (storypanelval > 1900) and (storypanelval < 1950) and (target_alpha > 0)
{
	target_alpha = target_alpha - 0.1;
}
if (storypanelval == 1950)
{
	sprite_index = storypanel_4;
}
if (storypanelval > 1980) and (storypanelval < 2030) and (target_alpha < 1)
{
	target_alpha = target_alpha + 0.1;
}
if (storypanelval > 2200) and (storypanelval < 2250) and (target_alpha > 0)
{
	target_alpha = target_alpha - 0.1;
}
if (storypanelval == 2250)
{
	sprite_index = storypanel_8;
}
if (storypanelval > 2700) and (storypanelval < 2750) and (target_alpha < 1)
{
	target_alpha = target_alpha + 0.1;
}
if (storypanelval > 2900) and (storypanelval < 2950) and (target_alpha > 0)
{
	target_alpha = target_alpha - 0.1;
}
if (storypanelval == 2950)
{
	sprite_index = storypanel_9;
}
if (storypanelval > 2950) and (storypanelval < 3000) and (target_alpha < 1)
{
	target_alpha = target_alpha + 0.1;
}
if (storypanelval > 3150) and (storypanelval < 3200) and (target_alpha > 0)
{
	target_alpha = target_alpha - 0.1;
}
if (storypanelval == 3200)
{
	sprite_index = storypanel_10;
}
if (storypanelval > 3200) and (storypanelval < 3250) and (target_alpha < 1)
{
	target_alpha = target_alpha + 0.1;
}
if (storypanelval == 3300)
{
	sprite_index = storypanel_17;
	Camera_Shake(2,2,1,1,5,5,0.3,0.3);
	audio_play_sound(snd_eye,1,0);
}
if (storypanelval == 3320)
{
	sprite_index = storypanel_11;
}
if (storypanelval > 3400) and (storypanelval < 3450) and (target_alpha > 0)
{
	target_alpha = target_alpha - 0.1;
}
if (storypanelval == 3450)
{
	sprite_index = storypanel_12;
}
if (storypanelval > 3450) and (storypanelval < 3500) and (target_alpha < 1)
{
	target_alpha = target_alpha + 0.1;
}
if (storypanelval > 3600) and (storypanelval < 3650) and (target_alpha > 0)
{
	target_alpha = target_alpha - 0.1;
}
if (storypanelval == 3650)
{
	sprite_index = storypanel_13;
}
if (storypanelval > 3650) and (storypanelval < 3700) and (target_alpha < 1)
{
	target_alpha = target_alpha + 0.1;
}
if (storypanelval > 4100) and (storypanelval < 4150) and (target_alpha > 0)
{
	target_alpha = target_alpha - 0.1;
}
if (storypanelval == 4150)
{
	sprite_index = storypanel_14;
}
if (storypanelval > 4380) and (storypanelval < 4430) and (target_alpha < 1)
{
	target_alpha = target_alpha + 0.1;
}
if (storypanelval > 4600) and (storypanelval < 4650) and (target_alpha > 0)
{
	target_alpha = target_alpha - 0.1;
}
if (storypanelval == 4650)
{
	sprite_index = storypanel_15;
}
if (storypanelval > 4670) and (storypanelval < 4720) and (target_alpha < 1)
{
	target_alpha = target_alpha + 0.1;
}
if (storypanelval > 5450) and (storypanelval < 5500) and (target_alpha > 0)
{
	target_alpha = target_alpha - 0.1;
}
if (storypanelval == 5500)
{
	sprite_index = storypanel_16;
}
if (storypanelval > 5750) and (storypanelval < 5800) and (target_alpha < 1)
{
	target_alpha = target_alpha + 0.1;
}
/*if (storypanelval == 3475)
{
	Camera_Shake(2,2,1,1,5,5,0.3,0.3);
}
if (storypanelval == 3770)
{
	Camera_Shake(2,2,1,1,5,5,0.3,0.3);
}
if (storypanelval == 3830)
{
	Camera_Shake(2,2,1,1,5,5,0.3,0.3);
}
if (storypanelval == 3880)
{
	Camera_Shake(2,2,1,1,5,5,0.3,0.3);
}
if (storypanelval == 3950)
{
	Camera_Shake(2,2,1,1,5,5,0.3,0.3);
}
if (storypanelval == 4010)
{
	Camera_Shake(2,2,1,1,5,5,0.3,0.3);
}
if (storypanelval == 4070)
{
	Camera_Shake(2,2,1,1,5,5,0.3,0.3);
}
if (storypanelval == 4100)
{
	Camera_Shake(2,2,1,1,5,5,0.3,0.3);
}
if (storypanelval == 4190)
{
	Camera_Shake(2,2,1,1,5,5,0.3,0.3);
}