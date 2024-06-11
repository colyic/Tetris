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
    rect(gameboardX, gameboardY, gameboardWidth, gameboardLength, boxRadius);
        
    gridSide = 30;
    gridX = gameboardX + 50;
    gridY = gameboardY + 50;
    
    currentBlock = new Block();
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
    
  void updateGame() {
    if (!currentBlock.isPlaced()) {
      currentBlock.softDrop();      
      // Check if block has landed
      if (!currentBlock.canMoveDown()) {
        placeBlock();
        clearLines();
        currentBlock = new Block();
      }
    }
    drawGrid();
    drawBlock();
  }
    
  void updateGrid() {
    // reset map
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
    
  void drawBlock() {
    for (int i = 0; i < currentBlock.getGrid().length; i++) {
      for (int j = 0; j < currentBlock.getGrid()[i].length; j++) {
        if (currentBlock.getGrid()[i][j] == 1) {
          fill(currentBlock.getBlockColor());
          fillBlock(currentBlock.getBlockX() + j, currentBlock.getBlockY() + i);
        }
      }
    }
  }
    
  void placeBlock() {
    int[][] grid = currentBlock.getGrid();
    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid[i].length; j++) {
        if (grid[i][j] == 1) {
          map[currentBlock.getBlockY() + i][currentBlock.getBlockX() + j] = 1;
        }
      }
    }
    currentBlock.setIsPlaced(true);
  }
    
  void clearLines() {
    for (int i = 0; i < map.length; i++) {
      boolean fullLine = true;
      for (int j = 0; j < map[i].length; j++) {
        if (map[i][j] == 0) {
          fullLine = false;
          break;
        }
      }
      if (fullLine) {
        for (int k = i; k > 0; k--) {
          map[k] = map[k - 1];
        }
        map[0] = new int[10];
      }
    }
  }
}
