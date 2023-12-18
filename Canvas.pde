class Canvas extends PaintObject{
  color 
    bgColor = color(255), 
    fgColor = color(0);
  
  Canvas(float sizeX, float sizeY){
     this(sizeX, sizeY, color(255));
  }
  
  Canvas(float sizeX, float sizeY, color bgColor, color ...fgColor){
    super(sizeX, sizeY);
    setColors(
      bgColor,
      (fgColor.length == 0) ? color(0) : fgColor[0]
    );
  }
  
  void setBgColor(color bg){
    this.bgColor = bg;
    initLayer();
  }
  
  void setFgColor(color fg){
    this.fgColor = fg;
    initLayer();
  }
    
  void setColors(color bg, color fg){
    this.bgColor = bg;
    this.fgColor = fg;
    initLayer();
  }
  
  @Override
  void initLayer(){
    layer.beginDraw();
      layer.background(g.backgroundColor);
      layer.fill(bgColor);
      layer.noStroke();
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
      } else if(abs(diffY) > abs(diffX)){
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
      
      println("DIFFS  - ", diffY, diffX);
      println("SLOPES - ", mY, mX);
      
      if(diffX*diffY != 0)
        for(float y=loopStart.y, x=loopStart.x; y != loopEnd.y && x != loopEnd.x; y+=loopIncrement.y, x+=loopIncrement.x)
          layer.image(b.layer, x - b.size.x/2, y - b.size.y/2);
      else
        for(float y=loopStart.y, x=loopStart.x; y <= loopEnd.y && x <= loopEnd.x; y+=loopIncrement.y, x+=loopIncrement.x)
          layer.image(b.layer, x - b.size.x/2, y - b.size.y/2);
      
    layer.endDraw();
  }
  
  void draw(Brush b){
    //updateLayer(b, mouseX, mouseY);
    
    updateLayerDragged(b, new PVector(pmouseX, pmouseY), new PVector(mouseX, mouseY));
    
    super.draw();
  }
  
  @Override()
  void draw(){
    if(frameCount == 1)
      layer.background(0,0,0,0);
    super.draw();
  }
}
