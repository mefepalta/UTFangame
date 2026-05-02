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
			  room_goto(room_area_0);
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