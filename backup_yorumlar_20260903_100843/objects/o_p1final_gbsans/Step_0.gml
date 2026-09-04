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

if (!instance_exists(o_p1final_gbtop)) { exit; }

x = o_p1final_gbtop.x + 64;
y = o_p1final_gbtop.y - 130;

/*if (sprite_index == s_p1final_sans_slash) and (image_index == 3)
{
	slashtime = true;
}
else
{
	slashtime = false;
}
/*if (slashtime == true) and (slashtimer % 20 == 0)
{
	instance_create_depth(o_p1final_gbsans.x,o_p1final_gbsans.y,"Instances_2",o_p1final_sansslash);
}*/
