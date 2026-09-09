
gml_pragma("forceinline");

function assert_bktglitch_activated(_uniform) {
	if (shader_current() != shdBktGlitch) {
		show_debug_message("ERROR: attempting to set " + _uniform + " while the shader is not active!");
	}
}

function BktGlitch_init() {
	bktglitch_init();
}

function BktGlitch_activate(_width, _height) {
	bktglitch_activate(_width, _height);
}

function BktGlitch_config_preset(_preset) {
	bktglitch_config_preset(_preset);
}

function BktGlitch_config(_lineShift, _lineSpeed, _lineResolution, _lineDrift, _lineVerticalShift, _jumbleness, _jumbleSpeed, _jumbleResolution, _jumbleShift, _noiseLevel, _channelShift, _channelDispersion, _shakiness, _intensity, _rngSeed) {
	bktglitch_config(_lineShift, _lineSpeed, _lineResolution, _lineDrift, _lineVerticalShift, _jumbleness, _jumbleSpeed, _jumbleResolution, _jumbleShift, _noiseLevel, _channelShift, _channelDispersion, _shakiness, _intensity, _rngSeed);
}

function BktGlitch_config_zero() {
	bktglitch_config_zero();
}

function BktGlitch_set_resolution_of_gui() {
	bktglitch_set_resolution_of_gui();
}

function BktGlitch_set_resolution_of_application_surface() {
	bktglitch_set_resolution_of_application_surface();
}

function BktGlitch_set_time(_time) {
	bktglitch_set_time(_time);
}

function BktGlitch_set_intensity(_intensity) {
	bktglitch_set_intensity(_intensity);
}

function BktGlitch_set_line_shift(_intensity) {
	bktglitch_set_line_shift(_intensity);
}

function BktGlitch_set_line_speed(_intensity) {
	bktglitch_set_line_speed(_intensity);
}

function BktGlitch_set_line_resolution(_granularity) {
	bktglitch_set_line_resolution(_granularity);
}

function BktGlitch_set_line_vertical_shift(_intensity) {
	bktglitch_set_line_vertical_shift(_intensity);
}

function BktGlitch_set_noise_level(_intensity) {
	bktglitch_set_noise_level(_intensity);
}

function BktGlitch_set_jumbleness(_intensity) {
	bktglitch_set_jumbleness(_intensity);
}

function BktGlitch_set_jumble_speed(_speed) {
	bktglitch_set_jumble_speed(_speed);
}

function BktGlitch_set_jumble_resolution(_granularity) {
	bktglitch_set_jumble_resolution(_granularity);
}

function BktGlitch_set_jumble_shift(_intensity) {
	bktglitch_set_jumble_shift(_intensity);
}

function BktGlitch_set_channel_shift(_intensity) {
	bktglitch_set_channel_shift(_intensity);
}

function BktGlitch_set_rng_seed(_value) {
	bktglitch_set_rng_seed(_value);
}

function BktGlitch_set_shakiness(_intensity) {
	bktglitch_set_shakiness(_intensity);
}

function BktGlitch_set_channel_dispersion(_intensity) {
	bktglitch_set_channel_dispersion(_intensity);
}

function BktGlitch_set_line_drift(_intensity) {
	bktglitch_set_line_drift(_intensity);
}

function BktGlitch_set_resolution(_width, _height) {
	bktglitch_set_resolution(_width, _height);
}

#macro BktGlitch_deactivate shader_reset