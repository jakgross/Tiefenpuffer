/////////////////////////////////////////////////////////////////////
// 
// (c) Jakobus Groß
//
// this tab is for initializing all geometry 
//
/////////////////////////////////////////////////////////////////////

// -----------------------------------------------------------------------------------------
// set width of layout----------------------------------------------------------------------
// -----------------------------------------------------------------------------------------
int layoutWidth = 400;
// -----------------------------------------------------------------------------------------
// set some rectangles----------------------------------------------------------------------
// -----------------------------------------------------------------------------------------
void setRectangles() {
  //rects.add(new rectangle(19,19,113,141));
  
   
  // width: 400 frame: 80
  rects.add(new rectangle(148,196,100,124));
  rects.add(new rectangle(294,330,89,27));
  rects.add(new rectangle(41,149,57,22));
  rects.add(new rectangle(275,29,99,29));
  rects.add(new rectangle(35,271,45,34));
  rects.add(new rectangle(319,237,45,20));
  rects.add(new rectangle(192,459,98,33));
  rects.add(new rectangle(9,54,92,48));
  rects.add(new rectangle(30,213,31,13));
  rects.add(new rectangle(348,448,23,25));
  rects.add(new rectangle(172,379,23,23));
  rects.add(new rectangle(243,121,138,46));
  rects.add(new rectangle(30,456,100,36));
  rects.add(new rectangle(253,392,31,13));
  rects.add(new rectangle(24,358,93,43));
  rects.add(new rectangle(126,31,100,66));

//  // width: 300 frame: 42
//  rects.add(new rectangle(100,133,100,124));
//  rects.add(new rectangle(205,248,89,27));
//  rects.add(new rectangle(14,99,57,22));
//  rects.add(new rectangle(178,36,99,29));
//  rects.add(new rectangle(18,249,45,34));
//  rects.add(new rectangle(239,146,45,20));
//  rects.add(new rectangle(96,325,98,33));
//  rects.add(new rectangle(34,19,92,48));
//  rects.add(new rectangle(20,177,31,13));
//  rects.add(new rectangle(248,336,23,25));
//  rects.add(new rectangle(23,339,23,23));

  // width: 200 frame: 9
//  rects.add(new rectangle(50,68,100,124));
//  rects.add(new rectangle(94,216,89,27));
//  rects.add(new rectangle(5,23,57,22));
//  rects.add(new rectangle(93,17,99,29));
//  rects.add(new rectangle(8,202,45,34));
//  rects.add(new rectangle(154,140,45,20));

  //rects.add(new rectangle(161,32,26,26));
  //rects.add(new rectangle(16,199,113,41));
  //rects.add(new rectangle(153,210,39,12));
  //rects.add(new rectangle(161,127,27,12));
  
  
  //rects.add(new rectangle(0,0,150,50));
  //rects.add(new rectangle(160,60,100,100));
  //rects.add(new rectangle(-41,-48,150,50));
  //rects.add(new rectangle(179,128,100,100));
  
  
  //überschneidung
  //rects.add(new rectangle(19,19,113,141));
  //rects.add(new rectangle(25,75,100,20));
  //rects.add(new rectangle(135,19,80,20));
  //rects.add(new rectangle(135,60,80,90));
  
  //rects.add(new rectangle(145,191,100,124));
  //rects.add(new rectangle(14,13,48,22));
  //rects.add(new rectangle(327,192,46,24));
  //rects.add(new rectangle(0,281,84,32));
  //rects.add(new rectangle(336,292,34,16));
  //rects.add(new rectangle(186,495,23,23));
  //rects.add(new rectangle(9,102,23,25));
  //rects.add(new rectangle(20,195,31,13));
  //rects.add(new rectangle(20,489,70,23));
  //rects.add(new rectangle(145,10,99,29));
  //rects.add(new rectangle(297,387,80,23));
  //rects.add(new rectangle(110,99,100,32));
  //rects.add(new rectangle(176,406,55,22));
  //rects.add(new rectangle(6,393,55,22));
  //rects.add(new rectangle(304,492,59,18));
  //rects.add(new rectangle(322,21,45,90));
} 

// -----------------------------------------------------------------------------------------
// set points ------------------------------------------------------------------------------
// -----------------------------------------------------------------------------------------

// set at mouse position -------------------------------------------------------------------
void setPoints() {
  helpVertices();
  
  //int newX = (int) (mouseX*1000/( sqrt( (z/cos(60))*(z/cos(60)) - (z*z))));
  //int newY = (int) (mouseY*1000/( sqrt( (z/cos(60))*(z/cos(60)) - (z*z))));
  
//  int newX = (int)(mouseX+tan(PI/3.0/2.0)*z);
//  int newY = (int)(mouseY+tan(PI/3.0/2.0)*z);
    

  int newX = mouseX/width;
  int newY = mouseY/height;
  

  //float newZ = (int) ((z*z)/2);
  //newZ = (z/900);
  
//  newX = (int)screenX(mouseX,mouseY,z);
//  newY = (int)screenY(mouseX,mouseY,z);

  newX = (int)modelX(mouseX,mouseY,z);
  newY = (int)modelY(mouseX,mouseY,z);

  //newX = (int)((float)newX * newZ);
  //newY = (int)((float)newY * newZ);
  
  point nPoint = new point(newX,newY);
  println("x: "+newX+" y: "+newY);

  points.add(nPoint);
  ArrayList<float[]> sv = setupVertex(nPoint.x,nPoint.y);
  pointVertices.add(sv);
}

// set 2 neighbour points
void makeFixPoint() {
  helpVertices();
  point newPoint = new point(width/2-coneSize/2,height/2);
  ArrayList<float[]> sv = setupVertex(newPoint.x,newPoint.y);
  pointVertices.add(sv);
  points.add(newPoint);   
  
  newPoint = new point(width/2+coneSize/2,height/2);
  ArrayList<float[]> sv2 = setupVertex(newPoint.x,newPoint.y);
  pointVertices.add(sv2);
  points.add(newPoint);   
}

// set random point  ------------------------------------------------------------------------
void makeNewPoint() {
    helpVertices();
    int vertcounter = 0;
    boolean abstand = false;
    point newPoint = null;
    while(vertcounter<200 && !abstand) {
      newPoint = new point(
          (int)random(
                (width-paintWidth)/2+(coneSize/2),
                width-((width-paintWidth)/2)-(coneSize/2)),
          (int)random(
                (height-paintHeight)/2+(coneSize/2),
                height-((height-paintHeight)/2)-(coneSize/2)));
      float abst = 99999;
      //float abstneigh = 99999;
      
      for(int i=0; i<points.size(); i++) {
      float abstTemp = dist(newPoint.x,newPoint.y,points.get(i).x,points.get(i).y);
        if(abstTemp<abst) abst = abstTemp;
        //if(points.size()-(points.size()/5) < i) {
        //  if(abstTemp<abstneigh) abstneigh = abstTemp;
        //}
      }
      if(/*abstneigh > (coneSize*2) &&*/ abst > (coneSize/2)) abstand = true;
      vertcounter++;
    }
    if(abstand) {
      ArrayList<float[]> sv = setupVertex(newPoint.x,newPoint.y);
      pointVertices.add(sv);
      points.add(newPoint);
    }
}

// if there are changes e.g. new Point, geometry changed update objects ---------------------
void updateContent() {
  generatePoints();
  setupRectangles();
  setupArrays();
}
