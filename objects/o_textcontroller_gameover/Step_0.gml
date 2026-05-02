// Time since game start
var elapsed = (current_time - start_time) / 1000;

// Start new line when its time is reached
if (current_line + 1 < array_length(dialogue)) {
    if (elapsed >= dialogue[current_line + 1].time) {
        current_line++;
        line_start_time = elapsed;
        last_chars = 0; // reset when new line starts
    }
}
