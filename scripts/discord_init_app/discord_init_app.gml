/// @param Discord_App_ID
function discord_init_app(argument0) {
	/*
	Use este script logo após iniciar o discord_init_dll, para se conectar ao seu APP_ID
	para conseguir um app id, crie uma aplicação aqui > (https://discordapp.com/developers/applications/)

	Arguments : 
	1 - Application Id (String)

	Returns:
	- Boolean (Whether successful)

	-----------------------------------------

	Discord Rich Presence for Game Maker made by Aouab

	*/

	return external_call(global.__d_init,argument0)


}
