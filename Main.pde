boolean isStarted;

int startWidth = 250;
int startLength = 80;

int boxRadius = 5;

Gameboard gameboard;

void setup() {
  size(800, 800);
  background(255);
  noStroke();
  
  isStarted = false;
  gameboard = new Gameboard();

  fill(200);
  textAlign(CENTER);
  textSize(30);
  holdBox();
  scoreBox();
  nextBox();
  startButton();
}

void draw() {
  if (!isStarted && isMouseOver(275, 310, 250, 80) && mousePressed) {
    isStarted = true;
    gameboard.drawGrid();
  }
  
  if (gameboard.isPaused){
    if (isMouseOver(275, 410, 250, 80) && mousePressed) {
      gameboard.isPaused = false;
      //gameboard.updateGrid();
    }
    
    if (isMouseOver(275, 310, 250, 80) && mousePressed) {
      gameboard.isPaused = false;
      gameboard = new Gameboard();
      //gameboard.updateGrid();
    }
  }
  
  if (isStarted) {
    if (!gameboard.isPaused) {
      gameboard.updateGame();
      if (gameboard.isGameOver) {
        gameOverScreen();
        if (isMouseOver(275, 310, 250, 80) && mousePressed) {
        gameboard.isPaused = false;
        gameboard = new Gameboard();
        //gameboard.updateGrid();
        }
      }
    } else {
      pauseScreen();
    }
  }
  
  
}

boolean isMouseOver(int x, int y, int w, int h) {
  if (mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h) {
    return true;
  }
  return false;
}

void startButton() {
  fill(#90EE90);
  rect(275, 310, 250, 80, 2);
  fill(255);
  textAlign(CENTER);
  textSize(45);
  fill(255);
  text("START", 400, 365);
}

void holdBox(){
  rect(25, 125, 150, 100, 5);
  text("HOLD", 100, 120);
}

void nextBox(){
  fill(200);
  rect(625, 125, 150, 300, 5);
  text("NEXT", 700, 120);
}

void scoreBox(){
  rect(25, 300, 150, 350, 5);
  fill(255);
  text("SCORE", 100, 350);
  text("LEVEL", 100, 450);
  text("LINES", 100, 550);
}

void restartButton() {
  fill(255);
  rect(275, 310, 250, 80, 2);
  fill(255);
  textAlign(CENTER);
  textSize(45);
  fill(0);
  text("RESTART", 400, 365);
}

void resumeButton(){
  fill(255);
  rect(275, 410, 250, 80, 2);
  fill(255);
  textAlign(CENTER);
  textSize(45);
  fill(0);
  text("RESUME", 400, 465);
}

void gameOverScreen(){
  fill(0);
  rect(200, 50, 400, 700, 5);
 
  restartButton();
  
  fill(255);
  text("GAME OVER", 400, 200);
}

void pauseScreen(){
  fill(200);
  rect(200, 50, 400, 700, 5);
  
  restartButton();
  resumeButton();
  
  fill(0);
  text("PAUSED", 400, 200);
}

void keyPressed() {
  if(isStarted){
    if (keyCode == UP) {
      gameboard.currentBlock.rotate();
    } else if (keyCode == LEFT) {
      gameboard.currentBlock.moveLeft();
    } else if (keyCode == RIGHT) {
      gameboard.currentBlock.moveRight();
    } else if (keyCode == DOWN) {
      gameboard.softDrop();
    } else if (keyCode == ' ')  {
      gameboard.hardDrop();
    } else if (keyCode == CONTROL){
      gameboard.swapHold();
    } else if (keyCode == TAB){
      gameboard.isPaused = true;
    }
    //gameboard.updateGrid();
  }
}
