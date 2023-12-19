Canvas paintCanvas; //<>//

Pointer p;
Brush b;

ColorPallette colorPallette;

POINTER_TYPE pType = POINTER_TYPE.NONE;

color bgColor = color(255, 255, 0);
color fgColor = color(0);

void setup() {
  size(1400, 900);
  //frameRate(2500);
  paintCanvas = new Canvas(width - 150, height - 150);

  p = new Pointer();
  b = new Brush();

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
}

void draw() {
  background(220);

  paintCanvas.draw();

  colorPallette.draw();

  if (pType == POINTER_TYPE.NONE)
    p.draw();
  else if (pType == POINTER_TYPE.BRUSH)
    if((mouseX > 0 && mouseX < paintCanvas.size.x) && (mouseY > 0 && mouseY < paintCanvas.size.y))
      b.draw();
}

void mouseClicked() {
  if (mouseButton == CENTER)
    pType = pType==POINTER_TYPE.BRUSH?POINTER_TYPE.NONE:POINTER_TYPE.BRUSH;
}

void mousePressed() {
  if (mouseButton == CENTER) return;

  if (pType == POINTER_TYPE.BRUSH)
    paintCanvas.draw(b);

  if(colorPallette.isClicked())
    colorPallette.onClick();
}

void mouseDragged() {
  if (mouseButton == CENTER) return;
  
  if (pType == POINTER_TYPE.BRUSH)
    paintCanvas.draw(b);
}

void mouseReleased() {
  colorPallette.onRelease();
}

void mouseWheel(MouseEvent e) {
  if (pType == POINTER_TYPE.BRUSH)
    if (e.getCount() > 0)
      b.decSize();
    else
      b.incSize();
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
