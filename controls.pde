/////////////////////////////////////////////////////////////////////
// 
// (c) Jakobus Groß
//
// this tab contains some methods for creating individual colors
//
/////////////////////////////////////////////////////////////////////

// Key-Bindings for different functionst
// press "2" while programm is running or watch tab "osd" for details
void keyPressed()
{
    if(key == 'k') {
      fn = !fn;  
    }
    //-- NAVIGATION --------------------------------------------------------------------------------------
    if(keyCode == CONTROL) {                                                                            //
        isCtrlPressed = true;                                                                           //
    }                                                                                                   //
    if (keyCode == LEFT) {                                                                              //
      if(isCtrlPressed) x-=10;                                                                          // 
      else x-=1;                                                                                        //
    }                                                                                                   //
    if (keyCode == RIGHT) {                                                                             //
      if(isCtrlPressed) x+=10;                                                                          //
      else x+=1;                                                                                        //                                                                                  //
    }                                                                                                   //
    if (keyCode == UP) {                                                                                //
      if(isCtrlPressed) y-=10;                                                                          //
      else y-=1;                                                                                        //
    }                                                                                                   //
    if (keyCode == DOWN) {                                                                              //
      if(isCtrlPressed) y+=10;                                                                          //
      else y+=1;                                                                                        //
    }                                                                                                   //
    if (key == 'z') {                                                                                   //
      mZ+=0.01;                                                                                         //
    }                                                                                                   //
    if (key == 'u') {                                                                                   //
      mZ-=0.01;                                                                                         //
    }                                                                                                   //
    //-- NAVIGATION --------------------------------------------------------------------------------------
    
    //----------------------------------------------------------------------------------------------------
    //-- CONE CONTROLS -----------------------------------------------------------------------------------
    //----------------------------------------------------------------------------------------------------
    
    //-- cone-vertices-count -----------------------------------------------------------------------------
    if (key == 'x') {
      coneDetail++;
      updateContent();
    }
    if (key == 'y') {
      if(coneDetail>2) {
        coneDetail--;
        updateContent();
      }
    }
        
    //-- cone-height --------------------------------------------------------------------------------------
    if (key == 'p') {
      if(!fn) coneHeight++;
      else coneHeight+=50;
      println("coneHeight: "+coneHeight);
      updateContent();
    }
    if (key == 'o') {
      if(coneHeight>1) {
        if(!fn) coneHeight--;
        else if(fn && coneHeight-50 >1) coneHeight-=50;
        else coneHeight--;
        println("coneHeight: "+coneHeight);
        updateContent();
      }
    }
    
    //-- cconeone radius --------------------------------------------------------------------------------------
    if (key == 'v') {
      coneSize++;
      updateContent();
    }
    if (key == 'c') {
      coneSize--;
      updateContent();
    }
    
    //--------------------------------------------------------------------------------------------------------
    //-- STROKE CONTROLS -------------------------------------------------------------------------------------
    //--------------------------------------------------------------------------------------------------------
    
    //-- stroke edges ----------------------------------------------------------------------------------------
    if (key == 'b') {
      if(nostroke) nostroke=false;
      else nostroke=true;
    }
        
    //-- draw additional cone circle -------------------------------------------------------------------------
    if (key == 'm') {
      drawConeEdge = !drawConeEdge;
      setupRectangles();
      paintPoints();
    }
    
    //-- stroke weight + -------------------------------------------------------------------------------------
    if (key == 'j') {
       strokeweight += 0.001;
    }
    //-- stroke weight - -------------------------------------------------------------------------------------
    if (key == 'h') {
      if(strokeweight > 0.001)
         strokeweight -= 0.001;
    }
    
    //--------------------------------------------------------------------------------------------------------
    //-- RECTANGLE CONTROLS ----------------------------------------------------------------------------------
    //--------------------------------------------------------------------------------------------------------
    
    //-- change rectangle mode -------------------------------------------------------------------------------
    if (key == 'a') {
      if(rectModes<2)
        rectModes++;
      else
        rectModes = 0; 
    }
    
    //-- points per rectangle --------------------------------------------------------------------------------
    if (key == 's') {
      if(!fn) {
        pointcounter--;
        println(pointcounter);
        setupRectangles();
      } else if(demoSpace > 0) {
        demoSpace--;
        updateContent();
      }
    }
    //-- points per rectangle --------------------------------------------------------------------------------
    if (key == 'd') {
      if(!fn) {
        pointcounter++;
        println(pointcounter);
        setupRectangles();
      } else {
        demoSpace++;
        updateContent();
      }
    }
    
    //-- draw rectangle view plane ---------------------------------------------------------------------------
    if (key == 'f') {
      if(drawViewFrustum == 0) {
         drawViewFrustum = 1;
      } else if( drawViewFrustum == 1) {
        drawViewFrustum = 2;
      } else {
        drawViewFrustum = 0;
      }
      setupRectangles();
    }
    
    //-- draw rectangle edges --------------------------------------------------------------------------------
    if (key == 'g') {
      drawRectangleEdges = !drawRectangleEdges;
      setupRectangles();
    }
    
    //--------------------------------------------------------------------------------------------------------
    //-- POINT CONTROLS --------------------------------------------------------------------------------------
    //--------------------------------------------------------------------------------------------------------
            
    //-- make new random point -------------------------------------------------------------------------------
    if (key == 'n') {
      if(fn) { 
        for(int i=0; i<50; i++) 
          makeNewPoint();
      }
      makeNewPoint();
    }
    
    //-- delete all points -----------------------------------------------------------------------------------
    if (keyCode == DELETE) {
      pointVertices = new ArrayList<ArrayList<float[]>>();
      points = new ArrayList<point>();
      if(!isCtrlPressed) makeNewPoint();
      rects = new ArrayList<rectangle>();
      setRectangles();
      setupRectangles();
      pointsORrects = false;
    }
    
    if (key == '+') {
      if(fn) {
        if((paintHeight+10)<height) {
          paintHeight+=10;
          paintWidth+=10;
        }
      } else {
        if(paintHeight+1<height) {
          paintHeight++;
          paintWidth++;
        }
      }
      //pushMatrix();
      //translate(x,y,z);
      //rotateY(mX);
      //rotateX(mY);
      //rotateZ(mZ);
      drawPointSpace = (int)(frameRate*5);
      //rect(paintWidth,paintHeight,width-paintWidth,height-paintHeight);
      //popMatrix();
      println(paintWidth);
    }
    if (key == '-') {
      if(paintWidth>coneSize) {
        if(fn) {
          paintHeight-=10;
          paintWidth-=10;
        } else {
          paintHeight--;
          paintWidth--;
        }
      }
      //pushMatrix();
      //translate(x,y,z);
      //rotateY(mX);
      //rotateX(mY);
      //rotateZ(mZ);
      drawPointSpace = (int)(frameRate*5);
      //rect(paintWidth,paintHeight,width-paintWidth,height-paintHeight);
      //popMatrix();
      println(paintWidth);
    }
    
    
    //--------------------------------------------------------------------------------------------------------
    //-- COLOR CONTROLS --------------------------------------------------------------------------------------
    //--------------------------------------------------------------------------------------------------------
    
    //-- color-transparency --------------------------------------------------------------------------------
    if (key == 'q') {
      if(transparency<=255)
      transparency+=5;
      if(transparency>255) transparency = 255;
    }
    if (key == 'w') {
      if(transparency>=0)
      transparency-=5;
      if(transparency<0) transparency = 0;
    }
    
    //-- blendmode ------------------------------------------------------------------------------------------
    if (key == 'r') {
      if(blendNumber<5)
      blendNumber++;
      setBlendMode(blendNumber);
    }
    if (key == 'e') {
      if(blendNumber>0)
      blendNumber--;
      setBlendMode(blendNumber);
    }
    
    //-- smoothen objects -----------------------------------------------------------------------------------
    if (key == 't') {
      smooth = !smooth;
      if(smooth) smooth(8);
      else noSmooth();
    }
    
    //--------------------------------------------------------------------------------------------------------
    //-- VIEW CONTROLS ---------------------------------------------------------------------------------------
    //--------------------------------------------------------------------------------------------------------
      
    if (key == ' ') {
      if(!pointsORrects) {
        countViews = 0;
        if(layoutWidth == 200) {
            setView(397,369,608,62.831856,62.831856,62.831856);
        } else if (layoutWidth == 300) {
            setView(352,310,510,62.831856,62.831856,62.831856);
        } else if (layoutWidth == 400) {
            setView(304,237,396,62.831856,62.831856,62.831856);
        }
      } else {
        countViews = 5;
        setView(0,0,-50,62.831856,62.831856,62.831856);
      }
      pointsORrects = !pointsORrects;
    }
    
    //-- show actual coordinates -----------------------------------------------------------------------------
    if (key == '1') {
      println("x: "+x+",   y: "+y+",   z: "+z+",    rx: "+mX+",   ry: "+mY+",    rz: "+mZ);
    }
    
    //-- show help -------------------------------------------------------------------------------------------
    if(key == '2') {
      firstHelp = 0;
      helpCounter = 0;
      help = !help;
    }
    //-- show polygon count ----------------------------------------------------------------------------------
    if (key == '3') {
      if(pointsORrects) {
          println("simplified-rectangle: "+rects.size()*((4*coneDetail)+4)+" polygons");
          int countP = 0;
          for(int r=0; r<rectangles.size();r++) {
            countP += (rectangles.get(r).size()*coneDetail);
          }
          //countP *= coneDetail;
          println("cone-rectangle: "+countP+" polygons");
      } else {
        int countP = 0;
        for(int r=0; r<pointVertices.size();r++) {
          countP += coneDetail;
        }
        println(countP+" polygons");
        
      }
      float fpsR = 0;
      for(int f=0; f<fps.size();f++) {
        fpsR += fps.get(f);
      }
      fpsR/=fps.size();
      println("FPS: "+fpsR);
    }
    //-- define some views -----------------------------------------------------------------------------------
    if(key== '4') {
      if(countViews == 0) {
        setView(304,237,396,62.831856,62.831856,62.831856);
        countViews++;
      } else if (countViews == 1) {
        setView(352,310,510,62.831856,62.831856,62.831856);
        countViews++;
      } else if (countViews == 2) {
        setView(397,369,608,62.831856,62.831856,62.831856);
        countViews++;
      } else if (countViews == 3) {
        setView(406,330,510,63.151855,63.44185,62.831856);
        countViews = 0;
      }  
//      if(countViews == 0) {
//        setView(510,524,488,63.531857,63.68186,62.831856);
//        countViews++;
//      } else if (countViews == 1) {
//        setView(559,690,323,56.51193,64.472,0.0);
//        countViews++;
//      } else if (countViews == 2) {
//        setView(369,508,503,58.122,64.4,0.0);
//        countViews++;
//      } else if (countViews == 3) {
//        setView(554,556,344,56.542,63.76,0.0);
//        countViews++;
//      } else if (countViews == 4) {
//        setView(400,374,488,62.831856,62.831856,62.831856);
//        countViews++;
//      } else if (countViews == 5) {
//        countViews++;
//        setView(0,0,-50,62.831856,62.831856,62.831856);
//      } else if (countViews == 6) {
//        countViews = 0;
//        setView(370,434,488,62.831856,62.831856,62.831856);
//      } 
    }
    
    //-- reset view to defaults ---------------------------------------------------------------------------------
    if(key == '5') {
        countViews = 0;
        //x = 296;
        //y = 350;
        //z = 307;
        //mX = PI/1*20;
        //mY = PI/1*20;
        //mZ = 0;
        
//        x = 550;
//        y = 524;
//        z = 488;
//        mX = 62.831856;
//        mY = 62.831856;
//        mZ = 62.831856;

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
    }
    
    //-- print polygon count -----------------------------------------------------------------------------------
    if (key == '6') {
       println("polygons/cconeone: "+(coneDetail-2));
       println("cones: "+pointVertices.size());
    }
    
    //-- rotate view --------------------------------------------------------------------------------------------
    if (key == '7') {
       mZ += PI/2;
    }
    
    //-- print fps -----------------------------------------------------------------------------------------------
    if (key == '8') {
       showFPS = !showFPS;
    }
    
    //-- save a screenshot --------------------------------------------------------------------------------------
    if (key == '9') {
      if(fn) {
//        int coneHtemp = coneHeight;
//        coneHeight = 5;
//        updateContent();
//        //paintPoints();
//        noLoop();
//        save(sketchPath("data/output_flat_"+screenShotCounter+".png"));
//        println("screenshot saved");
//        loop();
//        coneHeight = coneHtemp;
//        updateContent();
//        
//        noLoop();
//        save(sketchPath("data/output_regular_"+screenShotCounter+".png"));
//        println("screenshot saved");
//        loop();
        noLoop();
        save(sketchPath("data/output"+screenShotCounter+".png"));
        println("screenshot saved");
        loop();
      } else {
        noLoop();
        save(sketchPath("data/output"+screenShotCounter+".png"));
        println("screenshot saved");
        loop();
      }
      screenShotCounter++;
    }
}

void mouseReleased() {
  if(isCtrlPressed) {
    setPoints();
  } /*else {
      mX += (mouseX-pmouseX)*0.01;
      mY += (mouseY-pmouseY)*0.01;
    }*/
}

void keyReleased()
{ 
    if(keyCode == CONTROL) {
        isCtrlPressed = false;
    } 
}
void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  z+=e;
  println("z: "+z);
}
