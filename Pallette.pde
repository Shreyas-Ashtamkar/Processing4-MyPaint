class Pallette extends PaintObject{
  PVector pos;
  ArrayList<Button> buttons;
  float buttonSize = 45;
  
  Pallette(float posX, float posY, float sizeX, float sizeY){
    super(sizeX, sizeY);
    setPos(posX, posY);
  }
  
  void setPos(float posX, float posY){
    pos = new PVector(posX, posY);
    updateLayer();
  }
  
  @Override
  void updateLayer(){
    layer.beginDraw();
      layer.stroke(0);
      layer.fill(220);
      layer.rect(0, 0, size.x, size.y);
    layer.endDraw();
  }
  
  boolean isClicked(){
    boolean clicked=false;
    
    if(pos.x <= mouseX && mouseX <= pos.x+size.x)
      if(pos.y <= mouseY && mouseY <= pos.y+size.y)
        clicked=true;
    
    return clicked;
  }
  
  void onClick(){
    for (Button btn : buttons){
      if (btn.isClicked()){
        btn.onClick();
      }
    }
  }
  
  void onRelease(){
    for (Button btn : buttons)
      if (btn.isClicked())
        btn.onRelease();
  }
  
  @Override
  void draw(){
    image(layer, pos.x, pos.y);
    
    for (Button btn : buttons)
      btn.draw();
  }
}
