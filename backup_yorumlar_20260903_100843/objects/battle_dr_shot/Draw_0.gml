//Kutunun dışına çıkıyor, o yüzden kutu yüzeyine değil doğrudan ekrana.
//Sekmiş mermi kırmızıya çalıyor ki oyuncu tehlikeyi görsün.
var COL=reflected ? make_color_rgb(255,120,120) : c_white;
if(bounced){
	//Savrulan mermi sönükleşiyor: artık etkisiz olduğu belli olsun
	COL=make_color_rgb(160,160,160);
}
draw_sprite_ext(sprite_index,0,x,y,1,1,ang,COL,1);
