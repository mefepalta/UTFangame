///@arg bones
///@arg speed
///@arg size
///@arg color
///@arg out
///@arg len
///@arg len_x
///@arg len_y
///@arg tag (set "true" if you're using argument 11-13)
///@arg dir*
///@arg move_speed*
///@arg in_out_anim*
///@arg anim_duration*
///@arg anim_duration_back*
function MakeBoneCircle(){
	var dir=0
	var move_speed=0
	var anim=0;
	var dura=0;
	var dura2=0;
    var lg=argument[0];
	var rotate_speed=argument[1];
	var length=argument[2];
	var color=argument[3];
	var out=argument[4];
	var len=argument[5];
	var len_x=argument[6];
	var len_y=argument[7];
	var tag=argument[8];
	if argument_count>9{
		var dir=argument[9];
	}if argument_count>10{
		var move_speed=argument[10];
	}if argument_count>11{
		var anim=argument[11];
	}if argument_count>12{
		var dura=argument[12];
	}if argument_count>13{
		var dura2=argument[13];
	}
	
    repeat (lg)
	{
    var lenx = (battle_board.x*10)
    var leny = (battle_board.y)
    bone = instance_create_depth(lenx,leny-215,0,battle_bullet_bone)
    bone.len_dir = dir
    bone.angle = dir
	bone.tag=tag
    bone.lenable = 1
	bone.length = length
    bone.len = len
    bone.out = out
    bone.len_x = len_x
    bone.len_y = len_y
    bone.len_speed = move_speed
    bone.len_dir_move = rotate_speed
    bone.len_angle = 150
	bone.bottom=9
    bone.color = color
    dir += 360/lg
   }
   
   if bone.tag==1{
   Anim_Create(battle_bullet_bone,"len",0,0, len, anim, 25,dura)
   Anim_Create(battle_bullet_bone,"len",0,0, len+anim, -anim, 25,dura2)
   }

}