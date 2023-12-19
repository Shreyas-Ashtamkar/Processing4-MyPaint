class Pallette extends PaintObject{
  PVector pos;
  
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
  
  @Override
  void draw(){
    image(layer, pos.x, pos.y);
  }
}
