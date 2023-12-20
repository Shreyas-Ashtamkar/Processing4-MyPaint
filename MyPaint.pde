Canvas paintCanvas; //<>// //<>//

Pointer p;
Brush globalBrush;

ColorPallette colorPallette;
BrushPallette brushType;

POINTER_TYPE pType = POINTER_TYPE.BRUSH;

color bgColor = color(255, 255, 255);
color fgColor = color(0);

float brushRotateAngle = 0;

float rotateBrush(){
  return brushRotateAngle+=0.3%PI;
}

void setup() {
  size(1400, 900);
  //frameRate(2500);
  paintCanvas = new Canvas(width - 150, height - 150);

  p = new Pointer();
  globalBrush = new Brush(
    ()->{
      globalBrush.layer.pushMatrix();
        globalBrush.layer.translate(globalBrush.size.x/2, globalBrush.size.y/2);
        globalBrush.layer.rotate(PI/4);
        globalBrush.layer.translate(-globalBrush.size.x/2, -globalBrush.size.y/2);
        globalBrush.layer.line(0, 0, globalBrush.size.x, globalBrush.size.y);
        //globalBrush.layer.rect(globalBrush.size.x/2-5, 0, 5, globalBrush.size.y);
      globalBrush.layer.popMatrix();
    },
    50
  );
  
  colorPallette = new ColorPallette(
    //PosX
    width - 150, 
    //PosY
    0, 
    //SizeX
    150, 
    //SizeY
    height - 150,
    //ColorsList
    color(#00ff00),
    color(#0000ff),
    color(#ff0000),
    color(#ffff00),
    color(#00ffff),
    color(#ff00ff),
    color(#000000),
    color(#FF8F00),
    color(#6900FF),
    color(#98FF00),
    color(#762200),
    color(#ffffff)
    
  );
  
  brushType = new BrushPallette(
    0,
    height-150,
    width-150,
    150
  );
}

void draw() {
  background(220);

  paintCanvas.draw();
  colorPallette.draw();
  brushType.draw();
  
  if (pType == POINTER_TYPE.NONE){
    cursor(ARROW);
    p.draw();
  } else if (pType == POINTER_TYPE.BRUSH)
      if(paintCanvas.isMouseInsideCanvas()){
        globalBrush.draw();
        noCursor();
      }
      else
        cursor(ARROW);

}

void mouseClicked() {
  if (mouseButton == CENTER)
    pType = pType==POINTER_TYPE.BRUSH?POINTER_TYPE.NONE:POINTER_TYPE.BRUSH;
}

void mousePressed() {
  if (mouseButton == CENTER) return;

  if (pType == POINTER_TYPE.BRUSH){
    noCursor();
    paintCanvas.draw(globalBrush);
  }
  else{
    cursor(ARROW);
  }

  if(colorPallette.isClicked())
    colorPallette.onClick();
  else if(brushType.isClicked())
    brushType.onClick();
}

void mouseDragged() {
  if (mouseButton == CENTER) return;
  
  if (pType == POINTER_TYPE.BRUSH)
    paintCanvas.draw(globalBrush);
}

void mouseReleased() {
  colorPallette.onRelease();
  brushType.onRelease();
}

void mouseWheel(MouseEvent e) {
  if (pType == POINTER_TYPE.BRUSH)
    if (e.getCount() > 0)
      globalBrush.decSize();
    else
      globalBrush.incSize();
}

void keyPressed() {
  switch(key) {
    case 'w':
      setColor(color(255, 255, 255));
      break;
    case 'r':
      setColor(color(255, 0, 0));
      break;
    case 'g':
      setColor(color(0, 255, 0));
      break;
    case 'b':
      setColor(color(0, 0, 255));
      break;
    case 'c':
      setColor(color(0, 255, 255));
      break;
    case 'y':
      setColor(color(255, 255, 0));
      break;
    case 'm':
      setColor(color(255, 0, 255));
      break;
    case 'k':
      setColor(color(0, 0, 0));
      break;
    case 'e':
      setColor(bgColor);
  }
}
