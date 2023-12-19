class Brush extends Pointer{
  @Override
  void draw(){
    size.x = size.x<1?1:size.x;
    size.y = size.y<1?1:size.y;
    
    layer = createGraphics((int)size.x+1, (int)size.y+1);
    
    layer.beginDraw();
      layer.clear();
      layer.stroke(fgColor);
      layer.fill(fgColor);
      layer.ellipse(size.x/2, size.y/2, size.x, size.y);
    layer.endDraw();
    
    image(layer, mouseX - size.x/2,  mouseY - size.y/2);
  }
}

class BrushShape {
  Runnable drawShape;
  PGraphics layer;
  
  BrushShape(Runnable drawShape){
    layer = createGraphics(50,50);
    this.drawShape = drawShape;
  }
  
  PGraphics draw(){
    layer.beginDraw();
      layer.clear();
      layer.stroke(fgColor);
      layer.fill(fgColor);
      drawShape.run();
    layer.endDraw();
    
    return layer;
  }
}
