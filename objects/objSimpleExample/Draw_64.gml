bktglitch_activate();

bktglitch_config_preset(BktGlitchPreset.B);

bktglitch_set_jumbleness(0);
bktglitch_set_jumble_speed(0);
bktglitch_set_jumble_resolution(0);
bktglitch_set_jumble_shift(0);
bktglitch_set_channel_shift(0)
bktglitch_set_line_speed(0)
bktglitch_set_noise_level(0)
bktglitch_set_line_drift(0)
bktglitch_set_line_shift(global.line_drift)
bktglitch_set_line_resolution(1)

bktglitch_set_intensity(global.intensity);

depth=DEPTH_BATTLE.BULLET_OUTSIDE_HIGH*10-1
{
	draw_surface(application_surface, 0, 0);
}

bktglitch_deactivate();