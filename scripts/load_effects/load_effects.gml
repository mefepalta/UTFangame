function fancy_text(xx,yy,text,angle,scale_x,scale_y,spd,alpha){
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
var shader_blur=instance_create_depth(0,0,-1000000,blur_shader)
shader_blur.duration=duration
shader_blur.var_blur_amount=amount
shader_blur.has_horizontal=horizontal
shader_blur.has_vertical=vertical
return shader_blur
}

function invert_color(){
	if !global.easyeyes{
	if !instance_exists(colorinv)
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


function rgb_shake1(amt,fade,time){
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
if instance_exists(obj_scrglitch)
ins_dest(obj_scrglitch)
var sha=ins_create(0,0,-1000,obj_scrglitch)
with(sha)
amax=0
return sha}






