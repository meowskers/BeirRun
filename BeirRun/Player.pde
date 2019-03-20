class Player{
  float x;
  float y;
  int max_x;
  int max_y;
  // set the size of the character
  int size = 50;
  // list of the restricted areas of the map, this includes the tables 
  ArrayList<int[]> hitbox;
  
  Player(int x, int y, int max_x, int max_y){
    this.x = x;
    this.y = y;
    this.max_x = max_x;
    this.max_y = max_y;
    hitbox = new ArrayList<int[]>();
  }
  
  // movement the player
  void move(int dir, int speed){
    float xVel = 0;
    float yVel = 0;
    // based on the direction of the player, change the x and y velocities accordingly
    // also check if the character is at the bounds
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
    if(x + xVel <= size / 4 || x +xVel >= max_x - size / 4){
      xVel = 0;
    }
     if(y + yVel <= size / 4 || y + yVel >= max_y - size / 4){
      yVel = 0;
    }
    for(int[] coords: hitbox){
      if(x + xVel >= coords[0] - size / 4 && x + xVel <= coords[2] + size / 4 && y + yVel >= coords[1] - size / 4 && y + yVel <= coords[3] + size / 4){
        xVel = 0;
        yVel = 0;
      }
    }
    x += xVel * speed;
    y += yVel * speed;
  } 
  
  void display(){
    fill(0);
    ellipse(x, y, 30, 30); 
  }
  
  // add a pair of coordinates for the hitboxes within the map 
  void addHitboxCoords(int x1, int y1, int x2, int y2){
    int[] coords = new int[4];
    coords[0] = x1;
    coords[1] = y1;
    coords[2] = x2;
    coords[3] = y2;
    hitbox.add(coords);
  }
  
}
