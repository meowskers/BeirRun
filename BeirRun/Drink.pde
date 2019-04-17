class Drink{
  int x;
  int y;
  
  int size = 10;
  ArrayList<int[]> hitbox;
  
  //implemented where the drink x/y values are the center of the drink and the players x/y values are the players top left corner
  
  //create drink
  Drink(int x, int y, ArrayList<int[]> hitbox){
    this.x = (int)random(40,x);
    this.y = (int)random(40,y);
    this.hitbox = hitbox;
    int count = 0;
    //attempt to prevent drink from spawning in a hitbox - helps a little but not all the time
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
  
  //respawn drink if player touches it
  void serve(int x, int y, Player p){
    //implemented where the drink x/y values are the center of the drink and the players x/y values are the players top left corner
    if(this.x-this.size <= p.x+p.size && this.x+this.size >= p.x && this.y-this.size <= p.y+p.size && this.y+this.size >= p.y){
      this.x = (int)random(40,x);
      this.y = (int)random(40,y);
      p.drink();
      int count = 0;
      //attempt to prevent drink from spawning in a hitbox - helps a little but not all the time
      while(count < (hitbox.size())){
      count = 0;
        for(int[] coords: hitbox){
          if(this.x+this.size >= coords[0] && this.x-this.size <= coords[2] && this.y+this.size >= coords[1] && this.y-this.size <= coords[3]){
            this.x = (int)random(40,x);
            this.y = (int)random(40,y);
          } else {
            count++;
          }
        } 
      }
    }
  }
  
  // display drink ball
  void display(){
    fill(256, 200, 000);
    ellipse(this.x,this.y,20,20);
  }
  
  public Drink(){
    
  }
}
