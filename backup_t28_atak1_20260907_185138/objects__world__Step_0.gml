Anim_Step();
BGM_Step();

if(!variable_instance_exists(id,"_quit_hold_time")){
	_quit_hold_time=0;
	_quit_alpha=0;
	_quit_dot_count=0;
}
if(!variable_instance_exists(id,"_console_status_time")){
	_console_status_time=10;
}

if(_time>=60){
	Flag_Set(FLAG_TYPE.STATIC,FLAG_STATIC.TIME,Flag_Get(FLAG_TYPE.STATIC,FLAG_STATIC.TIME)+1);
	_time=0;
}else{
	_time+=1;
}

if(keyboard_check(vk_escape)){
	_quit_hold_time+=1;
	_quit_dot_count=1+floor(min(_quit_hold_time-1,89)/30);
	_quit_alpha=lerp(_quit_alpha,1,0.25);
	if(_quit_hold_time>=90){
		game_end();
	}
}else{
	_quit_hold_time=0;
	_quit_alpha=lerp(_quit_alpha,0,0.2);
	if(_quit_alpha<0.01){
		_quit_alpha=0;
		_quit_dot_count=0;
	}
}

var FRAME_SKIP=Game_GetFrameSkip();
if(FRAME_SKIP>0){
	if(_frame_skip>=FRAME_SKIP){
		draw_enable_drawevent(true);
		_frame_skip=0;
	}else{
		_frame_skip+=1;
		draw_enable_drawevent(false);
	}
}else{
	draw_enable_drawevent(true);
}

if(keyboard_check_pressed(vk_f2)){
	game_restart();
}

if(keyboard_check_pressed(192)){
	Console_SetVisible(!Console_IsVisible());
}

if(GMU_CONSOLE_ENABLED){
	_console_status_time+=1;
	if(_console_status_time>=10){
		_console_status_time=0;
		Console_SetStatusText(0,"FPS: "+string(fps));
		Console_SetStatusText(1,"Room: "+string(room)+"("+room_get_name(room)+")");
		Console_SetStatusText(2,"InstC: "+string(instance_count));
	}
}

Console_Step();

if(keyboard_check_pressed(vk_f4)&&!keyboard_check(vk_alt)&&!keyboard_check(vk_control)&&!keyboard_check(vk_shift)){
	window_set_fullscreen(!window_get_fullscreen());
}
