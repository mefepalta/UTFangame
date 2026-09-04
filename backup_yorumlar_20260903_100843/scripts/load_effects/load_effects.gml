function fancy_text(xx,yy,text,angle,scale_x,scale_y,spd,alpha){
// Doesn't need anything else, as simple as that
if rgb=undefined
rgb=0
rgb+=spd
var col1=make_color_hsv((((rgb%255))%255),255,255)
var col2=make_color_hsv((((rgb%255)+255*0.25)%255),255,255)
var col3=make_color_hsv((((rgb%255)+255*0.5)%255),255,255)
var col4=make_color_hsv((((rgb%255)+255*0.75)%255),255,255)
draw_text_ext_transformed_color(xx,yy,text,100,10000,scale_x,scale_y,angle,col1,col2,col3,col4,alpha)
}

function Blur_screen(duration,amount,horizontal,vertical){
// Requires Blur shader (included)
var shader_blur=instance_create_depth(0,0,-1000000,blur_shader)
shader_blur.duration=duration            //sets duration
shader_blur.var_blur_amount=amount       //sets blur amount
shader_blur.has_horizontal=horizontal    //sets if there is horizontal blur
shader_blur.has_vertical=vertical        //sets if there is vertical blur
return shader_blur
}

function invert_color(){
	if !global.easyeyes{		//global.easyeyes is just a thing in my game, you can delete it
	if !instance_exists(colorinv)//the object to invert the colors of the screen (included)
	instance_create_depth(0,0,-500,colorinv)
	with(colorinv)
	{
		if is_inverted=1
		is_inverted=0
		else if is_inverted=0
		is_inverted=1
	}
}
}

/*function Shock_wave(xx,yy,spd,amplitude,refract,width,duration){
//Creates a shockwave effect (bends the screen for a bit and stuff), WIP, requires shockwave shader(not included)
var shock=instance_create_depth(xx,yy,0,obj_shockwave)
shock.shockSpeed=spd
shock.var_shock_amplitude=amplitude
shock.var_shock_refraction=refract
shock.var_shock_width=width
shock.duration=duration
return shock}*/

function rgb_shake1(amt,fade,time){
//Basic RGB effect that wont break is most circumstances, obj_rgb is included
if fade=undefined
{
	fade=0
	time=0
}
if !instance_exists(obj_rgb)
var rgb1=instance_create_depth(0,0,0,obj_rgb)
else rgb1=obj_rgb
rgb1.sh=amt
rgb1.fade=fade
rgb1.endtime=time
return rgb1
}

function rgb_shake2(dis_min,dis_max,displace){
//RGB effect but its green and purple rather than green and blue, obj_rgb2 is included
if displace=undefined
displace=3.5
if !instance_exists(obj_rgb2)
var rgb2=instance_create_depth(0,0,0,obj_rgb2)
rgb2=obj_rgb
with(rgb2)
{
	fd=displace
	dmin=dis_min
	dmax=dis_max
}
return rgb2}

function rgb_shake3(dx,dy,mode,green){
//Multi-use RGB effect, requires rgb shader(included) and obj_rgb3(included)(WIP)
if !instance_exists(obj_rgb3)
var rgb3=instance_create_depth(0,0,0,obj_rgb3)
rgb3=obj_rgb3
if green=undefined
green=0
with(rgb3)
{
	dr1=dx
	dr2=dy
	draw_mode=mode
	green=green
}
return rgb3}

function load_particles(){
//Stupid thing that doesn't work, WIP
function basic_particles(shape,life_min,life_max){
if shape=undefined
shape=pt_shape_pixel
if life_min=undefined
life_min=60
if life_max=undefined
life_max=90
var _p=part_type_create()
part_type_shape(_p,shape)
part_type_life(_p,life_min,life_max)
part_type_direction(_p,90,90,0,0)
part_type_speed(_p,2,4,0,0)
global.temp_particle_type=_p

}
}

function draw_shadow(){
//Makes a shadow appear in the end of an fading bullet, mostly for blaster beams,
//obj_scrglitch is included and can be used as glitching the screen, just set the amax to not 0
if instance_exists(obj_scrglitch)
ins_dest(obj_scrglitch)	
var sha=ins_create(0,0,-1000,obj_scrglitch)
with(sha)
amax=0
return sha}






