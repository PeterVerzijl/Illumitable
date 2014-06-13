// we need to import the TUIO library
// and declare a TuioProcessing client variable
// import TUIO.*;

// Also import vector class from the java library
import java.util.*;
import java.util.concurrent.CopyOnWriteArrayList;

//TuioProcessing tuioClient;
List<Point> points = new CopyOnWriteArrayList<Point>();

// MIDI STUFF
midi_ix midi_ix;
MidiBus midi;
ArrayList<Integer> instrument1list = new ArrayList<Integer>();
ArrayList<Integer> instrument2list = new ArrayList<Integer>();
ArrayList<Integer> instrument3list = new ArrayList<Integer>();
ArrayList<Integer> instrument4list = new ArrayList<Integer>();
// InstrumentList
ArrayList[] insturmentlist = {
  instrument1list,
  instrument2list,
  instrument3list,
  instrument4list
};

// these are some helper variables which are used
// to create scalable graphical feedback
float cursor_size = 15;
float object_size = 60;
float table_size = 760;
float scale_factor = 1;
PFont font;

// Grid
Grid grid;
float screenRatio;

boolean sketchFullScreen() {
  return false;
}

void setup()
{
  //size(screen.width,screen.height);
  size(800, 450);
  screenRatio = (float)width / (float)height;
  noStroke();
  frameRate(60);
  //noLoop();
  
  // Initiate grid
  grid = new Grid();
  
  font = createFont("Arial", 18);
  scale_factor = height/table_size;
  
  // Init midi
  midi_ix = new midi_ix();
  
  // we create an instance of the TuioProcessing client
  // since we add "this" class as an argument the TuioProcessing class expects
  // an implementation of the TUIO callback methods (see below)
  // tuioClient  = new TuioProcessing(this);
}

// within the draw method we retrieve a Vector (List) of TuioObject and TuioCursor (polling)
// from the TuioProcessing client and then loop over both lists to draw the graphical feedback.
void draw()
{
  // Create white background
  background( 0 );
  // Create a font for the cursor id's
  textFont(font, 18*scale_factor); 

  // updatePoints();
  
  drawPoints();
  
  grid.draw();
  
  fill( 255, 255, 0 );
  text( "FPS: " + frameRate, 20, 20 );
  
  PVector drawPoint = grid.findClosestPoint( new PVector(mouseX, mouseY) );
  ellipse( drawPoint.x, drawPoint.y, 10, 20 );
}

void mousePressed() {
  
  PVector bla = grid.findClosestPoint( new PVector(mouseX, mouseY) );
  
  for( int i = 0; i < grid.points.length; i++ ) {
    Point p = grid.points[ i ];
    if( PVector.dist( p.pos, bla ) < 5 ) {
      p.on = true;
    }
  }
}

/*
void updatePoints() {
  
  // Cursor and Object sizes
  float cur_size = cursor_size*scale_factor; // Grey dot
  // Getting cursors from tuio
  // Vector class implements list<> (see java docs)
  Vector tuioCursorList = tuioClient.getTuioCursors();
  for (int i=0; i<tuioCursorList.size (); i++) {
    TuioCursor tcur = (TuioCursor)tuioCursorList.elementAt(i);
    Vector pointList = tcur.getPath();

    if (pointList.size()>0) {
      stroke(0, 0, 255);
      for (int j=0; j<pointList.size (); j++) {
        TuioPoint start_point = (TuioPoint)pointList.elementAt( j );
      }
      points.add( new Point( new PVector( 
        tcur.getScreenX(width), tcur.getScreenY(height) ), 
        cur_size ) );
      text(""+ tcur.getCursorID(), tcur.getScreenX(width)-5, 
        tcur.getScreenY(height)+5);
    }
  }
}
*/
void drawPoints() {
  
  for( int i = 0; i < grid.points.length; i++ ) {
    Point p = grid.points[ i ];
    p.collision();
    if( p.on ) {
      p.draw();
    }
  }
}

/*

// these callback methods are called whenever a TUIO event occurs

// called when an object is added to the scene
void addTuioObject(TuioObject tobj) {
  println("add object "+tobj.getSymbolID()+" ("+
    tobj.getSessionID()+") "+tobj.getX()+" "+tobj.getY()+" "+
    tobj.getAngle());
}

// called when an object is removed from the scene
void removeTuioObject(TuioObject tobj) {
  println("remove object "+tobj.getSymbolID()+" ("
    +tobj.getSessionID()+")");
}

// called when an object is moved
void updateTuioObject (TuioObject tobj) {
  println("update object "+tobj.getSymbolID()+" ("
    +tobj.getSessionID()+") "+tobj.getX()+" "+tobj.getY()+" "+
    tobj.getAngle()+" "+tobj.getMotionSpeed()+" "+
    tobj.getRotationSpeed()+" "+tobj.getMotionAccel()+" "
    +tobj.getRotationAccel());
}

// called when a cursor is added to the scene
void addTuioCursor(TuioCursor tcur) {
  println("add cursor "+tcur.getCursorID()+" ("
  +tcur.getSessionID()+ ") " +tcur.getX()+" "+tcur.getY());
}

// called when a cursor is moved
void updateTuioCursor (TuioCursor tcur) {
  println("update cursor "+tcur.getCursorID()+" ("
  +tcur.getSessionID()+ ") " +tcur.getX()+" "+tcur.getY()
    +" "+tcur.getMotionSpeed()+" "+tcur.getMotionAccel());
}

// called when a cursor is removed from the scene
void removeTuioCursor(TuioCursor tcur) {
  println("remove cursor "+tcur.getCursorID()+" ("+
  tcur.getSessionID()+")");
}

// called after each message bundle
// representing the end of an image frame
void refresh(TuioTime bundleTime) { 
  redraw();
}
*/
