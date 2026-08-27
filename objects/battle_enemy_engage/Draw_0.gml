//draw_sprite_ext(spr_waterfall_bg,0,0,0,2,2,0,c_white,1)
if (room == room_battle)
{
	//y kutunun üst kenarına bağlı (Step_0: ynew=(battle_board.y-battle_board.up)-10).
	//Kutu ekranın tepesine kadar uzayan atacklarda y sıfırın altına inip
	//"Invalid surface dimensions" hatası veriyordu, o yüzden en az 1.
	surface_resize(_surf,640,max(1,y));

	surface_set_target(_surf);
	draw_sprite_ext(_spear_sprite, _spear_image,x + _body_init_x*2 + _body_x*2 + _head_init_x*2 + _head_x*2 + 24,y + _body_init_y*2 + _body_y*2 + _head_init_y*2 + _head_y*2 + 25,2, 2, head_angle, c_white, _spear_alpha);
	draw_sprite_pos(leg_sprite,leg_image,bbox_left+(_body_x),bbox_top,bbox_right+(_body_x),bbox_top,bbox_right,bbox_bottom,bbox_left,bbox_bottom,_legs_alpha);
	draw_sprite_pos(leg_sprite1,_legs_image1,bbox_left+(_body_x),bbox_top,bbox_right+(_body_x),bbox_top,bbox_right,bbox_bottom,bbox_left,bbox_bottom,_legs_alpha1);
	mask_index=leg_sprite;
	draw_sprite_ext(_wingthing1_sprite,_wingthing1_image,x+_body_init_x*2+_body_x*2+_head_init_x*2+_head_x*2 + 11,y+_body_init_y*2+_body_y*2+_head_init_y*2+_head_y*2 - 105,2,2,_head_angle,c_white,_head_alpha);
	draw_sprite_ext(_wingthing2_sprite,_wingthing2_image,x+_body_init_x*2+_body_x*2+_head_init_x*2+_head_x*2 - 11,y+_body_init_y*2+_body_y*2+_head_init_y*2+_head_y*2 + 8,2,2,_head_angle,c_white,_head_alpha);
	draw_sprite_ext(_armleft_sprite,_armleft_image,x+_body_init_x*2+_body_x*2+_head_init_x*2+_head_x*2 - 32,y+_body_init_y*2+_body_y*2+_head_init_y*2+_head_y*2 + 16,2,2,head_angle * -1,c_white,_armleft_alpha);
	draw_sprite_ext(_armright_sprite,_armright_image,x+_body_init_x*2+_body_x*2+_head_init_x*2+_head_x*2 + 38,y+_body_init_y*2+_body_y*2+_head_init_y*2+_head_y*2 + 15,2,2,head_angle,c_white,_armright_alpha);
	draw_sprite_ext(_armleft_sprite1,_armleft_image1,x+_body_init_x*2+_body_x*2+_head_init_x*2+_head_x*2 - 23,y+_body_init_y*2+_body_y*2+_head_init_y*2+_head_y*2 + 16,-2,2,head_angle * -1,c_white,_armleft_alpha1);
	draw_sprite_ext(_armright_sprite1,_armright_image1,x+_body_init_x*2+_body_x*2+_head_init_x*2+_head_x*2 + 27,y+_body_init_y*2+_body_y*2+_head_init_y*2+_head_y*2 + 15,2,2,head_angle,c_white,_armright_alpha1);
	draw_sprite_ext(_body_sprite,_body_image,x+_body_init_x*2+_body_x*2,y+_body_init_y*2+_body_y*2,2,2,_body_angle,c_white,_head_alpha);
	draw_sprite_ext(_head_sprite,_head_image,x+_body_init_x*2+_body_x*2+_head_init_x*2+_head_x*2,y+_body_init_y*2+_body_y*2+_head_init_y*2+_head_y*2,2,2,_head_angle,c_white,_head_alpha);

	surface_reset_target();

	var _sw = surface_get_width(_surf);
	var _sh = surface_get_height(_surf);

	draw_set_color(image_blend);
	gpu_set_blendmode_ext(bm_one,bm_inv_src_alpha);
	draw_primitive_begin_texture(pr_trianglestrip,surface_get_texture(_surf));
	draw_vertex_texture(_sw/2-_sw*squish*0.5+x-320,0+_sh/2-_sh/squish*0.5,0,0);
	draw_vertex_texture(_sw/2+_sw*squish*0.5+x-320,0+_sh/2-_sh/squish*0.5,1,0);
	draw_vertex_texture(_sw/2-_sw*squish*0.5+x-320,_sh,0,1);
	draw_vertex_texture(_sw/2+_sw*squish*0.5+x-320,_sh,1,1);
	draw_primitive_end();
	gpu_set_blendmode(bm_normal);
}
if (room == room_battle_1) //and (global.sansp2headsprite == false)
{
	//y kutunun üst kenarına bağlı (Step_0: ynew=(battle_board.y-battle_board.up)-10).
	//Kutu ekranın tepesine kadar uzayan atacklarda y sıfırın altına inip
	//"Invalid surface dimensions" hatası veriyordu, o yüzden en az 1.
	surface_resize(_surf,640,max(1,y));

	surface_set_target(_surf);

	// ---- PAPYRUS (Sans'in solunda) ----
	// Parca ofsetleri Discord_Papyrus-1.png mockup'i uzerinden olculdu.
	// Ciziim sirasi: bacaklar -> kol -> govde -> kafa
	if (pap_alpha > 0)
	{
		var _px = pap_draw_x + pap_shake_x + kay_x;
		var _py = y;
		// Bacak skew'i: alt iki kose ayakta sabit, ust iki kose govdeyle birlikte
		// inip cikiyor. x'te hicbir kayma yok.
		var _pl = _px - 68;					// 34 (origin.x) * 2
		var _pr = _px + 68;
		var _pt = _py - 100 + pap_bob;		// 50 (origin.y) * 2
		draw_sprite_pos(pap_legs_sprite,pap_legs_image,_pl,_pt,_pr,_pt,_pr,_py,_pl,_py,pap_alpha);
		draw_sprite_ext(pap_arm_sprite,pap_arm_image,_px-50,_py-110+pap_bob,2,2,pap_arm_angle,c_white,pap_alpha*pap_arm_alpha);
		draw_sprite_ext(pap_body_sprite,pap_body_image,_px-8,_py-86+pap_bob,2,2,0,c_white,pap_alpha);
		draw_sprite_ext(pap_head_sprite,pap_head_image,_px-14,_py-164+pap_bob,2,2,0,c_white,pap_alpha*pap_head_alpha);

		// Bloklama: onunden yukselen kemik duvari. Papyrus'un parcalarindan
		// SONRA cizilir ki onunde dursun. Sprite 2x cizilmis, origin alt-orta,
		// bu yuzden olcek 1 ve dogrudan ayaklarinin oldugu noktaya konuyor.
		if (pap_block_state != 0)
		{
			// Titreme duvara uygulaniyor, Papyrus'un kendisine degil
			draw_sprite_ext(pap_block_sprite,pap_block_image,_px+pap_block_shake_x,_py,1,1,0,c_white,pap_alpha);
		}
	}

	// ---- ALPHYS (Sans'in saginda) ----
	// Parca ofsetleri s_p15_alphys siluetine oturtularak olculdu.
	// Govdesi bacaklari da iceriyor, skew'i onun uzerinde uyguluyoruz.
	if (alp_alpha > 0)
	{
		var _ax = alp_draw_x + alp_shake_x + kay_x;
		var _ay = y;
		draw_sprite_ext(alp_armright_sprite,0,_ax+46,_ay-74+alp_bob,2,2,alp_armright_angle,c_white,alp_alpha);
		var _al = _ax - 66;					// 33 (origin.x) * 2
		var _ar = _ax + 68;
		var _at = _ay - 122 + alp_bob;		// 61 (origin.y) * 2
		draw_sprite_pos(alp_body_sprite,alp_body_image,_al,_at,_ar,_at,_ar,_ay,_al,_ay,alp_alpha);
		draw_sprite_ext(alp_head_sprite,alp_head_image,_ax+22,_ay-94+alp_bob,2,2,0,c_white,alp_alpha);
		if (alp_eye_visible)
		{
			// Parlama kirmizi gozde degil, diger (beyaz) gozunde.
			// Kafanin ciziim noktasina gore ofset (+17,-33).
			draw_sprite_ext(alp_eye_sprite,alp_eye_image,_ax+54,_ay-122+alp_bob,2,2,0,c_white,alp_alpha);
		}
		draw_sprite_ext(alp_armleft_sprite,0,_ax-2,_ay-96+alp_bob,2,2,alp_armleft_angle,c_white,alp_alpha);
	}

	// Sans'in x'i sabit (balon ve hedefleme ona bagli); yer degistirme ve
	// hasar titremesi sadece ciziime uygulaniyor, digerlerini etkilemiyor.
	var _sx = x + p2_off_x + p2_shake_x + kay_x;
	draw_sprite_ext(p2_cape_sprite,p2_cape_image,_sx+p2_body_init_x*2+p2_body_x*2+p2_head_init_x*2+p2_head_x*2 + 3,y+p2_body_init_y*2+p2_body_y*2+p2_head_init_y*2+p2_head_y*2 - 3,2,2,p2_cape_angle,c_white,p2_cape_alpha);
	// Bacak skew'i: ayaklar yerde sabit, ust kenar govdeyle birlikte inip cikiyor
	// kay_x BURADA DA olmali: yoksa uc karakter yana kayarken Sans'in
	// govdesi gidiyor, bacaklari yerinde kaliyordu.
	// Olculer bbox'tan DEGIL sprite'in kendisinden: mask_index bu satirlarin
	// ALTINDA p2leg_sprite'a cekildigi icin bbox bir kare geriden geliyordu
	// ve bacaklar govdeden kopuk duruyordu. Son atakta bu yuzden bacaklar
	// tur nesnesinin Draw'inda elle ciziliyordu, ama orasi mermilerin de
	// onunde oldugu icin bacaklar kemiklerin ve govdenin ustune biniyordu.
	// Artik dogru geometriyle burada, yani dogru derinlikte ciziliyor.
	// (spr_p2_legs: 47x26, origin 23,26 -- 2x cizildigi icin ikiye katlandi)
	var _lx = x + p2_off_x + p2_shake_x + kay_x;
	var _sl = _lx - 46;
	var _sr = _lx + 48;
	var _st = y - 52 + p2_body_y*2;
	var _sb = y;
	draw_sprite_pos(p2leg_sprite,p2_legs_image,_sl,_st,_sr,_st,_sr,_sb,_sl,_sb,p2_legs_alpha);
	draw_sprite_pos(p2leg_sprite1,p2_legs_image1,_sl,_st,_sr,_st,_sr,_sb,_sl,_sb,p2_legs_alpha1);
	mask_index=p2leg_sprite;
	draw_sprite_ext(p2_armleft_sprite,p2_armleft_image,_sx+p2_body_init_x*2+p2_body_x*2+p2_head_init_x*2+p2_head_x*2 - 28,y+p2_body_init_y*2+p2_body_y*2+p2_head_init_y*2+p2_head_y*2 - 5,2,2,p2_head_angle_diddler * -0.25,c_white,p2_armleft_alpha);
	if (p2_armright_sprite == spr_p2_arm_right or p2_armright_sprite == spr_p2_arm_right_1)
	{
		draw_sprite_ext(p2_armright_sprite,p2_armleft_image,_sx+p2_body_init_x*2+p2_body_x*2+p2_head_init_x*2+p2_head_x*2 + 30,y+p2_body_init_y*2+p2_body_y*2+p2_head_init_y*2+p2_head_y*2 - 5,2,2,p2_head_angle_diddler / 4,c_white,p2_armright_alpha);
	}
	if (p2_armright_sprite == spr_p2_arm_right_slamup or p2_armright_sprite == spr_p2_arm_right_slamdown)
	{
		draw_sprite_ext(p2_armright_sprite,image_index / 6,_sx+p2_body_init_x*2+p2_body_x*2+p2_head_init_x*2+p2_head_x*2 + 30,y+p2_body_init_y*2+p2_body_y*2+p2_head_init_y*2+p2_head_y*2 - 5,2,2,p2_head_angle_diddler / 4,c_white,p2_armright_alpha);
	}
	if (p2_armright_sprite == spr_p2_arm_right_slam)
	{
		draw_sprite_ext(p2_armright_sprite,image_index / 4,_sx+p2_body_init_x*2+p2_body_x*2+p2_head_init_x*2+p2_head_x*2 + 30,y+p2_body_init_y*2+p2_body_y*2+p2_head_init_y*2+p2_head_y*2 - 5,2,2,p2_head_angle_diddler / 4,c_white,p2_armright_alpha);
	}
	draw_sprite_ext(p2_body_sprite,p2_body_image,_sx+p2_body_init_x*2+p2_body_x*2 + 2,y+p2_body_init_y*2+p2_body_y*2,2,2,p2_body_angle,c_white,p2_head_alpha);
	if (p2_head_sprite == spr_p2_idle)
	{
		draw_sprite_ext(p2_head_sprite,image_index / 12,_sx+p2_body_init_x*2+p2_body_x*2+p2_head_init_x*2+p2_head_x*2 - 2,y+p2_body_init_y*2+p2_body_y*2+p2_head_init_y*2+p2_head_y*2 + 5,2,2,p2_head_angle,c_white,p2_head_alpha);
	}
	if (p2_head_sprite == spr_p2_head)
	{
		draw_sprite_ext(p2_head_sprite,_head_image,_sx+p2_body_init_x*2+p2_body_x*2+p2_head_init_x*2+p2_head_x*2 - 2,y+p2_body_init_y*2+p2_body_y*2+p2_head_init_y*2+p2_head_y*2 + 5,2,2,p2_head_angle,c_white,p2_head_alpha);
	}
	draw_sprite_ext(p2_thingy_sprite,p2_thingy_image,_sx+p2_body_init_x*2+p2_body_x*2+p2_head_init_x*2+p2_head_x*2 - 15,y+p2_body_init_y*2+p2_body_y*2+p2_head_init_y*2+p2_head_y*2 + 1,2,2,p2_head_angle_diddler / 4,c_white,p2_thingy_alpha);

	surface_reset_target();

	var _sw = surface_get_width(_surf);
	var _sh = surface_get_height(_surf);

	draw_set_color(image_blend);
	gpu_set_blendmode_ext(bm_one,bm_inv_src_alpha);
	draw_primitive_begin_texture(pr_trianglestrip,surface_get_texture(_surf));
	draw_vertex_texture(_sw/2-_sw*squish*0.5+x-320,0+_sh/2-_sh/squish*0.5,0,0);
	draw_vertex_texture(_sw/2+_sw*squish*0.5+x-320,0+_sh/2-_sh/squish*0.5,1,0);
	draw_vertex_texture(_sw/2-_sw*squish*0.5+x-320,_sh,0,1);
	draw_vertex_texture(_sw/2+_sw*squish*0.5+x-320,_sh,1,1);
	draw_primitive_end();
	gpu_set_blendmode(bm_normal);
}