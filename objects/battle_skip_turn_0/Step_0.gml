var horizontal_stab = ((battle_board.y-(battle_board.down+battle_board.right))-60)

var left_box = (battle_board.x-battle_board.left)-5;
var right_box = (battle_board.x+battle_board.right)+5;
var up_box = (battle_board.y-battle_board.up)-5;
var down_box = (battle_board.y+battle_board.down)+5;

var bottom_box = (battle_board.y+battle_board.down)-2;
var top_box = (battle_board.y-battle_board.up)+2;

if (room == room_battle)
{
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
	switch (global.sanstalk)
	{
		case 23:
		if (_timer == 10)
		{
			Battle_EndTurn();
		}
		break;
		case 22:
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
			anotherTest.text = "{font 3}{voice 3}{head 19}I guess...{pause}{clear}I used up all my magic&in that last attack...{pause}{clear}{head 20}...{pause}{clear}{head 23}...Why did you do&this?{pause}{clear}{head 22}You came all this&way... you have us&under your mercy.{pause}{clear}{head 21}Monsters were...&never as strong as&humans.{pause}{clear}{head 22}After all this time,&you return here to&finish what you humans&started.{pause}{clear}{head 23}You locked us&underground for ages.{pause}{clear}{head 20}You never showed&mercy then, so why&now?{pause}{clear}{head 22}...{pause}{clear}{head 28}Mweh heh heh...{pause}{clear}I... understand now...{pause}{clear}{head 27}You were waiting for&me to use all my&magic, then you strike.{pause}{clear}{head 28}Well go ahead.&Strike me down now.";
		}
		if (_timer > 4120)
		{
			if !(instance_exists(anotherTest))
			{
				audio_play_sound(snd_chance,1,true);
				Battle_SetMenuDialog("* ...")
				Battle_EndTurn();
				global.sanstalk++;
				global.finalstretch = 1;
				global.go_dodge="damage"
			}
		}
		break;
		case 21:
		if (_timer == 1)
		{
			Battle_SlamDown();
		    Battle_SetBoardSizeCubic(65,65,160,160);
			audio_play_sound(snd_impact,2,false);
			RegularBlaster(320,-50,420,top_box-100,270,270,270,1,4,2,50);
			RegularBlaster(320,-50,220,top_box-100,270,270,270,1,4,2,50);
		}
		if (_timer == 30)
		{
			RegularBoneWall(DIR.UP,20,1,150,left_box + 130,top_box,50,246,0,false);
			RegularBoneWall(DIR.DOWN,20,1,150,left_box + 200,bottom_box,50,246,0,false);
		}
		if (_timer > 70) and (_timer < 286) and (_timer % 26 == 0)
		{
			RegularBone(left_box + 155,top_box - 20,25,0,3,270,0,0,1,0,0,0,0,true);
			RegularBone(left_box + 175,top_box - 60,25,0,3,270,0,0,1,0,0,0,0,true);
			RegularBone(left_box + 135,top_box - 60,25,0,3,270,0,0,1,0,0,0,0,true);
		}
		if (_timer == 330)
		{
			RegularBone(right_box + 20,bottom_box,40,-3,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box + 35,bottom_box,50,-3,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box + 50,bottom_box,60,-3,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box + 65,bottom_box,70,-3,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box + 80,bottom_box,60,-3,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box + 95,bottom_box,50,-3,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box + 110,bottom_box,40,-3,0,0,0,0,1,0,0,0,0,true);
		}
		if (_timer == 370)
		{
			RegularBone(left_box - 20,bottom_box,40,3,0,0,0,0,1,0,0,0,0,true);
			RegularBone(left_box - 35,bottom_box,50,3,0,0,0,0,1,0,0,0,0,true);
			RegularBone(left_box - 50,bottom_box,60,3,0,0,0,0,1,0,0,0,0,true);
			RegularBone(left_box - 65,bottom_box,70,3,0,0,0,0,1,0,0,0,0,true);
			RegularBone(left_box - 80,bottom_box,60,3,0,0,0,0,1,0,0,0,0,true);
			RegularBone(left_box - 95,bottom_box,50,3,0,0,0,0,1,0,0,0,0,true);
			RegularBone(left_box - 110,bottom_box,40,3,0,0,0,0,1,0,0,0,0,true);
		}
		if (_timer == 410)
		{
			RegularBone(right_box + 20,bottom_box,60,-3,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box + 35,bottom_box,60,-3,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box + 20,top_box,60,-3,0,180,0,0,1,0,0,0,0,true);
			RegularBone(right_box + 35,top_box,60,-3,0,180,0,0,1,0,0,0,0,true);
		}
		if (_timer > 430) and (_timer < 630) and (_timer % 30 == 0)
		{
			RegularBone(right_box,bottom_box,25,-3,0,0,0,0,1,0,0,0,0,true);
		}
		if (_timer == 480)
		{
			RegularBlaster(320,-50,battle_soul.x,top_box-100,270,270,170,1,2,2,50);
		}
		if (_timer == 550)
		{
			RegularBlaster(320,-50,battle_soul.x,top_box-100,270,270,100,1,2,2,50);
		}
		if (_timer == 600)
		{
			Battle_SlamUp();
			audio_play_sound(snd_impact,2,false);
		}
		if (_timer > 600) and (_timer % 5 == 0)
		{
			RegularBone(right_box,top_box,25,-3,0,180,0,0,1,0,0,0,0,true);
		}
		if (_timer == 680)
		{
			Battle_SetSoul(battle_soul_red);
			audio_play_sound(snd_ding,2,false);
		}
		if (_timer == 650)
		{
			RegularBlaster(320,-50,right_box + 100,top_box + 70,180,180,50,1,2,2,50);
		}
		if (_timer == 750)
		{
			RegularBone(right_box + 20,bottom_box,60,-3,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box + 35,bottom_box,60,-3,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box + 20,top_box,60,-3,0,180,0,0,1,0,0,0,0,true);
			RegularBone(right_box + 35,top_box,60,-3,0,180,0,0,1,0,0,0,0,true);
			RegularBone(left_box - 20,bottom_box,60,3,0,0,0,0,1,0,0,0,0,true);
			RegularBone(left_box - 35,bottom_box,60,3,0,0,0,0,1,0,0,0,0,true);
			RegularBone(left_box - 20,top_box,60,3,0,180,0,0,1,0,0,0,0,true);
			RegularBone(left_box - 35,top_box,60,3,0,180,0,0,1,0,0,0,0,true);
		}
		if (_timer == 800)
		{
			RegularBone(right_box + 20,bottom_box,152,-3,0,0,1,0,1,0,0,0,0,true);
			RegularBone(right_box + 35,bottom_box,152,-3,0,0,1,0,1,0,0,0,0,true);
			RegularBone(left_box - 20,bottom_box,152,3,0,0,1,0,1,0,0,0,0,true);
			RegularBone(left_box - 35,bottom_box,152,3,0,0,1,0,1,0,0,0,0,true);
		}
		if (_timer == 900)
		{
			Battle_SetSoul(battle_soul_red);
			Battle_SetMenuDialog("* Sans flips a bone in mid-air.")
			Battle_EndTurn();
		}
		break;
		case 20:
		if (_timer == 1)
		{
			Battle_SetSoul(battle_soul_red);
		    Battle_SetBoardSizeCubic(65,65,130,130);
		}
		if (_timer == 50)
		{
			RegularBone(left_box - 30,down_box -5,82,3,0,0,0,0,1,0,0,0,0,true);
			RegularBone(left_box - 40,down_box -5,82,3,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box + 30,down_box -5,82,-3,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box + 40,down_box -5,82,-3,0,0,0,0,1,0,0,0,0,true);
		}
		if (_timer == 90)
		{
			RegularBone(left_box - 30,top_box,82,3,0,180,0,0,1,0,0,0,0,true);
			RegularBone(left_box - 40,top_box,82,3,0,180,0,0,1,0,0,0,0,true);
			RegularBone(right_box + 30,top_box,82,-3,0,180,0,0,1,0,0,0,0,true);
			RegularBone(right_box + 40,top_box,82,-3,0,180,0,0,1,0,0,0,0,true);
		}
		if (_timer == 130)
		{
			RegularBone(left_box,top_box,120,5,0,180,0,0,1,0,0,0,0,true);
			audio_play_sound(snd_stab,2,false);
		}
		if (_timer == 150)
		{
			RegularBoneWall(DIR.DOWN,280,25,40,left_box,bottom_box,50,999,0,false);
		}
		if (_timer == 230)
		{
			RegularBone(left_box,top_box,70,3,0,180,0,0,1,0,0,0,0,true);
			RegularBone(left_box,bottom_box,70,3,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box,top_box,70,-3,0,180,0,0,1,0,0,0,0,true);
			RegularBone(right_box,bottom_box,70,-3,0,0,0,0,1,0,0,0,0,true);
		}
		if (_timer == 280)
		{
			RegularBoneWall(DIR.UP,280,25,40,left_box,top_box,50,999,0,false);
			RegularBone(left_box,top_box,30,3,0,180,0,0,1,0,0,0,0,true);
			RegularBone(left_box,bottom_box,110,3,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box,top_box,30,-3,0,180,0,0,1,0,0,0,0,true);
			RegularBone(right_box,bottom_box,110,-3,0,0,0,0,1,0,0,0,0,true);
		}
		if (_timer > 280) and (_timer < 480) and (_timer % 40 == 0)
		{
			RegularBlaster(-50,-50,battle_soul.x,top_box - 70 ,270,270,30,5,1,2,40);
		}
		if (_timer > 520) and (_timer < 720) and (_timer % 30 == 0)
		{
			audio_play_sound(snd_pullback,2,false);
			RegularBone(left_box - 30,top_box + random_range(40,80),20,3,0,90,0,0,1,0,0,0,0,true);
			RegularBone(right_box + 30,top_box + random_range(40,80),20,-3,0,90,0,0,1,0,0,0,0,true);
		}
		if (_timer == 760)
		{
			Battle_SlamLeft();
		}
		if (_timer == 780)
		{
			RegularBone(left_box,bottom_box,152,0.5,0,0,0,0,1,0,0,0,0,true);
		}
		if (_timer == 800)
		{
			Battle_SetSoul(battle_soul_red);
			audio_play_sound(snd_ding,2,false);
		}
		if (_timer == 820)
		{
			RegularBone(right_box,top_box,80,-1.5,0,180,0,0,1,0,0,0,0,true);
			RegularBone(right_box + 40,bottom_box,80,-1.5,0,0,0,0,1,0,0,0,0,true);
		}
		if (_timer == 860)
		{
			RegularBone(right_box,top_box,60,-1.5,0,180,0,0,1,0,0,0,0,true);
			RegularBone(right_box + 10,top_box,70,-1.5,0,180,0,0,1,0,0,0,0,true);
			RegularBone(right_box + 20,top_box,80,-1.5,0,180,0,0,1,0,0,0,0,true);
			RegularBone(right_box + 30,top_box,90,-1.5,0,180,0,0,1,0,0,0,0,true);
			RegularBone(right_box + 50,bottom_box,60,-1.5,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box + 60,bottom_box,70,-1.5,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box + 70,bottom_box,80,-1.5,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box + 80,bottom_box,90,-1.5,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box + 90,bottom_box,152,-1.5,0,0,1,0,1,0,0,0,0,true);
		}
		if (_timer == 1070)
		{
			Battle_SlamRight();
			RegularBoneWall(DIR.RIGHT,180,14,20,right_box,top_box,50,999,0,false);
		}
		if (_timer == 1150)
		{
			Battle_SetSoul(battle_soul_red);
			Battle_SetMenuDialog("* It smells like bones in here.")
			Battle_EndTurn();
		}
		break;
		case 19:
		if (_timer == 1)
		{
			Battle_SetSoul(battle_soul_red);
		    Battle_SetBoardSizeCubic(65,65,130,130);
		}
		if (_timer > 50) and (_timer < 350)
		{
			if (_timer % 5 == 0)
			{
				RegularBone(left_box,top_box,60+sin(_timer*0.1)*30,5,0,180,0,0,1,0,0,0,0,true);
				RegularBone(left_box,down_box,60+sin(_timer*0.1)*-30,5,0,0,0,0,1,0,0,0,0,true);
			}
		}
		if (_timer == 370)
		{
			audio_play_sound(snd_impact,2,false);
			Battle_SlamLeft();
			RegularBoneWall(DIR.LEFT,140,12,70,left_box,top_box,50,180,0,false);
		}
		if (_timer == 380)
		{
			RegularBlaster(-50,-50,left_box + 80,top_box - 70 ,270,270,30,5,1,2,40);
		}
		if (_timer == 410)
		{
			RegularBlaster(-50,-50,left_box + 110,top_box - 70 ,270,270,30,5,1,2,40);
		}
		if (_timer == 440)
		{
			RegularBlaster(-50,-50,left_box + 140,top_box - 70 ,270,270,30,5,1,2,40);
		}
		if (_timer == 470)
		{
			RegularBlaster(-50,-50,left_box + 170,top_box - 70 ,270,270,30,5,1,2,40);
		}
		if (_timer == 500)
		{
			RegularBlaster(-50,-50,left_box + 200,top_box - 70 ,270,270,30,5,1,2,40);
		}
		if (_timer == 410)
		{
			Battle_SetSoul(battle_soul_red);
			audio_play_sound(snd_ding,2,false);
		}
		if (_timer > 550) and (_timer < 780) and (_timer % 60 == 0)
		{
			RegularBone(left_box,top_box,82,3,0,180,0,0,1,0,0,0,0,true);
			RegularBone(right_box,top_box,82,-3,0,180,0,0,1,0,0,0,0,true);
			RegularBone(left_box - 30,down_box,82,3,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box + 30,down_box,82,-3,0,0,0,0,1,0,0,0,0,true);
		}
		if (_timer == 800)
		{
		    Battle_SetBoardSizeCubic(65,65,65,65);
		}
		if (_timer == 820)
		{
			with (o_excmark)
			{
				image_index = 2;
			}
			instance_create_layer(left_box + 70, top_box + 65,"Instances",o_excmark);
			audio_play_sound(snd_bonewarn,2,false);
		}
		if (_timer == 860)
		{
			RegularBone(right_box + 110,top_box + 50,150,-6,0,90,0,0,1,0,0,0,0,true);
			RegularBone(right_box + 110,top_box + 60,150,-6,0,90,0,0,1,0,0,0,0,true);
			RegularBone(right_box + 110,top_box + 70,150,-6,0,90,0,0,1,0,0,0,0,true);
		}
		if (_timer == 890)
		{
			Battle_SetSoul(battle_soul_red);
			Battle_SetMenuDialog("* Sans stares you down.")
			Battle_EndTurn();
		}
		break;
		case 18:
		if (_timer == 1)
		{
			Battle_SetSoul(battle_soul_red);
		    Battle_SetBoardSizeCubic(65,65,65,65);
		}
		if (_timer > 20) and (_timer < 320) and (_timer % 30 == 0)
		{
			RegularBone(left_box,bottom_box,77,3,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box,top_box,77,-3,0,180,0,0,1,0,0,0,0,true);
		}
		if (_timer == 350)
		{
			with (o_excmark)
			{
				image_index = 0;
			}
			instance_create_layer(left_box + 70, top_box + 65,"Instances",o_excmark);
			audio_play_sound(snd_bonewarn,2,false);
		}
		if (_timer == 370)
		{
			RegularBone(left_box + 60,top_box - 80,77,0,7,180,0,0,1,0,0,0,0,true);
			RegularBone(left_box + 70,top_box - 80,77,0,7,180,0,0,1,0,0,0,0,true);
			RegularBone(left_box + 80,top_box - 80,77,0,7,180,0,0,1,0,0,0,0,true);
		}
		if (_timer > 400) and (_timer < 520) and (_timer % 30 == 0)
		{
			RegularBone(left_box,bottom_box,77,3,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box,top_box,77,-3,0,180,0,0,1,0,0,0,0,true);
		}
		if (_timer == 560)
		{
			with (o_excmark)
			{
				image_index = 2;
			}
			instance_create_layer(left_box + 70, top_box + 65,"Instances",o_excmark);
			audio_play_sound(snd_bonewarn,2,false);
		}
		if (_timer == 530)
		{
			RegularBlaster(-50,-50,left_box + 70,top_box - 80,270,270,30,5,2,2,50);
		}
		if (_timer == 580)
		{
			RegularBlaster(-50,-50,left_box + 10,top_box - 80,270,270,30,5,1,2,50);
			RegularBlaster(-50,-50,right_box - 10,top_box - 80,270,270,30,5,1,2,50);
		}
		if (_timer == 600)
		{
			RegularBone(left_box - 80,top_box + 50,77,7,0,90,0,0,1,0,0,0,0,true);
			RegularBone(left_box - 80,top_box + 60,77,7,0,90,0,0,1,0,0,0,0,true);
			RegularBone(left_box - 80,top_box + 70,77,7,0,90,0,0,1,0,0,0,0,true);
		}
		if (_timer == 730)
		{
			Battle_SetSoul(battle_soul_red);
			Battle_SetMenuDialog("* The beginning of the end.")
			Battle_EndTurn();
		}
		break;
		case 17:
		if (_timer == 1)
		{
			Battle_SetSoul(battle_soul_blue);
		    Battle_SetBoardSizeCubic(65,65,195,195);
		}
		if (_timer == 50)
		{
			RegularBone(left_box,bottom_box,50,3,0,0,0,0,1,0,0,0,0,true);
		}
		if (_timer == 80)
		{
			RegularBone(left_box,bottom_box,120,3,0,0,1,0,1,0,0,0,0,true);
		}
		if (_timer == 100)
		{
			RegularBone(left_box,bottom_box,50,3,0,0,0,0,1,0,0,0,0,true);
		}
		if (_timer == 130)
		{
			RegularBone(left_box,bottom_box,120,3,0,0,1,0,1,0,0,0,0,true);
		}
		if (_timer == 150)
		{
			RegularBone(left_box,bottom_box,50,3,0,0,0,0,1,0,0,0,0,true);
		}
		if (_timer == 180)
		{
			RegularBone(left_box,bottom_box,120,3,0,0,1,0,1,0,0,0,0,true);
		}
		if (_timer == 200)
		{
			RegularBone(left_box,bottom_box,50,3,0,0,0,0,1,0,0,0,0,true);
		}
		if (_timer == 230)
		{
			RegularBone(left_box,bottom_box,120,3,0,0,1,0,1,0,0,0,0,true);
		}
		if (_timer == 300)
		{
			RegularBone(left_box,bottom_box,20,3,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box,bottom_box,20,-3,0,0,0,0,1,0,0,0,0,true);
		}
		if (_timer == 310)
		{
			RegularBone(left_box,bottom_box,40,3,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box,bottom_box,40,-3,0,0,0,0,1,0,0,0,0,true);
		}
		if (_timer == 320)
		{
			RegularBone(left_box,bottom_box,60,3,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box,bottom_box,60,-3,0,0,0,0,1,0,0,0,0,true);
		}
		if (_timer == 330)
		{
			RegularBone(left_box,bottom_box,80,3,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box,bottom_box,80,-3,0,0,0,0,1,0,0,0,0,true);
		}
		if (_timer == 350)
		{
			RegularBlaster(-50,-50,left_box - 60,top_box + 60,0,0,50,15,2,2,30);
			RegularBlaster(-50,-50,right_box + 60,top_box + 60,180,180,50,15,2,2,30);
		}
		if (_timer == 470)
		{
			audio_play_sound(snd_impact,2,false);
			Battle_SlamUp();
			RegularBoneWall(DIR.UP,420,37,70,left_box,top_box,50,30,0,false);
		}
		if (_timer == 530)
		{
			audio_play_sound(snd_impact,2,false);
			Battle_SlamDown();
		}
		if (_timer == 550)
		{
			RegularBone(left_box,bottom_box,84,3,0,0,0,0,1,0,0,0,0,true);
			RegularBone(left_box,top_box,44,3,0,180,0,0,1,0,0,0,0,true);
			RegularBone(right_box,bottom_box,84,-3,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box,top_box,44,-3,0,180,0,0,1,0,0,0,0,true);
		}
		if (_timer == 600)
		{
			RegularBone(left_box,bottom_box,64,3,0,0,0,0,1,0,0,0,0,true);
			RegularBone(left_box,top_box,64,3,0,180,0,0,1,0,0,0,0,true);
			RegularBone(right_box,bottom_box,64,-3,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box,top_box,64,-3,0,180,0,0,1,0,0,0,0,true);
		}
		if (_timer == 650)
		{
			RegularBone(left_box,bottom_box,44,3,0,0,0,0,1,0,0,0,0,true);
			RegularBone(left_box,top_box,84,3,0,180,0,0,1,0,0,0,0,true);
			RegularBone(right_box,bottom_box,44,-3,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box,top_box,84,-3,0,180,0,0,1,0,0,0,0,true);
		}
		if (_timer == 750)
		{
			Battle_SetSoul(battle_soul_red);
			Battle_SetMenuDialog("* The Knight has appeared.")
			Battle_EndTurn();
		}
		break;
		case 16:
		if (_timer == 1)
		{
			Battle_SetSoul(battle_soul_blue);
		    Battle_SetBoardSizeCubic(65,65,90,90);
		}
		if (_timer > 20) and (_timer % 20 == 0) and (_timer < 420)
		{
			makeplatform(left_box-50,top_box+100,60,3,0,true,0);
		}
		if (_timer > 50) and (_timer % 5 == 0) and (_timer < 420)
		{
			RegularBone(left_box,bottom_box,25,3,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box - 5,bottom_box + 10,25,0,-3,90,0,0,1,0,0,0,0,true);
		}
		if (_timer > 150) and (_timer < 160)
		{
			if (_timer % 4 ==0)
			{
		        RegularBone(left_box,bottom_box - 30,60,2,0,0,0,0,1,0,0,0,0,true);
				RegularBone(left_box,bottom_box - 30,60,2,0,0,0,0,1,0,0,0,0,true);
				RegularBone(right_box,top_box,50,-3,0,180,0,0,1,0,0,0,0,true);
				RegularBone(right_box,top_box,50,-3,0,180,0,0,1,0,0,0,0,true);
			}
		}
		if (_timer > 200) and (_timer < 210)
		{
			if (_timer % 4 ==0)
			{
		        RegularBone(left_box,bottom_box - 30,60,2,0,0,0,0,1,0,0,0,0,true);
				RegularBone(left_box,bottom_box - 30,60,2,0,0,0,0,1,0,0,0,0,true);
				RegularBone(right_box,top_box,50,-3,0,180,0,0,1,0,0,0,0,true);
				RegularBone(right_box,top_box,50,-3,0,180,0,0,1,0,0,0,0,true);
			}
		}
		if (_timer > 250) and (_timer < 260)
		{
			if (_timer % 4 ==0)
			{
		        RegularBone(left_box,bottom_box - 30,60,2,0,0,0,0,1,0,0,0,0,true);
				RegularBone(left_box,bottom_box - 30,60,2,0,0,0,0,1,0,0,0,0,true);
				RegularBone(right_box,top_box,50,-3,0,180,0,0,1,0,0,0,0,true);
				RegularBone(right_box,top_box,50,-3,0,180,0,0,1,0,0,0,0,true);
			}
		}
		if (_timer > 300) and (_timer < 310)
		{
			if (_timer % 4 ==0)
			{
		        RegularBone(left_box,bottom_box - 30,60,2,0,0,0,0,1,0,0,0,0,true);
				RegularBone(left_box,bottom_box - 30,60,2,0,0,0,0,1,0,0,0,0,true);
				RegularBone(right_box,top_box,50,-3,0,180,0,0,1,0,0,0,0,true);
				RegularBone(right_box,top_box,50,-3,0,180,0,0,1,0,0,0,0,true);
			}
		}
		if (_timer > 350) and (_timer < 360)
		{
			if (_timer % 4 ==0)
			{
		        RegularBone(left_box,bottom_box - 30,60,2,0,0,0,0,1,0,0,0,0,true);
				RegularBone(left_box,bottom_box - 30,60,2,0,0,0,0,1,0,0,0,0,true);
				RegularBone(right_box,top_box,50,-3,0,180,0,0,1,0,0,0,0,true);
				RegularBone(right_box,top_box,50,-3,0,180,0,0,1,0,0,0,0,true);
			}
		}
		if (_timer > 400) and (_timer < 410)
		{
			if (_timer % 4 ==0)
			{
		        RegularBone(left_box,bottom_box - 30,60,2,0,0,0,0,1,0,0,0,0,true);
				RegularBone(left_box,bottom_box - 30,60,2,0,0,0,0,1,0,0,0,0,true);
				RegularBone(right_box,top_box,50,-3,0,180,0,0,1,0,0,0,0,true);
				RegularBone(right_box,top_box,50,-3,0,180,0,0,1,0,0,0,0,true);
			}
		}
		if (_timer == 500)
		{
			Battle_SetSoul(battle_soul_red);
			audio_play_sound(snd_ding,2,false);
			Battle_SetBoardSizeCubic(65,65,65,65);
			RegularBlaster(320,-50,320,top_box-100,270,270,20,20,2,2,50);
			RegularBlaster(-50,battle_board.y,left_box-100,battle_board.y,0,0,20,20,2,2,50);
			RegularBlaster(690,battle_board.y,right_box+100,battle_board.y,180,180,20,20,2,2,50);
			RegularBlaster(320,540,320,bottom_box+100,90,90,20,20,2,2,50);
	
			Anim_Create(battle_board,"angle",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,0,45,90);
		}
		if (_timer == 700)
		{
			Battle_SetSoul(battle_soul_red);
			Anim_Create(battle_board,"angle",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,45,-45,90);
			Battle_SetMenuDialog("* No way out.")
			Battle_EndTurn();
		}
		break;
		case 15:
		if (_timer == 1)
		{
			Battle_SlamDown();
		    Battle_SetBoardSizeCubic(65,65,170,170);
			audio_play_sound(snd_impact,2,false);
		}
		if (_timer > 0) and (_timer < 300) and (_timer % 90 == 0)
		{
			RegularBlaster(-50,-50,battle_soul.x,top_box - 80,270,270,10,20,2,2,50);
		}
		if (_timer == 50)
		{
			RegularBone(left_box,bottom_box,62,3,0,0,0,0,1,0,0,0,0,true);
			RegularBone(left_box,top_box,62,3,0,180,0,0,1,0,0,0,0,true);
			RegularBone(right_box,bottom_box,62,-2,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box,top_box,62,-2,0,180,0,0,1,0,0,0,0,true);
		}
		if (_timer == 150)
		{
			RegularBone(left_box,bottom_box,42,3,0,0,0,0,1,0,0,0,0,true);
			RegularBone(left_box,top_box,82,3,0,180,0,0,1,0,0,0,0,true);
			RegularBone(right_box,bottom_box,42,-2,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box,top_box,82,-2,0,180,0,0,1,0,0,0,0,true);
		}
		if (_timer == 250)
		{
			RegularBone(left_box,bottom_box,82,2,0,0,0,0,1,0,0,0,0,true);
			RegularBone(left_box,top_box,42,2,0,180,0,0,1,0,0,0,0,true);
			RegularBone(right_box,bottom_box,82,-3,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box,top_box,42,-3,0,180,0,0,1,0,0,0,0,true);
		}
		if (_timer == 350)
		{
			RegularBoneWall(DIR.UP,370,31,95,left_box,top_box,50,400,0,false);
		}
		if (_timer > 400) and (_timer < 750) and (_timer % 40 == 0)
		{
			audio_play_sound(snd_stab,2,false);
			RegularBone(left_box,bottom_box - 18,24,4,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box,bottom_box,24,-4,0,0,0,0,1,0,0,0,0,true);
		}
		if (_timer == 750)
		{
			RegularBlaster(320,-50,left_box - 50,battle_soul.y,0,0,10,20,2,2,50);
			RegularBlaster(320,-50,right_box + 50,battle_soul.y,180,180,10,20,2,2,50);
		}

		if (_timer == 900)
		{
			Battle_SetSoul(battle_soul_red);
			Battle_SetMenuDialog("* He doesn't look happy.")
			Battle_EndTurn();
		}
		break;
		case 14:
		if (_timer == 1)
		{
			Battle_SlamDown();
			Battle_SetBoardSizeCubic(65,65,220,220);
			audio_play_sound(snd_impact,2,false);
		}
		if (_timer > 0) and (_timer < 580) and (_timer % 50 == 0)
		{
			RegularBone(left_box,bottom_box,24,4,0,0,0,0,1,0,0,0,0,true);
		}
		if (_timer > 0) and (_timer < 580) and (_timer % 50 == 0)
		{
			RegularBone(right_box,top_box,24,-4,0,180,0,0,1,0,0,0,0,true);
		}
		if (_timer > 0) and (_timer < 580) and (_timer % 150 == 0)
		{
			RegularBlaster(320,-50,battle_soul.x,top_box-100,270,270,10,20,2,2,50);
		}
		if (_timer > 0) and (_timer < 580) and (_timer % 150 == 0)
		{
			RegularBlaster(320,-50,left_box - 50,battle_soul.y,0,0,10,20,2,2,50);
		}
		if (_timer == 580)
		{
			Battle_SetBoardSizeCubic(65,65,110,110);
		}
		if (_timer > 650) and (_timer < 1150) and (_timer % 60 == 0)
		{
			RegularBone(left_box + 120,bottom_box + 30,24,0,-2,0,0,0,1,0,0,0,0,true);
		}
		if (_timer > 650) and (_timer < 1150) and (_timer % 70 == 0)
		{
			RegularBone(left_box,bottom_box,24,2,0,0,0,0,1,0,0,0,0,true);
		}
		if (_timer == 650)
		{
			with (o_smaaash)
			{
				audio_play_sound(snd_smash_rise,2,0);
				_ready = true;
			}
		}
		if (_timer > 650) and (_timer % 90 == 0)
		{
			bluddy = random_range(0,1);
		}
		if (bluddy < 0.5) and (bluddy >= 0)
		{
			if (_timer > 650) and (_timer < 1150) and (_timer % 90 == 0)
			{
				RegularBone(left_box + random_range(0,80),top_box - 20,random_range(24,48),0,random_range(2,5),random_range(0,360),0,0,1,0,0,0,0,true);
				RegularBone(left_box + random_range(0,80),top_box - 20,random_range(24,48),0,random_range(2,5),random_range(0,360),0,0,1,0,0,0,0,true);
				RegularBone(left_box + random_range(0,00),top_box - 20,random_range(24,48),0,random_range(2,5),random_range(0,360),0,0,1,0,0,0,0,true);
				RegularBone(left_box + random_range(0,80),top_box - 20,random_range(24,48),0,random_range(2,5),random_range(0,360),0,0,1,0,0,0,0,true);
				RegularBone(left_box + random_range(0,80),top_box - 20,random_range(24,48),0,random_range(2,5),random_range(0,360),0,0,1,0,0,0,0,true);
				RegularBone(left_box + random_range(0,80),top_box - 20,random_range(24,48),0,random_range(2,5),random_range(0,360),0,0,1,0,0,0,0,true);
				RegularBone(left_box + random_range(0,80),top_box - 20,random_range(24,48),0,random_range(2,5),random_range(0,360),0,0,1,0,0,0,0,true);
				RegularBone(left_box + random_range(0,80),top_box - 20,random_range(24,48),0,random_range(2,5),random_range(0,360),0,0,1,0,0,0,0,true);
				RegularBone(left_box + random_range(0,80),top_box - 20,random_range(24,48),0,random_range(2,5),random_range(0,360),0,0,1,0,0,0,0,true);
			}
			}
		if (bluddy > 0.5) and (bluddy <= 1)
		{
			if (_timer > 650) and (_timer < 1150) and (_timer % 90 == 0)
			{
		
				RegularBone(right_box - random_range(0,80),top_box - 20,random_range(24,48),0,random_range(2,5),random_range(0,360),0,0,1,0,0,0,0,true);
				RegularBone(right_box - random_range(0,80),top_box - 20,random_range(24,48),0,random_range(2,5),random_range(0,360),0,0,1,0,0,0,0,true);
				RegularBone(right_box - random_range(0,80),top_box - 20,random_range(24,48),0,random_range(2,5),random_range(0,360),0,0,1,0,0,0,0,true);
				RegularBone(right_box - random_range(0,80),top_box - 20,random_range(24,48),0,random_range(2,5),random_range(0,360),0,0,1,0,0,0,0,true);
				RegularBone(right_box - random_range(0,80),top_box - 20,random_range(24,48),0,random_range(2,5),random_range(0,360),0,0,1,0,0,0,0,true);
				RegularBone(right_box - random_range(0,80),top_box - 20,random_range(24,48),0,random_range(2,5),random_range(0,360),0,0,1,0,0,0,0,true);
				RegularBone(right_box - random_range(0,80),top_box - 20,random_range(24,48),0,random_range(2,5),random_range(0,360),0,0,1,0,0,0,0,true);
				RegularBone(right_box - random_range(0,80),top_box - 20,random_range(24,48),0,random_range(2,5),random_range(0,360),0,0,1,0,0,0,0,true);
				RegularBone(right_box - random_range(0,80),top_box - 20,random_range(24,48),0,random_range(2,5),random_range(0,360),0,0,1,0,0,0,0,true);
			}
		}
		if (_timer == 1150)
		{
			with (o_smaaash)
			{
				_ready = false;
			}
			anotherTest = instance_create_depth(0,0,0,battle_dialog_enemy);
			anotherTest.text = "{font 3}{voice 3}{squish 1.2}there's no&justification for&what you have done.";
		}
		if (_timer > 1150)
		{
			if !(instance_exists(anotherTest))
			{
				Battle_SetSoul(battle_soul_red);
				Battle_SetMenuDialog("* He's preparing something.")
				Battle_EndTurn();
			}
		}
		break;
		case 13:
		if (_timer = 1)
		{
		    Battle_SetBoardSizeCubic(65,65,110,110);
			Battle_SetSoul(battle_soul_red);
		}
		if (_timer == 40)
		{
			RegularBone(left_box,bottom_box,104,4,0,0,0,0,1,0,0,0,0,true);
		}
		if (_timer == 45)
		{
			RegularBone(left_box,bottom_box,104,4,0,0,0,0,1,0,0,0,0,true);
		}
		if (_timer == 60)
		{
			RegularBone(right_box,top_box,104,-4,0,180,0,0,1,0,0,0,0,true);
		}
		if (_timer == 65)
		{
			RegularBone(right_box,top_box,104,-4,0,180,0,0,1,0,0,0,0,true);
		}
		if (_timer == 85)
		{
			RegularBone(right_box,top_box,26,-4,0,180,0,0,1,0,0,0,0,true);
			RegularBone(left_box,top_box,26,4,0,180,0,0,1,0,0,0,0,true);
			RegularBone(right_box,bottom_box,104,-4,0,0,0,0,1,0,0,0,0,true);
			RegularBone(left_box,bottom_box,104,4,0,0,0,0,1,0,0,0,0,true);
		}
		if (_timer == 115)
		{
			RegularBone(right_box,top_box,104,-4,0,180,0,0,1,0,0,0,0,true);
			RegularBone(left_box,top_box,104,4,0,180,0,0,1,0,0,0,0,true);
			RegularBone(right_box,bottom_box,26,-4,0,0,0,0,1,0,0,0,0,true);
			RegularBone(left_box,bottom_box,26,4,0,0,0,0,1,0,0,0,0,true);
		}
		if (_timer > 135) and (_timer < 190)
		{
			if (_timer % 15 == 0)
			{
				RegularBone(right_box,bottom_box,104,-4,0,0,0,0,1,0,0,0,0,true);
			    RegularBone(left_box,bottom_box,104,4,0,0,0,0,1,0,0,0,0,true);
			}
		}
		if (_timer == 215)
		{
		    Battle_SetBoardSizeCubic(65,65,150,150);
			Battle_SlamDown();
			audio_play_sound(snd_impact,2,0);
		}
		if (_timer == 230)
		{
			RegularBone(right_box,top_box,60,-4,0,180,0,0,1,0,0,0,0,true);
			RegularBone(right_box,bottom_box,60,-4,0,0,0,0,1,0,0,0,0,true);
		}
		if (_timer == 235)
		{
			RegularBone(right_box,top_box,60,-4,0,180,0,0,1,0,0,0,0,true);
			RegularBone(right_box,bottom_box,60,-4,0,0,0,0,1,0,0,0,0,true);
		}
		if (_timer == 250)
		{
			RegularBone(left_box,bottom_box,30,3,0,0,0,0,1,0,0,0,0,true);
		}
		if (_timer == 260)
		{
			RegularBone(left_box,bottom_box,60,3,0,0,0,0,1,0,0,0,0,true);
		}
		if (_timer == 270)
		{
			RegularBone(left_box,bottom_box,90,3,0,0,0,0,1,0,0,0,0,true);
		}
		if (_timer == 280)
		{
			RegularBone(left_box,bottom_box,60,3,0,0,0,0,1,0,0,0,0,true);
		}
		if (_timer == 290)
		{
			RegularBone(left_box,bottom_box,30,3,0,0,0,0,1,0,0,0,0,true);
		}

		if (_timer == 350)
		{
			RegularBone(right_box,bottom_box,94,-4,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box,top_box,31,-4,0,180,0,0,1,0,0,0,0,true);
		}
		if (_timer == 350)
		{
			RegularBlaster(320,-50,320,top_box-100,270,270,20,20,2,2,50);
			RegularBlaster(320,-50,200,top_box-100,270,270,20,20,2,2,50);
			RegularBlaster(320,-50,440,top_box-100,270,270,20,20,2,2,50);
		}
		if (_timer == 355)
		{
			RegularBone(right_box,bottom_box,74,-4,0,0,0,0,1,0,0,0,0,true);
		}
		if (_timer == 360)
		{
			RegularBone(right_box,bottom_box,54,-4,0,0,0,0,1,0,0,0,0,true);
		}
		if (_timer == 365)
		{
			RegularBone(right_box,bottom_box,34,-4,0,0,0,0,1,0,0,0,0,true);
		}
		if (_timer == 375)
		{
			RegularBone(left_box,top_box,104,4,0,180,0,0,1,0,0,0,0,true);
		}
		if (_timer == 380)
		{
			RegularBone(left_box,top_box,104,4,0,180,0,0,1,0,0,0,0,true);
		}
		if (_timer == 385)
		{
			RegularBone(left_box,top_box,104,4,0,180,0,0,1,0,0,0,0,true);
		}
		if (_timer == 390)
		{
			RegularBone(right_box,bottom_box,44,-3,0,0,1,0,1,0,0,0,0,true);
		}
		if (_timer == 395)
		{
			RegularBone(right_box,bottom_box,44,-3,0,0,1,0,1,0,0,0,0,true);
		}
		if (_timer == 400)
		{
			RegularBone(right_box,bottom_box,44,-3,0,0,1,0,1,0,0,0,0,true);
		}
		if (_timer > 500) and (_timer < 560) and (_timer % 10 == 0)
		{
			RegularBone(left_box,bottom_box,70,4,0,0,0,0,1,0,0,0,0,true);
		}
		if (_timer == 650)
		{
		    Battle_SetBoardSizeCubic(65,65,65,65);
		}
		if (_timer > 650) and (_timer % 40 == 0) and (_timer < 1000)
		{
			RegularBone(left_box,bottom_box,33,4,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box,top_box,117,-4,0,180,0,0,1,0,0,0,0,true);
		}
		if (_timer == 1000)	
		{
			Battle_SetSoul(battle_soul_red);
			Battle_SetMenuDialog("* Sans gives you an enraged&  stare.")
			Battle_EndTurn();
		}
		break;
		case 12:
		if (_timer) = 1
		{
			Battle_SetSoul(battle_soul_blue);
			audio_play_sound(snd_bell,2,0);
		}
		if (_timer > 40) and (_timer < 50)
		{
			if (_timer % 3 ==0)
			{
				RegularBone(left_box,bottom_box,24,4,0,0,0,0,1,0,0,0,0,true);
				RegularBone(left_box,top_box,104,4,0,180,0,0,1,0,0,0,0,true);
				RegularBone(right_box,bottom_box,24,-4,0,0,0,0,1,0,0,0,0,true);
				RegularBone(right_box,top_box,104,-4,0,180,0,0,1,0,0,0,0,true);
			}
		}
		if (_timer > 80) and (_timer < 90)
		{
			if (_timer % 3 ==0)
			{
				RegularBone(left_box,bottom_box,24,4,0,0,0,0,1,0,0,0,0,true);
				RegularBone(left_box,top_box,104,4,0,180,0,0,1,0,0,0,0,true);
				RegularBone(right_box,bottom_box,24,-4,0,0,0,0,1,0,0,0,0,true);
				RegularBone(right_box,top_box,104,-4,0,180,0,0,1,0,0,0,0,true);
			}
		}

		if (_timer > 120) and (_timer < 130)
		{
			if (_timer % 3 ==0)
			{
				RegularBone(left_box,bottom_box,24,4,0,0,0,0,1,0,0,0,0,true);
				RegularBone(left_box,top_box,104,4,0,180,0,0,1,0,0,0,0,true);
				RegularBone(right_box,bottom_box,24,-4,0,0,0,0,1,0,0,0,0,true);
				RegularBone(right_box,top_box,104,-4,0,180,0,0,1,0,0,0,0,true);
			}
		}

		if (_timer > 160) and (_timer < 170)
		{
			if (_timer % 3 ==0)
			{
				RegularBone(left_box,bottom_box,24,4,0,0,0,0,1,0,0,0,0,true);
				RegularBone(left_box,top_box,104,4,0,180,0,0,1,0,0,0,0,true);
				RegularBone(right_box,bottom_box,24,-4,0,0,0,0,1,0,0,0,0,true);
				RegularBone(right_box,top_box,104,-4,0,180,0,0,1,0,0,0,0,true);
			}
		}
		if (_timer) = 170
		{
			Battle_SetSoul(battle_soul_red);
			audio_play_sound(snd_bell,2,0);
		}
		if (_timer) = 170
		{
			RegularBlaster(320,-50,320,top_box-100,270,270,20,1,2,2,50);
			RegularBlaster(320,-50,400,top_box-100,275,245,20,1,2,2,50);
			RegularBlaster(320,-50,240,top_box-100,265,295,20,1,2,2,50);
		}
		if (_timer) = 250
		{
		    Battle_SetBoardSizeCubic(80,65,270,-100);
		}
		if (_timer) > 270 and (_timer < 600)
		{
			if (_timer % 30 == 0)
			{
				audio_play_sound(snd_stab,2,0);
				RegularBone(left_box,top_box,90,4,0,180,0,0,1,0,0,0,0,true);
				RegularBone(right_box,bottom_box,90,-4,0,0,0,0,1,0,0,0,0,true);
			}
		}
		if (_timer = 570)
		{
			RegularBlaster(320,-50,right_box + 100,top_box + 70,180,180,20,1,2,2,50);
			RegularBlaster(320,-50,50,top_box - 70,270,270,20,1,1,2,50);
			RegularBlaster(320,-50,220,top_box - 70,270,270,20,1,1,2,50);
		}
		if (_timer = 670)
		{
		    Battle_SetBoardSizeCubic(65,65,65,65);
		}
		if (_timer = 700)
		{
			Battle_SlamDown()
			RegularBoneWall(DIR.DOWN,200,18,20,230,bottom_box,50,250,0,false);
		}
		if (_timer = 760)
		{
			Battle_SlamUp()
			RegularBoneWall(DIR.UP,200,18,20,230,top_box,50,190,0,false);
		}
		if (_timer = 820)
		{
			Battle_SetSoul(battle_soul_red);
			audio_play_sound(snd_bell,2,0);
			RegularBlaster(320,-50,320,top_box-100,270,270,20,20,2,2,50);
			RegularBlaster(-50,battle_board.y,left_box-100,battle_board.y,0,0,20,20,2,2,50);
			RegularBlaster(690,battle_board.y,right_box+100,battle_board.y,180,180,20,20,2,2,50);
			RegularBlaster(320,540,320,bottom_box+100,90,90,20,20,2,2,50);
		}

		if (_timer == 1000)
		{
			Battle_SetSoul(battle_soul_red);
			Battle_SetMenuDialog("* Smells like bones.")
			Battle_EndTurn();
		}
		break;
		case 11:
			if (_timer == 5)
		{
			Battle_SetSoul(battle_soul_red);
			audio_play_sound(snd_ding,2,0);
			Battle_SetBoardSizeCubic(65,65,195,195);
		}
		if (_timer > 0) and (_timer < 515)
		{
			if (_timer % 70 == 0)
			{
				var gbX = random_range(150,640-150);
				var gbY = top_box - 80;
				var gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
				RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,2,2,50);
			}
			if (_timer % 70 == 0)
			{
				var gbX = random_range(150,640-150);
				var gbY = top_box - 80;
				var gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
				RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,2,2,50);
			}
			if (_timer % 70 == 0)
			{
				var gbX = random_range(150,640-150);
				var gbY = top_box - 80;
				var gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
				RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,2,2,50);
			}
			if (_timer % 70 == 0)
			{
				var gbX = random_range(150,640-150);
				var gbY = top_box - 80;
				var gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
				RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,2,2,50);
			}
			if (_timer % 70 == 0)
			{
				var gbX = random_range(150,640-150);
				var gbY = top_box - 80;
				var gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
				RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,2,2,50);
			}
			if (_timer == 165)
			{
				Battle_SetBoardSizeCubic(65,65,169,169);
			}
			if (_timer == 235)
			{
				Battle_SetBoardSizeCubic(65,65,143,143);
			}
			if (_timer == 305)
			{
				Battle_SetBoardSizeCubic(65,65,117,117);
			}
			if (_timer == 375)
			{
				Battle_SetBoardSizeCubic(65,65,91,91);
			}
			if (_timer == 445)
			{
				Battle_SetBoardSizeCubic(65,65,65,65);
			}
			if (_timer == 515)
			{
				Battle_SetBoardSizeCubic(65,65,39,39);
			}
		}
		if (_timer == 650)
		{
			Battle_SetSoul(battle_soul_red);
			Battle_EndTurn();
		}
		break;
		case 10:
		if (_timer == 5)
		{
			Battle_SetSoul(battle_soul_red);
			audio_play_sound(snd_ding,2,0);
			Battle_SetBoardSizeCubic(65,65,65,65);
		}
		if (_timer % 40 == 0) and (_timer >  10)
		{
			RegularBone(left_box,bottom_box,80,1,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box,top_box,80,-1,0,180,0,0,1,0,0,0,0,true);
		}
		if (_timer == 60)
		{
			RegularBoneWall(DIR.UP,200,18,80,230,top_box,50,50,0,false);
		}
		if (_timer == 160)
		{
			RegularBoneWall(DIR.DOWN,200,18,80,230,bottom_box,50,50,0,false);
		}
		if (_timer == 260)
		{
			RegularBoneWall(DIR.UP,200,18,80,230,top_box,50,50,0,false);
		}
		if (_timer == 360)
		{
			RegularBoneWall(DIR.DOWN,200,18,80,230,bottom_box,50,50,0,false);
		}
		if (_timer == 460)
		{
			RegularBoneWall(DIR.UP,200,18,80,230,top_box,50,50,0,false);
		}
		if (_timer == 560)
		{
			RegularBoneWall(DIR.DOWN,200,18,80,230,bottom_box,50,50,0,false);
		}
		if (_timer == 620)
		{
			Battle_EndTurn();
		}
		break;
		case 9:
		if (_timer == 5)
		{
			Battle_SetSoul(battle_soul_red);
			audio_play_sound(snd_ding,2,0);
			Battle_SetBoardSizeCubic(65,65,195,195);
		}
		if (_timer > 0) and (_timer < 515)
		{
			if (_timer % 70 == 0)
			{
				var gbX = random_range(150,640-150);
				var gbY = top_box - 80;
				var gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
				RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,2,2,50);
			}
			if (_timer % 70 == 0)
			{
				var gbX = random_range(150,640-150);
				var gbY = top_box - 80;
				var gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
				RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,2,2,50);
			}
			if (_timer % 70 == 0)
			{
				var gbX = random_range(150,640-150);
				var gbY = top_box - 80;
				var gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
				RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,2,2,50);
			}
			if (_timer % 70 == 0)
			{
				var gbX = random_range(150,640-150);
				var gbY = top_box - 80;
				var gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
				RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,2,2,50);
			}
			if (_timer % 70 == 0)
			{
				var gbX = random_range(150,640-150);
				var gbY = top_box - 80;
				var gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
				RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,2,2,50);
			}
			if (_timer == 165)
			{
				Battle_SetBoardSizeCubic(65,65,169,169);
			}
			if (_timer == 235)
			{
				Battle_SetBoardSizeCubic(65,65,143,143);
			}
			if (_timer == 305)
			{
				Battle_SetBoardSizeCubic(65,65,117,117);
			}
			if (_timer == 375)
			{
				Battle_SetBoardSizeCubic(65,65,91,91);
			}
			if (_timer == 445)
			{
				Battle_SetBoardSizeCubic(65,65,65,65);
			}
			if (_timer == 515)
			{
				Battle_SetBoardSizeCubic(65,65,39,39);
			}
		}
		if (_timer == 650)
		{
			Battle_SetSoul(battle_soul_red);
			Battle_EndTurn();
		}
		break;
		case 8:
		if (_timer == 5)
		{
			Battle_SetSoul(battle_soul_red);
			audio_play_sound(snd_ding,2,0);
			Battle_SetBoardSizeCubic(65,65,65,65);
		}
		if (_timer % 40 == 0) and (_timer >  10)
		{
			RegularBone(left_box,bottom_box,80,1,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box,top_box,80,-1,0,180,0,0,1,0,0,0,0,true);
		}
		if (_timer == 60)
		{
			RegularBoneWall(DIR.UP,200,18,80,230,top_box,50,50,0,false);
		}
		if (_timer == 160)
		{
			RegularBoneWall(DIR.DOWN,200,18,80,230,bottom_box,50,50,0,false);
		}
		if (_timer == 260)
		{
			RegularBoneWall(DIR.UP,200,18,80,230,top_box,50,50,0,false);
		}
		if (_timer == 360)
		{
			RegularBoneWall(DIR.DOWN,200,18,80,230,bottom_box,50,50,0,false);
		}
		if (_timer == 460)
		{
			RegularBoneWall(DIR.UP,200,18,80,230,top_box,50,50,0,false);
		}
		if (_timer == 560)
		{
			RegularBoneWall(DIR.DOWN,200,18,80,230,bottom_box,50,50,0,false);
		}
		if (_timer == 620)
		{
			Battle_EndTurn();
		}
		break;
		case 7:
		if (_timer == 5)
		{
			Battle_SetSoul(battle_soul_red);
			audio_play_sound(snd_ding,2,0);
			Battle_SetBoardSizeCubic(65,65,195,195);
		}
		if (_timer > 0) and (_timer < 515)
		{
			if (_timer % 70 == 0)
			{
				var gbX = random_range(150,640-150);
				var gbY = top_box - 80;
				var gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
				RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,2,2,50);
			}
			if (_timer % 70 == 0)
			{
				var gbX = random_range(150,640-150);
				var gbY = top_box - 80;
				var gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
				RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,2,2,50);
			}
			if (_timer % 70 == 0)
			{
				var gbX = random_range(150,640-150);
				var gbY = top_box - 80;
				var gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
				RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,2,2,50);
			}
			if (_timer % 70 == 0)
			{
				var gbX = random_range(150,640-150);
				var gbY = top_box - 80;
				var gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
				RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,2,2,50);
			}
			if (_timer % 70 == 0)
			{
				var gbX = random_range(150,640-150);
				var gbY = top_box - 80;
				var gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
				RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,2,2,50);
			}
			if (_timer == 165)
			{
				Battle_SetBoardSizeCubic(65,65,169,169);
			}
			if (_timer == 235)
			{
				Battle_SetBoardSizeCubic(65,65,143,143);
			}
			if (_timer == 305)
			{
				Battle_SetBoardSizeCubic(65,65,117,117);
			}
			if (_timer == 375)
			{
				Battle_SetBoardSizeCubic(65,65,91,91);
			}
			if (_timer == 445)
			{
				Battle_SetBoardSizeCubic(65,65,65,65);
			}
			if (_timer == 515)
			{
				Battle_SetBoardSizeCubic(65,65,39,39);
			}
		}
		if (_timer == 650)
		{
			Battle_SetSoul(battle_soul_red);
			Battle_EndTurn();
		}
		break;
		case 6:
		if (_timer == 5)
		{
			Battle_SetSoul(battle_soul_red);
			audio_play_sound(snd_ding,2,0);
			Battle_SetBoardSizeCubic(65,65,65,65);
		}
		if (_timer % 40 == 0) and (_timer >  10)
		{
			RegularBone(left_box,bottom_box,80,1,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box,top_box,80,-1,0,180,0,0,1,0,0,0,0,true);
		}
		if (_timer == 60)
		{
			RegularBoneWall(DIR.UP,200,18,80,230,top_box,50,50,0,false);
		}
		if (_timer == 160)
		{
			RegularBoneWall(DIR.DOWN,200,18,80,230,bottom_box,50,50,0,false);
		}
		if (_timer == 260)
		{
			RegularBoneWall(DIR.UP,200,18,80,230,top_box,50,50,0,false);
		}
		if (_timer == 360)
		{
			RegularBoneWall(DIR.DOWN,200,18,80,230,bottom_box,50,50,0,false);
		}
		if (_timer == 460)
		{
			RegularBoneWall(DIR.UP,200,18,80,230,top_box,50,50,0,false);
		}
		if (_timer == 560)
		{
			RegularBoneWall(DIR.DOWN,200,18,80,230,bottom_box,50,50,0,false);
		}
		if (_timer == 620)
		{
			Battle_EndTurn();
		}
		break;
		case 5:
		if (_timer == 5)
		{
			Battle_SetSoul(battle_soul_red);
			audio_play_sound(snd_ding,2,0);
			Battle_SetBoardSizeCubic(65,65,195,195);
		}
		if (_timer > 0) and (_timer < 515)
		{
			if (_timer % 70 == 0)
			{
				var gbX = random_range(150,640-150);
				var gbY = top_box - 80;
				var gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
				RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,2,2,50);
			}
			if (_timer % 70 == 0)
			{
				var gbX = random_range(150,640-150);
				var gbY = top_box - 80;
				var gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
				RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,2,2,50);
			}
			if (_timer % 70 == 0)
			{
				var gbX = random_range(150,640-150);
				var gbY = top_box - 80;
				var gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
				RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,2,2,50);
			}
			if (_timer % 70 == 0)
			{
				var gbX = random_range(150,640-150);
				var gbY = top_box - 80;
				var gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
				RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,2,2,50);
			}
			if (_timer % 70 == 0)
			{
				var gbX = random_range(150,640-150);
				var gbY = top_box - 80;
				var gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
				RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,2,2,50);
			}
			if (_timer == 165)
			{
				Battle_SetBoardSizeCubic(65,65,169,169);
			}
			if (_timer == 235)
			{
				Battle_SetBoardSizeCubic(65,65,143,143);
			}
			if (_timer == 305)
			{
				Battle_SetBoardSizeCubic(65,65,117,117);
			}
			if (_timer == 375)
			{
				Battle_SetBoardSizeCubic(65,65,91,91);
			}
			if (_timer == 445)
			{
				Battle_SetBoardSizeCubic(65,65,65,65);
			}
			if (_timer == 515)
			{
				Battle_SetBoardSizeCubic(65,65,39,39);
			}
		}
		if (_timer == 650)
		{
			Battle_SetSoul(battle_soul_red);
			Battle_EndTurn();
		}
		break;
		case 4:
		if (_timer == 5)
		{
			Battle_SetSoul(battle_soul_red);
			audio_play_sound(snd_ding,2,0);
			Battle_SetBoardSizeCubic(65,65,65,65);
		}
		if (_timer % 40 == 0) and (_timer >  10)
		{
			RegularBone(left_box,bottom_box,80,1,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box,top_box,80,-1,0,180,0,0,1,0,0,0,0,true);
		}
		if (_timer == 60)
		{
			RegularBoneWall(DIR.UP,200,18,80,230,top_box,50,50,0,false);
		}
		if (_timer == 160)
		{
			RegularBoneWall(DIR.DOWN,200,18,80,230,bottom_box,50,50,0,false);
		}
		if (_timer == 260)
		{
			RegularBoneWall(DIR.UP,200,18,80,230,top_box,50,50,0,false);
		}
		if (_timer == 360)
		{
			RegularBoneWall(DIR.DOWN,200,18,80,230,bottom_box,50,50,0,false);
		}
		if (_timer == 460)
		{
			RegularBoneWall(DIR.UP,200,18,80,230,top_box,50,50,0,false);
		}
		if (_timer == 560)
		{
			RegularBoneWall(DIR.DOWN,200,18,80,230,bottom_box,50,50,0,false);
		}
		if (_timer == 620)
		{
			Battle_EndTurn();
		}
		break;
		case 3:
		if (_timer == 5)
		{
			Battle_SetSoul(battle_soul_red);
			audio_play_sound(snd_ding,2,0);
			Battle_SetBoardSizeCubic(65,65,195,195);
		}
		if (_timer > 0) and (_timer < 515)
		{
			if (_timer % 70 == 0)
			{
				var gbX = random_range(150,640-150);
				var gbY = top_box - 80;
				var gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
				RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,2,2,50);
			}
			if (_timer % 70 == 0)
			{
				var gbX = random_range(150,640-150);
				var gbY = top_box - 80;
				var gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
				RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,2,2,50);
			}
			if (_timer % 70 == 0)
			{
				var gbX = random_range(150,640-150);
				var gbY = top_box - 80;
				var gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
				RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,2,2,50);
			}
			if (_timer % 70 == 0)
			{
				var gbX = random_range(150,640-150);
				var gbY = top_box - 80;
				var gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
				RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,2,2,50);
			}
			if (_timer % 70 == 0)
			{
				var gbX = random_range(150,640-150);
				var gbY = top_box - 80;
				var gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
				RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,2,2,50);
			}
			if (_timer == 165)
			{
				Battle_SetBoardSizeCubic(65,65,169,169);
			}
			if (_timer == 235)
			{
				Battle_SetBoardSizeCubic(65,65,143,143);
			}
			if (_timer == 305)
			{
				Battle_SetBoardSizeCubic(65,65,117,117);
			}
			if (_timer == 375)
			{
				Battle_SetBoardSizeCubic(65,65,91,91);
			}
			if (_timer == 445)
			{
				Battle_SetBoardSizeCubic(65,65,65,65);
			}
			if (_timer == 515)
			{
				Battle_SetBoardSizeCubic(65,65,39,39);
			}
		}
		if (_timer == 650)
		{
			Battle_SetSoul(battle_soul_red);
			Battle_EndTurn();
		}
		break;
		case 2:
		if (_timer == 5)
		{
			Battle_SetSoul(battle_soul_red);
			audio_play_sound(snd_ding,2,0);
			Battle_SetBoardSizeCubic(65,65,65,65);
		}
		if (_timer % 40 == 0) and (_timer >  10)
		{
			RegularBone(left_box,bottom_box,80,1,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box,top_box,80,-1,0,180,0,0,1,0,0,0,0,true);
		}
		if (_timer == 60)
		{
			RegularBoneWall(DIR.UP,200,18,80,230,top_box,50,50,0,false);
		}
		if (_timer == 160)
		{
			RegularBoneWall(DIR.DOWN,200,18,80,230,bottom_box,50,50,0,false);
		}
		if (_timer == 260)
		{
			RegularBoneWall(DIR.UP,200,18,80,230,top_box,50,50,0,false);
		}
		if (_timer == 360)
		{
			RegularBoneWall(DIR.DOWN,200,18,80,230,bottom_box,50,50,0,false);
		}
		if (_timer == 460)
		{
			RegularBoneWall(DIR.UP,200,18,80,230,top_box,50,50,0,false);
		}
		if (_timer == 560)
		{
			RegularBoneWall(DIR.DOWN,200,18,80,230,bottom_box,50,50,0,false);
		}
		if (_timer == 620)
		{
			Battle_EndTurn();
		}
		break;
		case 1:
		if (_timer == 5)
		{
			Battle_SetSoul(battle_soul_red);
			audio_play_sound(snd_ding,2,0);
			Battle_SetBoardSizeCubic(65,65,195,195);
		}
		if (_timer > 0) and (_timer < 515)
		{
			if (_timer % 70 == 0)
			{
				var gbX = random_range(150,640-150);
				var gbY = top_box - 80;
				var gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
				RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,2,2,50);
			}
			if (_timer % 70 == 0)
			{
				var gbX = random_range(150,640-150);
				var gbY = top_box - 80;
				var gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
				RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,2,2,50);
			}
			if (_timer % 70 == 0)
			{
				var gbX = random_range(150,640-150);
				var gbY = top_box - 80;
				var gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
				RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,2,2,50);
			}
			if (_timer % 70 == 0)
			{
				var gbX = random_range(150,640-150);
				var gbY = top_box - 80;
				var gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
				RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,2,2,50);
			}
			if (_timer % 70 == 0)
			{
				var gbX = random_range(150,640-150);
				var gbY = top_box - 80;
				var gbAngle = point_direction(gbX,gbY,battle_soul.x,battle_soul.y);
				RegularBlaster(0,0,gbX,gbY,0,gbAngle,18,20,2,2,50);
			}
			if (_timer == 165)
			{
				Battle_SetBoardSizeCubic(65,65,169,169);
			}
			if (_timer == 235)
			{
				Battle_SetBoardSizeCubic(65,65,143,143);
			}
			if (_timer == 305)
			{
				Battle_SetBoardSizeCubic(65,65,117,117);
			}
			if (_timer == 375)
			{
				Battle_SetBoardSizeCubic(65,65,91,91);
			}
			if (_timer == 445)
			{
				Battle_SetBoardSizeCubic(65,65,65,65);
			}
			if (_timer == 515)
			{
				Battle_SetBoardSizeCubic(65,65,39,39);
			}
		}
		if (_timer == 650)
		{
			Battle_SetSoul(battle_soul_red);
			Battle_EndTurn();
		}
		break
		case 0:
		if (_timer == 5)
		{
			Battle_SetSoul(battle_soul_red);
			audio_play_sound(snd_ding,2,0);
			Battle_SetBoardSizeCubic(65,65,65,65);
		}
		if (_timer % 40 == 0) and (_timer >  10)
		{
			RegularBone(left_box,bottom_box,80,1,0,0,0,0,1,0,0,0,0,true);
			RegularBone(right_box,top_box,80,-1,0,180,0,0,1,0,0,0,0,true);
		}
		if (_timer == 60)
		{
			RegularBoneWall(DIR.UP,200,18,80,230,top_box,50,50,0,false);
		}
		if (_timer == 160)
		{
			RegularBoneWall(DIR.DOWN,200,18,80,230,bottom_box,50,50,0,false);
		}
		if (_timer == 260)
		{
			RegularBoneWall(DIR.UP,200,18,80,230,top_box,50,50,0,false);
		}
		if (_timer == 360)
		{
			RegularBoneWall(DIR.DOWN,200,18,80,230,bottom_box,50,50,0,false);
		}
		if (_timer == 460)
		{
			RegularBoneWall(DIR.UP,200,18,80,230,top_box,50,50,0,false);
		}
		if (_timer == 560)
		{
			RegularBoneWall(DIR.DOWN,200,18,80,230,bottom_box,50,50,0,false);
		}
		if (_timer == 620)
		{
			Battle_SetSoul(battle_soul_red);
			Battle_EndTurn();
		}
		break
		default:
		if (!global.finalstretch == 1)
		{
			if (_timer == 5)
			{
				Battle_SetSoul(battle_soul_red);
				audio_play_sound(snd_ding,2,0);
				Battle_SetBoardSizeCubic(65,65,65,65);
			}
			if (_timer % 40 == 0) and (_timer >  10)
			{
				RegularBone(left_box,bottom_box,80,1,0,0,0,0,1,0,0,0,0,true);
				RegularBone(right_box,top_box,80,-1,0,180,0,0,1,0,0,0,0,true);
			}
			if (_timer == 60)
			{
				RegularBoneWall(DIR.UP,200,18,80,230,top_box,50,50,0,false);
			}
			if (_timer == 160)
			{
				RegularBoneWall(DIR.DOWN,200,18,80,230,bottom_box,50,50,0,false);
			}
			if (_timer == 260)
			{
				RegularBoneWall(DIR.UP,200,18,80,230,top_box,50,50,0,false);
			}
			if (_timer == 360)
			{
				RegularBoneWall(DIR.DOWN,200,18,80,230,bottom_box,50,50,0,false);
			}
			if (_timer == 460)
			{
				RegularBoneWall(DIR.UP,200,18,80,230,top_box,50,50,0,false);
			}
			if (_timer == 560)
			{
				RegularBoneWall(DIR.DOWN,200,18,80,230,bottom_box,50,50,0,false);
			}
			if (_timer == 620)
			{
				Battle_EndTurn();
			}
		}
		else
		{
			if (_timer == 20)
			{
				Battle_EndTurn();
			}
		}
		break;
	}
}
if (room == room_battle_1)
{
	if (_timer % 40 == 0) and (_timer >  10)
	{
		RegularBone(left_box,bottom_box,80,1,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,80,-1,0,180,0,0,1,0,0,0,0,true);
	}
	/*if (_timer == 1)
	{
		Battle_EndTurn();
	}
	if (_timer == 20)
	{
		Battle_EndTurn();
	}*/
}