function Player_GetRoomName() {
    var ROOM=argument[0];
    var name="";
    switch(ROOM){
        case -1:
            name="--";
            break;
        case room_area_0:
            name="Last Corridor";
            break;
        case room_area_1:
            name="Last Corridor";
            break;
    }
    return name;
}