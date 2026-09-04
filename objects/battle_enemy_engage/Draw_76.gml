// Sans surface'i: boyutu SABIT tutuluyor.
// Eskiden her karede surface_resize cagriliyordu; bu D3D'de her karede
// eski texture'i yok edip yenisini olusturuyor (CreateTexture2D) ve
// suruculeri "device removed" ile dusuruyordu.
_surf_h_gerek = max(1,floor(y));

if (!surface_exists(_surf))
{
	_surf = surface_create(640,max(512,((_surf_h_gerek div 128)+1)*128));
}
else if (surface_get_height(_surf) < _surf_h_gerek)
{
	// sadece gercekten yetmediginde, 128'lik adimlarla buyut
	surface_resize(_surf,640,((_surf_h_gerek div 128)+1)*128);
}

surface_set_target(_surf);
draw_clear_alpha(0,0);
surface_reset_target();
