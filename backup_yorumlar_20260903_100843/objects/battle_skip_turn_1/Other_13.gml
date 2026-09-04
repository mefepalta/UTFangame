///@desc Turn End
if (global.sanstalk == 23) and (global.finalstretch < 8)
{
	global.finalstretch++;
}
// Mizrak sahnesi Sans'in elindeki mizragi gizliyor, sprite'ini savurma
// karesiyle degistiriyor ve onu karartiyor (image_blend). Oyuncu olmeden
// tur biterse hepsini geri aliyoruz, yoksa Sans mizraksiz ve simsiyah kalir.
SapTemizle();
instance_destroy();
