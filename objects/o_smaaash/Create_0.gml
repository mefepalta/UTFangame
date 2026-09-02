image_speed = 0;
image_alpha = 0;
_ready = false;
prev_frame = -1; // store previous frame index
bonedirection = 0;

// Vurus dongusunun disariya bildirilen anlari. Atak, kemik dalgasini
// bunlara gore kuruyor; boylece desen animasyonla birebir ayni tempoda.
yukseldi = false;	/// kolunu kaldirdigi kare (dongu basi) -- tek kare true
vurdu = false;		/// yere carptigi kare -- tek kare true
hiz = 1;			/// animasyon hizi (atak tempoyu buradan ayarliyor)

// Sans'in gizlenmesi: eskiden o_obligatoryblackscreen'in siyah
// dikdortgeni faz 1 Sans'inin uzerine cizilirdi. Arka plan siyah oldugu
// surece bu goze batmiyordu; artik arka plan renkli oldugu icin kutunun
// kendisi gorunuyor. Bunun yerine Sans'in parcalarinin saydamligini
// dogrudan sifirliyoruz ve vurus bitince eski degerlerine geri koyuyoruz.
_onceki_ready = false;
_saklanan = -1;
