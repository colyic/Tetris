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
  
  int leftX = 25;
  int topY = 125;
  int bottomY = 300;
  
  int boxWidth = 150;
  
  gameboard = new Gameboard();

  fill(200);
  textAlign(CENTER);
  textSize(30);
  
  // hold box
  rect(leftX, topY, boxWidth, 100, boxRadius);
  text("HOLD", leftX + boxWidth / 2, topY - 5);
  
  // score + level + lines box
  rect(leftX, bottomY, boxWidth, 350, boxRadius);
  
  fill(255);
  
  text("SCORE", leftX + boxWidth / 2, bottomY + 50);
  text("LEVEL", leftX + boxWidth / 2, bottomY + 150);
  text("LINES", leftX + boxWidth / 2, bottomY + 250);
    
  // next box
  fill(200);
  rect(width - 175, topY, boxWidth, 300, boxRadius);
  text("NEXT", width - 175 + boxWidth / 2, topY - 5);
  
  startScreen();
}

void draw() {
  int startX = width / 2 - startWidth / 2;
  int startY = height / 2 - startLength / 2 - 50;

  if (!isStarted && isMouseOver(startX, startY, startWidth, startLength) && mousePressed) {
    isStarted = true;
    gameboard.drawGrid();
  }
  
  if (isStarted) {
    gameboard.updateGame();
  }
}

boolean isMouseOver(int x, int y, int w, int h) {
  if (mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h) {
    return true;
  }
  return false;
}

void startScreen() {
  fill(#90EE90);
 
  int startWidth = 250;
  int startLength = 80;
  int startX = width / 2 - startWidth / 2;
  int startY = height / 2 - startLength / 2 - 50;
  
  rect(startX, startY, startWidth, startLength, 2);
  
  fill(255);
  textAlign(CENTER);
  textSize(45);
  
  text("START", startX + startWidth / 2, startY + 55);
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
      gameboard.currentBlock.softDrop();
    } else if (keyCode == ' ')  {
      gameboard.currentBlock.hardDrop();
    }
    gameboard.updateGrid();
  }
}
