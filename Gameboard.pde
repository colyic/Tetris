import java.util.Arrays;

public class Gameboard {
  int[][] map;
  
  int gameboardLength;
  int gameboardWidth;
  
  int gameboardX;
  int gameboardY;
  
  int gridSide;
  int gridX;
  int gridY;
  
  Block block;
  
  public Gameboard() {
    map = new int[20][10];
    
    gameboardLength = 700;
    gameboardWidth = 400;
    
    gameboardX = width / 2 - gameboardWidth / 2;
    gameboardY = height / 2 - gameboardLength / 2;
    
    fill(200);
    rect(gameboardX, gameboardY, gameboardWidth, gameboardLength, boxRadius);
    
    gridSide = 30;
    gridX = gameboardX + 50;
    gridY = gameboardY + 50;
  }
  
  int getLength() {
    return gameboardLength;
  }
  
  int getWidth() {
    return gameboardWidth;
  }
  
  void fillBlock(int x, int y) {
    rect(gridX + x * gridSide, gridY + y * gridSide, gridSide, gridSide, 2);
  }
  
  void drawGrid() {
    stroke(255);
    fill(65);
    
    for (int i = 0; i < map.length; i++) {
      for (int j = 0; j < map[i].length; j++) {
        rect(gridX, gridY, gridSide, gridSide, 2);
        gridX += gridSide;
        
        if (j == map[i].length - 1) {
          gridY += gridSide;
          gridX -= gridSide * 10;
        }
      }
    }
    
    gridX = gameboardX + 50;
    gridY = gameboardY + 50;
  }
  
  void startGame() {
    block = new Block();
    
    while (block.getBlockY() < 19) {
      for (int i = block.getBlockX(); i < block.getBlockX() + 4; i++) {
        for (int j = block.getBlockY(); j < block.getBlockY() + 2; j++) { 
          map[j][i] = block.getGrid()[j - block.getBlockY()][i - block.getBlockX()];
        }
      }
            
      System.out.println(block.getBlockType());
      System.out.println(block.getBlockY());
      System.out.println(block.getBlockColor());
      
      stroke(255);
      fill(65);
      
      for (int i = 0; i < map.length; i++) {
        for (int j = 0; j < map[i].length; j++) {
          fill(65);
          
          if (map[i][j] == 1) {
            fill(block.getBlockColor());
          }
          
          rect(gridX, gridY, gridSide, gridSide, 2);
          gridX += gridSide;
          
          if (j == map[i].length - 1) {
            gridY += gridSide;
            gridX -= gridSide * 10;
          }
        }
       }
       
       gridX = gameboardX + 50;
       gridY = gameboardY + 50;
       
       block.addBlockY();
       
       for (int i = 0; i < map.length; i++) {
         for (int j = 0; j < map[i].length; j++) {
           map[i][j] = 0;
         }
       }
     }
  }
}
