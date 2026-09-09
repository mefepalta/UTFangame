if (room != room_area_beforesans && room != room_area_aftersans)
{
	exit;
}

var _windowSpacing = 108;
var _windowFirstCenter = 223.5;
var _windowCount = 9;
var _beamColor = make_color_rgb(150, 185, 235);

for (var i = 0; i < _windowCount; i++)
{
	var _wx = _windowFirstCenter + i * _windowSpacing;
	OW_DrawLightBeam(_wx, 96, 232, 24, _beamColor, 0.6);
}
