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
  PImage[] character_images = new PImage[8];
  // this counts how distorted the game should be for the player 
  int distort = 0;
  
  // constructor for the player 
  Player(int x, int y, int max_x, int max_y, String name){
    this.x = x;
    this.y = y;
    this.max_x = max_x;
    this.max_y = max_y;
    hitbox = new ArrayList<int[]>();
    for(int i = 0; i < 8; i++){
      int image_num = i + 1;
      character_images[i] = loadImage("../images/characters/" + name + "/" + image_num + ".png");
    }
    
  }
  
  // movement the player
  void move(int direction, int speed){
    float x_vel = 0;
    float y_vel = 0;
    
    //random direction
    int r_direction = -1;
    float x_distort = 0;
    float y_distort = 0;
    
    
    if(direction != -1){
      r_direction = (int)random(-16,8);
    }
    // based on the directionection of the player, change the x and y velocities accordingly
    // also check if the character is at the bounds
    if(direction == 0){
       y_vel = -1;
    }else if(direction == 1){
      x_vel = (1 / sqrt(2));
      y_vel = -1 * (1 / sqrt(2));

    }else if(direction == 2){
      x_vel = 1;

    }else if(direction == 3){
      x_vel = (1 / sqrt(2));
      y_vel = (1 / sqrt(2));

    }else if(direction == 4){
      y_vel = 1;

    }else if(direction == 5){
      x_vel = -1 * (1 / sqrt(2));
      y_vel = (1 / sqrt(2));

    }else if(direction == 6){
      x_vel = -1;
    }else if(direction == 7){
      x_vel = -1 * (1 / sqrt(2));
      y_vel = -1 * (1 / sqrt(2));
    }
    
    //calculate level of movement/control distortion
    if(r_direction == 0){
       y_distort = -distort;
    }else if(r_direction == 1){
      x_distort = (distort / sqrt(2));
      y_distort = -1 * (distort / sqrt(2));

    }else if(r_direction == 2){
      x_distort = distort;

    }else if(r_direction == 3){
      x_distort = (distort / sqrt(2));
      y_distort = (distort / sqrt(2));

    }else if(r_direction == 4){
      y_distort = distort;

    }else if(r_direction == 5){
      x_distort = -1 * (distort / sqrt(2));
      y_distort = (distort / sqrt(2));

    }else if(r_direction == 6){
      x_distort = -distort;
    }else if(r_direction == 7){
      x_distort = -1 * (distort / sqrt(2));
      y_distort = -1 * (distort / sqrt(2));
    }
    
    x += x_vel * speed + x_distort;
    y += y_vel * speed + y_distort;
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
        x = x - x_vel * speed - x_distort;
        y = y - y_vel * speed - y_distort;
      }

    }
  } 
  
  // drawing the player 
  void display(int direction){
    if(direction == -1){
      image(character_images[0], x, y, 55, 55);
    }else{
      image(character_images[direction], x, y, 55, 55);
    }
  }
  
  // add a pair of coordinates for the hitboxes within the map 
  void addHitboxCoords(int[] coords){
    hitbox.add(coords);
  }
  
  // drink function, when the player is next to a drink the drink class will call this function 
  void drink(){
    distort++;
    print(distort + "\n");
  }
}
