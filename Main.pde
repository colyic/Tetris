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
  rect(leftX, 300, boxWidth, bottomY, boxRadius);
  
  fill(255);
  
  text("SCORE", leftX + boxWidth / 2, bottomY + 50);
  text("LEVEL", leftX + boxWidth / 2, bottomY + 300 / 2);
  text("LINES", leftX + boxWidth / 2, bottomY + 300 - 50);
  
  // gameboard box
  fill(200);
  int gameboardLength = 600;
  int gameboardWidth = 400;
  
  rect(width / 2 - gameboardWidth / 2, height / 2 - gameboardLength / 2, gameboardWidth, gameboardLength, boxRadius);
  
  // next box
  rect(width - 175, topY, boxWidth, 300, boxRadius);
  text("NEXT", width - 175 + boxWidth / 2, topY - 5);
  
  // start button
  fill(15, 19, 10);
  rect(250, 125, 300, 125, boxRadius);
  fill(200);
  text("START", 400, 200);
}

boolean isMouseOver(int x, int y, int w, int h){
  if(mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h){
    return true;
  }
  else{
    return false;
  }
}


void draw() {

}
