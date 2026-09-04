///@desc intro dialog 2
var inst=instance_create_depth(x+100,y-120,0,battle_dialog_enemy);
inst.text="{font FONT.BATTLE}{voice -1}{speed 5}{skippable false}should be&grinding&in grinder.";
inst.template=2;

Battle_SetTurnPreparationAutoEnd(true);