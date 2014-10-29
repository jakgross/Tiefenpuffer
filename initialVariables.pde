/////////////////////////////////////////////////////////////////////
// 
// (c) Jakobus Groß
//
// some initial parameters
//
/////////////////////////////////////////////////////////////////////

// -----------------------------------------------------------------------------------------
// general parameters ----------------------------------------------------------------------
// -----------------------------------------------------------------------------------------

int coneDetail = 30;         // defines the edge points of a cone
int coneSize = 75;           // defines radius of a cone
int coneHeight = 50;         // defines the height of a cone
float strokeweight = 0.006;  // defines stroke weight

// -----------------------------------------------------------------------------------------
// geometry parameters ---------------------------------------------------------------------
// -----------------------------------------------------------------------------------------

int pointcounter = 5;       // for cone-represented rectangles: space between rectangle-edge-points
int paintWidth = width;     // width for painting placing points
int paintHeight = height;   // height for painting placing points
int demoSpace = 0;          // for simplified rectangle geometry: 
                            //   space between sides and rectangle, to be changed with "s" & "d"

// -----------------------------------------------------------------------------------------
// switch values ---------------------------------------------------------------------------
// -----------------------------------------------------------------------------------------

// switch between modes
boolean pointsORrects = true;       // switch point-rectangle mode
int rectModes = 0;                  // switch simple-cone - mode

// for additional rectangle stuff
int drawViewFrustum = 0;            // draw view frustum: switch between none, semi-transparent and transparent view-frustum
boolean drawConeEdge = false;       // draw border of cones
boolean drawRectangleEdges = false; // draw border of rectangles
boolean isCtrlPressed = false;      // true while ctrl is pressed for second key bindings
boolean nostroke = true;            // for painting edges of cones
boolean mousepressed = false;       // for moving camera around
boolean smooth = true;              // smooth geometry
boolean fn = false;                 // second key mode
boolean showFPS = true;             // show fps

// -----------------------------------------------------------------------------------------
// color & blending modes ------------------------------------------------------------------
// -----------------------------------------------------------------------------------------

float[] randoms = new float[100];   // some randoms for varying colors
int transparency = 255;             // painting transparency
int blendNumber = 0;                // blending mode

int countViews = 0;                 // predefined views identifier
int screenShotCounter = 0;          // screenshot counter
int drawPointSpace = 0;             // counter for showing point drawing area

boolean help = false;               // show help
int helpCounter = 0;                // counter for showing key bindings
int firstHelp = 150;                // counter how long first help is showed

float maxiX, maxiY, miniX, miniY = 0.0f;   // max dimensions -> for rotation around object
  
ArrayList<Float> fps = new ArrayList<Float>(0);
