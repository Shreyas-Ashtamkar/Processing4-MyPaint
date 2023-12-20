enum POINTER_TYPE {
  NONE,
  BRUSH
};

enum BRUSH_TYPE {
  PEN,
  SQUARE,
  CIRCLE,
  LINE_STRAIGNT,
  FWD_SLASH,
  BWD_SLASH,
};

void setColor(color c){
    fgColor = c;
}

void setBrush(Brush b){
    println("SETTING BRUSH");
    globalBrush = b;
}


void shapeSketch0(PVector pos, PVector size) {
  float cX = size.x/2;
  ellipse(  pos.x+cX,      pos.y+cX,  size.x,  size.x );
  line(     pos.x+cX,  pos.x+size.x,  40.0, 240.0 );
  line(     pos.x+cX,  pos.x+size.x,   0.0, 240.0 );
  line(     pos.x+cX,          80.0,  80.0, 240.0 );
  line(     pos.x+cX,         240.0,   0.0, 300.0 );
  line(     pos.x+cX,         240.0,  80.0, 300.0 );
}

//void setup(){
//  size(500,500);
//}
//void draw(){
//  background(220);
//  shapeSketch0(new PVector(0,0),new PVector(80,300));
//}
