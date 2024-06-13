import java.util.ArrayList;
import java.util.Arrays;

public class Block {
  String blockType;
  color blockColor;
  boolean isPlaced;
  
  int blockX;
  int blockY;
  
  private int initialX;
  private int initialY;
  
  int[][] blockGrid;
  private int[][] initialGrid;
  
  public Block() {
    this.randomizeType();
    isPlaced = false;
    
    blockX = 3;
    blockY = 0;
    
    this.initialGrid = makeCopy(blockGrid);
    this.initialX = blockX;
    this.initialY = blockY;
  }
  
  String getBlockType() {
    return blockType;
  }
  
  color getBlockColor() {
    return blockColor;
  }
  
  int[][] getGrid() {
    return blockGrid;
  }
  
  int getBlockX() {
    return blockX;
  }
  
  int getBlockY() {
    return blockY;
  }
  
  private boolean canMoveLeft() {
    for (int i = 0; i < blockGrid.length; i++) {
      for (int j = 0; j < blockGrid[i].length; j++) {
        if (blockGrid[i][j] == 1 && (blockX + j - 1 < 0)) {
          return false;
        }
      }
    }
    return true;
  }

  private boolean canMoveRight() {
    for (int i = 0; i < blockGrid.length; i++) {
      for (int j = 0; j < blockGrid[i].length; j++) {
        if (blockGrid[i][j] == 1 && (blockX + j + 1 >= 10)) {
          return false;
        }
      }
    }
    return true;
  }
  
  private boolean canMoveDown() {
    for (int i = 0; i < blockGrid.length; i++) {
      for (int j = 0; j < blockGrid[i].length; j++) {
        if (blockGrid[i][j] == 1 && (blockY + i + 1 >= 20)) {
          return false;
        }
      }
    }
    return true;
  }
  
  void moveLeft() {
    if(canMoveLeft()) {
    blockX--;
    }
  }
  
  void moveRight() {
    if(canMoveRight()) {
    blockX++;
    }
  }
  
  boolean isPlaced() {
    return isPlaced;
  }
  
  void randomizeType() {
    int rng = (int) (Math.random() * 7);
    
    String[] typeArr = {"IBlock", "JBlock", "LBlock", "OBlock", "SBlock", "TBlock", "ZBlock"};
    color[] colors = {#B7FFFA, #779ECB, #FFA500, #FDFD96, #90EE90, #FFD1DC, #FF6961};
    
    int[][][] grid = {
        {{1, 1, 1, 1}},
        {{1, 0, 0}, {1, 1, 1}},
        {{0, 0, 1}, {1, 1, 1}},
        {{1, 1}, {1, 1}},
        {{0, 1, 1}, {1, 1, 0}},
        {{0, 1, 0}, {1, 1, 1}},
        {{1, 1, 0}, {0, 1, 1}}
    };
    
    blockType = typeArr[rng];
    blockGrid = grid[rng];
    blockColor = colors[rng];
  }
  
  
  
  void rotate() {
    int n = blockGrid.length;
    int m = blockGrid[0].length;
    int[][] newGrid = new int[m][n];

    // rotate grid 90 degrees (clockwise)
    for(int i = 0; i < n; i++) {
      for(int j = 0; j < m; j++) {
        newGrid[j][n - 1 - i] = blockGrid[i][j];
      }
    }

    // adjust position to prevent shifting
    int offsetX = (n - m) / 2;
    int offsetY = (m - n) / 2;
    int newBlockX = blockX + offsetX;
    int newBlockY = blockY + offsetY;

    // check for out of bounds after rotation
    if(newBlockX < 0) {
        newBlockX = 0;
    }
    if(newBlockX + newGrid[0].length > 10) {
        newBlockX = 10 - newGrid[0].length;
    }
    if(newBlockY < 0) {
        newBlockY = 0;
    }
    if(newBlockY + newGrid.length > 20) {
        newBlockY = 20 - newGrid.length;
    }

    // set new grid and position if valid
    if(isValidPosition(newGrid, newBlockX, newBlockY)) {
        blockGrid = newGrid;
        blockX = newBlockX;
        blockY = newBlockY;
    }
  }

  public void resetToInitialState() {
    this.blockGrid = makeCopy(initialGrid);
    this.blockX = initialX;
    this.blockY = initialY;
  }

  private int[][] makeCopy(int[][] original) {
    if (original == null) {
      return null;
    }
    int[][] copy = new int[original.length][];
    for (int i = 0; i < original.length; i++) {
      copy[i] = Arrays.copyOf(original[i], original[i].length);
    }
    return copy;
  }      
  
  private boolean isValidPosition(int[][] grid, int x, int y) {
    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid[i].length; j++) {
        if (grid[i][j] == 1) {
          int newX = x + j;
          int newY = y + i;
          if (newX < 0 || newX >= 10 || newY < 0 || newY >= 20) {
            return false;
          }
        }
      }
    }
    return true;
  }
}
