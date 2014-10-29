/////////////////////////////////////////////////////////////////////
// 
// (c) Jakobus Groß
//
// implementation of simplified, cone-represented 
// and "manhattan" rectangle geometry
//
/////////////////////////////////////////////////////////////////////

// -----------------------------------------------------------------------------------------
// SIMPLIFIED ------------------------------------------------------------------------------
// RECTANGLES ------------------------------------------------------------------------------
// -----------------------------------------------------------------------------------------
float[] coneX, coneY, coneZ;
float[] polyX = new float[4];
float[] polyY = new float[4];
float[] polyZ = new float[4];

// -----------------------------------------------------------------------------------------
// make arrays for simplified rectangles ---------------------------------------------------
// -----------------------------------------------------------------------------------------
void setupArrays() {
    coneX = new float[coneDetail];
    coneY = new float[coneDetail];
    coneZ = new float[coneDetail];

    coneX[0] = 0;
    coneY[0] = 0;
    coneZ[0] = 1;

    for (int i = 0; i < coneDetail - 1; i++) {
      float a1 = PConstants.TWO_PI/4 * i / (coneDetail - 2);
      coneX[i + 1] = cos(a1);
      coneY[i + 1] = sin(a1);
      coneZ[i + 1] = 0;
    }

    polyX[0] = 0;
    polyX[1] = 1;
    polyX[2] = 1;
    polyX[3] = 0;
    
    polyY[0] = 0;
    polyY[1] = 0;
    polyY[2] = 1;
    polyY[3] = 1;
      
    polyZ[0] = 1;
    polyZ[1] = 1;
    polyZ[2] = 0;
    polyZ[3] = 0;  
}

// -----------------------------------------------------------------------------------------
// paint 90° partial cone for rectangle corner ---------------------------------------------
void paintCone(int x, int y, float rot) {
  pushMatrix();
  translate(x, y, 0);
  scale(coneSize, coneSize, coneHeight);
  rotate(rot, 0,0,1);
  beginShape(PConstants.TRIANGLE_FAN);
  for (int k = 0; k < coneDetail; k++) vertex(coneX[k], coneY[k], coneZ[k]);
  endShape();
  popMatrix();
}

// -----------------------------------------------------------------------------------------
// paint area at edge of rectangle ---------------------------------------------------------
void paintSide(int x, int y, int scale1, int scale2, float rot, int px, int py, int pz) {
  pushMatrix();
  translate(x, y, 0);
  scale(scale1, scale2, coneHeight);
  rotate(rot, 0,0,1);
  beginShape();
  for (int k = 0; k < 4; k++) vertex(px*polyX[k], py*polyY[k], pz*polyZ[k]);
  endShape(PConstants.CLOSE);
  popMatrix();
}

// -----------------------------------------------------------------------------------------
// paint top area of rectangle  ------------------------------------------------------------
void paintRectangle(int x, int y, int w, int h) {
  pushMatrix();
  translate(x+w/2.0f, y+h/2.0f, 0);
  scale(1, 1, coneHeight);
  beginShape();
  vertex(-w/2.0f ,-h/2.0f,1);
  vertex( w/2.0f ,-h/2.0f,1);
  vertex( w/2.0f , h/2.0f,1);
  vertex(-w/2.0f , h/2.0f,1);
  endShape(CLOSE);
  popMatrix();  
}

// -----------------------------------------------------------------------------------------
// CONE-REPRESENTED ------------------------------------------------------------------------
// RECTANGLES ------------------------------------------------------------------------------
// -----------------------------------------------------------------------------------------
ArrayList<ArrayList<ArrayList<float[]>>> rectangles;
ArrayList<rectangle> rects = new ArrayList<rectangle>();


// generate all rectangles in the list with cones--------------------------------------------
void setupRectangles() {
  rectangles = new ArrayList<ArrayList<ArrayList<float[]>>>();
  verticesX = new float[coneDetail];
  verticesY = new float[coneDetail];
  verticesZ = new float[coneDetail];
  
  verticesX[0] = 0;
  verticesY[0] = 0;
  verticesZ[0] = coneHeight;

  for (int i = 0; i < coneDetail - 1; i++) {
      float a1 = TWO_PI * i / (coneDetail - 2);
      verticesX[i + 1] = coneSize*PApplet.cos(a1);
      verticesY[i + 1] = coneSize*PApplet.sin(a1);
      verticesZ[i + 1] = 0;
      //println("x: "+(verticesX[i + 1]/coneSize)+", y: "+(verticesY[i + 1]/coneSize));
  }
  for(int i=0; i<rects.size(); i++) {
    rectangles.add(makeRect(rects.get(i).x,rects.get(i).y,rects.get(i).w,rects.get(i).h));
  }
}

// generate one rectangle with cones---------------------------------------------------------
ArrayList<ArrayList<float[]>> makeRect(int x, int y, int w, int h) {
  
  ArrayList<ArrayList<float[]>> rect = new ArrayList<ArrayList<float[]>>();
  
  for(int i=y;i<=y+h;i+=pointcounter) {
    rect.add(setupVertex(x,i));
    rect.add(setupVertex(x+w,i));
  }
  for(int i=x;i<=x+w;i+=pointcounter) {
    rect.add(setupVertex(i,y));
    rect.add(setupVertex(i,y+h));
  }
  return rect;
}


// -----------------------------------------------------------------------------------------
// MANHATTAN -------------------------------------------------------------------------------
// RECTANGLES ------------------------------------------------------------------------------
// -----------------------------------------------------------------------------------------
float[] cornerX, cornerY, cornerZ;
float[] polyMX = new float[4];
float[] polyMY = new float[4];
float[] polyMZ = new float[4];

// -----------------------------------------------------------------------------------------
// make arrays for simplified rectangles ---------------------------------------------------
// -----------------------------------------------------------------------------------------
void setupArraysManhattan() {
    cornerX = new float[5];
    cornerY = new float[5];
    cornerZ = new float[5];

    cornerX[0] = 0;
    cornerY[0] = 0;
    cornerZ[0] = 1;
    
    cornerX[1] = 1;
    cornerY[1] = 0;
    cornerZ[1] = 0;
    
    cornerX[2] = 1;
    cornerY[2] = 1;
    cornerZ[2] = 0;
    
    cornerX[3] = 0;
    cornerY[3] = 1;
    cornerZ[3] = 0;
}

// -----------------------------------------------------------------------------------------
// paint 90° partial cone for rectangle corner ---------------------------------------------
void paintConeMan(int x, int y, float rot) {
  pushMatrix();
  translate(x, y, 0);
  scale(coneSize, coneSize, coneHeight);
  rotate(rot, 0,0,1);
  beginShape(PConstants.TRIANGLE_FAN);
  for (int k = 0; k < 4; k++) vertex(cornerX[k], cornerY[k], cornerZ[k]);
  endShape();
  popMatrix();
}

// -----------------------------------------------------------------------------------------
// defines a rectangle with position, dimensions and second corner  ------------------------
// -----------------------------------------------------------------------------------------
public class rectangle {
  public int x;
  public int y;
  public int w;
  public int h;
  
  public int x1;
  public int y1;
  public int x2;
  public int y2;
  
  public rectangle(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    setOther();
  } 
  void setOther() {
    x1 = x;
    y1 = y;
    x2 = x+w;
    y2 = y+h;
  }
}
