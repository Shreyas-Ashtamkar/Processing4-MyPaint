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
    
    for(int i=0, row=0, col=0; i<brushList.size(); i++){
      col = int(i%btnCount);
      row = int(i/btnCount);
      
      Brush tmp = brushList.get(i);
      tmp.draw();
      
      Button btn = new Button(
        pos.x + (col+1)*pad + col*buttonSize,
        pos.y + (row+1)*pad + row*buttonSize,
        buttonSize, 
        buttonSize,
        tmp.layer
      );
      
      btn.onClickHandler(() -> setBrush(tmp));
      btn.updateLayer();
      buttons.add(btn);
    }
  }
  
  void createBrushList(){
    brushList.add(new Brush(50));
    brushList.get(0).setShape(
      ()->{
        brushList.get(0).layer.ellipseMode(CORNER);
        brushList.get(0).layer.ellipse(0, 0, brushList.get(0).size.x, brushList.get(0).size.y);
      }
    );
    
    brushList.add(new Brush(50));
    brushList.get(1).setShape(
      ()->{
        brushList.get(1).layer.rect(0, 0, brushList.get(1).size.x, brushList.get(1).size.y);
      }
    );
    
    brushList.add(new Brush(50));
    brushList.get(2).setShape(
      ()->{
        brushList.get(2).layer.pushMatrix();
          brushList.get(2).layer.translate(brushList.get(2).size.x/2, brushList.get(2).size.y/2);
          brushList.get(2).layer.rotate(PI/4);
          brushList.get(2).layer.translate(-brushList.get(2).size.x/2, -brushList.get(2).size.y/2);
          //brushList.get(2).layer.line(0, 0, brushList.get(2).size.x, brushList.get(2).size.y);
          brushList.get(2).layer.rect(brushList.get(2).size.x/2-5, 0, 5, brushList.get(2).size.y);
        brushList.get(2).layer.popMatrix();
      }
    );
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
