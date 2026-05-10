///@desc Soul Collision
if global.kr=true{
    if (!instance_exists(hurtkr)) {
        instance_create_depth(0, 0, 0, hurtkr)
    }
}else{
    battle_soul._inv=50;
    instance_destroy(hurtkr);
    instance_destroy();
    Player_Hurt(3);
}