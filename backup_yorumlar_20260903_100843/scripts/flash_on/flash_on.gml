function flash_on() {
	fader.color = 0;
	fader.alpha = 1;
	audio_pause_all();
	audio_play_sound(snd_noise, 1, false);
}
