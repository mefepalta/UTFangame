val_++;

if (image_xscale < 1)
{
	image_xscale = image_xscale + 0.05;
}
if (image_yscale < 1)
{
	image_yscale = image_yscale + 0.05;
}
if (image_index > 97)
{
	sprite_index = s_gameover_heart_2;
}
if (val_ == 10)
{
	audio_play_sound(snd_hurt,2,0);
}
if (val_ == 30)
{
	audio_play_sound(snd_exit,2,0);
}
if (val_ == 70)
{
	audio_play_sound(snd_break_0,2,0);
}
if (val_ == 240)
{
	audio_play_sound(snd_break_1,2,0);
}
if (val_ == 270)
{
	audio_play_sound(snd_noise,2,0);
}
if (val_ == 275)
{
	audio_play_sound(snd_noise,2,0);
}
if (val_ == 280)
{
	audio_play_sound(snd_noise,2,0);
}
if (val_ == 285)
{
	audio_play_sound(snd_noise,2,0);
}
if (val_ == 290)
{
	audio_play_sound(snd_noise,2,0);
}
if (val_ == 295)
{
	audio_play_sound(snd_noise,2,0);
}
if (val_ == 300)
{
	audio_play_sound(snd_noise,2,0);
}
if (val_ == 305)
{
	audio_play_sound(snd_noise,2,0);
}
if (val_ == 310)
{
	audio_play_sound(snd_noise,2,0);
}
if (val_ == 315)
{
	audio_play_sound(snd_noise,2,0);
}
if (val_ == 320)
{
	audio_play_sound(snd_noise,2,0);
}
if (val_ == 325)
{
	audio_play_sound(snd_noise,2,0);
}
if (val_ == 330)
{
	audio_play_sound(snd_noise,2,0);
}
if (val_ == 335)
{
	audio_play_sound(snd_noise,2,0);
}
if (val_ == 340)
{
	audio_play_sound(snd_noise,2,0);
}
if (val_ == 345)
{
	audio_play_sound(snd_noise,2,0);
}
if (val_ == 350)
{
	audio_play_sound(snd_noise,2,0);
}
if (val_ == 350)
{
	audio_play_sound(snd_gameover,1,999);
}