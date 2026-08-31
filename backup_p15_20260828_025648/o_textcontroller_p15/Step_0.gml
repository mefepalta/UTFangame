p15++;

// Time since game start
var elapsed = (current_time - start_time) / 1000;

// Start new line when its time is reached
if (current_line + 1 < array_length(dialogue)) {
    if (elapsed >= dialogue[current_line + 1].time) {
        current_line++;
        line_start_time = elapsed;
        last_chars = 0; // reset when new line starts
    }
}
if (p15 == 15)
{
	o_p15_legs.shake_time = 4;
	o_p15_head.sprite_index = s_p15_headraise_1;
	o_p15_head.image_index = 0;
	instance_create_depth(o_p15_head.x + 15,o_p15_head.y - 50,-999999999,o_skull_particle);
	instance_create_depth(o_p15_head.x + 15,o_p15_head.y - 50,-999999999,o_skull_particle);
	instance_create_depth(o_p15_head.x + 15,o_p15_head.y - 50,-999999999,o_skull_particle);
	instance_create_depth(o_p15_head.x + 15,o_p15_head.y - 50,-999999999,o_skull_particle);
	instance_create_depth(o_p15_head.x + 15,o_p15_head.y - 50,-999999999,o_skull_particle);
	audio_play_sound(snd_damage,1,false);
	}
if (p15 == 45)
{
	o_p15_legs.shake_time = 4;
	o_p15_head.sprite_index = s_p15_headraise_1;
	o_p15_head.image_index = 1;
	instance_create_depth(o_p15_head.x + 15,o_p15_head.y - 50,-999999999,o_skull_particle);
	instance_create_depth(o_p15_head.x + 15,o_p15_head.y - 50,-999999999,o_skull_particle);
	instance_create_depth(o_p15_head.x + 15,o_p15_head.y - 50,-999999999,o_skull_particle);
	instance_create_depth(o_p15_head.x + 15,o_p15_head.y - 50,-999999999,o_skull_particle);
	instance_create_depth(o_p15_head.x + 15,o_p15_head.y - 50,-999999999,o_skull_particle);
	audio_play_sound(snd_damage,1,false);
}
if (p15 == 75)
{
	o_p15_legs.shake_time = 4;
	o_p15_head.sprite_index = s_p15_headraise_1;
	o_p15_head.image_index = 2;
	instance_create_depth(o_p15_head.x + 15,o_p15_head.y - 50,-999999999,o_skull_particle);
	instance_create_depth(o_p15_head.x + 15,o_p15_head.y - 50,-999999999,o_skull_particle);
	instance_create_depth(o_p15_head.x + 15,o_p15_head.y - 50,-999999999,o_skull_particle);
	instance_create_depth(o_p15_head.x + 15,o_p15_head.y - 50,-999999999,o_skull_particle);
	instance_create_depth(o_p15_head.x + 15,o_p15_head.y - 50,-999999999,o_skull_particle);
	audio_play_sound(snd_damage,1,false);
}
if (p15 == 105)
{
	o_p15_legs.shake_time = 4;
	o_p15_head.sprite_index = s_p15_headraise_1;
	o_p15_head.image_index = 3;
	instance_create_depth(o_p15_head.x + 15,o_p15_head.y - 50,-999999999,o_skull_particle);
	instance_create_depth(o_p15_head.x + 15,o_p15_head.y - 50,-999999999,o_skull_particle);
	instance_create_depth(o_p15_head.x + 15,o_p15_head.y - 50,-999999999,o_skull_particle);
	instance_create_depth(o_p15_head.x + 15,o_p15_head.y - 50,-999999999,o_skull_particle);
	instance_create_depth(o_p15_head.x + 15,o_p15_head.y - 50,-999999999,o_skull_particle);
	audio_play_sound(snd_damage,1,false);
}
if (p15 == 135)
{
	o_p15_legs.shake_time = 4;
	o_p15_head.sprite_index = s_p15_headraise_1;
	o_p15_head.image_index = 4;
	o_p15_legs.image_index = 1;
	o_p15_arm.image_index = 1;
	o_p15_arm_1.image_index = 1;
	instance_create_depth(o_p15_head.x + 15,o_p15_head.y - 50,-999999999,o_skull_particle);
	instance_create_depth(o_p15_head.x + 15,o_p15_head.y - 50,-999999999,o_skull_particle);
	instance_create_depth(o_p15_head.x + 15,o_p15_head.y - 50,-999999999,o_skull_particle);
	instance_create_depth(o_p15_head.x + 15,o_p15_head.y - 50,-999999999,o_skull_particle);
	instance_create_depth(o_p15_head.x + 15,o_p15_head.y - 50,-999999999,o_skull_particle);
	audio_play_sound(snd_damage,1,false);
}
if (p15 == 180)
{
	o_p15_head.sprite_index = s_p15_headraise;
	o_p15_head.image_index = 0;
}
if (p15 == 190)
{
	o_p15_head.image_index = 1;
}
if (p15 == 200)
{
	o_p15_head.image_index = 2;
}
if (p15 == 210)
{
	o_p15_head.image_index = 3;
}
if (p15 == 220)
{
	o_p15_head.image_index = 4;
}
if (p15 == 230)
{
	o_p15_head.image_index = 5;
}
if (p15 == 240)
{
	o_p15_head.image_index = 6;
}
if (p15 == 1100)
{
	audio_play_sound(snd_blueeyes,1,false);
}
if (p15 == 1650)
{
	o_p15_legs.image_index = 0;
	o_p15_arm.image_index = 0;
	o_p15_arm_1.image_index = 0;
	audio_play_sound(snd_noise,1,false);
	o_p15_legs.shake_time = 4;
}

if (current_line = 20)
{
	font_custom = font_determination_mono_1;
}
if (current_line > 19)
{
	o_p15_arm.image_alpha -= 0.03;
	o_p15_arm_1.image_alpha -= 0.03;
	o_p15_body.image_alpha -= 0.03;
	o_p15_head.image_alpha -= 0.03;
	o_p15_legs.image_alpha -= 0.03;
	o_p15wingthings_1.image_alpha -= 0.03;
	o_p15_wingthing.image_alpha -= 0.03;
}
if (p15 > 3600) and (p15 < 4550) and (p15 % 15 == 0)
{
	Camera_Shake(3,3,1,1,2,2,1,1);
}
if (p15 == 4875)
{
	o_p15_eye.image_alpha = 1;
	instance_create_layer(o_p15_eye.x,o_p15_eye.y,"Instances",o_p15_eye_effect);
	o_p15_papyrus.image_alpha += 0.01;
	o_p15_alphys.image_alpha += 0.01;
}
if (p15 > 4875)
{
	o_p15_papyrus.image_alpha += 0.001;
	o_p15_alphys.image_alpha += 0.001;
}

//instance_create_depth(o_p15_head.x + 15,o_p15_head.y - 50,-999999999,o_skull_particle);
	
if(keyboard_check_pressed(vk_space))
{
	global.sansphase = 2;
	room_goto(room_battle_1);
}