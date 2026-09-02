// KAPANIS SAHNESI: parca serbest kaldiysa rig'i takip etmiyor, kendi
// balistik yoluyla dusuyor ve ekranin altinda yok oluyor.
if (serbest)
{
	v_t += 1;
	vy += yerc;
	x += vx;
	y += vy;
	if (sal > 0) { image_angle = dsin(v_t*sal_hiz)*sal; }
	else { image_angle += vd; }
	if (y > 880) { instance_destroy(); }
	exit;
}

y = lerp(y, target_y, move_speedy);
x = lerp(x, target_x, move_speedx);

if (!manuel)
with (o_p1final_fall)
{
	if (p1finalattackval == 470)
	{
		other.image_alpha = 1;
		
		with (o_p1final_gbsans)
		{
			image_alpha = 1;
		}
		with (o_p1final_gbbottom)
		{
			image_alpha = 1;
		}
	}
	if (p1finalattackval == 520)
	{
		other.target_x = 448;
		other.target_y = 194;
	}
}