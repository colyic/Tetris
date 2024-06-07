public class Block {
  String blockType;
  color blockColor;
  int[][] blockGrid;
  int blockX;
  int blockY;
  
  public Block(){
    this.randomizeType();
    blockColor = color(150, 150, 150);
  }
  
  String getBlockType() {
    return blockType;
  }
  
  int getBlockX(){
    return blockY;
  }
  
  int getBlockY(){
    return blockY;
  }
  
  color getBlockColor() {
    return blockColor;
  }
  
  int[][] getGrid() {
    return blockGrid;
  }
  
  void randomizeType() {
    int rng = (int) (Math.random() * 7);
    
    String[] typeArr = {"IBlock", "JBlock", "LBlock", "OBlock", "SBlock", "TBlock", "ZBlock"};
    int[][][] grid = {
      {{1, 1, 1, 1}, {0, 0, 0, 0}},
      {{1, 0, 0, 0}, {1, 1, 1, 0}},
      {{0, 0, 0, 1}, {0, 1, 1, 1}},
      {{0, 1, 1, 0}, {0, 1, 1, 0}},
      {{0, 0, 1, 1}, {0, 1, 1, 0}},
      {{0, 1, 0, 0}, {1, 1, 1, 0}},
      {{1, 1, 0, 0}, {0, 1, 1, 0}}
    };
    
    blockType = typeArr[rng];
    blockGrid = grid[rng];
  }
  
  int[][] rotateBlock(int[][] oldBlockGrid) {
    int rows = oldBlockGrid.length;
    int cols = oldBlockGrid[0].length;
    int[][] newBlockGrid = new int[cols][rows];
    for(int i = 0; i < rows; i++) {
      for(int j = 0; j < cols; j++) {
        newBlockGrid[j][rows - 1 - i] = oldBlockGrid[i][j];
    }
  }
  return newBlockGrid;
  }
  
  int addBLock(){
  }
}
