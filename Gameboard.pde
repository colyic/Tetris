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
  
  Block currentBlock;
  Block[] queue;
  
  public Gameboard() {
    map = new int[20][10];
    
    gameboardLength = 700;
    gameboardWidth = 400;
    
    gameboardX = width / 2 - gameboardWidth / 2;
    gameboardY = height / 2 - gameboardLength / 2;
    
    fill(200);
    rect(gameboardX, gameboardY, gameboardWidth, gameboardLength, 5); // Assuming boxRadius is 5
    
    gridSide = 30;
    gridX = gameboardX + 50;
    gridY = gameboardY + 50;

    currentBlock = new Block(); // Initialize the current block when the game starts
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
    drawGrid();
    drawBlock();
  }
  
  void drawBlock() {
    int[][] grid = currentBlock.getGrid();
    int x = currentBlock.getBlockX();
    int y = currentBlock.getBlockY();
    
    fill(currentBlock.getBlockColor());
    
    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid[i].length; j++) {
        if (grid[i][j] == 1) {
          rect(gridX + (x + j) * gridSide, gridY + (y + i) * gridSide, gridSide, gridSide);
        }
      }
    }
  }
  
  void updateGrid() {
    // Reset the map
    for (int i = 0; i < map.length; i++) {
      Arrays.fill(map[i], 0);
    }
    
    // Update the map with the current block's position
    int[][] grid = currentBlock.getGrid();
    int x = currentBlock.getBlockX();
    int y = currentBlock.getBlockY();
    
    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid[i].length; j++) {
        if (grid[i][j] == 1) {
          map[y + i][x + j] = 1;
        }
      }
    }
  }
  
  void keyPressed() {
    if (keyCode == UP) {
      currentBlock.rotate();
    } else if (keyCode == LEFT) {
      currentBlock.moveLeft();
    } else if (keyCode == RIGHT) {
      currentBlock.moveRight();
    } else if (keyCode == DOWN) {
      currentBlock.softDrop();
    }
    //} else if (keyCode == )
    updateGrid();
  }
}
