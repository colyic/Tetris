public class ScoreBoard{
  int highscore;
  int score;
  int level;
  int linesCleared = 0;
  
  public ScoreBoard(){
    rect(25, 250, 150, 350, 5);
  
    fill(255);
  
    text("HIGHSCORE", 100, 300);
    text("SCORE", 100, 300 + 75);
    text("LEVEL", 100, 300 + 150);
    text("LINES", 100, 300 + 225);
  }
  
  int getHighScore(){
    return highscore;
  }
  
  int getScore(){
    return score;
  }
  
  int getLevel(){
    return level;
  }
  
  int getLinesCleared(){
    return linesCleared;
  }
  
  void updateHighScore(int newHighscore){
    highscore = newHighscore;
  }
  
  void updateScore(int addedScore){
    score += addedScore;
  }
  
  void updateLevel(){
    level++;
  }
  
  void updateLinesCleared(int addedLinesCleared){
    linesCleared += addedLinesCleared;
  }
}
  
  
