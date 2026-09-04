var current = dialogue[dialogue_index];
var spk = current.speaker;

if (variable_struct_exists(current, "music")) {
    if (_current_music != current.music) {
        if (_current_music != noone) audio_stop_sound(_current_music);
        _current_music = current.music;
        if (_current_music != noone) audio_play_sound(_current_music, 1, true);
    }
}

_portrait_sprite = char_portrait[spk];
_portrait_expression = current.expression;

if (instance_exists(_inst_text)) {
    instance_destroy(_inst_text);
}

var _text_x = (char_portrait[spk] != noone) ? 160 : 60;
_inst_text = instance_create_depth(_text_x, 336, 0, text_typer);
_inst_text.text = "{gui true}{shadow true}{scale 2}{speed 1}{depth " + string(depth-1) + "}";
_inst_text.text += "{voice " + string(char_voice[spk]) + "}";
_inst_text.text += "{font " + string(char_font[spk]) + "}";
if (spk == 2) {
    _inst_text.text += "{effect 1}";
}
_inst_text.text += current.text + "{pause}{end}";