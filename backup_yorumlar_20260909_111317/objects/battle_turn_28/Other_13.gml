// Tur beklenmedik bir sekilde biterse (or. oyuncu olurse) imlec ve girdi
// kilidi acik kalmasin.
if (ara_kilit) { Win_Split_Birak(); ara_kilit = false; }
global.no_quit = false;

instance_destroy();