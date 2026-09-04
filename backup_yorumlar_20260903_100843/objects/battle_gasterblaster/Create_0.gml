depth=DEPTH_BATTLE.BULLET_OUTSIDE_HIGH
image_xscale=2
image_yscale=2
image_blend=c_white

_target_x=0
_target_y=0
_target_angle=0

_blaster_index=0
_blast_cooldown=20
_blast=false
_blast_duration=50

BlasterDuration=50

_counter=0

_stage = "coming"
play_the_animation=false

_beam=noone

image_speed=0
follow=false
alpha_is_ready = false
can_continue=false

//--- Turuncu ruh modu ---
//Normal blaster ateslendikten sonra isinin tersi yone suruklenip cikiyor.
//Koridorda bu istenmiyor: blaster nisan aldigi yerde kaliyor, onun yerine
//dunyanin geri kalani gibi asagi kayiyor. dr_mode bunu aciyor.
//dr_len isinin uzunlugu (px); dr_mode kapaliyken kullanilmiyor.
dr_mode=false
dr_len=20000