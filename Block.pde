public class Block {
  String blockType;
  color blockColor;
  
  public Block() {
    this.randomizeType();
  }
  
  String getBlockType() {
    return blockType;
  }
  
  color getBlockColor() {
    return blockColor;
  }
  
  void randomizeType() {
    int rng = (int) (Math.random() * 7);
    String[] typeArr = {"IBlock", "JBlock", "LBlock", "OBlock", "SBlock", "TBlock", "ZBlock"};
    
    blockType = typeArr[rng];
  }
}
