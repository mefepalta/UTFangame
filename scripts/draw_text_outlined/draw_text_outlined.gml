function draw_text_outlined() {
	var xx,yy;
	xx = argument[0];
	yy = argument[1];
  
	draw_set_color(argument[2]);
	draw_text(xx+1, yy+1, argument[4]);
	draw_text(xx-1, yy-1, argument[4]);
	draw_text(xx,   yy+1, argument[4]);
	draw_text(xx+1,   yy, argument[4]);
	draw_text(xx,   yy-1, argument[4]);
	draw_text(xx-1,   yy, argument[4]);
	draw_text(xx-1, yy+1, argument[4]);
	draw_text(xx+1, yy-1, argument[4]);

	draw_text(xx+2, yy+2, argument[4]);
	draw_text(xx-2, yy-2, argument[4]);
	draw_text(xx,   yy+2, argument[4]);
	draw_text(xx+2,   yy, argument[4]);
	draw_text(xx,   yy-2, argument[4]);
	draw_text(xx-2,   yy, argument[4]);
	draw_text(xx-2, yy+2, argument[4]);
	draw_text(xx+2, yy-2, argument[4]);
  
	draw_set_color(argument[3]);
	draw_text(xx, yy, argument[4]);
}