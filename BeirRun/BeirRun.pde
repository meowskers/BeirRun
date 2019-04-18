// declaration for files to be loaded for html embedding 
/* @pjs preload="../images/levels/O'Murphy's.png"; */
/* @pjs preload="../images/characters/Ed/*.png"; */
/* @pjs preload="../hitboxes/O'Murphy's.csv"; */
PImage bg;
String level;

// Set the dimensions of the game screen. Also used to tell the player class where the walls of the game are.
int width = 1000;
int height = 800;
// Following variables are used to initialize and control the player. 
Player player;
int start_x = 500;
int start_y = 500;
int direction;
int speed;
// name for the character to pick the char image 
String name;
// Variable(s) for drinks
Drink drink;
// Hold the distortion object
Distort distort;
// keep track of the time of the game 
int next_distort;

//Powerup food;

// This checks whether or not specific keys are being pressed. keys[0] = 'w', keys[1] = 'd', keys[2] = 's', keys[3] = 'a'
boolean[] keys = {false, false, false, false};
// Instantiate times for use of timing the spawn of the next batch of drinks 
int time_diff = 5000;
int curr_time = 0;

// Boolean used to see if the location of the pointer should be printed out for the purpose of finding the coordinates of the hitbox
boolean hitbox_checker = false;
// CSVReader to take in the coordinates of the hitboxes 
//Table table;
String[] lines;
String line;
int[] coords;


void setup()
{
  // set the level of the map 
  level = "O'Murphy's";
  size(1000,800);
  smooth();
  noStroke();
  background(255);
  bg = loadImage("../images/levels/" + level + ".png");
  // create the player and set the speed of the player 
  name = "Ed";
  player = new Player(start_x,start_y, width, height, name);
  speed = 5;
  lines = loadStrings("../hitboxes/" + level + ".csv");
  for(int i = 1; i < lines.length; i++){
    coords = int(split(lines[i], ",")); 
    player.addHitboxCoords(coords);
  }
  // create drinks
  drink = new Drink(width, height, player.hitbox, level);

  // create the Distort class;
  distort = new Distort(width, height, 20);
  next_distort = 1000;

  //food = new Powerup(width, height, player.hitbox);

}

void draw()
{
  // set the image as the background of the game
  background(bg);
  // [ick the direction that the player is moving based on the keys pressed 
  if(keys[0] && keys[1]){
    direction = 1; 
  }else if(keys[1] && keys[2]){
    direction = 3; 
  }else if(keys[2] && keys[3]){
    direction = 5; 
  }else if(keys[3] && keys[0]){
    direction = 7; 
  }else if(keys[0]){
    direction = 0; 
  }else if(keys[1]){
    direction = 2; 
  }else if(keys[2]){
    direction = 4; 
  }else if(keys[3]){
    direction = 6; 
  }else{
    direction = -1; 
  }
  
  // move the player 
  player.move(direction, speed);
  // redraw the player 
  player.display(direction);
  //drink check+move
  drink.move(player);
  drink.display();

  if(millis() > next_distort){
    distort.randomize();
    next_distort += 1000;
  }
  distort.pixelate();

  //food.move(player);
  //food.display();

}

// set the booleans of the key presses to true when pressed 
void keyPressed(){
  if(key == 'w'){  
    keys[0] = true;
  }else if(key == 'd'){
    keys[1] = true;   
  }else if(key == 's'){
    keys[2] = true; 
  }else if(key == 'a'){
    keys[3] = true; 
  } 
}

// set the booleans of the key presses to false when released 
void keyReleased(){
  if(key == 'w'){  
    keys[0] = false;
  }else if(key == 'd'){
    keys[1] = false;   
  }else if(key == 's'){
    keys[2] = false; 
  }else if(key == 'a'){
    keys[3] = false; 
  } 
}

// when the mouse is clicked, print out the coordinates. this is for setting up hitboxes. 
void mouseClicked(){
  if(hitbox_checker){
    print(mouseX + ", " + mouseY + "\n");
  }
}
