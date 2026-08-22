depth=DEPTH_BATTLE.UI;
visible=false;
y=40
ystart=65
// Eskiden 330'a sabitlenmisti; tek dusman varken dogruydu ama phase 2'de
// hasar sayisi hedefin degil ekranin ortasinda cikiyordu. Artik yaratildigi
// yeri takip ediyor. (+10, ciziimdeki -10 ofsetini dengeliyor; boylece sayi
// xstart'a, yani can barinin merkezine hizalaniyor.)
x=xstart+10
damage=0;
color=c_red;
display_time=60;
bar_visible=true;
// Normalde damage<=0 ise "BLOCKED"/"MISS" yazisi cikar. Alphys hasar aliyormus
// gibi gorunup 0 hasar aldigi icin, 0'in rakam olarak yazilmasi gerekiyor.
force_number=false;
bar_width=150;
bar_hp_max=0;
bar_hp_original=0;
bar_hp_target=0;
bar_duration=45;
_bar_hp=0;
dmg_sprite=spr_blocked_damage;

alarm[0]=1;