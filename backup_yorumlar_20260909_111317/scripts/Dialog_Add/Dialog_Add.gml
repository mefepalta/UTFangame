function Dialog_Add() {
	// EASY'de Sans'in overworld replikleri de "..." oluyor. Kuyrukta esya,
	// tabela, telefon ve CHECK metinleri de var; filtre {font 3} uzerinden.
	ds_queue_enqueue(global._dialog_queue,Difficulty_KuyrukMetin(argument[0]));
	return true;


}
