boolean isStarted = false;
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
  rect(leftX, 250, boxWidth, 350, boxRadius);
  
  fill(255);
  
  text("HIGHSCORE", leftX + boxWidth / 2, bottomY);
  text("SCORE", leftX + boxWidth / 2, bottomY + 75);
  text("LEVEL", leftX + boxWidth / 2, bottomY + 150);
  text("LINES", leftX + boxWidth / 2, bottomY + 225);
  
  
  // gameboard box
  fill(200);
  int gameboardLength = 600;
  int gameboardWidth = 400;
  
  rect(width / 2 - gameboardWidth / 2, height / 2 - gameboardLength / 2, gameboardWidth, gameboardLength, boxRadius);
  
  // next box
  rect(width - 175, topY, boxWidth, 300, boxRadius);
  text("NEXT", width - 175 + boxWidth / 2, topY - 5);
  
  // start button
  int startX = 300;
  int startY = 125;
  int startWidth = 250;
  int startHeight = 125;
  
  fill(15, 19, 10);
  rect(startWidth, startHeight, startX, startY, boxRadius);
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

void setupGameboard(){//temporary
  fill(50);
  for(int i = 200; i < 600; i-=40){
    for(int j = 100; j < 700; i-=40){
      rect(i, j, 38, 38, 5);
    }
  }
}

void startGame(){
  if((isMouseOver(300, 125, 250, 150)) && mousePressed){
    fill(200);
    rect(250, 125, 300, 125, 5);
    setupGameboard();
  }
}

void draw() {
  startGame();
}
