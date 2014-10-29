/////////////////////////////////////////////////////////////////////
// 
// (c) Jakobus Groß
//
// defines an osd with all key-bindings
//
/////////////////////////////////////////////////////////////////////

// -----------------------------------------------------------------------------------------
// camera parameters -----------------------------------------------------------------------
// -----------------------------------------------------------------------------------------

// camera x,y,z parameters -----------------------------------------------------------------
float x,y,z;
// camera rotation parameters --------------------------------------------------------------
float mX = PI/1*20;
float mY = PI/1*20;
float mZ = PI/1*20;

// -----------------------------------------------------------------------------------------
// set view --------------------------------------------------------------------------------
// -----------------------------------------------------------------------------------------
void setView(float x, float y, float z, float rx, float ry, float rz) {
  this.x = x;
  this.y = y;
  this.z = z;
  this.mX = rx;
  this.mY = ry;
  this.mZ = rz;
}

// -----------------------------------------------------------------------------------------
// rotation of the view --------------------------------------------------------------------
// -----------------------------------------------------------------------------------------
void rotateView() {
  translate((miniX+maxiX)/2,(miniY+maxiY)/2,0);
  rotateY(mX);
  rotateX(mY);
  rotateZ(mZ);
  translate(-(miniX+maxiX)/2,-(miniY+maxiY)/2,0);
}

// -----------------------------------------------------------------------------------------
// set blend mode --------------------------------------------------------------------------
// -----------------------------------------------------------------------------------------
void setBlendMode(int blNum) {
  if(blNum==0) {
      blendMode(BLEND);
  } else if(blNum==1) {
    blendMode(SUBTRACT);
  } else if(blNum==2) {
    blendMode(DARKEST);
  } else if(blNum==3) {
    blendMode(EXCLUSION);
  } else if(blNum==4) {
    blendMode(MULTIPLY);
  } else {
    blendMode(REPLACE);
  }
}

// -----------------------------------------------------------------------------------------
// show commands ---------------------------------------------------------------------------
// -----------------------------------------------------------------------------------------
void showHelp(int time) {
  camera();
  hint(DISABLE_DEPTH_TEST);
  if(time<125) {
    fill(255, 0, 255, 125);
    rect(25,25,485,565);
    fill(100, 0, 0, 255);
  } else {
    fill(255, 0, 255, 255-time);
    rect(25,25,485,565);
    fill(100, 0, 0, (255-time)/0.5);
  }
  text("--------------------------------------------------------------------"+
  "\nup, down, left, right"+
  "\nCTRL+up,down,right,left,..."+
  "\nz,u"+
  "\nx,y"+
  "\nc,v"+
  "\nb"+
  "\nm"+
  "\nj,h"+
  "\na"+
  "\ns,d"+
  "\n--------------------------------------------------------------------"+
  "\nf"+
  "\ng"+
  "\nCTRL+LeftClick"+
  "\nn"+
  "\nDELETE"+
  "\nCTRL+DELETE"+
  "\nq,w"+
  "\nr,e"+
  "\nt"+
  "\nSPACE"+
  "\n--------------------------------------------------------------------"+
  "\n1"+
  "\n2"+
  "\n3"+
  "\n4"+
  "\n5"+
  "\n7"+
  "\n8"+
  "\n9"+
  "\n--------------------------------------------------------------------"+
  "\n+"+
  "\n-"+
  "\nk"+
  "\n + s"+
  "\n + d"+
  "\n + n"+
  "\n + +"+
  "\n + -"+
  "\n--------------------------------------------------------------------"
  , 30, 30);
  
  text("\n"+
  "moving"+
  "\nmoving faster"+
  "\nrotate z-axis"+
  "\nchange cone polygon count"+
  "\nchange cone radius"+
  "\nshow/hide strokes"+
  "\ndraw additional cone circle"+
  "\nchange stroke weight"+
  "\nchange rectangle draw mode"+
  "\nchange simplified rect cone count"+
  "\n"+
  "\nshow view planes"+
  "\nshow rectangles"+
  "\nmake new point at mouse coordinates"+
  "\nmake new random point"+
  "\ndelete all points"+
  "\ndelete all points and create a new one"+
  "\nchange color transparency"+
  "\nchange blend mode"+
  "\nsmooth objects"+
  "\nchange point/rectangle-mode"+
  "\n"+
  "\nshow actual view parameters"+
  "\nshow help"+
  "\nprint polygon count"+
  "\nswitch through some views"+
  "\nreset view"+
  "\nrotate view around z-axis"+
  "\nshow fps"+
  "\ntake screenshot"+
  "\n"+
  "\nincrease point drawing size"+
  "\ndecrease point drawing width"+
  "\nfn-mode:"+
  "\nrectangle side gap-"+
  "\nrectangle side gap+"+
  "\nmake 50 random points"+
  "\nheavily increase point drawing size"+
  "\nheavily decrease point drawing width"+
  "\n"
  , 200, 30);
  
  //text("move up\nmove down\nmove left\nmove right\nmove faster\n"+
  //"more/less cconeone-points\nchange cone-radius\ndraw edges\nadd/delete rectangle-point\nchange blending mode\n"+
  //"show help\ntake screenshot\nchange color transparency\nchange point-rectangle-mode\nset to defaults\n"+
  //"set to defaults & delete all points\nchange view\ndraw clipping plane\ndraw rectangle-traces\ndraw cone-traces\n"+
  //"make new point at mouse position\ngenerate random point\nprint view details in console", 130, 30);
  
  hint(ENABLE_DEPTH_TEST); 
}

// -----------------------------------------------------------------------------------------
// show help key on startup ----------------------------------------------------------------
// -----------------------------------------------------------------------------------------
void showFirstHelp(int time) {
  hint(DISABLE_DEPTH_TEST);
  if(time<125) {
    fill(100, 0, 0, 255);
  } else {
    fill(100, 0, 0, (255-time)/0.5);
  }
   text("press \"2\" for help!", 30, 30);
   hint(ENABLE_DEPTH_TEST);
}

// -----------------------------------------------------------------------------------------
// show if second key-maping is active -----------------------------------------------------
// -----------------------------------------------------------------------------------------
void showFN() {
  hint(DISABLE_DEPTH_TEST);
  fill(100, 0, 0, 255);
  text("fn", width-20, height-20);
  hint(ENABLE_DEPTH_TEST);
}

// -----------------------------------------------------------------------------------------
// show if second key-maping is active -----------------------------------------------------
// -----------------------------------------------------------------------------------------
void showFPSonGUI() {
  hint(DISABLE_DEPTH_TEST);
  fill(255, 0, 255, 125);
  rect(width-52,8,width-20,15);
  fill(100, 0, 0, 255);
  text("fps: "+round(frameRate), width-50, 20);
  hint(ENABLE_DEPTH_TEST);
}

