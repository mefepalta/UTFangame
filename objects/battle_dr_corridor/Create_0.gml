event_inherited();

//Engellerin arkasında kalsın diye biraz daha yüksek depth
depth=DEPTH_BATTLE.BULLET+10;

//Dünyanın aşağı akış hızı. Oyuncuya yukarı doğru ilerliyormuş hissi verir.
//Hızlanmanın tek kaynağı battle_soul_orange_dr.world_mul.
scroll_base=5;
scroll_spd=scroll_base;
scroll_off=0;

//Gri şeritler
stripe_gap=92;
stripe_h=5;

//Kalbin altına düşen şeffafımsı kalpler.
//Güç hareketi sırasında daha seyrek çıkıyorlar; aralık açıldıkça
//oyuncu daha hızlı gittiği izlenimine kapılıyor.
after_imgs=[];
after_timer=0;
after_delay_normal=5;
after_delay_special=11;

//Engel üretimi
spawn_on=true;
spawn_timer=70;
spawn_delay=105;

//Zıplama daireleri. Aralık, ruhun jump_dist'i ile aynı olmalı;
//yoksa zincirlenecek şekilde hizalanmıyorlar.
ring_on=true;
ring_gap=260;
ring_dist=0;
ring_margin=26;
