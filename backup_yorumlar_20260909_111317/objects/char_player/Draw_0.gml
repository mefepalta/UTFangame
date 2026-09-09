if (room == room_area_beforesans || room == room_area_aftersans)
{
	OW_ShadowDrawLitTinted(make_color_rgb(70, 80, 110), make_color_rgb(95, 100, 112), 0.8, OW_WindowLight(x, y));
}
else
{
	draw_self();
}
if (!instance_exists(o_temp_sprite))
{
	instance_create_layer(x, y, "Instances", o_temp_sprite);
}
