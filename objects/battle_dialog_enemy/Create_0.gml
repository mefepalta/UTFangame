depth=DEPTH_BATTLE.UI_HIGH;
visible=false;

text="";
dir=DIR.LEFT;
show_spike=true;
wide_spike=true;
up=0;
down=0;
left=0;
right=0;
template=0;

x_box=0
y_box=0
xscale_box=4.2    //// ORIGINAL SIZE
yscale_box=1.8	  //// ORIGINAL SIZE

fast=false;

MODE = 0
SIDE = 0   /// 0 IS NORMAL, 1 IS THE OPPOSITE SIDE
SPIKE = true

_spike_extra_x = 0
_spike_extra_y = 0
ANGLE_BUBBLE = 0
ANGLE_SPIKE = 0

_inst=instance_create_depth(x,y,0,text_typer);

alarm[0]=1;