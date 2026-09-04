Battle_SetBoardSizeCubic(65,65,150,150);

P25Sahneye();
if (instance_exists(o_p25_battle)) and (global.p25phase <= 2) { o_p25_battle.kafa = 0; }

global.checkornot = false;

if (global.p25phase <= 2)
{
	sansy = instance_create_depth(0,0,0,battle_dialog_enemy);
	sansy.text = "{speaker 0}{font 3}{voice 3}Th-... that's right...{pause}{clear}I'm... not done...&with you yet!{pause}{clear}What... What's the&matter...?{pause}{clear}Come on, I still got&some fight left in&me...!";
}
