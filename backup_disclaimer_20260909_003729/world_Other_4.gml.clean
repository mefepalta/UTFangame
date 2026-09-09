Flag_Set(FLAG_TYPE.STATIC,FLAG_STATIC.ROOM,room);

room_persistent=false;

// --- Texture group VRAM yonetimi ---
// tg_story (hikaye panelleri + kredi gorselleri, 5 texture sayfasi) sadece
// kullanildigi odalarda VRAM'de tutulur; diger odalarda VRAM'den atilir.
// Sayfalar WAD'ta kaldigi icin cizim aninda otomatik geri yuklenir.
var _tg_story_odasi = (room == room_story) || (room == room_credits) || (room == room_story_final);
var _tg_sayfalar = texturegroup_get_textures("tg_story");
for (var _i = 0; _i < array_length(_tg_sayfalar); _i++)
{
	if (_tg_story_odasi) { texture_prefetch(_tg_sayfalar[_i]); }
	else { texture_flush(_tg_sayfalar[_i]); }
}
