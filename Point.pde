public class Point {
 
  PVector pos;
  
  float size = 20;
  
  int instrument, note;
    
  long startTime, stayDuration;
  
  boolean on = false;
  
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
    
    if( pos.x < grid.x*0.5 + width*0.5 && pos.y < grid.y*0.5 + height*0.5 && pos.x > -grid.x*0.5 + width*0.5 && 
        pos.x > -grid.x*0.5 + width*0.5 && pos.y > -grid.y*0.5 + height*0.5 ) {
      if( on ) {
        println("added to list");
        insturmentlist[ instrument-1 ].add( note );
        println( insturmentlist );
        on = false;
      }
    }
  }
} 
