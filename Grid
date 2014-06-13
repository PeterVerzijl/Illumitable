public class Grid {
  
  // Grid circles
  int measures = 4;
  int signatures = 4;
  
  // Grid angles
  int instruments = 4;
  int notes = 8;
  
  // Pulse
  float x;
  float y;
  
  int bpm = 120;
  
  long startTime;
  
  Point[] points;
  
  public Grid( ) {
    
    startTime = millis();
    
    // half
    points = new Point[ notes * measures * signatures * instruments ];
    PVector center = new PVector( width*0.5, height*0.5 );
    float ringDeltaY = height / (measures * signatures);
    
    int index = 0;
    for( int i = 1; i < measures * signatures+1; i++ ) {
      // box
      float boxY = i * ringDeltaY;
      float boxX = boxY * screenRatio;
      
      float subX = boxX / notes;
      float subY = boxY / notes;
      for( int j = 0; j < notes; j++ ) {
        points[ index ] = new Point( new PVector( center.x - boxX*0.5 + subX*j, center.y - boxY*0.5 ), 1, j  );
        index++;
        points[ index ] = new Point( new PVector( center.x + boxX*0.5, center.y - boxY*0.5 + subY * j ), 2, j );
        index++;
        points[ index ] = new Point( new PVector( center.x + boxX*0.5 - subX*j, center.y + boxY*0.5 ), 3, j );
        index++;
        points[ index ] = new Point( new PVector( center.x - boxX*0.5, center.y + boxY*0.5 - subY * j ), 4, j );
        index++;
      }
    }
    
  }
  
  public void draw() {
    
    drawGrid();
    
    drawPulse();
    
    rectMode( CORNER );
    noStroke();
    fill( 255, 0, 0, 50 );
    rect( 0, 0, width*0.5, height*0.5 );
    fill( 0, 0, 255, 50 );
    rect( 0, height*0.5, width*0.5, height );
    fill( 0, 255, 0, 50 );
    rect( width*0.5, 0, width, height*0.5 );
    fill( 255, 255, 0, 50 );
    rect( width*0.5, height*0.5, width, height );
  }
  
  public void drawGrid() {
    
    float ringDeltaX = (width) / (measures * signatures);
    float ringDeltaY = (height) / (measures * signatures);
    float noteDelta = ( 2 * PI ) / ( notes * instruments );
    
    // Draw the rings of the grid;
    for( int i = 0; i < measures*signatures; i ++ ) {
      fill( 0, 0, 0, 0 );
      stroke( 255 );
      strokeWeight( 1 );
      if( i % 4 == 1 ) strokeWeight( 3 );
      rectMode( CENTER );
      rect( width*0.5, height*0.5, ringDeltaX*i, ringDeltaY*i );
    }
    
    // Draw the lines of the grid
    for( int i = 0; i < notes; i++ ) {
      // Equal distance between lines
      float dx = width/notes;
      float dy = height/notes;
      line( width*0.5, height*0.5, dx * i, height );
      line( width*0.5, height*0.5, dx * i, 0 );
      line( width*0.5, height*0.5, 0, dy * i );
      line( width*0.5, height*0.5, width, dy * i );
    }
    line( width*0.5, height*0.5, width, height );
  }
  
  void drawPulse() {
    
    // 16 seconds per pulse
    float dPulseX = (float)width / (float)16000;
    float dPulseY = (float)height / (float)16000;
    
    x = ( ( millis() - startTime ) * dPulseX ) % width;
    y = ( ( millis() - startTime ) * dPulseY ) % height;
    
    // Empty array
    if( (int)(x*0.5) % (int)( width*0.5/( measures*signatures ) ) == 1 ){
      
      // Loop trough all arraylists of notes
      for( int i = 0; i < insturmentlist.length; i++ ) {
        // Send note array to midi_ix
        midi_ix.activateNote( i, insturmentlist[i] );
        // Empty note arraylist
        insturmentlist[i] = new ArrayList<Integer>();
      }
      println( insturmentlist );
    }
    
    rectMode( CENTER );
    stroke( 255, 0, 0 );
    strokeWeight( 4 );
    rect( width*0.5, height*0.5, x, y );
  }
    
  PVector findClosestPoint( PVector pos ) {
    
    PVector returnVector = new PVector( 0, 0 );
    
    float distance = PVector.dist(points[0].pos, pos);
    int idx = 0;
    for(int c = 1; c < points.length; c++){
        float cdistance = PVector.dist(points[c].pos, pos);
        if(cdistance < distance){
            idx = c;
            distance = cdistance;
        }
    }
    
    returnVector.set( points[idx].pos );
    return returnVector;
  }
}

