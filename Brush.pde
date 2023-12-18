class Brush extends Pointer{
  color fillColor = color(0);
  color borderColor = color(0);
  
  @Override
  void initLayer(){
    layer.beginDraw();
      layer.stroke(borderColor);
      layer.fill(fillColor);
      layer.ellipse(size.x/2, size.y/2, size.x, size.y);
    layer.endDraw();
  }
}
