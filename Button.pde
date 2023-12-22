class Button extends PaintObject{
  PVector pos, shadowSize;
  
  color buttonColor = color(255);
  boolean clicked = false;
  
  PGraphics faceImage;
  
  Runnable onClickHandler;
  
  Button(){
     super(10, 10);
  }
  
  Button(float posX, float posY, float sizeX, float sizeY){ //<>// //<>//
     super(sizeX, sizeY);
     setPos(posX, posY);
  }
  
  Button(float posX, float posY, float sizeX, float sizeY, color c){
     super(sizeX, sizeY);
     setPos(posX, posY);
     setColor(c);
  }
  
  Button(float posX, float posY, float sizeX, float sizeY, PGraphics img){
     super(sizeX, sizeY);
     setPos(posX, posY);
     setFaceImage(img);
  }
  
  Button(float posX, float posY, float sizeX, float sizeY, Runnable handler){
     super(sizeX, sizeY);
     setPos(posX, posY);
     onClickHandler(handler);
  }
  
  void setPos(float posX, float posY){
    pos = new PVector(posX, posY);
    updateLayer();
  }
  
  void setFaceImage(PGraphics img){
    this.faceImage = img;
  }
  
  void showFaceImage(float posX, float posY, float sizeX, float sizeY){
    if(faceImage == null) return;
    
    layer.image(faceImage, posX+5, posY+5, constrain(size.x, 1, 35), constrain(size.y, 0, 35));
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
  
  void onClickHandler(Runnable r){
    this.onClickHandler = r;
  }
  
  void onClick(){
    layer.beginDraw();
      layer.clear();
      layer.stroke(0);
      layer.fill(buttonColor);
      layer.rect(shadowSize.x, shadowSize.y, size.x, size.y);
      showFaceImage(shadowSize.x, shadowSize.y, size.x, size.y);
    layer.endDraw();
    onClickHandler.run();
    this.clicked = true;

  }
    
  void onRelease(){
    layer.beginDraw();
      layer.clear();
      layer.stroke(0);
      layer.fill(180);
      layer.rect(shadowSize.x, shadowSize.y, size.x-shadowSize.x, size.y-shadowSize.y);
      layer.fill(buttonColor);
      layer.rect(0, 0, size.x-shadowSize.x, size.y-shadowSize.y);
      showFaceImage(0, 0, size.x-shadowSize.x, size.y-shadowSize.y);
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
      showFaceImage(0, 0, size.x-shadowSize.x, size.y-shadowSize.y);
    layer.endDraw();
  }
  
  @Override
  void draw(){
    //updateLayer();
    image(layer, pos.x, pos.y);
    //showFaceImage(0, 0, size.x-shadowSize.x, size.y-shadowSize.y);
  }
}
