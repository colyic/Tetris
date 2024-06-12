boolean isStarted;

int startWidth = 250;
int startLength = 80;

int boxRadius = 5;

Gameboard gameboard;
Scoreboard scoreboard;
int highScore;

void setup() {
  size(800, 800);
  background(255);
  beginningScreen();
}

void beginningScreen(){
  textAlign(LEFT);
  noStroke();
  
  isStarted = false;
  gameboard = new Gameboard();
  scoreboard = new Scoreboard();
  textSize(80);
  fill(#FF6961);
  text("T", 265, 225);
  fill(#FFA500);
  text("E", 315, 225);
  fill(#FDFD96);
  text("T", 365, 225);
  fill(#90EE90);
  text("R", 415, 225);
  fill(#B7FFFA);
  text("I", 475, 225);
  fill(#C3B1E1);
  text("S", 503, 225);

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
    
    if (isMouseOver(275, 510, 250, 80) && mousePressed) {
      gameboard.isPaused = false;
      beginningScreen();
      //gameboard.updateGrid();
    }
  }
  
  if (isStarted) {
    if (!gameboard.isPaused) {
      gameboard.updateGame();
      if (gameboard.isGameOver) {
        if (gameboard.scoreboard.getScore() > highScore) {
          highScore = gameboard.scoreboard.getScore();
        }
        gameOverScreen();
        if (isMouseOver(275, 310, 250, 80) && mousePressed) {
          gameboard.isPaused = false;
          gameboard = new Gameboard();
          holdBox();
          //gameboard.updateGrid();
        }
        if (isMouseOver(275, 510, 250, 80) && mousePressed) {
          gameboard.isPaused = false;
          beginningScreen();
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
  textSize(30);
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

void quitButton(){
  fill(255);
  rect(275, 510, 250, 80, 2);
  fill(255);
  textAlign(CENTER);
  textSize(45);
  fill(0);
  text("QUIT", 400 , 565);
}

void gameOverScreen(){
  fill(0);
  rect(200, 50, 400, 700, 5);
 
  restartButton();
  quitButton();
  
  fill(255);
  text("GAME OVER", 400, 200);
  
  showHighScore();
}

void pauseScreen(){
  fill(200);
  rect(200, 50, 400, 700, 5);
  
  restartButton();
  resumeButton();
  quitButton();
  
  fill(0);
  text("PAUSED", 400, 200);
}

void showHighScore(){
  fill(255);
  rect(275, 410, 250, 80, 2);
  fill(255);
  textAlign(CENTER);
  textSize(20);
  fill(0);
  text("HIGH SCORE:", 400 , 440);
  text(highScore, 400, 470);
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
