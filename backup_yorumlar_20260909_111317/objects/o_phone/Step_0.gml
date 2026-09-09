if (!visible) exit;
if (dialogue_index >= array_length(dialogue)) exit;

if (!instance_exists(_inst_text)) {
    dialogue_index++;
    if (dialogue_index >= array_length(dialogue)) {
        if (_current_music != noone) {
            audio_stop_sound(_current_music);
        }
        alarm[1] = room_speed * 2;
        exit;
    }
    event_user(0);
}