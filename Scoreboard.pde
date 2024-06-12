public class ScoreBoard{
  int score;
  int level;
  int linesCleared;
  
  public ScoreBoard(){
    score = 0;
    level = 1;
    linesCleared = 0;
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
  
  void updateScore(int addedScore){
    score += addedScore;
  }
  
  void updateLevel(){
    level = score / 1000 + 1;
  }
  
  void updateLinesCleared(int addedLinesCleared){
    linesCleared += addedLinesCleared;  
  }
}
  
  
