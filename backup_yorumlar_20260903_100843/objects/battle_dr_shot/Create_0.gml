event_inherited();

//Oyuncunun ateşlediği mermi. Sarı ruh doğururken sprite/hız/yön atıyor.
//Kutunun dışına çıktığı için kutu yüzeyine değil doğrudan ekrana çiziliyor.
depth=DEPTH_BATTLE.BULLET_OUTSIDE_LOW;

big=false;
dir=0;
spd=13;
reflected=false;	//aynadan sekti mi (sekince ruha hasar verir)
life=240;

ang=0;				//çizim açısı; savrulunca dir'den bağımsızlaşıyor

//Büyük hedefe çarpan küçük mermi: turuncu ruhtaki kırılan kemik parçaları
//gibi savrulup dönerek düşüyor. Bu hâldeyken hiçbir şeye etki etmiyor.
bounced=false;
vx=0;
vy=0;
grav=0.42;
spin=0;
