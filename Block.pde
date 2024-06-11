public class Block {
  String blockType;
  color blockColor;
  boolean isPlaced;
  
  int blockX;
  int blockY;
  
  int[][] blockGrid;
  
  public Block() {
    this.randomizeType();
    
    isPlaced = false;
    
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
  
  void dropOne() {
    blockY++;
  }
  
  boolean isPlaced() {
    return isPlaced;
  }
  
  void setIsPlaced(boolean placed) {
    isPlaced = placed;
  }
  
  void randomizeType() {
    int rng = (int) (Math.random() * 7);
    
    String[] typeArr = {"IBlock", "JBlock", "LBlock", "OBlock", "SBlock", "TBlock", "ZBlock"};
    color[] colors = {#00FFFF, #00008B, #FFA500, #FFFF00, #90EE90, #FF00FF, #FFFF00};
    
    int[][][] grid = {
      {{0, 0, 0, 0}, {1, 1, 1, 1}},
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
}
