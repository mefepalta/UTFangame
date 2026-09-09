if (variable_global_exists("easy_final") && global.easy_final)
{
	room_goto(room_easy_ending);
}

instance_destroy();