// Faz 1 Sans'inin gizlenip geri getirilmesi. KENAR tetikli: yalnizca _ready
// degistigi karede is yapiyor, boylece baska sahnelerin (orn. o_p1final_fall)
// ayarladigi saydamliklari her adim ezmiyor.
if (_ready != _onceki_ready)
{
	_onceki_ready = _ready;
	if (_ready)
	{
		with (battle_enemy_engage)
		{
			other._saklanan = [_head_alpha,_spear_alpha,_legs_alpha,_legs_alpha1,
			                   _armleft_alpha,_armright_alpha,_armleft_alpha1,_armright_alpha1];
			_head_alpha = 0;
			_spear_alpha = 0;
			_legs_alpha = 0;
			_legs_alpha1 = 0;
			_armleft_alpha = 0;
			_armright_alpha = 0;
			_armleft_alpha1 = 0;
			_armright_alpha1 = 0;
		}
	}
	else if (is_array(_saklanan))
	{
		with (battle_enemy_engage)
		{
			_head_alpha      = other._saklanan[0];
			_spear_alpha     = other._saklanan[1];
			_legs_alpha      = other._saklanan[2];
			_legs_alpha1     = other._saklanan[3];
			_armleft_alpha   = other._saklanan[4];
			_armright_alpha  = other._saklanan[5];
			_armleft_alpha1  = other._saklanan[6];
			_armright_alpha1 = other._saklanan[7];
		}
		_saklanan = -1;
	}
}

if (_ready == true)
{
    image_alpha = 1;
    image_speed = hiz;
}
if (_ready == false)
{
    image_alpha = 0;
    image_speed = 0;
}

// Trigger when the frame actually CHANGES
var current_frame = floor(image_index);

yukseldi = false;
vurdu = false;

if (image_alpha == 1 && current_frame != prev_frame)
{
    if (current_frame == 0)
    {
        audio_play_sound(snd_smash_rise, 2, false);
        yukseldi = true;	// kol kalkti: vurusun geldigi buradan belli oluyor
    }
    if (current_frame == 7)
    {
        audio_play_sound(snd_smash_impact, 2, false);
        Camera_Shake(5,5,1,1,1,1);
        vurdu = true;		// yere carpti: sok dalgasi tam bu karede yayiliyor
    }
}

// Update previous frame
prev_frame = current_frame;
