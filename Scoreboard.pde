public class ScoreBoard{
  int highscore;
  int score;
  int level;
  int linesCleared = 0;
  
  public ScoreBoard(){
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
  
  
