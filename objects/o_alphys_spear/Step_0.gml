_t++;

switch (kind)
{
	case 0:
		if (!_fired)
		{
			if (fade_in > 0)
			{
				image_alpha = min(1,image_alpha+fade_in);
			}
			else
			{
				image_alpha = 1;
			}

			if (drift_max <= 0) or (_t*drift <= drift_max)
			{
				x += lengthdir_x(drift,dir);
				y += lengthdir_y(drift,dir);
			}

			if (_t >= warn_time)
			{
				_fired = true;
				SpearSound(snd_spear_pierce);
			}
		}
		else
		{
			if (_gone < run_len) or (!run_stop)
			{
				x += lengthdir_x(spd,dir);
				y += lengthdir_y(spd,dir);
				_gone += spd;
			}

			if (_gone >= run_len)
			{
				image_alpha -= fade_out;
				if (image_alpha <= 0) { instance_destroy(); exit; }
			}
		}
	break;

	case 1:
		_ticker += ang_tick;
		var _step = max(ang_floor,ang_step-_ticker);
		ang += _step*orb_dir;

		if (orb_rad > 0)
		{
			image_alpha = min(1,image_alpha+fade_in);
			orb_rad -= orb_shrink;
			x = orb_x+lengthdir_x(orb_rad,ang);
			y = orb_y+lengthdir_y(orb_rad,ang);
			dir = ang+180;
		}
		else
		{
			image_alpha -= fade_out;
			if (image_alpha <= 0) { instance_destroy(); exit; }
		}
	break;

	case 2:
		image_alpha = min(1,image_alpha+fade_in);

		if (spin != 0) and (dive_life < 0)
		{
			image_angle += spin;
		}

		dive_life += dive_step;

		if (dive_life >= 0)
		{
			x += lengthdir_x(spd,dir);
			y += lengthdir_y(spd,dir);
		}
		if (dive_life > dive_fade)
		{
			image_alpha -= fade_out;
		}
		if (dive_life > dive_kill)
		{
			instance_destroy();
			exit;
		}
	break;

	case 3:
		if (abs(aim_to-aim_now) > 3)
		{
			aim_now += (aim_to-aim_now)/aim_ease;
		}
		image_angle = aim_now;

		if (image_alpha >= 1)
		{
			aim_vel += aim_acc;
			x += aim_sx*aim_vel/5;
			y += aim_sy*aim_vel/5;
		}
		else
		{
			image_alpha = min(1,image_alpha+fade_in);
		}

		if (_t == aim_toss) { SpearSound(snd_spear_toss); }

		if (abs(x-battle_board.x) > aim_out) or (abs(y-battle_board.y) > aim_out)
		{
			image_alpha -= fade_out;
			x += aim_sx*aim_vel/5;
			y += aim_sy*aim_vel/5;
			if (image_alpha <= 0) { instance_destroy(); exit; }
		}
	break;
}

if (!free_angle) and (kind != 3)
{
	image_angle = dir-90;
}

if (x < -850) or (x > 1500) or (y < -750) or (y > 1350)
{
	instance_destroy();
}
