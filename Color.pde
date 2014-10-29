// -----------------------------------------------------------------------------------------
// -----------------------------------------------------------------------------------------
// different methods for creating colors ---------------------------------------------------
// -----------------------------------------------------------------------------------------
// -----------------------------------------------------------------------------------------

// -----------------------------------------------------------------------------------------
// get c,s,b color without alpha
// -----------------------------------------------------------------------------------------
color getNonTransColor(int size, int number) {
    float c = 0;
    
    float b = 0.5f;
    
    float s = 1.0f;
    
    b+=number*0.25;
    if(b>1.0) {
        b = 0.5f;
     }
     s-=number*0.5;
     if(s<0.5) {
        s = 1.0f;
     }
     
     c = (1/(float)size)*number;
     
    return color(c, s, b);
}


// -----------------------------------------------------------------------------------------
// get color for points
// -----------------------------------------------------------------------------------------
color getColorSpez(int size, int number, int x, int y) {
  if(size==2) {
    if(number==0) 
      return color(0, 1, 1, transparency); 
    else
      return color(0.3f, 1, 1, transparency);
  } else {
    float rand = randoms[randoms.length/size*number];
    
    float c = 0;
    
    float b = 1.0f;
    
    float s = 1.0f;
    
     //c = (1.0f/6.0f) - ((1.0f/2.0f) / (float) size)*(float)number;
     //if(c<0.0f) c +=1.0f;
     
    b = 1-(0.5f / (float) size) * (float)number;
    c = 1-(0.5f / (float) size) * (float)number;
    if(number%2 == 0)
      c = (1 / (float) size) * (float)number * y/x;
    else 
      c = (1 / (float) size) * (float)number * x/y;
    //c = random(0,1);
    return color(c, s, b, transparency);
  }
}


// -----------------------------------------------------------------------------------------
// get color with alpha for rectangles
// -----------------------------------------------------------------------------------------
color getColor(int size, int number) {
  if(size==2) {
    //println("test");
    if(number==0) 
      return color(0, 1, 1, transparency); 
    else
      return color(0.3f, 1, 1, transparency);
  } else {
    float rand = randoms[randoms.length/size*number];
    
    float c = 0;
    
    float b = 1.0f;
    
    float s = 1.0f;
    
     //c = (1.0f/6.0f) - ((1.0f/2.0f) / (float) size)*(float)number;
     //if(c<0.0f) c +=1.0f;
     
    b = 1-(0.5f / (float) size) * (float)number;
    c = 1-(0.5f / (float) size) * (float)number;
    c = (1 / (float) size) * (float)number;
    //c = random(0,1);
    return color(c, s, b, transparency);
  }
}
