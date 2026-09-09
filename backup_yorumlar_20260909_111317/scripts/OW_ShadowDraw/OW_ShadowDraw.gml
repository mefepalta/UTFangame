/// @func OW_ShadowDraw(shadowColor, rimColor, rimStrength)
/// @desc Draws the calling instance's current sprite as a lit silhouette:
///       a flat shadow tone plus a cool rim light along the silhouette edges.
///       Colour information in the sprite is ignored, so it works with the
///       existing flat-black overworld sprites.
function OW_ShadowDraw(_shadowColor, _rimColor, _rimStrength)
{
	__OW_ShadowDrawInternal(_shadowColor, _rimColor, _rimStrength, 0.0, 1.0);
}

/// @func OW_ShadowDrawTinted(tintColor, rimColor, rimStrength)
/// @desc Same lighting treatment as OW_ShadowDraw, but keeps the sprite's own
///       colours (multiplied by tintColor) instead of a flat silhouette.
function OW_ShadowDrawTinted(_tintColor, _rimColor, _rimStrength)
{
	__OW_ShadowDrawInternal(_tintColor, _rimColor, _rimStrength, 1.0, 1.0);
}

/// @func OW_ShadowDrawLit(shadowColor, rimColor, lightAmount)
/// @desc Lit-silhouette shading (see OW_ShadowDraw) but driven by a real
///       positional light: lightAmount (0..1, see OW_WindowLight) fades the
///       character between near-black (far from any window) and the given
///       shadowColor silhouette tone (right under a window). No white-wash -
///       just black <-> tone.
function OW_ShadowDrawLit(_shadowColor, _rimColor, _lightAmount)
{
	__OW_ShadowDrawInternal(_shadowColor, _rimColor, 1.0, 0.0, _lightAmount);
}

/// @func OW_ShadowDrawLitTinted(tintColor, rimColor, rimStrength, lightAmount)
/// @desc Same as OW_ShadowDrawLit, but keeps the sprite's own colours instead
///       of a flat silhouette: near-black far from a window, the sprite's
///       true colours (times tintColor) right under one. No white-wash.
function OW_ShadowDrawLitTinted(_tintColor, _rimColor, _rimStrength, _lightAmount)
{
	__OW_ShadowDrawInternal(_tintColor, _rimColor, _rimStrength, 1.0, _lightAmount);
}

function __OW_ShadowDrawInternal(_baseColor, _rimColor, _rimStrength, _colorMix, _lightAmount)
{
	static _shader           = shd_ow_shadow;
	static _u_texel          = shader_get_uniform(_shader, "u_texel");
	static _u_shadowColor    = shader_get_uniform(_shader, "u_shadowColor");
	static _u_rimColor       = shader_get_uniform(_shader, "u_rimColor");
	static _u_rimStrength    = shader_get_uniform(_shader, "u_rimStrength");
	static _u_colorMix       = shader_get_uniform(_shader, "u_colorMix");
	static _u_lightAmount    = shader_get_uniform(_shader, "u_lightAmount");

	var _tex = sprite_get_texture(sprite_index, image_index);

	shader_set(_shader);
	shader_set_uniform_f(_u_texel, texture_get_texel_width(_tex), texture_get_texel_height(_tex));
	shader_set_uniform_f(_u_shadowColor, color_get_red(_baseColor) / 255, color_get_green(_baseColor) / 255, color_get_blue(_baseColor) / 255);
	shader_set_uniform_f(_u_rimColor, color_get_red(_rimColor) / 255, color_get_green(_rimColor) / 255, color_get_blue(_rimColor) / 255);
	shader_set_uniform_f(_u_rimStrength, _rimStrength);
	shader_set_uniform_f(_u_colorMix, _colorMix);
	shader_set_uniform_f(_u_lightAmount, _lightAmount);
	draw_self();
	shader_reset();
}
