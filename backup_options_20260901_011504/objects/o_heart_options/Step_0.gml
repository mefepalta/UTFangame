if (global.menu_state == "options") {
    // Fade in
    global.fade_alpha = min(global.fade_alpha + 0.05, 1);

    // Navigation
    if (keyboard_check_pressed(vk_down)) {
        menu_index = (menu_index + 1) mod array_length(menu_items);
        audio_play_sound(snd_menu_switch, 1, false);
    }
    if (keyboard_check_pressed(vk_up)) {
        menu_index = (menu_index - 1 + array_length(menu_items)) mod array_length(menu_items);
        audio_play_sound(snd_menu_switch, 1, false);
    }

    // Toggle options
    if (Input_IsPressed(INPUT.CONFIRM)) {
        switch (menu_index) {
            case 0: 
                global.fullscreen = !global.fullscreen;
                window_set_fullscreen(global.fullscreen);
				if(!global.fullscreen){
					Border_SetEnabled(global.border_enabled);
				}
                break;
            case 1:
				global.border_enabled = !global.border_enabled;
				Border_SetEnabled(global.border_enabled);
				break;
            case 2:
				global.window_scale_index = (global.window_scale_index + 1) mod array_length(window_scales);
				global.window_scale = window_scales[global.window_scale_index];
				Border_SetEnabled(global.border_enabled);
				break;
            case 3: global.no_heal = !global.no_heal; break;
            case 4: global.no_hit = !global.no_hit; break;
        }
        audio_play_sound(snd_menu_confirm, 1, false);
    }
switch (menu_index) 
{
case 0: 
	with (o_heartmenuoptions)
	{
		image_alpha = 1;
		x = 323;
		y = 218;
	}
    break;
    case 1:	
	with (o_heartmenuoptions)
	{
		image_alpha = 1;
		x = 323;
		y = 242;
	}
	break;
    case 2:	
	with (o_heartmenuoptions)
	{
		image_alpha = 1;
		x = 323;
		y = 266;
	}
	break;
    case 3:	
	with (o_heartmenuoptions)
	{
		image_alpha = 1;
		x = 323;
		y = 290;
	}
	break;
    case 4:	
	with (o_heartmenuoptions)
	{
		image_alpha = 1;
		x = 323;
		y = 314;
	}
	break;
    case 5:	
	with (o_heartmenuoptions)
	{
		image_alpha = 1;
		x = 323;
		y = 338;
	}
	break;
}
	if (menu_index == 2) {
		var _scale_changed = false;
		if (keyboard_check_pressed(vk_right)) {
			global.window_scale_index = (global.window_scale_index + 1) mod array_length(window_scales);
			_scale_changed = true;
		}
		if (keyboard_check_pressed(vk_left)) {
			global.window_scale_index = (global.window_scale_index - 1 + array_length(window_scales)) mod array_length(window_scales);
			_scale_changed = true;
		}
		if (_scale_changed) {
			global.window_scale = window_scales[global.window_scale_index];
			Border_SetEnabled(global.border_enabled);
			audio_play_sound(snd_menu_confirm, 1, false);
		}
	}

    // Volume control
    if (menu_index == 5) {
        if (keyboard_check_pressed(vk_right)) { 
            global.volume = clamp(global.volume + 0.1, 0, 1);
            audio_master_gain(global.volume);
            audio_play_sound(snd_menu_confirm, 1, false);
        }
        if (keyboard_check_pressed(vk_left)) { 
            global.volume = clamp(global.volume - 0.1, 0, 1);
            audio_master_gain(global.volume);
            audio_play_sound(snd_menu_confirm, 1, false);
        }
    }

    // Smooth slider animation
    global.display_volume = lerp(global.display_volume, global.volume, 0.15);

    // Close menu
    if (Input_IsPressed(INPUT.CANCEL)) {
        global.menu_state = "main";
        audio_play_sound(snd_menu_cancel, 1, false);
		with (obj_fog)
		{
			target_alpha = 0.4;
		}
    }
}
else {
    // Fade out when leaving options
    global.fade_alpha = max(global.fade_alpha - 0.05, 0);
}
