float timer = 0;
class Canvas extends PaintObject{
  Canvas(float sizeX, float sizeY){
     super(sizeX, sizeY);
  }
  
  @Override
  void updateLayer(){
    layer.beginDraw();
      layer.noStroke();
      layer.fill(bgColor);
      layer.rect(0, 0, size.x, size.y);
    layer.endDraw();
  }
  
  void updateLayer(Brush b, float posX, float posY){
    layer.beginDraw();
      layer.image(b.layer, posX - b.size.x/2, posY - b.size.y/2);
    layer.endDraw();
  }
  
  void updateLayerDragged(Brush b, PVector start, PVector end){
    float diffX = end.x - start.x;
    float diffY = end.y - start.y;
    
    float mY = (diffX!=0) ? (diffY!=0? diffY/diffX : 0 ) : 0;
    float mX = (mY!=0) ? 1/mY : 0;
    
    PVector loopStart = start;
    PVector loopEnd = end;
    
    PVector loopIncrement = new PVector(0,0);
    
    layer.beginDraw();
      if(diffX == 0){
        if(diffY < 0){
          loopStart = end;
          loopEnd   = start;
        }
        else{ 
          loopStart = start;
          loopEnd   = end;
        }
        
        loopIncrement.x = 0;
        loopIncrement.y = 1;
      } else if(diffY == 0){
        if(diffX < 0){
          loopStart = end;
          loopEnd   = start;
        }
        else{ 
          loopStart = start;
          loopEnd   = end;
        }
        
        loopIncrement.x = 1;
        loopIncrement.y = 0;
      } else if(abs(diffY) >= abs(diffX)){
        if(diffY < 0){
          loopStart = end;
          loopEnd   = start;
        }
        else{ 
          loopStart = start;
          loopEnd   = end;
        }
        
        loopIncrement.x = mX;
        loopIncrement.y = 1;
      } else{
        if(diffX < 0){
          loopStart = end;
          loopEnd   = start;
        }
        else{ 
          loopStart = start;
          loopEnd   = end;
        }
        
        loopIncrement.x = 1;
        loopIncrement.y = mY;
      }
      
      if(diffX*diffY != 0){
        for(float y=loopStart.y, x=loopStart.x; y != loopEnd.y && x != loopEnd.x; y+=loopIncrement.y, x+=loopIncrement.x)
          if(isInsideCanvas(x, y)){
            println("Drawn ", timer++); //<>//
            layer.image(b.layer, x - b.size.x/2, y - b.size.y/2);
          }
      }
      else {
        for(float y=loopStart.y, x=loopStart.x; y <= loopEnd.y && x <= loopEnd.x; y+=loopIncrement.y, x+=loopIncrement.x)
          if(isInsideCanvas(x, y)){
            layer.image(b.layer, x - b.size.x/2, y - b.size.y/2);
          }
      }
      
    layer.endDraw();
  }
  
  boolean isMouseInsideCanvas(){
    return isInsideCanvas(mouseX, mouseY);
  }
  
  boolean isInsideCanvas(float x, float y){
    return (x > 0 && x < (size.x)) && (y > 0 && y < (size.y));
  }
  
  void draw(Brush b){
    updateLayerDragged(b, new PVector(pmouseX, pmouseY), new PVector(mouseX, mouseY));
    super.draw();
  }
}
