function OW_WindowLight(_worldX, _worldY)
{
	var _windowSpacing = 108;
	var _windowFirstCenter = 223.5;
	var _windowCount = 9;
	var _radiusX = 62;
	var _floorTopY = 100;
	var _floorBottomY = 216;
	var _floorTopLight = 1.0;
	var _floorBottomLight = 0.25;
	var _yFallOff = 60;

	var _index = clamp(round((_worldX - _windowFirstCenter) / _windowSpacing), 0, _windowCount - 1);
	var _windowCenter = _windowFirstCenter + _index * _windowSpacing;

	var _lightX = clamp(1 - (abs(_worldX - _windowCenter) / _radiusX), 0, 1);

	var _lightY;
	if (_worldY <= _floorTopY)
	{
		_lightY = _floorTopLight;
	}
	else if (_worldY <= _floorBottomY)
	{
		var _t = (_worldY - _floorTopY) / (_floorBottomY - _floorTopY);
		_lightY = lerp(_floorTopLight, _floorBottomLight, _t);
	}
	else
	{
		var _below = (_worldY - _floorBottomY) / _yFallOff;
		_lightY = _floorBottomLight * clamp(1 - _below, 0, 1);
	}

	return _lightX * _lightY;
}
