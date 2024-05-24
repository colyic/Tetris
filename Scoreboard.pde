public class ScoreBoard{
  int score;
  int highScore;
  int linesCleared;
  
  public ScoreBoard(int x, int y){
    rect(x, y, 150, 300, 5);
    text("SCORE:", x, y);
    fill(0);
  }
  
  int getScore(){
    return score;
  }
  
  int getHighScore(){
    return highScore;
  }
  
  int getLinesCleared(){
    return linesCleared;
  }
}
  
  
