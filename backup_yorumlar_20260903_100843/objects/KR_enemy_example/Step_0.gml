y=battle_board.y-battle_board.up-battle_board.thickness_frame-4;
_head_image=face_sans_battle.emotion;
if(action==SANS_ACTION.IDLE){
	_body_sprite=(face_sans_battle_body.emotion==0 ? spr_sans_body : spr_papyrus_body_nope);
}

if(_intro_ready){
	if(!instance_exists(battle_dialog_enemy)){
		audio_play_sound(snd_noise,0,false);
		fader.alpha=1;
		alarm[2]=20;
		_intro_ready=false;
	}
}

var num=sprite_get_number(_body_sprite);

_body_image+=_body_speed;
if(_body_image>=num){
	if(_body_loop){
		_body_image=0;
	}else{
		_body_image=num-1;
		_body_speed=0;
	}
}

if(_wiggle){
	_wiggle_sin+=1;
	if(_wiggle_sin%4==0){
		_body_x=sin(_wiggle_sin*0.1)*1.4;
		_body_y=sin(_wiggle_sin*0.2)*0.6;
		_head_x=sin(_wiggle_sin*0.1)*0.4;
		_head_y=sin(_wiggle_sin*0.2)*0.3;
	}
}else{
	_wiggle_sin=0;
}

if(action==SANS_ACTION.STATIC){
	if(_action_step!=1){
		_body_sprite=spr_sans_body;
		_body_x=0;
		_body_y=0;
		_body_image=0;
		_body_speed=0;
		_body_loop=true;
		_wiggle=false;
		_action_step=1;
	}
}else if(action==SANS_ACTION.IDLE){
	if(_action_step!=1){
		_body_sprite=spr_sans_body;
		_body_x=0;
		_body_y=0;
		_body_image=0;
		_body_speed=0.065;
		_body_loop=true;
		_wiggle=true;
		_action_step=1;
	}
}else if(action==SANS_ACTION.LEFT){
	if(_action_step<=4){
		switch(_action_step){
			case 0:
				_body_sprite=spr_sans_body;
				_body_x=0;
				_body_y=0;
				_body_image=0;
				_body_speed=0;
				_body_loop=false;
				_wiggle=false;
				break;
			case 1:
				_body_x=5;
				break;
			case 2:
				_body_x=6;
				break;
			case 3:
				_body_x=-1;
				_body_sprite=spr_papyrus_body_left;
				_body_speed=0.5;
				break;
			case 4:
				_body_x=0;
				_body_speed=0.2;
				break;
		}
		_action_step+=0.25;
	}
}else if(action==SANS_ACTION.RIGHT){
	if(_action_step<=5){
		switch(_action_step){
			case 0:
				_body_sprite=spr_papyrus_body_left;
				_body_x=0;
				_body_y=0;
				_body_image=5;
				_body_speed=0;
				_body_loop=false;
				_wiggle=false;
				break;
			case 1:
				_body_x=-5;
				break;
			case 2:
				_body_x=-6;
				_body_sprite=spr_papyrus_body_right;
				_body_speed=0.5;
				break;
			case 3:
				_body_x=3;
				_body_sprite=spr_sans_body;
				_body_image=0;
				_body_speed=0;
				break;
			case 4:
				_body_x=2;
				break;
			case 5:
				_body_x=0;
				break;
		}
		_action_step+=0.25;
	}
}else if(action==SANS_ACTION.DOWN){
	if(_action_step<=4){
		switch(_action_step){
			case 0:
				_body_sprite=spr_papyrus_body_down;
				_body_x=0;
				_body_y=-1;
				_body_image=0;
				_body_speed=0;
				_body_loop=false;
				_wiggle=false;
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
}else if(action==SANS_ACTION.UP){
	if(_action_step<=4){
		switch(_action_step){
			case 0:
				_body_sprite=spr_papyrus_body_up;
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
}