sprite_index=spr_battle_menu_fight_bookimpact;
Anim_Destroy(id,"image_xscale");
Anim_Create(id,"image_xscale",ANIM_TWEEN.QUINT,ANIM_EASE.IN,2,4,15);
Anim_Create(id,"image_yscale",ANIM_TWEEN.QUINT,ANIM_EASE.IN,2,4,15);
Anim_Create(id,"image_alpha",ANIM_TWEEN.QUINT,ANIM_EASE.IN,1,-1,15);
alarm[1]=30;