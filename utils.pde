enum POINTER_TYPE {
  NONE,
  BRUSH
};

enum BRUSH_TYPE {
  PEN,
  SQUARE,
  CIRCLE
};

void setColor(color c){
    fgColor = c;
    
    //reinitialize relevant layers
    //for( PaintObject p : pObjects)
    //  p.initLayer();
}
