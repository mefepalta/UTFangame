// Sprite'in origin'i sapin ucunda (0,39) ve cekic o noktanin etrafinda
// donuyor. Pivot, sapma sifirken carpma kosesi (head_corner) tam vurus
// noktasina denk gelecek sekilde bir kez hesaplaniyor; boylece savurma
// sirasinda bas duvardan uzaklasip yay ciziyor.
var _m  = ((along >= 0) ? 1 : -1);
var _a0 = WallAngle();
var _cx = head_corner_x*hammer_scale*_m;
var _cy = head_corner_y*hammer_scale;

var _px = hit_x - (_cx*dcos(_a0) + _cy*dsin(_a0));
var _py = hit_y - (-_cx*dsin(_a0) + _cy*dcos(_a0));

draw_sprite_ext(spr_alphys_hammer,0,_px,_py,hammer_scale*_m,hammer_scale,_a0+_angle*_m,c_white,_alpha);
