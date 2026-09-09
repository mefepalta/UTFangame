var _elapsed = (current_time - start_time) / 1000;

// Sirali satirlar
if (current_line + 1 < array_length(dialogue))
{
	if (_elapsed >= dialogue[current_line + 1].t)
	{
		current_line++;
		if (instance_exists(_inst_text)) { instance_destroy(_inst_text); }
		_inst_text = instance_create_depth(85, 300, -9999, text_typer);
		_inst_text.text = _prefix + dialogue[current_line].text;
	}
}

// Son satirdan sonra: muzigi kis, menuye don.
if (!_biten) and (_elapsed >= son_satir_sonu)
{
	_biten = true;
	_cikis_t = 0;
	if (audio_is_playing(global.ending_bgm)) { audio_sound_gain(global.ending_bgm, 0, 1500); }
}

if (_biten)
{
	_cikis_t += 1;
	if (_cikis_t >= 100)
	{
		if (audio_is_playing(global.ending_bgm)) { audio_stop_sound(global.ending_bgm); }
		if (instance_exists(_inst_text)) { instance_destroy(_inst_text); }
		room_goto(room_menu);
	}
}
