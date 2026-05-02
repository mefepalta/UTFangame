//draw_sprite_ext(spr_waterfall_bg,0,0,0,2,2,0,c_white,1)
if (room == room_battle)
{
	surface_resize(_surf,640,y);

	surface_set_target(_surf);
	draw_sprite_ext(_spear_sprite, _spear_image,x + _body_init_x*2 + _body_x*2 + _head_init_x*2 + _head_x*2 + 24,y + _body_init_y*2 + _body_y*2 + _head_init_y*2 + _head_y*2 + 25,2, 2, head_angle, c_white, _spear_alpha);
	draw_sprite_pos(leg_sprite,leg_image,bbox_left+(_body_x),bbox_top,bbox_right+(_body_x),bbox_top,bbox_right,bbox_bottom,bbox_left,bbox_bottom,_legs_alpha);
	draw_sprite_pos(leg_sprite1,_legs_image1,bbox_left+(_body_x),bbox_top,bbox_right+(_body_x),bbox_top,bbox_right,bbox_bottom,bbox_left,bbox_bottom,_legs_alpha1);
	mask_index=leg_sprite;
	draw_sprite_ext(_wingthing1_sprite,_wingthing1_image,x+_body_init_x*2+_body_x*2+_head_init_x*2+_head_x*2 + 11,y+_body_init_y*2+_body_y*2+_head_init_y*2+_head_y*2 - 105,2,2,_head_angle,c_white,_head_alpha);
	draw_sprite_ext(_wingthing2_sprite,_wingthing2_image,x+_body_init_x*2+_body_x*2+_head_init_x*2+_head_x*2 - 11,y+_body_init_y*2+_body_y*2+_head_init_y*2+_head_y*2 + 8,2,2,_head_angle,c_white,_head_alpha);
	draw_sprite_ext(_armleft_sprite,_armleft_image,x+_body_init_x*2+_body_x*2+_head_init_x*2+_head_x*2 - 32,y+_body_init_y*2+_body_y*2+_head_init_y*2+_head_y*2 + 16,2,2,head_angle * -1,c_white,_armleft_alpha);
	draw_sprite_ext(_armright_sprite,_armright_image,x+_body_init_x*2+_body_x*2+_head_init_x*2+_head_x*2 + 38,y+_body_init_y*2+_body_y*2+_head_init_y*2+_head_y*2 + 15,2,2,head_angle,c_white,_armright_alpha);
	draw_sprite_ext(_armleft_sprite1,_armleft_image1,x+_body_init_x*2+_body_x*2+_head_init_x*2+_head_x*2 - 23,y+_body_init_y*2+_body_y*2+_head_init_y*2+_head_y*2 + 16,-2,2,head_angle * -1,c_white,_armleft_alpha1);
	draw_sprite_ext(_armright_sprite1,_armright_image1,x+_body_init_x*2+_body_x*2+_head_init_x*2+_head_x*2 + 27,y+_body_init_y*2+_body_y*2+_head_init_y*2+_head_y*2 + 15,2,2,head_angle,c_white,_armright_alpha1);
	draw_sprite_ext(_body_sprite,_body_image,x+_body_init_x*2+_body_x*2,y+_body_init_y*2+_body_y*2,2,2,_body_angle,c_white,_head_alpha);
	draw_sprite_ext(_head_sprite,_head_image,x+_body_init_x*2+_body_x*2+_head_init_x*2+_head_x*2,y+_body_init_y*2+_body_y*2+_head_init_y*2+_head_y*2,2,2,_head_angle,c_white,_head_alpha);

	surface_reset_target();

	var _sw = surface_get_width(_surf);
	var _sh = surface_get_height(_surf);

	draw_set_color(image_blend);
	gpu_set_blendmode_ext(bm_one,bm_inv_src_alpha);
	draw_primitive_begin_texture(pr_trianglestrip,surface_get_texture(_surf));
	draw_vertex_texture(_sw/2-_sw*squish*0.5+x-320,0+_sh/2-_sh/squish*0.5,0,0);
	draw_vertex_texture(_sw/2+_sw*squish*0.5+x-320,0+_sh/2-_sh/squish*0.5,1,0);
	draw_vertex_texture(_sw/2-_sw*squish*0.5+x-320,_sh,0,1);
	draw_vertex_texture(_sw/2+_sw*squish*0.5+x-320,_sh,1,1);
	draw_primitive_end();
	gpu_set_blendmode(bm_normal);
}
if (room == room_battle_1) //and (global.sansp2headsprite == false)
{
	surface_resize(_surf,640,y);

	surface_set_target(_surf);
	draw_sprite_ext(p2_cape_sprite,p2_cape_image,x+p2_body_init_x*2+p2_body_x*2+p2_head_init_x*2+p2_head_x*2 + 3,y+p2_body_init_y*2+p2_body_y*2+p2_head_init_y*2+p2_head_y*2 - 3,2,2,p2_cape_angle,c_white,p2_cape_alpha);
	draw_sprite_pos(p2leg_sprite,p2_legs_image,bbox_left+(p2_body_x),bbox_top,bbox_right+(p2_body_x),bbox_top,bbox_right,bbox_bottom,bbox_left,bbox_bottom,p2_legs_alpha);
	draw_sprite_pos(p2leg_sprite1,p2_legs_image1,bbox_left+(p2_body_x),bbox_top,bbox_right+(p2_body_x),bbox_top,bbox_right,bbox_bottom,bbox_left,bbox_bottom,p2_legs_alpha1);
	mask_index=p2leg_sprite;
	draw_sprite_ext(p2_armleft_sprite,p2_armleft_image,x+p2_body_init_x*2+p2_body_x*2+p2_head_init_x*2+p2_head_x*2 - 28,y+p2_body_init_y*2+p2_body_y*2+p2_head_init_y*2+p2_head_y*2 - 5,2,2,p2_head_angle_diddler * -0.25,c_white,p2_armleft_alpha);
	if (p2_armright_sprite == spr_p2_arm_right or p2_armright_sprite == spr_p2_arm_right_1)
	{
		draw_sprite_ext(p2_armright_sprite,p2_armleft_image,x+p2_body_init_x*2+p2_body_x*2+p2_head_init_x*2+p2_head_x*2 + 30,y+p2_body_init_y*2+p2_body_y*2+p2_head_init_y*2+p2_head_y*2 - 5,2,2,p2_head_angle_diddler / 4,c_white,p2_armright_alpha);
	}
	if (p2_armright_sprite == spr_p2_arm_right_slamup or p2_armright_sprite == spr_p2_arm_right_slamdown)
	{
		draw_sprite_ext(p2_armright_sprite,image_index / 6,x+p2_body_init_x*2+p2_body_x*2+p2_head_init_x*2+p2_head_x*2 + 30,y+p2_body_init_y*2+p2_body_y*2+p2_head_init_y*2+p2_head_y*2 - 5,2,2,p2_head_angle_diddler / 4,c_white,p2_armright_alpha);
	}
	if (p2_armright_sprite == spr_p2_arm_right_slam)
	{
		draw_sprite_ext(p2_armright_sprite,image_index / 4,x+p2_body_init_x*2+p2_body_x*2+p2_head_init_x*2+p2_head_x*2 + 30,y+p2_body_init_y*2+p2_body_y*2+p2_head_init_y*2+p2_head_y*2 - 5,2,2,p2_head_angle_diddler / 4,c_white,p2_armright_alpha);
	}
	draw_sprite_ext(p2_body_sprite,p2_body_image,x+p2_body_init_x*2+p2_body_x*2 + 2,y+p2_body_init_y*2+p2_body_y*2,2,2,p2_body_angle,c_white,p2_head_alpha);
	if (p2_head_sprite == spr_p2_idle)
	{
		draw_sprite_ext(p2_head_sprite,image_index / 12,x+p2_body_init_x*2+p2_body_x*2+p2_head_init_x*2+p2_head_x*2 - 2,y+p2_body_init_y*2+p2_body_y*2+p2_head_init_y*2+p2_head_y*2 + 5,2,2,p2_head_angle,c_white,p2_head_alpha);
	}
	if (p2_head_sprite == spr_p2_head)
	{
		draw_sprite_ext(p2_head_sprite,_head_image,x+p2_body_init_x*2+p2_body_x*2+p2_head_init_x*2+p2_head_x*2 - 2,y+p2_body_init_y*2+p2_body_y*2+p2_head_init_y*2+p2_head_y*2 + 5,2,2,p2_head_angle,c_white,p2_head_alpha);
	}
	draw_sprite_ext(p2_thingy_sprite,p2_thingy_image,x+p2_body_init_x*2+p2_body_x*2+p2_head_init_x*2+p2_head_x*2 - 15,y+p2_body_init_y*2+p2_body_y*2+p2_head_init_y*2+p2_head_y*2 + 1,2,2,p2_head_angle_diddler / 4,c_white,p2_thingy_alpha);

	surface_reset_target();

	var _sw = surface_get_width(_surf);
	var _sh = surface_get_height(_surf);

	draw_set_color(image_blend);
	gpu_set_blendmode_ext(bm_one,bm_inv_src_alpha);
	draw_primitive_begin_texture(pr_trianglestrip,surface_get_texture(_surf));
	draw_vertex_texture(_sw/2-_sw*squish*0.5+x-320,0+_sh/2-_sh/squish*0.5,0,0);
	draw_vertex_texture(_sw/2+_sw*squish*0.5+x-320,0+_sh/2-_sh/squish*0.5,1,0);
	draw_vertex_texture(_sw/2-_sw*squish*0.5+x-320,_sh,0,1);
	draw_vertex_texture(_sw/2+_sw*squish*0.5+x-320,_sh,1,1);
	draw_primitive_end();
	gpu_set_blendmode(bm_normal);
}