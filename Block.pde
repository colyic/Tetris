public class Block{
  String blockType;
  int positionX;
  int positionY;
  color baseColor;
  int speed;
  
  String getBlockType(){
    return blockType;
  }
  
  int getSpeed(){
    return speed;
  }
  
  int getPositionX(){
    return positionX;
  }
  
  int getPositionY(){
    return positionY;
  }
  
  void changeSpeed(){
    speed++;
  }
  
  void moveRight(){
    if(
    positionX++;
  }
  
  void moveLeft(){
    positionX--;
  }
  
  void hardDrop(){
  }
  
  void softDrip(){
  }
  
  void rotate(){
  }
  
  void randomizeType(){
    int rng = (int)(Math.random() * 7);
    String[] typeArr = {"IBLock", "JBLock", "LBlock", "OBlock", "SBlock", "TBLock", "ZBLock"};
    for(int i = 0; i <= 7; i++){
      if(rng == i){
        this.blockType = typeArr[i];
      }
    } 
  }
}