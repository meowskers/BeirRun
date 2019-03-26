class Player{
  float x;
  float y;
  int max_x;
  int max_y;
  // set the size of the character
  int size = 50;
  // list of the restricted areas of the map, this includes the tables 
  ArrayList<int[]> hitbox;
  // get the image for the character
  PImage character;
  
  // constructor for the player 
  Player(int x, int y, int max_x, int max_y, String name){
    this.x = x;
    this.y = y;
    this.max_x = max_x;
    this.max_y = max_y;
    hitbox = new ArrayList<int[]>();
    character = loadImage("../images/characters/" + name + ".png");
  }
  
  // movement the player
  void move(int dir, int speed){
    float x_vel = 0;
    float y_vel = 0;
    // based on the direction of the player, change the x and y velocities accordingly
    // also check if the character is at the bounds
    if(dir == 0){
       y_vel = -1;
    }else if(dir == 1){
      x_vel = (1 / sqrt(2));
      y_vel = -1 * (1 / sqrt(2));

    }else if(dir == 2){
      x_vel = 1;

    }else if(dir == 3){
      x_vel = (1 / sqrt(2));
      y_vel = (1 / sqrt(2));

    }else if(dir == 4){
      y_vel = 1;

    }else if(dir == 5){
      x_vel = -1 * (1 / sqrt(2));
      y_vel = (1 / sqrt(2));

    }else if(dir == 6){
      x_vel = -1;
    }else if(dir == 7){
      x_vel = -1 * (1 / sqrt(2));
      y_vel = -1 * (1 / sqrt(2));
    }
    x += x_vel * speed;
    y += y_vel * speed;
        // stop the player when they approach walls or hitboxes
    if(x <= size / 4){
      x = size / 4;
    }
    if(x >= max_x - size){
      x = max_x - size;
    }
    if(y <= size){
      y = size;
    }
    if(y >= max_y - size){
      y = max_y - size;
    }
    for(int[] coords: hitbox){
      if(x + x_vel >= coords[0] - size / 4 && x + x_vel <= coords[2] + size / 4 && y + y_vel >= coords[1] - size / 4 && y + y_vel <= coords[3] + size / 4){
        x = x - x_vel * speed;
        y = y - y_vel * speed;
      }

    }
  } 
  
  // drawing the player 
  void display(){
    image(character, x, y, 55, 55);
    
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
