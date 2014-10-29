import processing.pdf.*;
import processing.opengl.*;
import processing.dxf.*;

/////////////////////////////////////////////////////////////////////
// 
// visualizes z-Buffer of different Voronoi-cunstructions
// implemented for 
// - points
// - simplified rectangle geometry
// - cone-represented rectangles
// - "Manhattan"-geometry
//
/////////////////////////////////////////////////////////////////////

void setup() {
  frameRate(60);
  size(1000,1000,P3D);
  paintWidth = width;
  paintHeight = height;
  
  // save some random numbers in array for colors
  for(int i=0; i<100; i++) randoms[i] = random(0.1,1);
  
  // set blend mode
  setBlendMode(blendNumber);
  
  // set initial view depending on content
  if(!pointsORrects) setView(0,0,-50,62.831856,62.831856,62.831856);
  else {
    if(layoutWidth == 200) {
        setView(397,369,608,62.831856,62.831856,62.831856);
    } else if (layoutWidth == 300) {
        setView(352,310,510,62.831856,62.831856,62.831856);
    } else if (layoutWidth == 400) {
        setView(304,237,396,62.831856,62.831856,62.831856);
    }
  }
  
  // enable smooth 
  if(smooth) smooth(8);
  
  // set perspective 
  perspective(PI/3.0,(float)width/height,1,100000);
  
  // setup content
  setRectangles();
  setupArrays();
  setupArraysManhattan();
  
  // as default show simplified rectangle geometry
  generateRectanglesSimple();
  //generateRectanglesManhattan();
  
  setupRectangles();
  makeFixPoint();
}

void draw() {
  getFPS();
  background(1,1);
  
  // draw object strokes
  if(nostroke) noStroke();
  else stroke(0);
  
  pushMatrix();
  translate(x,y,z);
  
  // change orientation while mouse pressed
  if(mousePressed) {
    mX += (mouseX-pmouseX)*0.01;
    mY += (mouseY-pmouseY)*0.01;
  }
  rotateView();
  
  // change content to draw
  if(pointsORrects) {
    if(rectModes==0) generateRectanglesSimple();
    else if(rectModes==1) drawConeRectangles();
    else if(rectModes==2) generateRectanglesManhattan();
  } else {
    paintPoints();
  }
  
  // draw area in which points are placed randomly
  if(drawPointSpace>0) showPointDrawingSpace(drawPointSpace--);
  popMatrix();
  
  // show activated second key mapping in gui
  if(fn) showFN();
  
  // show control key at startup
  if(firstHelp>0) showFirstHelp(firstHelp--);
  
  // show fps
  if(showFPS) showFPSonGUI();
  
  // show key-bindings in gui
  if(help) {
    helpCounter++;
    //println(helpCounter);
    showHelp(helpCounter);
    if(helpCounter==255) {
      help = !help;
      helpCounter = 0;
    }
  }
}

// get fps
void getFPS() {
  if(fps.size()<10) {
    fps.add(frameRate);  
  } else {
    fps.remove(0);
    fps.add(frameRate);
  }
}

// setup cone at position xr, yr
ArrayList<float[]> setupVertex(int xr, int yr) {
  
  float[] tempX = new float[coneDetail];
  float[] tempY = new float[coneDetail];
  float[] tempZ = new float[coneDetail];

  for(int i=0;i<verticesX.length; i++) {
    tempX[i] = verticesX[i]+xr;
    tempY[i] = verticesY[i]+yr;
    tempZ[i] = verticesZ[i];  
  }
  ArrayList<float[]> vertices = new ArrayList<float[]>();
  vertices.add(tempX);
  vertices.add(tempY);
  vertices.add(tempZ);

  return vertices;
}

