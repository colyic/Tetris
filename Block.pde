public class Block {
  String blockType;
  color blockColor;
  
  int blockX;
  int blockY;
  
  int[][] blockGrid;
  
  public Block() {
    this.randomizeType();
    
    blockColor = color(150, 150, 150);
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
  }
}
