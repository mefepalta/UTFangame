if(global.sansphase == 0)
{
	y = ynew
	ynew = (battle_board.y-battle_board.up)-10;

	if global.kr=false{
		if(instance_exists(hurtkr)){
			instance_destroy(hurtkr)
		}
	}

	if index_img > 8{
		index_img=0
	}
	index_img+=0.5/2;

	if (game_get_speed(gamespeed_fps) != 60)
	    game_set_speed(60, gamespeed_fps);

	//Angular Movement Shit
	wing_angle = sin(current_time / 100 * wing_speed) * 30;  // 30 = max angle
	arm_angle  = sin(current_time / 100 * arm_speed)  * 15;
	head_angle = sin(current_time / 100 * head_speed) * 3;

	timer++;
	if global.invinvible > 0{
		global.invinvible-=1;
	}

	if (_wiggle){
		slam_counter=0;
		slam_image=0;
		slam_alpha=0;
	
		_timee+=0.5;
		_body_x=sin(_timee*0.1)*-2.2/2;
		_body_y=sin(_timee*0.2)*-1.6/2;
	    //_head_x=sin(_timee*0.1)*-0.1;
	    //_head_y=sin(_timee*0.2)*0.1;
	}else{
		_body_x=0
		_body_y=0
		_head_y=0
		_head_x=0
		_armleft_x=0
		_armleft_x1=0
		_armright_x=0
		_armright_x1=0
	}
	/*if global.sans_mode = 0{
		_head_sprite=spr_papyrus_head
		_body_sprite=spr_papyrus_body
		leg_sprite=spr_papyrus_legs
	
		_head_init_x=0;
		_head_init_y=-26;
		_body_init_x=-1;
		_body_init_y=-20;
	}else if global.sans_mode = 1{
		_head_sprite=spr_sans_miss_head
		_body_sprite=spr_sans_miss_body
		leg_sprite=spr_sans_miss_legs
	
		_head_init_x=-2;
		_head_init_y=-24;
		_body_init_x=4;
		_body_init_y=-21;
	}*/

	squish = lerp(squish,1,0.1);
	squish = clamp(squish,0,6969);

	var num=sprite_get_number(_body_sprite);

	_body_image +=_body_speed;
	if(_body_image>=num){
		if(_body_loop){
			_body_image=0;
			if amk = 0{
			alarm[2]=25
			amk=1
			}
		}else{
			_body_image=num-1;
			_body_speed=0;
			amk=0
		}
	}

	/*if(action==SANS_ACTION.STATIC)
	{
		if(_action_step!=1)
		{
			_body_sprite=spr_sans_body;
			_body_x=0;
			_body_y=0;
			_body_image=0;
			_body_speed=0;
			_body_loop=true;
			_wiggle=false;
			_action_step=1;
		}
	}
	else if(action==SANS_ACTION.IDLE)
	{
		if(_action_step!=1)
		{
			_body_sprite=spr_sans_body;
			_body_x=0;
			_body_y=0;
			_body_image=0;
			_body_speed=0;
			_body_loop=true;
			_wiggle=true;
			_action_step=1;
		}
	}
	else if(action==SANS_ACTION.LEFT)
	{
		if(_action_step <= 4){
			switch _action_step
			{
				case 0:
         
	                _body_x = 0;
	                _body_y = 0;
	                _body_image = 0;
	                _body_speed = 0.2;
	                _body_loop = 0;
	                _wiggle = 0;
	                break;
	            case 1:
	                _body_x = 5;
	                break;
	            case 2:
	                _body_x = 6;
	                break;
	            case 3:
	                _body_x = -3;
	                break;
	            case 4:
	                _body_x = -2;
	                break;
				case 5:
	                _body_x = 0;
	                break;
			}
	        _action_step += 0.25
		}
	}
	else if(action==SANS_ACTION.RIGHT)
	{
		if(_action_step <= 5){
	        switch _action_step
	        {
	            case 0:
               
	                _body_x = 0;
	                _body_y = 0;
	                _body_image = 0;
	                _body_speed = 0.2;
	                _body_loop = 0;
	                _wiggle = 0;
	                break
	            case 1:
	                _body_x = -5;
	                break;
	            case 2:
	                _body_x = -6;
	                break;
	            case 3:
	                _body_x = 3;
	                break;
	            case 4:
	                _body_x = 2;
	                break;
	            case 5:
	                _body_x = 0;
	                break;
	        }
	        _action_step += 0.25
	    }
	}
	else if(action==SANS_ACTION.DOWN)
	{
		if(_action_step<=4)
		{
			switch(_action_step)
			{
				case 0:
				
					_body_x=0;
					_body_y=-1;
					_body_image=0;
					_body_speed=0;
					_body_loop=false;
					_wiggle=false
					break;
				case 1:
					_body_y=-3;
					_body_speed=0.5;
					break;
				case 2:
					_body_y=3;
			     	 break;
				case 3:
					_body_y=2;
					break;
			}
			_action_step+=0.2;
		}
	}
	else if(action==SANS_ACTION.UP)
	{
		if(_action_step<=4)
		{
			switch(_action_step)
			{
				case 0:
				
					_body_x=0;
					_body_y=3;
					_body_image=0;
					_body_speed=0;
					_body_loop=false;
					_wiggle=false;
					break;
				case 1:
					_body_y=5;
					_body_speed=0.5;
					break;
				case 2:
					_body_y=-1;
					break;
				case 3:
					_body_y=0;
					break;
			}
			_action_step+=0.2;
		}
	}*/
}
if(global.sansphase == 1)
{
	y = ynew
	ynew = (battle_board.y-battle_board.up)-10;

	if global.kr=false{
		if(instance_exists(hurtkr)){
			instance_destroy(hurtkr)
		}
	}

	if index_img > 8{
		index_img=0
	}
	index_img+=0.5/2;

	if (game_get_speed(gamespeed_fps) != 60)
	    game_set_speed(60, gamespeed_fps);

	//Angular Movement Shit
	wing_angle = sin(current_time / 100 * wing_speed) * 30;  // 30 = max angle
	arm_angle  = sin(current_time / 100 * arm_speed)  * 15;
	head_angle = sin(current_time / 100 * head_speed) * 3;
	p2_wing_angle_diddler = sin(current_time / 100 * p2_wing_speed_diddler) * 90;  // 30 = max angle
	p2_arm_angle_diddler  = sin(current_time / 100 * p2_arm_speed_diddler)  * 15;
	p2_head_angle_diddler = sin(current_time / 100 * p2_head_speed_diddler) * 3;

	timer++;
	if global.invinvible > 0{
		global.invinvible-=1;
	}

	if (_wiggle){
		slam_counter=0;
		slam_image=0;
		slam_alpha=0;
	
		_timee+=0.5;
		//p2_body_x=sin(_timee*0.1)*-2.2/2;
		p2_body_y=sin(_timee*0.1)*-1.6/4;
	    //_head_x=sin(_timee*0.1)*-0.1;
	    //_head_y=sin(_timee*0.2)*0.1;
	}else{
		p2_body_x=0
		p2_body_y=0
		p2_head_y=0
		p2_head_x=0
		p2_armleft_x=0
		p2_armright_x=0
	}
	/*if global.sans_mode = 0{
		_head_sprite=spr_papyrus_head
		_body_sprite=spr_papyrus_body
		leg_sprite=spr_papyrus_legs
	
		_head_init_x=0;
		_head_init_y=-26;
		_body_init_x=-1;
		_body_init_y=-20;
	}else if global.sans_mode = 1{
		_head_sprite=spr_sans_miss_head
		_body_sprite=spr_sans_miss_body
		leg_sprite=spr_sans_miss_legs
	
		_head_init_x=-2;
		_head_init_y=-24;
		_body_init_x=4;
		_body_init_y=-21;
	}*/

	squish = lerp(squish,1,0.1);
	squish = clamp(squish,0,6969);

	var num=sprite_get_number(_body_sprite);

	_body_image +=_body_speed;
	if(_body_image>=num){
		if(_body_loop){
			_body_image=0;
			if amk = 0{
			alarm[2]=25
			amk=1
			}
		}else{
			_body_image=num-1;
			_body_speed=0;
			amk=0
		}
	}

	/*if(action==SANS_ACTION.STATIC)
	{
		if(_action_step!=1)
		{
			_body_sprite=spr_sans_body;
			_body_x=0;
			_body_y=0;
			_body_image=0;
			_body_speed=0;
			_body_loop=true;
			_wiggle=false;
			_action_step=1;
		}
	}
	else if(action==SANS_ACTION.IDLE)
	{
		if(_action_step!=1)
		{
			_body_sprite=spr_sans_body;
			_body_x=0;
			_body_y=0;
			_body_image=0;
			_body_speed=0;
			_body_loop=true;
			_wiggle=true;
			_action_step=1;
		}
	}
	else if(action==SANS_ACTION.LEFT)
	{
		if(_action_step <= 4){
			switch _action_step
			{
				case 0:
         
	                _body_x = 0;
	                _body_y = 0;
	                _body_image = 0;
	                _body_speed = 0.2;
	                _body_loop = 0;
	                _wiggle = 0;
	                break;
	            case 1:
	                _body_x = 5;
	                break;
	            case 2:
	                _body_x = 6;
	                break;
	            case 3:
	                _body_x = -3;
	                break;
	            case 4:
	                _body_x = -2;
	                break;
				case 5:
	                _body_x = 0;
	                break;
			}
	        _action_step += 0.25
		}
	}
	else if(action==SANS_ACTION.RIGHT)
	{
		if(_action_step <= 5){
	        switch _action_step
	        {
	            case 0:
               
	                _body_x = 0;
	                _body_y = 0;
	                _body_image = 0;
	                _body_speed = 0.2;
	                _body_loop = 0;
	                _wiggle = 0;
	                break
	            case 1:
	                _body_x = -5;
	                break;
	            case 2:
	                _body_x = -6;
	                break;
	            case 3:
	                _body_x = 3;
	                break;
	            case 4:
	                _body_x = 2;
	                break;
	            case 5:
	                _body_x = 0;
	                break;
	        }
	        _action_step += 0.25
	    }
	}
	else if(action==SANS_ACTION.DOWN)
	{
		if(_action_step<=4)
		{
			switch(_action_step)
			{
				case 0:
				
					_body_x=0;
					_body_y=-1;
					_body_image=0;
					_body_speed=0;
					_body_loop=false;
					_wiggle=false
					break;
				case 1:
					_body_y=-3;
					_body_speed=0.5;
					break;
				case 2:
					_body_y=3;
			     	 break;
				case 3:
					_body_y=2;
					break;
			}
			_action_step+=0.2;
		}
	}
	else if(action==SANS_ACTION.UP)
	{
		if(_action_step<=4)
		{
			switch(_action_step)
			{
				case 0:
				
					_body_x=0;
					_body_y=3;
					_body_image=0;
					_body_speed=0;
					_body_loop=false;
					_wiggle=false;
					break;
				case 1:
					_body_y=5;
					_body_speed=0.5;
					break;
				case 2:
					_body_y=-1;
					break;
				case 3:
					_body_y=0;
					break;
			}
			_action_step+=0.2;
		}
	}*/
}
if (global.checkornot == true)
{
	instance_destroy(battle_dialog_enemy);
}
if (global.p1sanshp == true)
{
	room_goto(room_p15);
	_head_image = 15;
	_head_alpha = 1;
	_body_alpha = 1;
	_legs_alpha1 = 1;
}
if (room == room_battle)
{
	global.sansphase = 0;
}
if (room == room_battle_1)
{
	global.sansphase = 1;
}