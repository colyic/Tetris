void setup() {
  size(800, 800);
  background(255);
  noStroke();
  
  int leftX = 25;
  int topY = 125;
  int bottomY = 300;
  
  int boxWidth = 150;
  int boxRadius = 5;

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
  
  // gameboard box
  fill(200);
  int gameboardLength = 600;
  int gameboardWidth = 400;
  
  rect(width / 2 - gameboardWidth / 2, height / 2 - gameboardLength / 2, gameboardWidth, gameboardLength, boxRadius);
  
  // next box
  rect(width - 175, topY, boxWidth, 300, boxRadius);
  text("NEXT", width - 175 + boxWidth / 2, topY - 5);
  
  startScreen();
}

void draw() {

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
  
  if (isMouseOver(startX, startY, startWidth, startLength) && mousePressed) {
    gameboard();
  }
}

void gameboard() {
}
