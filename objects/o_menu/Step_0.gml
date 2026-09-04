menu_t++;

for (var _h = 0; _h < 4; _h++)
{
	with (menu_objs[_h]) { visible = false; }
}
with (o_heart) { visible = false; }

for (var _d = 0; _d < 4; _d++)
{
	item_dx[_d] = lerp(item_dx[_d], (_d == menucounter) ? 6 : 0, 0.22);
}

if (instance_exists(o_swapfelldiscord_logo))
{
	if (logo_base_y < 0) { logo_base_y = o_swapfelldiscord_logo.y; }
	o_swapfelldiscord_logo.y = logo_base_y + sin(menu_t * 0.025) * 2.5;
}
if (instance_exists(o_swapfelldiscord_spear))
{
	if (spear_base_y < 0) { spear_base_y = o_swapfelldiscord_spear.y; }
	o_swapfelldiscord_spear.y = spear_base_y + sin(menu_t * 0.025) * 2.5;
}

col_a    = lerp(col_a,    (global.menu_state == "main")   ? 1 : 0, 0.12);
extras_a = lerp(extras_a, (global.menu_state == "extras") ? 1 : 0, 0.16);
extras_t++;
if (extras_deny > 0) { extras_deny -= 1; }

if (view_enabled) and (view_visible[0])
{
	var _cam = view_camera[0];
	vx_ = camera_get_view_x(_cam);
	vy_ = camera_get_view_y(_cam);
	vw_ = camera_get_view_width(_cam);
	vh_ = camera_get_view_height(_cam);
}

if (array_length(snow) == 0)
{
	for (var _n = 0; _n < 70; _n++)
	{
		array_push(snow, {
			px     : vx_ + random(vw_),
			py     : vy_ + random(vh_),
			r      : 0.5 + random(1.1),
			vy     : 0.12 + random(0.45),
			sway   : random(6.2831),
			swaysp : 0.008 + random(0.020),
			a      : 0.18 + random(0.42)
		});
	}
}
for (var _s = 0; _s < array_length(snow); _s++)
{
	var _f = snow[_s];
	_f.sway += _f.swaysp;
	_f.py   += _f.vy;
	_f.px   += sin(_f.sway) * 0.35 - 0.10;
	if (_f.py > vy_ + vh_ + 4)
	{
		_f.py = vy_ - 4;
		_f.px = vx_ + random(vw_);
	}
	if (_f.px < vx_ - 4) { _f.px = vx_ + vw_ + 4; }
}



switch (global.menu_state)
{
	case "main":
	
	if (keyboard_check_pressed(vk_down))
	{
		menucounter--;
		audio_play_sound(snd_menu_switch,2,false);
	}
	if (keyboard_check_pressed(vk_up))
	{
		menucounter++;
		audio_play_sound(snd_menu_switch,2,false);
	}

	if (Input_IsPressed(INPUT.CONFIRM)) and (menucounter == 3)
	{
		if (!transitioning)
			{
				StartRun(room_area_beforesans);
				global.extras_room = noone;
				next_room = room_area_beforesans;
				transitioning = true;
			}
	}
	if (Input_IsPressed(INPUT.CONFIRM)) and (menucounter == 2)
	{
         global.menu_state = "options";
         global.fade_alpha = 0;
	}
	if (Input_IsPressed(INPUT.CONFIRM)) and (menucounter == 1)
	{
		global.menu_state = "extras";
		extras_index = 0;
		extras_deny  = 0;
		audio_play_sound(snd_menu_confirm,2,false);
	}
	if (Input_IsPressed(INPUT.CONFIRM)) and (menucounter == 0)
	{
		room_goto(room_credits);
	}

	if (menucounter > 3)
	{
		menucounter = 0;
	}
	if (menucounter < 0)
	{
		menucounter = 3;
	}


	if (transitioning)
	{
	  with (o_transition)
	  {
		  istime = true;
		  if (target_alpha > 1)
		  {
			  room_goto(other.next_room);
			  audio_stop_all();
		  }
	  }
	}
	with (o_heartmenuoptions)
	{
		image_alpha = 0;
	}
	break;
	
	case "extras":
		with (obj_fog) { target_alpha = 0.8; }

		if (Input_IsPressed(INPUT.LEFT)) and (extras_index > 0)
		{
			extras_index -= 1;
			audio_play_sound(snd_menu_switch,2,false);
		}
		if (Input_IsPressed(INPUT.RIGHT)) and (extras_index < 1)
		{
			extras_index += 1;
			audio_play_sound(snd_menu_switch,2,false);
		}

		if (!transitioning) and (Input_IsPressed(INPUT.CANCEL) or keyboard_check_pressed(ord("C")))
		{
			global.menu_state = "main";
			with (obj_fog) { target_alpha = 0.4; }
			audio_play_sound(snd_menu_cancel,2,false);
		}

		if (!transitioning) and (Input_IsPressed(INPUT.CONFIRM))
		{
			if (extras_index == 1) and (!global.phase2_unlocked)
			{
				extras_deny = 20;
				Camera_Shake(2,2,1,1,5,5,0.3,0.3);
				audio_play_sound(snd_damage,2,false);
			}
			else
			{
				var _troom = extras_rooms[extras_index];
				StartRun(_troom);
				global.sansphase   = extras_phases[extras_index];
				global.extras_room = _troom;
				next_room = _troom;
				transitioning = true;
				audio_play_sound(snd_menu_confirm,2,false);
			}
		}

		if (transitioning)
		{
			with (o_transition)
			{
				istime = true;
				if (target_alpha > 1)
				{
					room_goto(other.next_room);
					audio_stop_all();
				}
			}
		}
		break;
	
   case "options":
		with (obj_fog)
		{
            target_alpha = 0.8;
			if (keyboard_check_pressed(ord("C")))
			{
				global.menu_state = "main";
				global.fade_alpha = 1;
                target_alpha = 0.4;
			}
			
        }
		if (!options_opened)
		{
        options_opened = true;
			if (instance_exists(o_heart_options))
			{
				with (o_heart_options)
				{
                current_index = 0;
				}
			}
        }
        break;

}
