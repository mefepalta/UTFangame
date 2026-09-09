function Dialog_Add() {
	ds_queue_enqueue(global._dialog_queue,Difficulty_KuyrukMetin(argument[0]));
	return true;


}
