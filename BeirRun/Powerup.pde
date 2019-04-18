class Powerup extends Pickup {
  Powerup(int x, int y, ArrayList<int[]> hitbox){
    super(x,y,hitbox);
  }
  void use(Player p){
    p.distort -= 1;
    if (p.distort < 0) p.distort = 0;
  }
  
  void display() {
    fill(256, 000, 200);
    ellipse(this.x,this.y,20,20);
  }
}
