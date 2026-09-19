if (alpha <= 0) or (array_length(lines) == 0) or (gizli) { exit; }
if (((t div blink) & 1) == 1) { exit; }

draw_set_font(fnt);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var _n = array_length(lines);
var _y0 = y-line_h*(_n-1)/2;
for (var _i = 0; _i < _n; _i++)
{
	draw_text_transformed_color(x,_y0+_i*line_h,lines[_i],sc,sc,0,col,col,col,col,alpha);
}
draw_set_halign(fa_left);
draw_set_valign(fa_top);

if (isaret)
{
	// Unlemli ucgen uyari levhasi, metnin solunda
	var _tw2 = 0;
	for (var _i = 0; _i < _n; _i++) { _tw2 = max(_tw2,string_width(lines[_i])*sc); }
	var _ix = x-_tw2/2-14;
	var _iy = y;
	var _r = 9;
	draw_set_color(col);
	draw_set_alpha(alpha);
	draw_triangle(_ix,_iy-_r,_ix-_r,_iy+_r*0.8,_ix+_r,_iy+_r*0.8,true);
	draw_triangle(_ix,_iy-_r+1,_ix-_r+1,_iy+_r*0.8-1,_ix+_r-1,_iy+_r*0.8-1,true);
	draw_rectangle(_ix-1,_iy-4,_ix,_iy+1,false);
	draw_rectangle(_ix-1,_iy+3,_ix,_iy+4,false);
	draw_set_alpha(1);
	draw_set_color(c_white);
}

if (ok)
{
	// Metinden hedefe (hx,hy) dogru kisa bir ok
	var _tw = 0;
	for (var _i = 0; _i < _n; _i++) { _tw = max(_tw,string_width(lines[_i])*sc); }
	var _bx = x-_tw/2-6;
	var _by = y+line_h*_n/2;
	var _d = point_direction(_bx,_by,hx,hy);
	var _ex = hx+lengthdir_x(14,_d+180);
	var _ey = hy+lengthdir_y(14,_d+180);
	draw_set_color(col);
	draw_set_alpha(alpha);
	draw_line_width(_bx,_by,_ex,_ey,2);
	draw_line_width(_ex,_ey,_ex+lengthdir_x(8,_d+150),_ey+lengthdir_y(8,_d+150),2);
	draw_line_width(_ex,_ey,_ex+lengthdir_x(8,_d-150),_ey+lengthdir_y(8,_d-150),2);
	draw_set_alpha(1);
	draw_set_color(c_white);
}
