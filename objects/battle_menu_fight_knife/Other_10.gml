///@desc Anim
if(Battle_GetMenuFightDamage()>=0){
	// Slash, secili hedefin uzerinde cikmali. Phase 2'de Papyrus ve Alphys de
	// birer slot ve Sans'in kendisi de hizalamaya gore yer degistiriyor; bu
	// yuzden nesnenin x'i degil ciziim konumu kullaniliyor.
	var _slot=Battle_ConvertMenuChoiceEnemyToEnemySlot(Battle_GetMenuChoiceEnemy());
	var _tx=battle_enemy_engage.x;
	var _ty=battle_enemy_engage.y-100;

	if(room==room_battle_1){
		with(battle_enemy_engage){
			if(_slot==0){
				_tx=pap_draw_x;
				_ty=y-110;
			}else if(_slot==2){
				_tx=alp_draw_x;
				_ty=y-90;
			}else{
				_tx=p2_draw_x;
				_ty=y-100;
			}
		}
	}

	instance_create_depth(_tx,_ty,0,battle_menu_fight_anim_knife);
}
