///@desc Menu End

// ACT > Check yalnizca bu karakter secildiyse
if(Battle_ConvertMenuChoiceEnemyToEnemySlot(Battle_GetMenuChoiceEnemy())!=_enemy_slot){
    exit;
}

switch(Battle_GetMenuChoiceButton()){
    case BATTLE_MENU_CHOICE_BUTTON.ACT:
        switch(Battle_GetMenuChoiceAction()){
            case 0:  ///Check
                global.checkornot = true;
                Dialog_Add("* ALPHYS ?? ATK ?? DEF{pause}{clear}* A fallen warrior returned to&  settle the score.{pause}{clear}* Her immense pride is palpable&  for the man she chose to be&  her successor.")
                break;
        }
        break;
}
