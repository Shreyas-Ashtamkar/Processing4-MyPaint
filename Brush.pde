class Brush extends Pointer{
  Runnable drawShape;
  
  Brush(){
    super();
    setShape(()->{
      layer.ellipseMode(CORNER);
      layer.ellipse( 0, 0, size.x, size.y);
    });
  }
  
  Brush(float size){
    super();
    setSize(size);
    setShape(()->{
      layer.ellipseMode(CORNER);
      layer.ellipse( 0, 0, this.size.x, this.size.y);
    });
  }
  
  Brush(Runnable drawShape){
    super();
    setShape(drawShape);
  }
  
  Brush(Runnable drawShape, float size){
    super();
    setSize(size);
    setShape(drawShape);
  }
  
  Brush(Brush that){
    super();
    setShape(that.drawShape);
    setSize(that.size.x, that.size.y);
    print("Copied Object");
  }
  
  void setShape(Runnable drawShape){
    this.drawShape = drawShape;
  }
  
  @Override
  void updateLayer(){
    size.x = size.x<1?1:size.x;
    size.y = size.y<1?1:size.y;
    
    layer = createGraphics((int)size.x+1, (int)size.y+1);
    
    layer.beginDraw();
      layer.clear();
      layer.stroke(fgColor);
      layer.fill(fgColor);
      //layer.ellipse(size.x/2, size.y/2, size.x, size.y);
      if(drawShape!=null)
        drawShape.run();
    layer.endDraw();
  }
  
  @Override
  void draw(){
    updateLayer();
    image(layer, mouseX - size.x/2,  mouseY - size.y/2);
  }
}
