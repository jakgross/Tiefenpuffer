/////////////////////////////////////////////////////////////////////
// 
// (c) Jakobus Groß
//
// implementation of point-cones
//
/////////////////////////////////////////////////////////////////////

// -----------------------------------------------------------------------------------------
// point arrays ----------------------------------------------------------------------------
// -----------------------------------------------------------------------------------------

ArrayList<ArrayList<float[]>> pointVertices = new ArrayList<ArrayList<float[]>>();
ArrayList<point> points = new ArrayList<point>();

float[] verticesX, verticesY, verticesZ, tempX, tempY, tempZ;

// -----------------------------------------------------------------------------------------
// get points and fill vertice-arrays ------------------------------------------------------
// -----------------------------------------------------------------------------------------
void generatePoints() {
  helpVertices();
  pointVertices = new ArrayList<ArrayList<float[]>>();
  for(int i=0; i<points.size(); i++) {
    pointVertices.add(setupVertex(points.get(i).x,points.get(i).y));
  }
}

// -----------------------------------------------------------------------------------------
// create arrays for cones -----------------------------------------------------------------
// -----------------------------------------------------------------------------------------
void helpVertices() {
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
  }
}

// -----------------------------------------------------------------------------------------
// defines a simple point with coordinates -------------------------------------------------
// -----------------------------------------------------------------------------------------
public class point {
    public int x, y;
    
    public point(int x, int y) {
       this.x = x;
       this.y = y;
    }
}
