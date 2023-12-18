Canvas paintCanvas;

Pointer p;
Brush b;

POINTER_TYPE pType;

void setup(){
  size(1400,900);
  //frameRate(2500);
  
  p = new Pointer();
  b = new Brush();
  
  paintCanvas = new Canvas(width - 50, height - 50);
  
  pType = POINTER_TYPE.BRUSH;
  
  println(RECT);
}

void draw(){
  background(220);
  
  paintCanvas.draw();
  
  if(pType == POINTER_TYPE.NONE)
    p.draw();
  else if(pType == POINTER_TYPE.BRUSH)
    b.draw();
}

void mouseClicked(){
  if(mouseButton == CENTER)
    pType = pType==POINTER_TYPE.BRUSH?POINTER_TYPE.NONE:POINTER_TYPE.BRUSH;
}

void mousePressed(){
  if(pType == POINTER_TYPE.BRUSH && mouseButton != CENTER)
    paintCanvas.draw(b);
}

float max_distance = 0;

void mouseDragged(){
  if(pType == POINTER_TYPE.BRUSH && mouseButton != CENTER)
    paintCanvas.draw(b);
  
  max_distance = max(max_distance, abs(pmouseX-mouseX));
  println(max_distance);
}
