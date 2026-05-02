_counter++;
BlasterDuration-=1;
direction = image_angle;

if _counter = 1{
	if _stage = "coming"{
		audio_play_sound(snd_gb_charge,0,false)
		
		Anim_Create(id,"x",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,x,-(x-_target_x),BlasterDuration)
		Anim_Create(id,"y",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,y,-(y-_target_y),BlasterDuration)
		Anim_Create(id,"image_angle",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,image_angle,-(image_angle-_target_angle),BlasterDuration)
	}
}

if BlasterDuration = -1{
	_stage = "blast cooldown"
}

if (play_the_animation){
	if image_index < 4{
		if _counter%5=0{
			image_index+=1;
		}
	}else if image_index > 3{
		if _counter%5=0{
			image_index+=1;
		}
	}
	if image_index > 5{
		image_index=4
	}
}
if _stage = "blast cooldown"{
	_blast_cooldown-=1;
	if _blast_cooldown < 0{
		_stage="preparing for the blast"
	}
}

if _stage = "preparing for the blast"{
	play_the_animation=true
	if image_index = 4{
		audio_play_sound(snd_gb_release,0,false)
		_beam = instance_create_depth(x,y,DEPTH_BATTLE.BULLET_OUTSIDE_HIGH*2-1,battle_gasterblaster_beam)
		if image_yscale > 1{
			Camera_Shake(3,4,2,2)
		}
		_stage = "shoot!"
		speed=-15
		
		if(instance_exists(_beam)){
			alarm[1]=10
			Anim_Create(_beam,"image_alpha",ANIM_TWEEN.LINEAR,ANIM_EASE.OUT,0,1,10)
			Anim_Create(_beam,"image_yscale",ANIM_TWEEN.LINEAR,ANIM_EASE.IN_OUT,0,image_yscale,10)	
			alarm[0]=10
		}
	}
}
if _stage = "shoot!"{
	if!(_beam = noone){
		follow=true
		
		if can_continue =true{
		_blast_duration-=1;
		if _blast_duration > 5{
			_beam.image_yscale = lerp(_beam.image_yscale,image_yscale+sin(_counter*0.5)*2,0.1)
		}else{
			_stage="beam end"
			Anim_Create(_beam,"image_yscale",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,_beam.image_yscale,-(_beam.image_yscale),50)
			Anim_Create(_beam,"image_alpha",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,_beam.image_alpha,-(_beam.image_alpha),50)
		}
		}
	}
}
if follow=true{
	_beam.x = x+lengthdir_x(40,image_angle)
	_beam.y = y+lengthdir_y(40,image_angle)
	_beam.image_angle = image_angle
	_beam.image_xscale=20000
}

if _stage = "beam end"{
	if (instance_exists(_beam)){
		if _beam.image_alpha < 0.1{
			follow=false
			instance_destroy(_beam)
		}
	}
}