event_inherited();
if (Battle_GetState() == BATTLE_STATE.IN_TURN && moveable) {

    // Platform takip kodu KALDIRILDI — artık platform Begin Step'te yapılıyor

    if (jump_state = 0) {
        if (xprevious != x || yprevious != y) {
            global.is_moving = 1;
        } else {
            global.is_moving = 0;
        }
    } else {
        global.is_moving = 1;
    }
}