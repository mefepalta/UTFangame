function flash_off() {
	fader.color=0;
	fader.alpha = 0;
	audio_play_sound(snd_noise, 1, false);
	audio_resume_all();
}
