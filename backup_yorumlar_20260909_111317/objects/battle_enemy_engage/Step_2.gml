if global.kr=true{
var kr=Player_GetKr();
var timer=Player_GetKrTimer();

if(timer==0){
    Player_SetKr(kr-1);
    Player_SetKrTimer(-1);
}else if(timer>0){
    Player_SetKrTimer(timer-1);
}

if(timer==-1){
    if(kr==90){
        Player_SetKrTimer(1);
    }else if(kr<=89&&kr>=70){
        Player_SetKrTimer(2);
    }else if(kr<=69&&kr>=50){
        Player_SetKrTimer(4);
    }else if(kr<=49&&kr>=20){
        Player_SetKrTimer(10);
    }else if(kr<=19&&kr>=10){
        Player_SetKrTimer(30);
    }else if(kr<=9&&kr>=1){
        Player_SetKrTimer(60);
    }
}
}