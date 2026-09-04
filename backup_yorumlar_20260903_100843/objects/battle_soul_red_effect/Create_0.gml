//==========================================================================
//  RUH DEGISIM PARLAMASI -- RENGI RUHTAN OKUYOR
//==========================================================================
//  Bu nesne eskiden sprite_index'i spr_battle_soul_red olarak SABITLIYORDU.
//  Oysa butun turlar ruh degistirirken ayni nesneyi yaratiyor: sari (DR) ve
//  turuncu ruha gecerken de KIRMIZI kalp parliyordu.
//
//  Artik sprite battle_soul'dan okunuyor. Okuma isi Step'te, cunku bu efekt
//  her cagri yerinde Battle_SetSoul'dan HEMEN ONCE yaratiliyor -- su anda
//  battle_soul hala ESKI ruh. Step ilk karesinde yeni ruhu goruyor.
//
//  (Nesnenin adindaki "red" artik tarihsel: butun renkler bunu kullaniyor.)
//==========================================================================
depth=DEPTH_BATTLE.SOUL-1
x=battle_soul.x
y=battle_soul.y
sprite_index=battle_soul.sprite_index
image_index=0
image_speed=0
audio_play_sound(snd_ding,0,false)
Anim_Create(id,"image_alpha",0,1,1,-1,70)

Anim_Create(id,"image_xscale",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,1,2,65)
Anim_Create(id,"image_yscale",ANIM_TWEEN.EXPO,ANIM_EASE.OUT,1,2,65)
