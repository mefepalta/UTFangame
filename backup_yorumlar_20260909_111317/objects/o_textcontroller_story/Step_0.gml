var val = o_story.storypanelval;

if (current_line + 1 < array_length(dialogue)) {
	if (val >= dialogue[current_line + 1].time) {
		current_line++;

		if (instance_exists(_inst_text)) {
			instance_destroy(_inst_text);
		}

		_inst_text = instance_create_depth(85, 310, -9999, text_typer);
		_inst_text.text = _prefix + dialogue[current_line].text;
	}
}

if (current_line >= 0) and (instance_exists(_inst_text)) {
	if (val >= dialogue[current_line].bit) {
		instance_destroy(_inst_text);
		_inst_text = noone;
	}
}
