abstract class PaintObject{
  PVector size;
  PGraphics layer;
  
  PaintObject(){
     this(10, 10);
  }

  PaintObject(float sizeX, float sizeY){
     this.size = new PVector(sizeX, sizeY);
     initLayer();
  }
  
  void initLayer(){
    //Normalize the Sizes to the constraints
    size.x = size.x<1?1:size.x;
    size.y = size.y<1?1:size.y;
    
    layer = createGraphics((int)size.x+1, (int)size.y+1);
    updateLayer();
  }
  
  void updateLayer(){
    layer.beginDraw();
      layer.clear();
      layer.stroke(0);
      layer.rect(0, 0, size.x, size.y);
    layer.endDraw();
  }
  
  void setSize(float s){
    setSize(s, s);
    updateLayer();
  }
  
  void incSize(){
    size.x += 1;
    size.y += 1;
    initLayer();
  }
  
  void decSize(){
    size.x -= 1;
    size.y -= 1;

    initLayer();
  }
  
  void setSize(float x, float y){
    size = new PVector(x, y);
    updateLayer();
  }
  
  void draw(){
    image(layer, 0, 0);
  }
}
