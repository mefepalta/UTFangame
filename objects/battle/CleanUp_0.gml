ds_map_destroy(_turn_info);

if (variable_global_exists("_dialog_queue")
and ds_exists(global._dialog_queue,ds_type_queue))
{
	Dialog_Clear();
}
