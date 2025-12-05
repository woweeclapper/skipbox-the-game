class Car extends Rectangle {
  
  float speed;
  
  Car(float x, float y, float w, float h, float s) {
    super(x, y, w, h);
    speed = s;
  }
  
  
  void update(int currentScore)  {
    if (speed > 0)
      x = x + speed + (currentScore/5);
    else if (speed < 0)
      x = x + speed - (currentScore/5);
    else
      x = x + speed;
    
    if (speed > 0 && x > width+grid) {
      x = -w-grid;
    } else if (speed < 0 && x < -grid)  {
      x = width+grid;
    }
    
    
  }
  
  
  void show(int[] newColor)  {
    //float r = random(0,255);
    //float g = random(0,255);
    //float b = random(0,255);
    //fill(r,g,b);
    
    fill(newColor[0],newColor[1],newColor[2]);
    
    rect(x, y, w, h);
    
    
  }
  
}
