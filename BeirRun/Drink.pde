class Drink extends Pickup{  
  
  
  //create drink
  Drink(int x, int y, ArrayList<int[]> hitbox, String level){
    super(x, y, hitbox);
    this.sprites = new PImage[2];
    this.sprites[0] = loadImage("../images/drinks/"+level+"/Beer.png");
    this.sprites[1] = loadImage("../images/drinks/"+level+"/Shot.png");
    this.sprite_index = (int)random(2);
  }
  
  //drink the drink
  void use(Player p){
    p.drink();
    sprite_index = (int)random(2);
  }
  
  // display drink ball
  void display(){
    imageMode(CENTER);
    image(sprites[sprite_index], x, y);
    imageMode(CORNER);
  }
}
