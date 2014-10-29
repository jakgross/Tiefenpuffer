
private float xMin = 9999.0;
private float yMin = 9999.0;
private float xMax = 0.0;
private float yMax = 0.0;

// -----------------------------------------------------------------------------------------
// paint simplified rectangles -------------------------------------------------------------
// -----------------------------------------------------------------------------------------
void generateRectanglesSimple() { 
  colorMode(HSB,1,1,1);
  
  for(int i = 0; i< rects.size(); i++) {
    if(nostroke) {
      stroke(0);
      strokeWeight(strokeweight);
    } else {
      noStroke();
    }
    rectangle r = rects.get(i);
    
    xMin = min(xMin,r.x1);
    yMin = min(yMin,r.y1);
    xMax = max(xMax,r.x2);
    yMax = max(yMax,r.y2);
    
    fill(getColor(rects.size(),i));
    
    // paint sides ----------------------------------------------------------
    paintSide(r.x , r.y-demoSpace , r.w     , coneSize, PI        , -1,  1, 1);
    paintSide(r.x2+demoSpace, r.y1, coneSize, r.h     , HALF_PI   ,  1, -1, 1);
    paintSide(r.x1, r.y2+demoSpace, r.w     , coneSize, 0         ,  1,  1, 1);
    paintSide(r.x1-demoSpace, r.y1, coneSize, r.h     , HALF_PI+PI, -1, -1, 1);

    // paint top -------------------------------------------------------------
    paintRectangle(r.x1,r.y1,r.w,r.h);

    // paint corners ---------------------------------------------------------
    paintCone(r.x1-demoSpace, r.y1-demoSpace, PConstants.PI);
    paintCone(r.x2+demoSpace, r.y1-demoSpace, -PConstants.HALF_PI);
    paintCone(r.x2+demoSpace, r.y2+demoSpace, 0);
    paintCone(r.x1-demoSpace, r.y2+demoSpace, PConstants.HALF_PI);

    // paint rectangle
    if(drawRectangleEdges) {
      translate(0,0,coneHeight+1);
      noFill();
      stroke(0);
      rect(r.x,r.y,r.w,r.h);
      translate(0,0,-(coneHeight+1));
    }
  }
  
  miniX = xMin;
  miniY = yMin;
  maxiX = xMax;
  maxiY = yMax;
  if(drawConeEdge) {
    //for(int j=2; j<verticesX.length; j++) {
    //  stroke(getColor(rect.size(),r));
    //  noFill();
    //  line(vert21[j-1],vert22[j-1],51,vert21[j],vert22[j],51);
    //}
   }
   
  drawAdditionalStuff();
}

// -----------------------------------------------------------------------------------------
// paint simplified rectangles -------------------------------------------------------------
// -----------------------------------------------------------------------------------------
void generateRectanglesManhattan() { 
  colorMode(HSB,1,1,1);
  for(int i = 0; i< rects.size(); i++) {
    if(nostroke) {
      stroke(0);
      strokeWeight(strokeweight);
    } else {
      noStroke();
    }
    rectangle r = rects.get(i);
    
    xMin = min(xMin,r.x1);
    yMin = min(yMin,r.y1);
    xMax = max(xMax,r.x2);
    yMax = max(yMax,r.y2);
    
    fill(getColor(rects.size(),i));
    
    // paint sides ----------------------------------------------------------
    paintSide(r.x , r.y-demoSpace , r.w     , coneSize, PI        , -1,  1, 1);
    paintSide(r.x2+demoSpace, r.y1, coneSize, r.h     , HALF_PI   ,  1, -1, 1);
    paintSide(r.x1, r.y2+demoSpace, r.w     , coneSize, 0         ,  1,  1, 1);
    paintSide(r.x1-demoSpace, r.y1, coneSize, r.h     , HALF_PI+PI, -1, -1, 1);

    // paint top -------------------------------------------------------------
    paintRectangle(r.x1,r.y1,r.w,r.h);

    // paint corners ---------------------------------------------------------
    paintConeMan(r.x1-demoSpace, r.y1-demoSpace, PConstants.PI);
    paintConeMan(r.x2+demoSpace, r.y1-demoSpace, -PConstants.HALF_PI);
    paintConeMan(r.x2+demoSpace, r.y2+demoSpace, 0);
    paintConeMan(r.x1-demoSpace, r.y2+demoSpace, PConstants.HALF_PI);

    // paint rectangle
    if(drawRectangleEdges) {
      translate(0,0,coneHeight+1);
      noFill();
      stroke(0);
      rect(r.x,r.y,r.w,r.h);
      translate(0,0,-(coneHeight+1));
    }
  }
  
  miniX = xMin;
  miniY = yMin;
  maxiX = xMax;
  maxiY = yMax;
   
  drawAdditionalStuff();
}

// -----------------------------------------------------------------------------------------
// paint cone-represented rectangles -------------------------------------------------------
// -----------------------------------------------------------------------------------------
void drawConeRectangles() {
  
  for(int r=0; r<rectangles.size();r++) {
    ArrayList<ArrayList<float[]>> cones = rectangles.get(r);
    
    for(int i=0; i<cones.size();i++) {
      float[] vert21 = cones.get(i).get(0);
      float[] vert22 = cones.get(i).get(1);
      float[] vert23 = cones.get(i).get(2);
      
      beginShape(PConstants.TRIANGLE_FAN);      
      colorMode(HSB,1,1,1);
      for(int j=0; j<verticesX.length; j++) {
        fill(getColor(rectangles.size(),r));
        if(nostroke) stroke(0);
        else noStroke();
        
        
        //if(r==0 && j==0)
        //  vertex(vert21[j],vert22[j],60);
        //else 
          vertex(vert21[j],vert22[j],vert23[j]);
          
          xMin = min(vert21[j], xMin);
          xMax = max(vert21[j], xMax);
          yMin = min(vert22[j], yMin);
          yMax = max(vert22[j], yMax);
      }
      endShape();
      
      if(drawConeEdge) {
        for(int j=2; j<verticesX.length; j++) {
          stroke(getColor(rectangles.size(),r));
          noFill();
          line(vert21[j-1],vert22[j-1],51,vert21[j],vert22[j],51);
        }
      }
    }
  }
  
  miniX = xMin;
  miniY = yMin;
  maxiX = xMax;
  maxiY = yMax;
  
  /*if(drawRectangleEdges || drawViewFrustum != 0)*/ drawAdditionalStuff();
}

// -----------------------------------------------------------------------------------------
// paint single points ---------------------------------------------------------------------
// -----------------------------------------------------------------------------------------
void paintPoints() {  
  
  for(int r=0; r<pointVertices.size();r++) {
    ArrayList<float[]> cones = pointVertices.get(r);
    
    for(int i=0; i<cones.size();i++) {
      float[] vert21 = cones.get(0);
      float[] vert22 = cones.get(1);
      float[] vert23 = cones.get(2);
      beginShape(PConstants.TRIANGLE_FAN);
      colorMode(HSB,1,1,1);
      if(nostroke) stroke(0);
          else noStroke();
          
      //strokeWeight(0.01);
      fill(getColorSpez(pointVertices.size(),r, points.get(r).x, points.get(r).y));
      //noFill();
      for(int j=0; j<verticesX.length; j++) {
          vertex(vert21[j],vert22[j],vert23[j]);
            
          xMin = min(vert21[j], xMin);
          xMax = max(vert21[j], xMax);
          yMin = min(vert22[j], yMin);
          yMax = max(vert22[j], yMax);
      }
      endShape();
    
      if(drawConeEdge) {
        for(int j=2; j<verticesX.length; j++) {
            //color c1 = getColor(pointVertices.size(),r);
            stroke(getNonTransColor(pointVertices.size(),r));
            //noFill();
            line(vert21[j-1],vert22[j-1],51,vert21[j],vert22[j],51);
          }
        }
     }
  }
  if(drawRectangleEdges) {
    translate(0,0,coneHeight+1);
    fill(color(0,0,0));
    //stroke(1);
  
    for(int i=0; i<points.size(); i++) {
      ellipse(points.get(i).x, points.get(i).y,3,3);
    }
  }
  
  if(drawViewFrustum>=1) {  
    //noFill();
    if(drawViewFrustum==1) fill(1,50);
    else noFill();
    stroke(0.2);
    beginShape();
    vertex(xMin,yMin,1);
    vertex(xMax,yMin,1);
    vertex(xMax,yMax,1);
    vertex(xMin,yMax,1);
    vertex(xMin,yMin,1);
    endShape();
  }
  miniX = xMin;
  miniY = yMin;
  maxiX = xMax;
  maxiY = yMax;
}

// -----------------------------------------------------------------------------------------
// paint some additional stuff for rectangles ----------------------------------------------
// -----------------------------------------------------------------------------------------
void drawAdditionalStuff() {
  
  int xRectMax = 0;
  int xRectMin = 0;
  int yRectMax = 0;
  int yRectMin = 0;
  
  translate(0,0,coneHeight);
  //fill(color(0,0,0));
  stroke(0.2);
  noFill();
  for(int i=0; i<rects.size(); i++) {
    xMin = min(rects.get(i).x, xMin);
    xMax = max(rects.get(i).x+rects.get(i).w, xMax);
    yMin = min(rects.get(i).y, yMin);
    yMax = max(rects.get(i).y+rects.get(i).h, yMax);
    
    //fill(color(0,0,0));
    stroke(0);
    //strokeWeight(1);
    //ellipse(rects.get(i).x+(rects.get(i).w)/2,rects.get(i).y+(rects.get(i).h)/2,3,3);
    strokeWeight(strokeweight*60);
    
    if(drawRectangleEdges) {
      noFill();
      beginShape();
      vertex(rects.get(i).x,rects.get(i).y,1);
      vertex(rects.get(i).x+rects.get(i).w,rects.get(i).y,1);
      vertex(rects.get(i).x+rects.get(i).w,rects.get(i).y+rects.get(i).h,1);
      vertex(rects.get(i).x,rects.get(i).y+rects.get(i).h,1);
      vertex(rects.get(i).x,rects.get(i).y,1);
      endShape();
      //rect(rects.get(i).x,rects.get(i).y,rects.get(i).w,rects.get(i).h);
    }
  }
  
  //translate(0,0,coneHeight);
  //fill(color(0,0,0));
  //noFill();
  //stroke(1);
  //ellipse((xMin+xMax)/2,(yMin+yMax)/2,3,3);
  //translate(0,0,-coneHeight);
  
  xMin -= coneSize;
  xMax += coneSize;
  yMin -= coneSize;
  yMax += coneSize; 
  
  if(drawViewFrustum>=1) {  
    //noFill();
    if(drawViewFrustum==1) fill(1,50);
    else noFill();
    
    beginShape();
    vertex(xMin,yMin,1);
    vertex(xMax,yMin,1);
    vertex(xMax,yMax,1);
    vertex(xMin,yMax,1);
    vertex(xMin,yMin,1);
    endShape();
  } 
}

// -----------------------------------------------------------------------------------------
// show area in which points could be placed -----------------------------------------------
// -----------------------------------------------------------------------------------------
void showPointDrawingSpace(int loops) {
    fill(255, 0, 255, 50);
    beginShape();
    vertex((width-paintWidth)/2+(coneSize/2),(height-paintHeight)/2+(coneSize/2),coneHeight);
    vertex(width-((width-paintWidth)/2)-(coneSize/2),(height-paintHeight)/2+(coneSize/2),coneHeight);
    vertex(width-((width-paintWidth)/2)-(coneSize/2),height-((height-paintHeight)/2)-(coneSize/2),coneHeight);
    vertex((width-paintWidth)/2+(coneSize/2),height-((height-paintHeight)/2)-(coneSize/2),coneHeight);
    vertex((width-paintWidth)/2+(coneSize/2),(height-paintHeight)/2+(coneSize/2),coneHeight);
    endShape();
}
