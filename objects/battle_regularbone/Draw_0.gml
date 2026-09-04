	
	
	
if (_color = 0){
	real_color=make_color_rgb(70, 70, 110);
	
	if (place_meeting(x,y,battle_soul)){
		if (_alpha = 1){
			if(global.kr){
				if (!instance_exists(hurtkr)){
					instance_create_depth(0, 0, 0, hurtkr)
				}
			}else{
				Battle_HurtNormal(DMG_BONE);
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
				}else{
					Battle_HurtNormal(DMG_BONE_BLUE);
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
				if(global.kr){
					if (!instance_exists(hurtkr)){
						instance_create_depth(0, 0, 0, hurtkr)
					}
				}else{
					Battle_HurtNormal(DMG_BONE_ORANGE);
				}
			}
		}
	}
}

if _inside = 0{
	depth=DEPTH_BATTLE.BULLET{
		surface_set_target(Battle_GetBoardSurface()){
			if _center = 0{
				if _bottom = 0{
					_sprite = spr_bone_origin_down
				}else if _bottom = 1{
					_sprite = spr_bone_origin_down_nobottom
				}
			}else if _center = 1{
				if _bottom = 0{
					_sprite = spr_bone_origin_center
				}else if _bottom = 1{
					_sprite = spr_bone_origin_center_nobottom
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
				}else if _bottom = 1{
					_sprite = spr_bone_origin_down_nobottom
				}
			}else if _center = 1{
				if _bottom = 0{
					_sprite = spr_bone_origin_center
				}else if _bottom = 1{
					_sprite = spr_bone_origin_center_nobottom
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