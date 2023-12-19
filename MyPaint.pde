Canvas paintCanvas;

Pointer p;
Brush b;

Pallette colorPallette;
Button btn1;
ArrayList<Button> buttons = new ArrayList();


POINTER_TYPE pType = POINTER_TYPE.NONE;

color bgColor = color(255,255,0); 
color fgColor = color(0);

void setup(){
  size(1400,900);
  //frameRate(2500);
  paintCanvas = new Canvas(width - 150, height - 150);
  
  p = new Pointer();
  b = new Brush();
  
  colorPallette = new Pallette(width - 150, 0, 150, height - 150);
  //btn1 = new Button(width - 140, 10, 40, 40);
  //btn2 = new Button(width - 95, 10, 40, 40);
  
  buttons.add(new Button(width - 140, 10, 40, 40));
  buttons.add(new Button(width - 95, 10, 40, 40));
  buttons.add(new Button(width - 50, 10, 40, 40));
  
  buttons.add(new Button(width - 140, 55, 40, 40));
  buttons.add(new Button(width - 95, 55, 40, 40));
  buttons.add(new Button(width - 50, 55, 40, 40));
  
  buttons.add(new Button(width - 140, 100, 40, 40));
  buttons.add(new Button(width - 95, 100, 40, 40));
  buttons.add(new Button(width - 50, 100, 40, 40));
  
  buttons.add(new Button(width - 140, 145, 40, 40));
  buttons.add(new Button(width - 95, 145, 40, 40));
  buttons.add(new Button(width - 50, 145, 40, 40));
}

void draw(){
  background(220);
  
  paintCanvas.draw();
  
  colorPallette.draw();
  //btn1.draw();
  //btn2.draw();
  
  for(Button b: buttons)
    b.draw();
  
  if(pType == POINTER_TYPE.NONE)
    p.draw();
  else if(pType == POINTER_TYPE.BRUSH)
    b.draw();
}

void mouseClicked(){
  if(mouseButton == CENTER) //<>//
    pType = pType==POINTER_TYPE.BRUSH?POINTER_TYPE.NONE:POINTER_TYPE.BRUSH;
}

void mousePressed(){
  if(mouseButton == CENTER) return;
  
  if(pType == POINTER_TYPE.BRUSH)
    paintCanvas.draw(b);
  
  //if(btn1.isClicked())
  //  btn1.onClick();
    
  //if(btn2.isClicked())
  //  btn2.onClick();
  
  for(Button btn: buttons)
    if(btn.isClicked())
      btn.onClick();
}

void mouseDragged(){
  if(mouseButton == CENTER) return;
  if(pType == POINTER_TYPE.BRUSH)
    paintCanvas.draw(b);
}

void mouseReleased(){
  //btn1.onRelease();
  //btn2.onRelease();
  for(Button btn: buttons)
    if(btn.isClicked())
      btn.onRelease();
}

void mouseWheel(MouseEvent e) {
  if(pType == POINTER_TYPE.BRUSH)
    if(e.getCount() > 0)
      b.decSize();
    else
      b.incSize();
}

void keyPressed() {
  println(key);
  if (key == 'g') {
    setColor(color(0,255,0), b);
  }
  switch(key){
    case 'w':
      setColor(color(255, 255, 255), b);
      break;
    case 'r':
      setColor(color(255, 0, 0), b);
      break;
    case 'g':
      setColor(color(0, 255, 0), b);
      break;
    case 'b':
      setColor(color(0, 0, 255), b);
      break;
    case 'c':
      setColor(color(0, 255, 255), b);
      break;
    case 'y':
      setColor(color(255,255,0), b);
      break;
    case 'm':
      setColor(color(255, 0, 255), b);
      break;
    case 'k':
      setColor(color(0, 0, 0), b);
      break;
    case 'e':
      setColor(bgColor, b);
  }
}
