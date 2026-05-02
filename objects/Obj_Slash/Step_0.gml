image_blend=_beam_color;
image_xscale=_beam_scale;
image_alpha=_beam_alpha;

_beam_timer-=1;

if _beam_timer < -200{
	instance_destroy();
}

if _beam_timer = -1{
	_warning_alpha=0;
	_beam_alpha=1;
	
	Camera_Shake(5,6,3,-2,-2,3);
	audio_play_sound(snd_slash_boom,0,false);
	
	_go_slash=true;
}
if _beam_timer > -1{
	_warning_alpha=1;
	_beam_alpha=0;
}

if (_go_slash){
	_damage_player=true;
	
	_beam_scale+=0.2;
	_beam_alpha-=0.028;
}
if image_alpha > 0.1 and (_damage_player){
	if _beam_color=c_red{
	    if place_meeting(x,y,battle_soul){
		Player_Hurt(1);
	  }
	}
}
if image_alpha > 0.3 and (_damage_player){
	if _beam_color=c_fuchsia{
	    if place_meeting(x,y,battle_soul){
		if (!instance_exists(hurtkr)){
		   instance_create_depth(0, 0, 0, hurtkr)
	    }
	  }
   }
}