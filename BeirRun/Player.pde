class Player{
  float x;
  float y;
  int max_x;
  int max_y;
  
  public Player(int x, int y){
    this.x = x;
    this.y = y;
  }
  
  void move(int dir, int speed){
    float xVel = 0;
    float yVel = 0;
    if(dir == 0){
       yVel = -1;
    }else if(dir == 1){
      xVel = (1 / sqrt(2));
      yVel = -1 * (1 / sqrt(2));
    }else if(dir == 2){
      xVel = 1;
    }else if(dir == 3){
      xVel = (1 / sqrt(2));
      yVel = (1 / sqrt(2));
    }else if(dir == 4){
      yVel = 1;
    }else if(dir == 5){
      xVel = -1 * (1 / sqrt(2));
      yVel = (1 / sqrt(2));
    }else if(dir == 6){
      xVel = -1;
    }else if(dir == 7){
      xVel = -1 * (1 / sqrt(2));
      yVel = -1 * (1 / sqrt(2));
    }
    
    x += xVel * speed;
    y += yVel * speed;
  } 
  
  void display(){
    fill(0);
    ellipse(x, y, 30, 30); 
  }
  
}
