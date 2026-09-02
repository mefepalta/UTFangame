var horizontal_stab = ((battle_board.y-(battle_board.down+battle_board.right))-60)

var left_box = (battle_board.x-battle_board.left)-5;
var right_box = (battle_board.x+battle_board.right)+5;
var up_box = (battle_board.y-battle_board.up)-5;
var down_box = (battle_board.y+battle_board.down)+5;

var bottom_box = (battle_board.y+battle_board.down)-2;
var top_box = (battle_board.y-battle_board.up)+2;

if (room == room_battle)
{
	if (_timer == 1)
	{
		Battle_SlamDown();
		Battle_SetBoardSizeCubic(35,65,220,220);
		audio_play_sound(snd_impact,2,false);
	}
	if (_timer > 0) and (_timer < 580) and (_timer % 50 == 0)
	{
		RegularBone(left_box,bottom_box,24,4,0,0,0,0,1,0,0,0,0,true);
	}
	if (_timer > 0) and (_timer < 580) and (_timer % 50 == 0)
	{
		RegularBone(right_box,top_box,24,-4,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer > 0) and (_timer < 580) and (_timer % 150 == 0)
	{
		RegularBlaster(320,-50,battle_soul.x,top_box-100,270,270,10,20,2,2,50);
	}
	if (_timer > 0) and (_timer < 580) and (_timer % 150 == 0)
	{
		RegularBlaster(320,-50,left_box - 50,battle_soul.y,0,0,10,20,2,2,50);
	}
	if (_timer == 580)
	{
		Battle_SetBoardSizeCubic(65,65,110,110);
	}
	// NOT: burada eskiden left_box+120'den yukselen bir kemik vardi. O nokta
	// kutunun tam ortasi; duvarin boslugu ortaya dustugunde oyuncuyu
	// boslugun icinde sikistiriyordu, o yuzden kaldirildi. Zemindeki yatay
	// kemik (asagidaki %70) dokusu saglamaya devam ediyor.
	// NOT: burada vurus boyunca soldan saga suzulen bir zemin kemigi vardi.
	// Dalga tavandan geldiginde oyuncu zaten asagi serite inmek zorunda
	// oluyor ve bu kemik tam oraya denk geliyordu; kaldirildi.
	if (_timer == 650)
	{
		with (o_smaaash)
		{
			// Yukselme sesini o_smaaash 0. karede kendisi caliyor; burada bir
			// daha calmiyoruz. prev_frame sifirlaniyor ki dongunun kare
			// olaylari (ozellikle 7. karedeki carpma) bastan yakalansin.
			prev_frame = -1;
			hiz = T3_SLAM_HIZ;	// dongu ~114 kare: dalga rahatca tarayip bitiyor
			image_index = 0;
			_ready = true;
		}
	}

	// Uc dalga: carpmalar 750, 892 ve 1034. Sonuncusu 1132'de tarayip
	// bitiyor, bolum 1200'de kapaniyor -- hicbir dalga yarida kesilmiyor.
	// Sok dalgasi tam YERE CARPMA karesinde basliyor -- kol kalkarken
	// oyuncu vurusun geldigini goruyor, carpma aninda da sarsinti + dalga
	// birlikte cikiyor. 1000'den sonra yeni dalga yok ki sonuncusu bolum
	// bitmeden tarayip bitsin.
	if (_timer >= 650) and (_timer <= 1050) and (o_smaaash.vurdu)
	{
		DalgaBasla();
	}
	DalgaAdim();
	if (_timer == 1200)
	{
		with (o_smaaash)
		{
			_ready = false;
			hiz = 1;	// diger sahneler icin varsayilan tempoya donuyor
		}
		DalgaTemizle();
		anotherTest = instance_create_depth(0,0,0,battle_dialog_enemy);
		anotherTest.text = "{font 3}{voice 3}{head 13}{squish 1.2}you'll soon get what's&coming to you.";
	}
	if (_timer > 1200)
	{
		if !(instance_exists(anotherTest))
		{
			Battle_SetSoul(battle_soul_red);
			Battle_SetMenuDialog("* Just as weak as everyone&  else.")
			Battle_EndTurn();
		}
	}
}
if (room == room_battle_1)
{
	if (_timer == 1)
	{
		battle_enemy_engage.p2_head_sprite = spr_p2_idle;
	}
	if (_timer = 20)
	{
		RegularBlaster(320,-50,left_box - 50,bottom_box - 65,0,0,460,55,1,2,30);
	}
	if (_timer = 85)
	{
		if (battle_soul.y < bottom_box - 65)
		{
			Battle_SlamUp();
		}
		if (battle_soul.y > bottom_box - 65)
		{
			Battle_SlamDown();
		}
	}
	if (_timer > 100) and (_timer < 421) and (_timer % 30 == 0)
	{
		RegularBone(right_box,bottom_box,20,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,bottom_box - 40,20,-4,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,20,4,0,180,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box + 40,20,4,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer = 480)
	{
		if (battle_soul.y < bottom_box - 65)
		{
			Battle_SlamRight()
		}
		if (battle_soul.y > bottom_box - 65)
		{
			Battle_SlamLeft()
		}
	}
	if (_timer == 540)
	{
		Battle_SetSoul(battle_soul_red);
	}
	if (_timer == 570)
	{
		Battle_SetBoardSizeCubic(65,65,150,150);
	}
	if (_timer > 600) and (_timer < 800) and (_timer % 30 == 0)
	{
		RegularBone(left_box,bottom_box,81,5,0,0,0,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,81,-5,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer > 600) and (_timer < 800) and (_timer % 15 == 0)
	{
		RegularBone(left_box,bottom_box,152,7,0,0,2,0,1,0,0,0,0,true);
		RegularBone(right_box,top_box,152,-7,0,180,2,0,1,0,0,0,0,true);
	}
	if (_timer == 850)
	{
		RegularBone(right_box,bottom_box,81,-6,0,0,0,0,1,0,0,0,0,true);
		RegularBone(left_box,top_box,81,6,0,180,0,0,1,0,0,0,0,true);
	}
	if (_timer == 920)
	{
		o_sans_blockp2.sprite_index = spr_p2_comeatmebro;
		Battle_SetSoul(battle_soul_red);
		Battle_SetMenuDialog("* Here they come!")
		Battle_EndTurn();
	}
}