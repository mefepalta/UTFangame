var horizontal_stab = ((battle_board.y-(battle_board.down+battle_board.right))-60)

var left_box = (battle_board.x-battle_board.left)-5;
var right_box = (battle_board.x+battle_board.right)+5;
var up_box = (battle_board.y-battle_board.up)-5;
var down_box = (battle_board.y+battle_board.down)+5;

var bottom_box = (battle_board.y+battle_board.down)-2;
var top_box = (battle_board.y-battle_board.up)+2;

with (o_p1final_gbsans)
{
	if (sprite_index == s_p1final_sans_slash)
	{
		other.spriteready = true;
	}
	else
	{
		other.spriteready = false;
	}
	if (floor(image_index) == 6)
	{
		other.frameready = true;
	}
	else
	{
		other.frameready = false;
	}
}
if (_timer == 10)
{
	audio_play_sound(snd_impact,2,false);
	Battle_SlamDown();
}
if (_timer == 50)
{
	RegularBone(left_box,bottom_box,64,4,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box,bottom_box,64,-4,0,0,0,0,1,0,0,0,0,true);
}
if (_timer == 100)
{
	RegularBone(left_box,bottom_box,32,4,0,0,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 10,bottom_box,48,4,0,0,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 20,bottom_box,32,4,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box,top_box,104,-4,0,180,0,0,1,0,0,0,0,true);
}
if (_timer == 150)
{
	RegularBone(right_box,bottom_box,32,-4,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 10,bottom_box,48,-4,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 20,bottom_box,32,-4,0,0,0,0,1,0,0,0,0,true);
	RegularBone(left_box,top_box,104,4,0,180,0,0,1,0,0,0,0,true);
}
if (_timer == 200)
{
	RegularBone(left_box,bottom_box,32,4,0,0,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 10,bottom_box,48,4,0,0,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 20,bottom_box,64,4,0,0,0,0,1,0,0,0,0,true);
}
if (_timer > 230) and (_timer < 310) and (_timer % 20 == 0)
{
	RegularBone(left_box,top_box,124,2.5,0,180,0,0,1,0,0,0,0,true);
	RegularBone(right_box,bottom_box,28,-2.5,0,0,0,0,1,0,0,0,0,true);
}
if (_timer == 350)
{
	RegularBone(left_box,bottom_box,64,4,0,0,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 10,bottom_box,64,4,0,0,0,0,1,0,0,0,0,true);
	RegularBone(left_box - 20,bottom_box,64,4,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box,bottom_box,64,-4,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 10,bottom_box,64,-4,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 20,bottom_box,64,-4,0,0,0,0,1,0,0,0,0,true);
}
if (_timer == 370)
{
	RegularBone(left_box - 30,top_box,88,4,0,180,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 30,top_box,88,-4,0,180,0,0,1,0,0,0,0,true);
}
if (_timer == 410)
{
	RegularBone(right_box + 10,bottom_box,152,-4,0,0,1,0,1,0,0,0,0,true);
	RegularBone(right_box + 20,bottom_box,152,-4,0,0,1,0,1,0,0,0,0,true);
}
if (_timer == 430)
{
	RegularBone(right_box + 20,top_box,88,-2.5,0,180,0,0,1,0,0,0,0,true);
	RegularBone(right_box,bottom_box,32,-4,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 10,bottom_box,48,-4,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box + 20,bottom_box,64,-4,0,0,0,0,1,0,0,0,0,true);
}
if (_timer > 470) and (_timer < 520) and (_timer % 10 == 0)
{
	RegularBone(left_box,bottom_box,64,3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(left_box,top_box,64,3,0,180,0,0,1,0,0,0,0,true);
}
if (_timer == 540)
{
	RegularBone(left_box,bottom_box,152,4,0,0,1,0,1,0,0,0,0,true);
}
if (_timer > 550) and (_timer < 750) and (_timer % 30 == 0)
{
	RegularBone(left_box,bottom_box,32,3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(left_box,top_box,100,3,0,180,0,0,1,0,0,0,0,true);
	RegularBone(right_box,bottom_box,32,-3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box,top_box,100,-3,0,180,0,0,1,0,0,0,0,true);
}
if (_timer == 770)
{
	RegularBone(left_box,bottom_box,64,3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box,bottom_box,64,-3,0,0,0,0,1,0,0,0,0,true);
}
if (_timer == 805)
{
	RegularBone(left_box,bottom_box,152,3,0,0,1,0,1,0,0,0,0,true);
	RegularBone(left_box - 10,bottom_box,152,3,0,0,1,0,1,0,0,0,0,true);
	RegularBone(left_box - 20,bottom_box,152,3,0,0,1,0,1,0,0,0,0,true);
	RegularBone(right_box,bottom_box,152,-3,0,0,1,0,1,0,0,0,0,true);
	RegularBone(right_box + 10,bottom_box,152,-3,0,0,1,0,1,0,0,0,0,true);
	RegularBone(right_box + 20,bottom_box,152,-3,0,0,1,0,1,0,0,0,0,true);
}
if (_timer == 830)
{
	RegularBone(right_box,bottom_box,48,-3,0,0,0,0,1,0,0,0,0,true);
}
if (_timer == 850)
{
	RegularBone(right_box,top_box,108,-3,0,180,0,0,1,0,0,0,0,true);
}
if (_timer == 900)
{
	RegularBone(left_box,bottom_box,48,3,0,0,0,0,1,0,0,0,0,true);
}
if (_timer == 920)
{
	RegularBone(left_box,top_box,108,3,0,180,0,0,1,0,0,0,0,true);
}
if (_timer > 950) and (_timer < 1321) and (_timer % 120 == 0)
{
	RegularBlaster(-50,-50,battle_soul.x,top_box - 50,270,270,20,20,2,2,40);
}
if (_timer > 950) and (_timer < 1300) and (_timer % 80 == 0)
{
	RegularBone(left_box,bottom_box,24,3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box,bottom_box,120,-3,0,0,1,0,1,0,0,0,0,true);
}
if (_timer == 1320)
{
	Battle_SetBoardSize(50,65,65,65);
}
if (_timer > 1350) and (_timer < 1850) and (_timer % 40 == 0)
{
	RegularBone(left_box,bottom_box,32,3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(left_box,top_box,90,3,0,180,0,0,1,0,0,0,0,true);
	RegularBone(right_box,bottom_box,32,-3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box,top_box,90,-3,0,180,0,0,1,0,0,0,0,true);
}
if (_timer == 1650) //1650
{
	with (o_p1final_fall)
	{
		p1finalattack = true;
	}
}
if (_timer == 2085)
{
    Battle_SetBoardSize(270,65,300,-210);
}
if (_timer == 2125)
{
	Battle_SetSoul(battle_soul_red);
	audio_play_sound(snd_ding,2,false);
	battle_soul.x = 70;
}
if (_timer > 2150) and (_timer < 2950) and (_timer % 100 == 0)
{
	for (var i = 195; i > 165; i -= 5)
	{
		var bone = RegularBone(o_p1final_gbtop.x,o_p1final_gbtop.y, 40,0, 0, i+90,0,1,1,0,0,0,0,true);
		bone.direction = i;
		bone.speed = 10;
	}
	audio_play_sound(snd_stab,2,false);
	with (o_p1final_gbtop)
	{
		target_x = random_range(348,548);
		target_y = random_range(94,224);
	}
	with (o_p1final_gbsans)
	{
		sprite_index = s_p1final_sans_slash;
		image_speed = 1;
	}
}
if (_timer > 2150) and (_timer < 2950) and (_timer % 60 == 0)
{
	RegularBone(left_box + 5,top_box,53,0,4,270,0,0,1,0,0,0,0,true);
	RegularBone(right_box - 5,bottom_box,53,0,-4,90,0,0,1,0,0,0,0,true);
}
if (_timer > 2170) and (_timer < 2950) and (spriteready == true) and (frameready == true)
{
    if (!attack_done)
	{
		var slash = instance_create_depth(o_p1final_gbsans.x - 102, o_p1final_gbsans.y + 56, -99999, o_p1final_sansslash);
        
        // Calculate direction towards player
		var dir = point_direction(o_p1final_gbsans.x, o_p1final_gbsans.y, battle_soul.x, battle_soul.y);
        slash.direction = dir;
        slash.speed = 7;
        slash.image_angle = dir + 180;

        attack_done = true; // Prevents multiple slashes per frame
    }
}
else
{
    attack_done = false; // Reset when not on frame 3
}
if (_timer == 2950)
{
	with (o_p1final_gbsans)
	{
		sprite_index = s_p1final_sans_laugh;
	}
	audio_play_sound(snd_sans_laugh,2,false);
}
if (_timer == 3030)
{
	with (o_p1final_gbsans)
	{
		sprite_index = s_p1final_sans_serious;
	}
	audio_play_sound(snd_slice,2,false);
	instance_create_depth(x,y,-99999999,o_fakeslash);
}
if (_timer == 3100)
{
	audio_play_sound(snd_bighit,2,false);
	Camera_Shake(5,5,1,1,5,5,0.3,0.3);
}
if (_timer > 3170) and (_timer < 3270) and (_timer % 30 == 0)
{
	instance_create_depth(o_p1final_gbtop.x + random_range(-200,70),o_p1final_gbtop.y + random_range(-100,100),-999999999,o_p1final_explosion);
	instance_create_depth(o_p1final_gbtop.x + random_range(-200,70),o_p1final_gbtop.y + random_range(-100,100),-999999999,o_p1final_explosion_1);
}
if (_timer > 3170) and (_timer < 3320)
{
	with (o_p1_shine)
	{
		target_alpha = target_alpha + 0.01;
	}
}
if (_timer > 3320) and (_timer < 3420)
{
	with (o_p1_shine)
	{
		target_alpha = target_alpha - 0.1;
	}
}
if (_timer == 3220)
{
	with (o_p1final_gbtop)
	{
		move_speedx = move_speedx * 0.15;
		move_speedy = move_speedy * 0.15;
		target_x = 60;
		target_y = 904;
	}
}
if (_timer == 3290)
{
	Battle_SetBoardSize(65,65,130,130);
}
if (_timer == 3320)
{
	battle_soul.x = right_box - 120;
	battle_soul.y = top_box + 40;
	audio_play_sound(snd_impact,2,false);
	Battle_SlamDown();
	with (o_p1final_gbtop)
	{
		instance_destroy();
	}
	with (o_p1final_gbbottom)
	{
		instance_destroy();
	}
	with (o_p1final_gbsans)
	{
		instance_destroy();
	}
	with (o_p1final_gbsans_expressions)
	{
		instance_destroy();
	}
	with (o_p1final_fall)
	{
		instance_destroy();
	}
}
if (_timer == 3450)
{
	with (o_p1final_fall_1)
	{
		target_y = -256;
		image_speed = -1;
	}
	with (o_p1_shine)
	{
		image_alpha = 0;
	}
	battle_enemy_engage._wiggle = false;
	battle_enemy_engage.arm_speed = 0;
}
if (_timer == 3525)
{
	with (battle_enemy_engage)
	{
		_head_sprite = spr_sans_head_1;
		_head_alpha = 1;
		_spear_alpha = 0;
		_armleft_alpha = 0;
		_armright_alpha = 0;
		_armleft_alpha1 = 1;
		_armright_alpha1 = 1;
		_legs_alpha1 = 1;
		mask_index = leg_sprite1;
		_body_x = 1;
	}
	with (o_p1final_fall_1)
	{
		instance_destroy();
	}
}
if (_timer > 3350) and (_timer < 3525) and (_timer % 40 == 0)
{
	RegularBone(left_box,bottom_box,32,3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(left_box,top_box,100,3,0,180,0,0,1,0,0,0,0,true);
	RegularBone(right_box,bottom_box,32,-3,0,0,0,0,1,0,0,0,0,true);
	RegularBone(right_box,top_box,100,-3,0,180,0,0,1,0,0,0,0,true);
}
if (_timer == 3550)
{
	Battle_SetBoardSize(65,65,65,65);
	Battle_SetSoul(battle_soul_red);
	audio_play_sound(snd_ding,2,false);
	RegularBlasterCircle(battle_board.x,battle_board.y,5,175,5,45,8,20,1,400);
}
if (_timer == 3650)
{
	audio_stop_sound(snd_chevalier);
}
if (_timer == 4120)
{
	with (battle_enemy_engage)
	{
		_head_sprite = spr_sans_head;
	}
	anotherTest = instance_create_depth(0,0,0,battle_dialog_enemy);
	anotherTest.text = "{font 3}{voice 3}{squish 1.2}{head 28}Heh...{pause}{clear}{head 27}Heheheh...{pause}{clear}{head 28}Man...{pause}{clear}{head 27}Would you believe me&if I said I put&everything I had into&that last attack?{pause}{clear}{head 22}Heh...{pause}{clear}{head 19}You really are&something, huh?{pause}{clear}{head 20}All these years I've&been obsessed with&being the best...{pause}{clear}{head 21}Failure wasn't even&close to being an&option for me.{pause}{clear}{head 23}I beat everyone I&encountered through&sheer skill alone.{pause}{clear}{head 27}And to think...{pause}{clear}...it took the might&of a human... to&finally best me in&combat...!{pause}{clear}{head 22}Alphys... Toriel...{pause}{clear}{head 21}It's been an honor...{pause}{clear}{head 22}I'm done.";
}
if (_timer > 4120)
{
	if !(instance_exists(anotherTest))
	{
		audio_play_sound(snd_chance,1,true);
		Battle_SetMenuDialog("* ...")
		Battle_EndTurn();
		global.finalstretch = 1;
		global.go_dodge="damage"
	}
}