if (instance_exists(_beam)){
	if _stage = "beam end"{
		if _beam.image_alpha < 0.1{
			follow=false
			instance_destroy()
		}
	}
}