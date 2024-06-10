public class Block {
  String blockType;
  color blockColor;
  
  int blockX;
  int blockY;
  
  int[][] blockGrid;
  
  public Block() {
    this.randomizeType();
    
    blockX = 3;
    blockY = 0;
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
  
  void addBlockX() {
    blockX++;
  }
  
  void addBlockY() {
    blockY++;
  }
  
  void randomizeType() {
    int rng = (int) (Math.random() * 7);
    
    String[] typeArr = {"IBlock", "JBlock", "LBlock", "OBlock", "SBlock", "TBlock", "ZBlock"};
    color[] colors = {#00FFFF, #00008B, #FFA500, #FFFF00, #90EE90, #FF00FF, #FFFF00};
    
    int[][][] grid = {
      {{1, 1, 1, 1}, {0, 0, 0, 0}},
      {{1, 0, 0, 0}, {1, 1, 1, 0}},
      {{0, 0, 1, 0}, {1, 1, 1, 0}},
      {{0, 1, 1, 0}, {0, 1, 1, 0}},
      {{0, 1, 1, 0}, {1, 1, 0, 0}},
      {{0, 1, 0, 0}, {1, 1, 1, 0}},
      {{1, 1, 0, 0}, {0, 1, 1, 0}}
    };
    
    blockType = typeArr[rng];
    blockGrid = grid[rng];
    blockColor = colors[rng];
  }
  
  void rotate() {
    int rows = blockGrid.length;
    int cols = blockGrid[0].length;
    int[][] newGrid = new int[cols][rows];
    
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        newGrid[j][rows - 1 - i] = blockGrid[i][j];
      }
    }
    
    blockGrid = newGrid;
  }
}
