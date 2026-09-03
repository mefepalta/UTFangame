// Ruh ile birlikte hareket ve RENK. Battle_SetSoul eski ruh nesnesini yok
// edip yenisini yarattigi icin sprite de degisiyor; her kare yeniden
// okuyunca sari ruhta sari, turuncu ruhta turuncu parliyor.
if (instance_exists(battle_soul))
{
	x=battle_soul.x
	y=battle_soul.y
	sprite_index=battle_soul.sprite_index
	image_index=0
}

// Solma bitince kendini temizle. Eskiden bunu yapan hicbir sey yoktu:
// alpha 0'a inen ornek turun/savasin sonuna kadar yasiyor ve her kare
// ruhu takip etmeye devam ediyordu.
if (image_alpha <= 0) { instance_destroy(); }
