ds_map_destroy(_turn_info);

// Savas sirasinda Dialog_Add ile kuyruga girip hic gosterilmemis metinleri
// temizle. Savasta Dialog_Start() her zaman false doner (Player_IsInBattle),
// kuyruk yalnizca BATTLE_STATE.DIALOG icinde bosaltilir; savas o durumdan
// gecmeden biterse (oda degisimi, erken cikis) metin global kuyrukta kalir.
// Overworld'de bir sonraki Dialog_Start onu ACIKLAMANIN USTUNE basiyordu --
// "esyayi check yapinca can alma diyalogu oynuyor" sikayeti buydu.
// Oyun kapanirken CleanUp, Dialog_Uninit'ten SONRA da calisabiliyor:
// kuyruk o an yok edilmis oluyor, korumasiz cagri "invalid reference"
// hatasi veriyordu.
if (variable_global_exists("_dialog_queue")
and ds_exists(global._dialog_queue,ds_type_queue))
{
	Dialog_Clear();
}
