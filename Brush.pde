class Brush extends Pointer{
  @Override
  void updateLayer(){
    layer.beginDraw();
      layer.clear();
      layer.stroke(fgColor);
      layer.fill(fgColor);
      layer.ellipse(size.x/2, size.y/2, size.x, size.y);
    layer.endDraw();
  }
}
