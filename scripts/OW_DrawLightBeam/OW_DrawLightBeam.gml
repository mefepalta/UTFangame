/// @func OW_DrawLightBeam(centerX, topY, bottomY, maxHalfWidth, color, intensity)
/// @desc Draws one soft, cone-shaped light shaft (pale window light falling onto
///       the floor) - a smooth shader-based gradient, not a stack of rectangles.
function OW_DrawLightBeam(_centerX, _topY, _bottomY, _maxHalfWidth, _color, _intensity)
{
	static _shader     = shd_ow_lightbeam;
	static _u_color     = shader_get_uniform(_shader, "u_color");
	static _u_top       = shader_get_uniform(_shader, "u_topWidthFrac");
	static _u_bottom    = shader_get_uniform(_shader, "u_bottomWidthFrac");
	static _u_soft      = shader_get_uniform(_shader, "u_softness");
	static _u_intensity = shader_get_uniform(_shader, "u_intensity");

	var _h = _bottomY - _topY;
	var _w = _maxHalfWidth * 2;

	shader_set(_shader);
	shader_set_uniform_f(_u_color, color_get_red(_color) / 255, color_get_green(_color) / 255, color_get_blue(_color) / 255);
	shader_set_uniform_f(_u_top, 0.12);
	shader_set_uniform_f(_u_bottom, 0.5);
	shader_set_uniform_f(_u_soft, 0.22);
	shader_set_uniform_f(_u_intensity, _intensity);
	draw_sprite_ext(spr_pixel, 0, _centerX - _maxHalfWidth, _topY, _w, _h, 0, c_white, 1);
	shader_reset();
}
