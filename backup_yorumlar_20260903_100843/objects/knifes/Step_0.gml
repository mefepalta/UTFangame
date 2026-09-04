duration_knife-=1
x1=x;
y1=y;
if duration_knife = 0
{
	alarm[0]=1;
}

if(place_meeting(x1,y1,battle_soul)) and image_alpha = 1{
	Player_Hurt(5);
	Camera_Shake(3,5,2,3,4,5);
	go_away=true
}
if go_away = true{
	image_alpha+=0.2;
}