event_inherited();

depth = DEPTH_BATTLE.BULLET_OUTSIDE_HIGH;
sprite_index = spr_alphys_lightning_bolt;
image_speed = 0;
image_index = 0;
image_alpha = 0;

bolt_scale = 3;
spin       = 6;
fade_in    = 8;

boom_scale = 0.6;
boom_grow  = 0.22;
boom_time  = 22;

fan_count  = 8;
fan_speed  = 5;
fan_curve  = 2.6;
fan_decay  = 0.978;
fan_spin   = 8;
fan_scale  = 1;

serbest_y = -1;

_state = 0;
_t = 0;

Explode = function()
{
	_state = 1;
	_t = 0;
	speed = 0;
	audio_play_sound(kaboom,0,false);
	Camera_Shake(6,6,1,1,1,1);

	var _base = irandom(359);
	for (var _i = 0; _i < fan_count; _i++)
	{
		var _b = instance_create_depth(x,y,DEPTH_BATTLE.BULLET_OUTSIDE_HIGH,o_alphys_bolt);
		_b.direction = _base + _i*(360/fan_count);
		_b.speed = fan_speed;
		_b.spin  = fan_spin;
		_b.curve = fan_curve;
		_b.curve_decay = fan_decay;
		_b.scale = fan_scale;
	}
};
