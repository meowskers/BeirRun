class Drink extends Pickup{  
  //create drink
  Drink(int x, int y, ArrayList<int[]> hitbox){
    super(x, y, hitbox);
  }
  
  //drink the drink
  void use(Player p){
    p.drink();
  }
  
  // display drink ball
  void display(){
    fill(256, 200, 000);
    ellipse(this.x,this.y,20,20);
  }
}
