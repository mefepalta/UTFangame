function Battle_AddBoardExtraVertex(){
	var BOARD = argument[0];
	var X = argument[1];
	var Y = argument[2];
	var VERTEXLIST = BOARD.listVertex;
	
	ds_list_add(VERTEXLIST,[X,Y])
	BOARD.updateDivide();
}

