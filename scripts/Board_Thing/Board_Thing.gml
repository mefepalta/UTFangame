function Battle_BoardMaskSet(useTexture = false, maskEnable = 1) {
	var mask_shader = (!useTexture) ? shd_clip_mask_primitive : shd_clip_mask_sprite;
	shader_set(mask_shader);
	var u_mask = shader_get_sampler_index(mask_shader, "u_mask"),
		u_maskEnable = shader_get_uniform(mask_shader, "u_maskEnable"),
		u_rect = shader_get_uniform(mask_shader, "u_rect");
	
	shader_set_uniform_f(u_rect, 0, 0, 640, 480);
	shader_set_uniform_f(u_maskEnable, maskEnable);
	texture_set_stage(u_mask, surface_get_texture(battle_board.surface_mask));
}

function Battle_BoardMaskReset() {
	shader_reset();
}