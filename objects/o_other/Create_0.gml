valval = 0;

depth = -1000;

DISC_ALWAYS = true;

disc_savefile = "save.ini";

disc_title = "DISCLAIMER";

disc_lines = [
    "Swapfell DISCORD is a fan game.",
    "UNDERTALE and DELTARUNE belong to Toby Fox.",
    "",
    "It is made for players who already know",
    "UNDERTALE and DELTARUNE. Their characters,",
    "mechanics and story beats are used here",
    "without explanation, and both games get",
    "spoiled along the way.",
    "",
    "If you haven't played them yet, play them first.",
    "",
    "Not affiliated with or endorsed by Toby Fox."
];

disc_prompt = "PRESS  Z  TO CONTINUE";

TITLE_SCALE = 1.8;
LINE_H      = 24;
FADE_IN     = 0.035;
FADE_OUT    = 0.06;
MIN_HOLD    = 45;

var _body_h  = array_length(disc_lines) * LINE_H;
var _title_h = 30 * TITLE_SCALE;
var _total   = _title_h + 30 + _body_h;

disc_title_y = (480 - _total) * 0.5 - 20;
disc_body_y  = disc_title_y + _title_h + 30;

disc_shown   = true;
disc_alpha   = 0;
disc_time    = 0;
disc_leaving = false;
disc_blink   = 0;

if (!DISC_ALWAYS) {
    ini_open(disc_savefile);
    var _seen = (ini_read_real("PlayerData", "DisclaimerSeen", 0) > 0);
    ini_close();
    if (_seen) disc_shown = false;
}
