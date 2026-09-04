if (!visible) exit;
if (dialogue_index >= array_length(dialogue)) exit;

var current = dialogue[dialogue_index];
var data = char_data[current.speaker];

// --- Music handling (check once per dialogue line)
if (variable_struct_exists(current, "music")) {
    // Only change if it's not already playing
    if (current_music != current.music) {
        if (current_music != noone) {
            audio_stop_sound(current_music);
        }
        current_music = current.music;
        audio_play_sound(current_music, 1, true);
    }
}

// --- Typing effect ---
if (!text_done) {
    text_timer++;
    if (text_timer >= text_speed) {
        text_timer = 0;
        if (char_index < string_length(current.text)) {
            char_index++;
            current_text = string_copy(current.text, 1, char_index);

            if (data.sound != noone) {
                var ch = string_char_at(current.text, char_index);
                if (ch != " ") {
                    var snd = audio_play_sound(data.sound, 0, false);
                }
            }
        } else {
            text_done = true;
        }
    }
}

// --- Skip typing (X) ---
if (Input_IsPressed(INPUT.CANCEL) && !text_done) {
    current_text = current.text;
    text_done = true;
    char_index = string_length(current.text);
}

// --- Next (Z) ---
if (Input_IsPressed(INPUT.CONFIRM) && text_done) {
    dialogue_index++;
    if (dialogue_index < array_length(dialogue)) {
        char_index = 0;
        current_text = "";
        text_done = false;
    } else {
        // Dialogue ended -> stop music
        if (current_music != noone) {
            audio_stop_sound(current_music);
            current_music = noone;
        }

        // Trigger alarm instead of destroying immediately
        alarm[1] = room_speed * 3; // 1 second delay (adjust as needed)
    }
}