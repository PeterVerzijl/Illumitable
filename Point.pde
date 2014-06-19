public class Point {
 
  PVector pos;
  
  float size = 20;
  
  int instrument, note;
    
  long startTime, stayDuration;
  
  boolean on = false;
  
  // Accuracy of the collision
  int accuracy = 3;
  
  public Point( PVector pos, int instrument, int note ) {
    
    this.pos = pos;
    this.size = size;
    this.instrument = instrument;
    this.note = note;
    
    startTime = millis();
    stayDuration = 5000; // 5 seconds
  }
    
  void draw() {
    
    float delta = (float)255 / (float)stayDuration;
    float alpha = 255 - ( millis() - startTime ) * delta;  
    pushMatrix();
      fill(255, 0, 0, 255); // alpha!
      noStroke();
      translate( pos.x, pos.y );
      ellipse( 0, 0, 20, 20 );
    popMatrix();
  }
  
  void collision() {
    
     if ( ( pos.x > width*0.5 - grid.pulseX*0.5 && pos.x < width*0.5 + grid.pulseX*0.5 && pos.y > height*0.5 - grid.pulseY*0.5 && pos.y < height*0.5 + grid.pulseY*0.5 ) && 
      !( pos.x > width*0.5 - grid.pulseX*0.5 + accuracy && pos.x < width*0.5 + grid.pulseX*0.5 - accuracy && pos.y > height*0.5 - grid.pulseY*0.5 + accuracy && pos.y < height*0.5 + grid.pulseY*0.5 - accuracy ) && on ) {
      if( on ) {
        // print for debug mode
        // println("added to list");
        insturmentlist[ instrument-1 ].add( note );
        // println( insturmentlist );
        on = false;
      }
    }
  }
} 
