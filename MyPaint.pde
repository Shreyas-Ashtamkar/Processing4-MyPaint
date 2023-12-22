Canvas paintCanvas; //<>// //<>//

Pointer p;
Brush globalBrush;

ColorPallette colorPallette;
BrushPallette brushType;

POINTER_TYPE pType = POINTER_TYPE.BRUSH;

color bgColor = color(255, 255, 255);
color fgColor = color(0);

void setup() {
  size(1400, 900);
  paintCanvas = new Canvas(width - 151, height - 151);

  p = new Pointer();
  globalBrush = new Brush(
    ()->{
      globalBrush.layer.pushMatrix();
        globalBrush.layer.ellipseMode(CORNER);
        globalBrush.layer.ellipse(0, 0, globalBrush.size.x, globalBrush.size.y);
      globalBrush.layer.popMatrix();
    },
    5
  );
  
  colorPallette = new ColorPallette(
    width - 150,  0, 
    150, height - 150,
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
    0, height-150,
    width-150, 150
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
  } 
  else if (pType == POINTER_TYPE.BRUSH)
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
      if(keyPressed && keyCode ==SHIFT)
        globalBrush.decSize(globalBrush.size.x/4);
      else
        globalBrush.decSize();

    else
      if(keyPressed && keyCode ==SHIFT)
        globalBrush.incSize(globalBrush.size.x/4);
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
    case 'a':
      rotateBrush();
  }
}
