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
  ArrayList<Block> queue;
  Block holdBlock;
  boolean holdUsed;
  
  boolean isGameOver;
  boolean isPaused;
  
  long lastDropTime;  // Time tracking for block dropping
  int dropInterval = 1000;;  // 1 second interval
  
  ScoreBoard scoreboard;
    
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
    
    queue = new ArrayList<Block>();
    
    Block blockA = new Block();
    Block blockB = new Block();
    Block blockC = new Block();
    
    queue.add(blockA);
    queue.add(blockB);
    queue.add(blockC);
    
    holdBlock = null;
    holdUsed = false;
    
    isGameOver = false;
    isPaused = false;
    
    lastDropTime = millis();  // Initialize the timer
    
    scoreboard = new ScoreBoard();
  }
    
  int getLength() {
    return gameboardLength;
  }
    
  int getWidth() {
    return gameboardWidth;
  }
  
  void changeDropInterval() {
    dropInterval = 1050 - 50 * scoreboard.getLevel();
  }
    
  void fillBlock(int x, int y) {
    rect(gridX + x * gridSide, gridY + y * gridSide, gridSide, gridSide, 2);
  }
  
  void drawCurrentBlock() {
    for (int i = 0; i < currentBlock.getGrid().length; i++) {
      for (int j = 0; j < currentBlock.getGrid()[i].length; j++) {
        if (currentBlock.getGrid()[i][j] == 1) {
          fill(currentBlock.getBlockColor());
          fillBlock(currentBlock.getBlockX() + j, currentBlock.getBlockY() + i);
        }
      }
    }
  }
  
  void queueNext() {
    currentBlock = queue.remove(0);
    if (!canPlaceBlock(currentBlock)) {
      isGameOver = true;
      return;
    }
    Block newQueue = new Block();
    queue.add(newQueue);
  }
  
  void drawNextBlocks() {
    //reset next box
    fill(200);
    rect(625, 125, 150, 300, 5);
     
    int nextBlockX = 650; // starting corner
    int nextBlockY = 150; 
    int spacing = 100; // spacing between blocks
    int blockSize = gridSide; // adjust block size
    
    for (int i = 0; i < queue.size(); i++) {
      Block nextBlock = queue.get(i);
      int[][] nextBlockGrid = nextBlock.getGrid();
 
      for (int row = 0; row < nextBlockGrid.length; row++) {
        for (int col = 0; col < nextBlockGrid[row].length; col++) {
          if (nextBlockGrid[row][col] == 1) {
            fill(nextBlock.getBlockColor());
            rect(nextBlockX + col * blockSize, nextBlockY + row * blockSize, blockSize, blockSize);
          } 
        }
      }
      nextBlockY += spacing; // Adjust vertical position for next block
    }
  }
  
  void swapHold() {
    if(!holdUsed) {
      if (holdBlock == null) {
        holdBlock = currentBlock;
        holdBlock.resetToInitialState();
        queueNext();
        drawCurrentBlock();
      } else {
        Block temp = currentBlock;
        currentBlock = holdBlock;
        currentBlock.resetToInitialState();
        holdBlock = temp;
        holdBlock.resetToInitialState();
        drawCurrentBlock();
      }
      holdUsed = true;
    }
  }
  
  void drawHoldBlock() {
    if(holdBlock != null) {
      //reset hold box
      fill(200);
      rect(25, 125, 150, 100, 5);
    
      int holdBlockX = 50; // starting corner
      int holdBlockY = 150;
      int blockSize = gridSide; // adjust block size
    
      int[][] holdBlockGrid = holdBlock.getGrid();
    
      for (int row = 0; row < holdBlockGrid.length; row++) {
        for (int col = 0; col < holdBlockGrid[row].length; col++) {
          if (holdBlockGrid[row][col] == 1) {
            fill(holdBlock.getBlockColor());
            rect(holdBlockX + col * blockSize, holdBlockY + row * blockSize, blockSize, blockSize);
          } 
        }
      }
    }
  }
  
  void lockBlock() {
    int[][] blockGrid = currentBlock.getGrid();
    int blockX = currentBlock.getBlockX();
    int blockY = currentBlock.getBlockY();
        
    for(int i = 0; i < blockGrid.length; i++) {
      for (int j = 0; j < blockGrid[i].length; j++) {
        if (blockGrid[i][j] == 1) {
          map[blockY + i][blockX + j] = 2; // Assuming 1 represents a filled cell
        }
      }
    }
    holdUsed = false;
    scoreboard.updateScore(20 * scoreboard.getLevel());
    scoreboard.updateLevel();
  }
    
  void drawGrid() {
    stroke(255);
    fill(65);
        
    for (int i = 0; i < map.length; i++) {
      for (int j = 0; j < map[i].length; j++) {
        if (map[i][j] == 0) {
          rect(gridX, gridY, gridSide, gridSide, 2);
        }
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
  
  //void updateGrid() {
  //  // reset map
  //  for (int i = 0; i < map.length; i++) {
  //    for (int j = 0; j < map[i].length; j++) {
  //      if(map[i][j] != 2){
  //        map[i][j] = 0;
  //      }
  //    }
  //  }
    
  //  // Update the map with the current block's position
  //  int[][] grid = currentBlock.getGrid();
  //  int x = currentBlock.getBlockX();
  //  int y = currentBlock.getBlockY();
    
  //  for (int i = 0; i < grid.length; i++) {
  //    for (int j = 0; j < grid[0].length; j++) {
  //      if (grid[i][j] == 1) {
  //        map[y + i][x + j] = 1;
  //      }
  //    }
  //  }
  //}
  
  void updateGame() {
    if(isPaused || isGameOver){
      return;
    }
    
    long currentTime = millis();
    
    if (currentTime - lastDropTime >= dropInterval) {
      if (!currentBlock.isPlaced()) {
        softDrop();
        } else {
          lockBlock();
          clearLines();
          queueNext();
        }
      lastDropTime = currentTime;
    }
    drawGrid();
    drawCurrentBlock();
    //updateGrid();
    drawNextBlocks();
    drawHoldBlock();
    displayScores();
    changeDropInterval();
    System.out.println(Arrays.toString(map));
  }
  
  boolean checkBelow() {
    for (int i = currentBlock.getBlockX(); i < currentBlock.getBlockX() + currentBlock.getGrid()[0].length; i++) {
      if (currentBlock.getBlockY() < map.length - currentBlock.getGrid().length) {
        if (map[currentBlock.getBlockY() + currentBlock.getGrid().length][i] != 0) {
          return false;
        }
      }
    }
    return true;
  }
  
  void softDrop() {
    if(currentBlock.canMoveDown() && checkBelow()) {
      currentBlock.blockY++;
    } else {
      currentBlock.isPlaced = true;
    }
  }
  
  void hardDrop(){
    while(currentBlock.canMoveDown() && checkBelow()) {
      currentBlock.blockY++;
    }
    currentBlock.isPlaced = true;
    scoreboard.updateScore(2 * scoreboard.getLevel() * currentBlock.blockY);
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
        scoreboard.updateLinesCleared(1);
        scoreboard.updateScore(100 * scoreboard.getLevel());
      }
    }
  }
  
  void isGameOver(){
    if (currentBlock.isPlaced()) {
      for (int i = 0; i < map[0].length; i++) {
        if (map[0][i] == 1) {
          isGameOver = true;
        }
      }
    }
  }
  
  boolean canPlaceBlock(Block block) {
    int[][] blockGrid = block.getGrid();
    int blockX = block.getBlockX();
    int blockY = block.getBlockY();
    for (int i = 0; i < blockGrid.length; i++) {
      for (int j = 0; j < blockGrid[i].length; j++) {
        if (blockGrid[i][j] == 1) {
          int gridX = blockX + j;
          int gridY = blockY + i;
          if (gridY < 0 || gridX < 0 || gridX >= map[0].length || gridY >= map.length || map[gridY][gridX] != 0) {
            return false;
          }
        }
      }
    }
    return true;
  }
  
  void displayScores(){
    //reset box
    fill(200);
    rect(25, 300, 150, 350, 5);
    fill(255);
    textSize(30);
    text("SCORE", 100, 350);
    text("LEVEL", 100, 450);
    text("LINES", 100, 550);
    
    
    fill(255);
    text(scoreboard.getScore(), 100,  400);
    text(scoreboard.getLevel(), 100, 500);
    text(scoreboard.getLinesCleared(), 100, 600);
  }
}
