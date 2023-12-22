float brushRotateAngle = 0;

float rotateBrush(){
  return brushRotateAngle+=0.1%PI;
}

float SQRT3 = sqrt(3);

class BrushPallette extends Pallette{
  ArrayList<Brush> brushList = new ArrayList<Brush>();
  
  BrushPallette(float posX, float posY, float sizeX, float sizeY){
    super(posX, posY, sizeX, sizeY);
    
    buttons = new ArrayList<Button>();
    
    int btnCount = (int)(size.x / buttonSize);
    float totalPadding = size.x % buttonSize;
    
    if(totalPadding == 0.0){
      btnCount -= 1;
      totalPadding = buttonSize;
    }
    
    float pad = totalPadding/(btnCount+1);
    
    createBrushList();
    
    Button btn;
    
    for(int i=0, row=0, col=0; i<brushList.size(); i++){
      col = int(i%btnCount);
      row = int(i/btnCount);
      
      Brush tmp = brushList.get(i);
      tmp.draw();
      
      btn = new Button(
        pos.x + (col+1)*pad + col*buttonSize,
        pos.y + (row+1)*pad + row*buttonSize,
        buttonSize, 
        buttonSize,
        tmp.layer
      );
      
      btn.onClickHandler(ButtonTaskByIndex(i, tmp));
      btn.updateLayer();
      buttons.add(btn);
    }
    

  }
  
  void createBrushList(){
    brushList.add(new Brush());
    brushList.get(0).setShape(
      ()->{
        brushList.get(0).layer.ellipseMode(CORNER);
        brushList.get(0).layer.ellipse(0, 0, brushList.get(0).size.x, brushList.get(0).size.y);
      }
    );
    
    brushList.add(new Brush());
    brushList.get(1).setShape(
      ()->{
        brushList.get(1).layer.rect(0, 0, brushList.get(1).size.x, brushList.get(1).size.y);
      }
    );
    
    brushList.add(new Brush());
    brushList.get(2).setShape(
      ()->{
        brushList.get(2).layer.pushMatrix();
          brushList.get(2).layer.rect(brushList.get(2).size.x/2-(brushList.get(2).size.x/20), 0, brushList.get(2).size.x/10, brushList.get(2).size.y);
        brushList.get(2).layer.popMatrix();
      }
    );
    
    brushList.add(new Brush());
    brushList.get(3).setShape(
      ()->{
        brushList.get(3).layer.pushMatrix();
          brushList.get(3).layer.translate(brushList.get(3).size.x/2, brushList.get(3).size.y/2);
          brushList.get(3).layer.rotate(PI/2);
          brushList.get(3).layer.translate(-(brushList.get(3).size.x/2), -brushList.get(3).size.y/2);
          brushList.get(3).layer.rect(brushList.get(3).size.x/2-(brushList.get(3).size.x/20), 0, (brushList.get(3).size.x/10), brushList.get(3).size.y);
        brushList.get(3).layer.popMatrix();
      }
    );
    
    brushList.add(new Brush());
    brushList.get(4).setShape(
      ()->{
        brushList.get(4).layer.pushMatrix();
          brushList.get(4).layer.translate(brushList.get(4).size.x/2, brushList.get(4).size.y/2);
          brushList.get(4).layer.rotate(PI/4);
          brushList.get(4).layer.translate(-(brushList.get(4).size.x/2), -brushList.get(4).size.y/2);
          brushList.get(4).layer.rect(brushList.get(4).size.x/2-(brushList.get(4).size.x/20), 0, (brushList.get(4).size.x/10), brushList.get(4).size.y);
        brushList.get(4).layer.popMatrix();
      }
    );
    
    brushList.add(new Brush());
    brushList.get(5).setShape(
      ()->{
        brushList.get(5).layer.pushMatrix();
          brushList.get(5).layer.translate(brushList.get(5).size.x/2, brushList.get(5).size.y/2);
          //brushList.get(5).layer.rotate(PI*3/4);
          brushList.get(5).layer.rotate(brushRotateAngle);
          brushList.get(5).layer.translate(-(brushList.get(5).size.x/2), -brushList.get(5).size.y/2);
          brushList.get(5).layer.rect(brushList.get(5).size.x/2-(brushList.get(5).size.x/20), 0, (brushList.get(5).size.x/10), brushList.get(5).size.y);
        brushList.get(5).layer.popMatrix();
      }
    );
    
    brushList.add(new Brush());
    brushList.get(6).setShape(
      ()->{
        brushList.get(6).layer.pushMatrix();
          
          brushList.get(6).layer.translate(brushList.get(6).size.x/2, (brushList.get(6).size.y/2 - brushList.get(6).size.x*SQRT3/4)+brushList.get(6).size.x*(1-SQRT3)/2*SQRT3);
          //brushList.get(6).layer.rotate(brushRotateAngle);
          brushList.get(6).layer.translate(-(brushList.get(6).size.x/2), -((brushList.get(6).size.y/2 - brushList.get(6).size.x*SQRT3/4)+brushList.get(6).size.x*(1-SQRT3)/2*SQRT3));
          
          brushList.get(6).layer.triangle(
            brushList.get(6).size.x/2, 
            (brushList.get(6).size.y/2 - brushList.get(6).size.x*SQRT3/4), 
            
            0, 
            (brushList.get(6).size.y/2 - brushList.get(6).size.x*SQRT3/4) + brushList.get(6).size.x*SQRT3/2,
            
            brushList.get(6).size.x, 
            (brushList.get(6).size.y/2 - brushList.get(6).size.x*SQRT3/4) + brushList.get(6).size.x*SQRT3/2
          );
          
        brushList.get(6).layer.popMatrix();
      }
    );
    
    brushList.add(new Brush());
    brushList.get(7).setShape(
      ()->{
        brushList.get(7).layer.textSize(21);
        brushList.get(7).layer.text("R", 4f, 2f, brushList.get(7).size.x, brushList.get(7).size.y);
      }
    );
  }
  
  Runnable ButtonTaskByIndex(int index, Brush ...o){
    switch(index){
      case 7:
        return () -> rotateBrush();
        
      default:
        if(o.length != 0)
          return ()->setBrush(o[0]);
    }
    
    return ()->println("Unachievable Condition, BrushPallette.ButtonTaskByIndex");
  }
}



//Brush[] brushList = {
//  new Brush(
//    ()->{
//      //b.layer.ellipseMode(CORNER);
//      //b.layer.ellipse(0, 0, b.size.x, b.size.y);
//      //b.layer.ellipse(0, b.size.y, b.size.x, b.size.y);
//      //b.layer.ellipse(b.size.x, 0, b.size.x, b.size.y);
//      //b.layer.ellipse(b.size.x, b.size.y, b.size.x, b.size.y);
//      b.layer.pushMatrix();
//        b.layer.translate(b.size.x/2, b.size.y/2);
//        b.layer.rotate(rotateBrush());
//        b.layer.translate(-b.size.x/2, -b.size.y/2);
//        //b.layer.line(0, 0, b.size.x, b.size.y);
//        b.layer.rect(b.size.x/2-5, 0, 5, b.size.y);
//      b.layer.popMatrix();
//    },
//    50
//  ),
//  new Brush(
//    ()->{
//      //b.layer.ellipseMode(CORNER);
//      //b.layer.ellipse(0, 0, b.size.x, b.size.y);
//      //b.layer.ellipse(0, b.size.y, b.size.x, b.size.y);
//      //b.layer.ellipse(b.size.x, 0, b.size.x, b.size.y);
//      //b.layer.ellipse(b.size.x, b.size.y, b.size.x, b.size.y);
//      b.layer.pushMatrix();
//        //b.layer.translate(b.size.x/2, b.size.y/2);
//        //b.layer.rotate(rotateBrush());
//        //b.layer.translate(-b.size.x/2, -b.size.y/2);
//        b.layer.line(0, 0, b.size.x, b.size.y);
//        //b.layer.rect(b.size.x/2-5, 0, 5, b.size.y);
//      b.layer.popMatrix();
//    },
//    50
//  ),
//  new Brush(
//    ()->{
//      //b.layer.ellipseMode(CORNER);
//      //b.layer.ellipse(0, 0, b.size.x, b.size.y);
//      //b.layer.ellipse(0, b.size.y, b.size.x, b.size.y);
//      //b.layer.ellipse(b.size.x, 0, b.size.x, b.size.y);
//      //b.layer.ellipse(b.size.x, b.size.y, b.size.x, b.size.y);
//      b.layer.pushMatrix();
//        b.layer.translate(b.size.x/2, b.size.y/2);
//        b.layer.rotate(PI/4);
//        b.layer.translate(-b.size.x/2, -b.size.y/2);
//        b.layer.line(0, 0, b.size.x, b.size.y);
//        //b.layer.rect(b.size.x/2-5, 0, 5, b.size.y);
//      b.layer.popMatrix();
//    },
//    50
//  ),
//};
