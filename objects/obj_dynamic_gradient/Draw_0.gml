if !(time%45)
Anim_Create(self,"alpha",2,0,1,-0.5,15)
for (var i = 0; i < 640; i++)
draw_sprite_ext(spr_battle_gradient,0,i,520+sin((i+time)/35)*25,1,2,0,c_aqua,alpha)
draw_sprite_ext(spr_battle_gradient,0,0,500,640,2.5,0,c_aqua,alpha)
//in sin((i+time)/35)*35, /35 means the distance if the waves and *35 means the change of height, the lower "/amount" is, the denser it becomes, the higher the "*amount" is, the more wavy is it, until it becomes a tsunami lmao
