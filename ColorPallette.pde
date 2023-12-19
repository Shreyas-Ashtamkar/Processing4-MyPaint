class ColorPallette extends Pallette{
  ColorPallette(float posX, float posY, float sizeX, float sizeY, color ...colorList){
    super(posX, posY, sizeX, sizeY);
    
    buttons = new ArrayList<Button>();
    
    int btnCount = (int)(size.x / buttonSize);
    float totalPadding = size.x % buttonSize;
    
    if(totalPadding == 0.0){
      btnCount -= 1;
      totalPadding = buttonSize;
    }
    
    float pad = totalPadding/(btnCount+1);
    
    println(size.x);
    
    for(int i=0, row=0, col=0; i<colorList.length; i++){
      col = int(i%btnCount);
      row = int(i/btnCount);
      Button btn = new Button(
        pos.x + (col+1)*pad + col*buttonSize,
        pos.y + (row+1)*pad + row*buttonSize,
        buttonSize, 
        buttonSize,
        colorList[i]
      );
      
      btn.onClickHandler(() -> setColor(btn.buttonColor));
      buttons.add(btn);
    }
  }
}
