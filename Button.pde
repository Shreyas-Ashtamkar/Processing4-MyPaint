class Button extends PaintObject{
  PVector pos, shadowSize;
  color buttonColor = color(255);
  boolean clicked = false;
  
  
  Button(){
     super(10, 10);
  }
  
  Button(float posX, float posY, float sizeX, float sizeY){ //<>//
     super(sizeX, sizeY);
     setPos(posX, posY);
  }
  
  void setPos(float posX, float posY){
    pos = new PVector(posX, posY);
    updateLayer();
  }
  
  void setColor(color c){
    buttonColor = c;
    updateLayer();
  }
  
  void setShadow(float s){
    setShadow(s, s);
  }
  
  void setShadow(float x, float y){
    shadowSize = new PVector(x, y);
  }
  
  boolean isClicked(){
    this.clicked=false;
    
    if(pos.x <= mouseX && mouseX <= pos.x+size.x)
      if(pos.y <= mouseY && mouseY <= pos.y+size.y)
        this.clicked=true;
    
    return this.clicked;
  }
  
  void onClick(){
    layer.beginDraw();
      layer.clear();
      layer.stroke(0);
      layer.fill(buttonColor);
      layer.rect(5, 5, size.x, size.y);
    layer.endDraw();
  }
  
  void onRelease(){
    layer.beginDraw();
      layer.clear();
      layer.stroke(0);
      layer.fill(180);
      layer.rect(shadowSize.x, shadowSize.y, size.x-shadowSize.x, size.y-shadowSize.y);
      layer.fill(buttonColor);
      layer.rect(0, 0, size.x-shadowSize.x, size.y-shadowSize.y);
    layer.endDraw();
    this.clicked = false;
  }
  
  @Override
  void updateLayer(){
    if(shadowSize == null)
      setShadow(2);
    layer.beginDraw();
      layer.clear();
      layer.stroke(0);
      layer.fill(180);
      layer.rect(shadowSize.x, shadowSize.y, size.x-shadowSize.x, size.y-shadowSize.y);
      layer.fill(buttonColor);
      layer.rect(0, 0, size.x-shadowSize.x, size.y-shadowSize.y);
    layer.endDraw();
  }
  
  @Override
  void draw(){
    image(layer, pos.x, pos.y);
  }
}
