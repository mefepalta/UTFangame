/*if (global.menu_state == "main") {
    // Navigation
    if (keyboard_check_pressed(vk_down))
{
	menu_index = (menu_index + 1) mod array_length(main_menu_items);
    audio_play_sound(snd_menu_switch,2,false);
}
    if (keyboard_check_pressed(vk_up))
{
	menu_index = (menu_index - 1 + array_length(main_menu_items)) mod array_length(main_menu_items);
	audio_play_sound(snd_menu_switch,2,false);
}

    // Select menu item
    if (keyboard_check_pressed(vk_enter)) {
        switch (menu_index) {
            case 0: /* Start Game Code break;
            case 1: // Open options
                global.menu_state = "options";
                global.fade_alpha = 0;
                break;
            case 2: game_end(); break;
        }
    }
}*/

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
		Camera_Shake(2,2,1,1,5,5,0.3,0.3);
		audio_play_sound(snd_damage,2,false);
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
			  room_goto(room_area_beforesans);
			  audio_stop_all();
		  }
	  }
	}
	with (o_heartmenuoptions)
	{
		image_alpha = 0;
	}
	break;
	
   case "options":
		with (obj_fog)
		{
            target_alpha = 0.8; // Make fog visible
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

// TEMP-SHOTS-BEGIN (test only)
if (!variable_instance_exists(id, "shotc")) { shotc = 0; }
shotc++;
if (shotc == 60)
{
	var _c = view_camera[0];
	show_debug_message("DBGMENU room=" + string(room_width) + "x" + string(room_height)
		+ " viewen=" + string(view_enabled)
		+ " vis0=" + string(view_visible[0])
		+ " camx=" + string(camera_get_view_x(_c)) + " camy=" + string(camera_get_view_y(_c))
		+ " camw=" + string(camera_get_view_width(_c)) + " camh=" + string(camera_get_view_height(_c))
		+ " gui=" + string(display_get_gui_width()) + "x" + string(display_get_gui_height())
		+ " win=" + string(window_get_width()) + "x" + string(window_get_height()));
	with (o_menuitems_play) { show_debug_message("DBGPLAY x=" + string(x) + " y=" + string(y) + " xs=" + string(image_xscale)); }
	with (o_heart) { show_debug_message("DBGHEART x=" + string(x) + " y=" + string(y)); }
}
if (shotc == 90) { screen_save("menu_a.png"); }
// TEMP-SHOTS-END
