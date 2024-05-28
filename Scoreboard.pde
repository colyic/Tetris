public class ScoreBoard{
  int score = 0;
  int highscore = 0;
  int linesCleared = 0;
  
  public ScoreBoard(int x, int y){
    rect(x, y, 150, 300, 5);
    text("SCORE:", x, y);
    fill(0);
  }
  
  int getScore(){
    return score;
  }
  
  int getHighScore(){
    return highscore;
  }
  
  int getLinesCleared(){
    return linesCleared;
  }
  
  void updateScore(int newScore){
    score = newScore;
  }
  
  void updateHighScore(int newHighscore){
    highscore = newHighscore;
  }
}
  
  
