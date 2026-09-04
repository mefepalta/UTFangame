/// @param State (String)
/// @param Details (String)
/// @param Key of large image (String)
/// @param Key of small image (String)
function discord_update_presence(argument0, argument1, argument2, argument3) {

	/*

	Este script atualiza as informações mostradas no discord

	Arguments : 
	- State (String)
	- Details (String)
	- Key of large image (String)
	- Key of small image (String)

	Returns:
	- Void

	-----------------------------------------

	Discord Rich Presence for Game Maker made by Aouab

	*/
	external_call(global.__d_update,argument0,argument1,argument2,argument3)


}
