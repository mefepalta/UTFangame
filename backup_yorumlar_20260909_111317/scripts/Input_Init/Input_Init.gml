function Input_Init() {

	global._gmu_input=ds_map_create();
	global._gmu_input_state_override=ds_map_create();

	enum INPUT_TYPE{
		KEYBOARD,
		GAMEPAD,
		MOUSE
	};

	enum INPUT_STATE{
		NULL,
		HELD,
		PRESSED,
		RELEASED
	};

	return true;


}
