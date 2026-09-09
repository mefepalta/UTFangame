function Splash(alphaStart,duration){
	splashy = instance_create_depth(0,0,0,SplashObject);
	splashy.startAlpha = alphaStart
	splashy.duration = duration
	return splashy;
}