class Player extends Rectangle {
  
  
  Player(float x, float y, float w) {
    super(x, y, w, w);
  }
  
  void show()  {
    fill(255);
    rect(x, y, w, w);
    
  }
  
  void move(float xdir, float ydir)  {
    
    x += xdir * grid/2;
    y += ydir * grid;
  }
  
}
