class Pickup{
  int x;
  int y;
  
  int max_x;
  int max_y;
  
  int size = 10;
  ArrayList<int[]> hitbox;
  
  PImage[] sprites;
  int sprite_index;
  
  //implemented where the pickup x/y values are the center of the drink and the players x/y values are the players top left corner
  
  //input x/y should be width/height of map
  Pickup(int x, int y, ArrayList<int[]> hitbox) {
    this.x = (int)random(40,x);
    this.y = (int)random(40,y);
    this.max_x = x;
    this.max_y = y;
    this.hitbox = hitbox;
    int count = 0;
    //prevent drink from spawning in a hitbox
    while(count < (hitbox.size())){
      count = 0;
      for(int[] coords: hitbox){
        if(this.x+size >= coords[0] && this.x-size <= coords[2] && this.y-size >= coords[1] && this.y+size <= coords[3]){
          this.x = (int)random(40,x);
          this.y = (int)random(40,y);
        } else {
          count++;
        }
      } 
    }
  }
  
  void use(Player p){
    p.x += 0;
  }
  
  void move(Player p) {
    if(this.x-this.size <= p.x+p.size && this.x+this.size >= p.x && this.y-this.size <= p.y+p.size && this.y+this.size >= p.y){
      use(p);
      this.x = (int)random(40,max_x);
      this.y = (int)random(40,max_y);
      int count = 0;
      //attempt to prevent drink from spawning in a hitbox - helps a little but not all the time
      while(count < (hitbox.size())){
      count = 0;
        for(int[] coords: hitbox){
          if(this.x+this.size >= coords[0] && this.x-this.size <= coords[2] && this.y+this.size >= coords[1] && this.y-this.size <= coords[3]){
            this.x = (int)random(40,max_x);
            this.y = (int)random(40,max_y);
          } else {
            count++;
          }
        } 
      }
    }
  }
}
