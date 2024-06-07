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
    positionX++;
  }
  
  void moveLeft(){
    positionX--;
  }
  
  void hardDrop(){
    for(int i = grid[0].length; i >=0; i++){
      if(grid[positionX][positionY] == 0)[
      positionY--;
    }
  }
  
  void softDrop(){
    positionY--;
  }
  
  void rotate(){
  }
  
  void randomizeType() {
    int rng = (int) (Math.random() * 7);
    String[] typeArr = {"IBlock", "JBlock", "LBlock", "OBlock", "SBlock", "TBlock", "ZBlock"};
    
    blockType = typeArr[rng];
  }
}
