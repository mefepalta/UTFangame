//////////////////////////////////
//                              //
//   bktGlitch 1.3.2            //
//    Written by Jan Vorisek    //
//    @odditica | odditica.fyi  //
//      jan@odditica.fyi        //
//       02/07/2022             //
//                              //
//     "Here we go again."      //
//							 	//
//////////////////////////////////

// You can init the shader here manually if you want, otherwise it will be done automatically the first
// time you run bktglitch_activate(), which might take a few frames.
// bktglitch_init()
depth=DEPTH_BATTLE.BULLET_OUTSIDE_HIGH*10-1;

application_surface_draw_enable(false); //disabling automatic redrawing of the application surface
display_set_gui_size(640, 480); //making sure the GUI layer stays always the same size

ballTimestep = 0.0;
ballTime = 0.0;

line_shift=0
intensity=0