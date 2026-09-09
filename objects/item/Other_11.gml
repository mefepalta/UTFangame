if (variable_instance_exists(id,"_description"))
{
	Dialog_Add(_description);
	Dialog_Start();
}

instance_destroy();
