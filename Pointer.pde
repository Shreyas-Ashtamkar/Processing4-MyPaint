class Pointer extends PaintObject{
  Pointer(){
     super(20, 20);
  }
  
  Pointer(float sizeX, float sizeY){
     super(sizeX, sizeY);
  }
  
  @Override
  void updateLayer(){
    //layer.beginDraw();
    //  layer.clear();
    //  layer.stroke(0);
    //  layer.line(0,size.y/2, size.x,size.y/2);
    //  layer.line(size.x/2, 0, size.x/2,size.y);
    //layer.endDraw();
  }
  
  @Override
  void draw(){
    image(layer, mouseX - size.x/2,  mouseY - size.y/2);
  }
}
