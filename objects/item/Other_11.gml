// Bazi alt esyalar (item_stick, item_toy_knife, item_bandage,
// item_faded_ribbon, item_tml) kendi Other_11'inde metnini Lang_GetString ile
// yaziyor ve buraya SADECE instance_destroy() icin event_inherited() ile
// geliyor. Onlarda _description hic tanimli degil, dolayisiyla kosulsuz
// Dialog_Add(_description) "not set before reading it" ile oyunu dusuruyordu
// (overworld menusunde o esyalari CHECK yapinca).
if (variable_instance_exists(id,"_description"))
{
	Dialog_Add(_description);
	Dialog_Start();
}

instance_destroy();
