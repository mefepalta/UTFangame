// Activating the shader
bktglitch_activate();

// Quickly setting all parameters at once using a preset
bktglitch_config_preset(BktGlitchPreset.B);

// Additional tweaking
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
//bktglitch_set_channel_dispersion(.05);

// Setting the overall intensity of the effect, adding a bit when the ball bounces.
bktglitch_set_intensity(global.intensity);

// Drawing the application surface
depth=DEPTH_BATTLE.BULLET_OUTSIDE_HIGH*10-1
{
	draw_surface(application_surface, 0, 0);
}

// Done with the shader (this is really just shader_reset)!
bktglitch_deactivate();