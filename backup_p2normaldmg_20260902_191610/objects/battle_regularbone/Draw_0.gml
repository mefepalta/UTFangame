/*if _color = 0{
	real_color = c_white
	
	if _alpha = 1{
		if (place_meeting(x,y,battle_soul)){
			if global.kr=false{
				Battle_CallSoulEventBulletCollision();
			}else if global.kr=true{
				if count%frequency_damage=0{
					//Player_Hurt(1)
					//Player_IsKarmaHappening(true)
					if (!instance_exists(hurtkr)) {
						instance_create_depth(0, 0, 0, hurtkr)
					}
					//audio_play_sound(snd_hurt,0,false)
				}
			}
		}
	}		
}else if _color = 1{
	real_color = c_aqua
	
	if _alpha = 1{
		if (place_meeting(x,y,battle_soul)){
			if (Input_IsHeld(INPUT.LEFT) or Input_IsHeld(INPUT.RIGHT) or Input_IsHeld(INPUT.UP) or Input_IsHeld(INPUT.DOWN)){
				if global.kr=false{
					Battle_CallSoulEventBulletCollision();
				}else if global.kr=true{
					if count%frequency_damage=0{
						if (!instance_exists(hurtkr)) {
						instance_create_depth(0, 0, 0, hurtkr)
					}
					}
				}
			}
		}
	}
}else if _color = 2{
	real_color = c_orange
	
	if _alpha = 1{
		if (place_meeting(x,y,battle_soul)){
			if !(Input_IsHeld(INPUT.LEFT) or Input_IsHeld(INPUT.RIGHT) or Input_IsHeld(INPUT.UP) or Input_IsHeld(INPUT.DOWN)){
				if global.kr=false{
					Battle_CallSoulEventBulletCollision();
				}else if global.kr=true{
					if count%frequency_damage=0{
						if (!instance_exists(hurtkr)) {
						instance_create_depth(0, 0, 0, hurtkr)
					}
					}
				}
			}
		}
	}
}*/
if (_color = 0){
	real_color=make_color_rgb(70, 70, 110);
	
	if (place_meeting(x,y,battle_soul)){
		if (_alpha = 1){
			if(global.kr){
				if (!instance_exists(hurtkr)){
					instance_create_depth(0, 0, 0, hurtkr)
				}
			}else{
				if(global._inv<1){
					Battle_CallSoulEventHurt();
					instance_destroy();
				}
			}
		}
	}
}
if (_color = 1){
	real_color=c_aqua
	
	
	if (place_meeting(x,y,battle_soul)){
		if (_alpha = 1){
			if!(battle_soul.x = battle_soul.xprevious&&battle_soul.y = battle_soul.yprevious){
				if(global.kr){
					if (!instance_exists(hurtkr)){
						instance_create_depth(0, 0, 0, hurtkr)
					}
				}
			}
		}
	}
}
if (_color = 2){
	real_color=c_orange
	
	if (place_meeting(x,y,battle_soul)){
		if(battle_soul.x = battle_soul.xprevious&&battle_soul.y = battle_soul.yprevious){
			if (_alpha = 1){
				if (!instance_exists(hurtkr)){
					instance_create_depth(0, 0, 0, hurtkr)
				}
			}
		}
	}
}

///Draw the bones
if _inside = 0{
	depth=DEPTH_BATTLE.BULLET{
		surface_set_target(Battle_GetBoardSurface()){
			if _center = 0{
				if _bottom = 0{
					_sprite = spr_bone_origin_down
					//sprite_index = spr_bone_origin_down_hitbox
				}else if _bottom = 1{
					_sprite = spr_bone_origin_down_nobottom
					//sprite_index = spr_bone_origin_down_hitbox
				}
			}else if _center = 1{
				if _bottom = 0{
					_sprite = spr_bone_origin_center
					//sprite_index = spr_bone_origin_center_hitbox
				}else if _bottom = 1{
					_sprite = spr_bone_origin_center_nobottom
					//sprite_index = spr_bone_origin_center_hitbox
				}
			}
			draw_sprite_ext(_sprite,_papyrus,x,y,1,_length/18,_angle,real_color,_alpha)
			image_yscale = _length/20
			image_angle = _angle
			if global.show_hitbox=true{
				image_alpha=1
			}else global.show_hitbox=false{
				image_alpha=0
			}
		}surface_reset_target();
	}
}else if _inside = 1{
	depth=DEPTH_BATTLE.BULLET_OUTSIDE_HIGH{
		if _center = 0{
				if _bottom = 0{
					_sprite = spr_bone_origin_down
					//sprite_index = spr_bone_origin_down_hitbox
				}else if _bottom = 1{
					_sprite = spr_bone_origin_down_nobottom
					//sprite_index = spr_bone_origin_down_hitbox
				}
			}else if _center = 1{
				if _bottom = 0{
					_sprite = spr_bone_origin_center
					//sprite_index = spr_bone_origin_center_hitbox
				}else if _bottom = 1{
					_sprite = spr_bone_origin_center_nobottom
					//sprite_index = spr_bone_origin_center_hitbox
				}
			}
		draw_sprite_ext(_sprite,_papyrus,x,y,1,_length/18,_angle,real_color,_alpha)
		image_yscale = _length/20
		image_angle = _angle
		if global.show_hitbox=true{
				image_alpha=1
			}else global.show_hitbox=false{
				image_alpha=0
			}
	}
}
draw_self()