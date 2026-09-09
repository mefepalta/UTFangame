
if(Battle_ConvertMenuChoiceEnemyToEnemySlot(Battle_GetMenuChoiceEnemy())!=_enemy_slot){
    exit;
}

switch(Battle_GetMenuChoiceButton()){
    case BATTLE_MENU_CHOICE_BUTTON.ACT:
        switch(Battle_GetMenuChoiceAction()){
            case 0:
                global.checkornot = true;
                Dialog_Add("* PAPYRUS ?? ATK ?? DEF{pause}{clear}* A gentle smile curls his face.{pause}{clear}* He can rest easy knowing the&  future is ensured by a hopeful&  tomorrow.")
                break;
        }
        break;
}
