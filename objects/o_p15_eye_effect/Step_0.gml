image_xscale += 0.02;
image_yscale += 0.02;
image_alpha  -= 0.02;

// Eskiden "== 0" ile karsilastiriliyordu; kayan noktali toplama tam 0'a
// oturmadigi icin ornek hic yok olmayabiliyordu.
if (image_alpha <= 0)
{
	instance_destroy();
}
