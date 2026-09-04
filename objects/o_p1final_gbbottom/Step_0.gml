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

x = o_p1final_gbtop.x + 68;
y = o_p1final_gbtop.y + 32;
image_angle = agiz;