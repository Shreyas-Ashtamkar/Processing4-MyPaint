abstract class PaintObject{
  PVector size;
  PGraphics layer;
  
  PaintObject(){
     this(10, 10);
  }

  PaintObject(float sizeX, float sizeY){
     this.size = new PVector(sizeX, sizeY);
     layer = createGraphics((int)sizeX, (int)sizeY);
     initLayer();
  }
  
  void initLayer(){
    layer.beginDraw();
      layer.stroke(0);
      layer.rect(0, 0, size.x, size.y);
    layer.endDraw();
  }
  
  void draw(){
    image(layer, 0, 0);
  }
}
