class Player{
  float x;
  float y;
  int max_x;
  int max_y;
  // set the size of the character
  int size = 50;
  
  public Player(int x, int y, int max_x, int max_y){
    this.x = x;
    this.y = y;
    this.max_x = max_x;
    this.max_y = max_y;
  }
  
  void move(int dir, int speed){
    float xVel = 0;
    float yVel = 0;
    // based on the direction of the player, change the x and y velocities accordingly
    // also check if the character is at the bounds
    if(dir == 0){
       yVel = -1;
       if(y <= size / 2){
         yVel = 0; 
       }
    }else if(dir == 1){
      xVel = (1 / sqrt(2));
      yVel = -1 * (1 / sqrt(2));
      if(y <= size / 2){
        yVel = 0; 
      }if(x >= max_x - size / 2){
        xVel = 0; 
      }
    }else if(dir == 2){
      xVel = 1;
      if(x >= max_x - size / 2){
        xVel = 0; 
      }
    }else if(dir == 3){
      xVel = (1 / sqrt(2));
      yVel = (1 / sqrt(2));
      if(y >= max_y - size / 2){
        yVel = 0; 
      }if(x >= max_x - size / 2){
        xVel = 0; 
      }
    }else if(dir == 4){
      yVel = 1;
      if(y >= max_y - size / 2){
        yVel = 0; 
      }
    }else if(dir == 5){
      xVel = -1 * (1 / sqrt(2));
      yVel = (1 / sqrt(2));
      if(y >= max_y - size / 2){
        yVel = 0; 
      }if(x <= size / 2){
        xVel = 0; 
      }
    }else if(dir == 6){
      xVel = -1;
      if(x <= size / 2){
        xVel = 0; 
      }
    }else if(dir == 7){
      xVel = -1 * (1 / sqrt(2));
      yVel = -1 * (1 / sqrt(2));
      if(y <= size / 2){
        yVel = 0; 
      }if(x <= size / 2){
        xVel = 0; 
      }
    }
    x += xVel * speed;
    y += yVel * speed;
  } 
  
  void display(){
    fill(0);
    ellipse(x, y, 30, 30); 
  }
  
}
