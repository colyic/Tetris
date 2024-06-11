import java.util.Arrays;

public class Gameboard {
  int[][] map;
  int[][] activeMap;
  
  int gameboardLength;
  int gameboardWidth;
  
  int gameboardX;
  int gameboardY;
  
  int gridSide;
  int gridX;
  int gridY;
  
  Block block;
  boolean activeBlock;
  
  public Gameboard() {
    map = new int[20][10];
    activeMap = new int[20][10];
    
    gameboardLength = 700;
    gameboardWidth = 400;
    
    gameboardX = width / 2 - gameboardWidth / 2;
    gameboardY = height / 2 - gameboardLength / 2;
    
    fill(200);
    rect(gameboardX, gameboardY, gameboardWidth, gameboardLength, boxRadius);
    
    gridSide = 30;
    gridX = gameboardX + 50;
    gridY = gameboardY + 50;
    
    activeBlock = false;
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
    for (int i = 0; i < map.length; i++) {
      for (int j = 0; j < map[i].length; j++) {
        fill(65);
        stroke(255);
        
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
    if (activeBlock == false) {
      block = new Block();
      activeBlock = true;
    }
    
    // map block to game map
    for (int i = block.getBlockX(); i < block.getBlockX() + 4; i++) {
      for (int j = block.getBlockY(); j < block.getBlockY() + 2; j++) { 
        map[j][i] = block.getGrid()[j - block.getBlockY()][i - block.getBlockX()];
      }
    }
    
    stroke(255);
    fill(65);
    
    // draw grid + block
    for (int i = 0; i < map.length; i++) {
      for (int j = 0; j < map[i].length; j++) {
        fill(65);
        
        if (map[i][j] == 1) {
          fill(block.getBlockColor());
          rect(gridX, gridY, gridSide, gridSide, 2);
        }

        gridX += gridSide;
        
        if (j == map[i].length - 1) {
          gridY += gridSide;
          gridX -= gridSide * 10;
        }
      }
     }
     
     // reset prev block position
     for (int i = block.getBlockX(); i < block.getBlockX() + 4; i++) {
       for (int j = block.getBlockY(); j < block.getBlockY() + 2; j++) { 
         map[j][i] = 0;
         
         fill(65);
         stroke(255);
         fillBlock(j, i);
       }
     }
       
     gridX = gameboardX + 50;
     gridY = gameboardY + 50;
     
     block.dropOne();
     
     if (block.getBlockY() == 19) {
       activeBlock = false;
     }
   }
}
