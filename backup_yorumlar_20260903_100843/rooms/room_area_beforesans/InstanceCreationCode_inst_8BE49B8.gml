if (place_meeting(x,y,Trigger_Sans)){
	char_player.moveable=false;
	Anim_Create(camera,"x",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,camera.x,120,90,20);
}
var layer1 = layer_get_id("brhu")
layer_x(layer1,-0.5*camera.x)
layer_x(layer1,-0.5*camera.y)