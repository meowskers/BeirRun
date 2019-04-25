// declaration for files to be loaded for html embedding 
// these are for the map images
/* @pjs preload="../images/levels/OMurphys/*.png"; */
/* @pjs preload="../images/levels/BeirMeadow/*.png"; */
// these are for the hitboxes for the level 
/* @pjs preload="../hitboxes/OMurphys.csv"; */
/* @pjs preload="../hitboxes/BeirMeadow.csv"; */
// these are for the character sprites 
/* @pjs preload="../images/characters/Cameron/*.png"; */
/* @pjs preload="../images/characters/Ed/*.png"; */
/* @pjs preload="../images/characters/Issac/*.png"; */
/* @pjs preload="../images/characters/Max/*.png"; */
// these are for the drink and powerup sprites */
/* @pjs preload="../images/drinks/OMurphys/*.png"; */
/* @pjs preload="../images/drinks/BeirMeadow/*.png"; */

// used to see if the game should be at the main menu or not 
boolean main;
PImage logo;
// used to pause the game on and off
boolean pause;

// set the image for the level 
PImage bg;
String level;
// set the character's name, which will choose the sprite used
String name;

// Set the dimensions of the game screen. Also used to tell the player class where the walls of the game are.
int width = 1000;
int height = 800;

// Following variables are used to initialize and control the player. 
Player player;
int start_x = 500;
int start_y = 500;
int direction;
int speed;

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

//max time/game timer variables
int start_time = 120;
int time_left = start_time;

// Boolean used to see if the location of the pointer should be printed out for the purpose of finding the coordinates of the hitbox
boolean hitbox_checker = false;

// CSVReader to take in the coordinates of the hitboxes 
//Table table;
String[] lines;
String line;
int[] coords;


void setup()
{
  // set the game setting booleans 
  main = false;
  pause = false;
  
  // setup for the main menu of the game 
  logo = loadImage("Assets/logo.png");
  
  
  // set the level of the map 
  level = "OMurphys";
  size(1000,800);
  smooth();
  noStroke();
  background(255);
  bg = loadImage("../images/levels/" + level + "/1.png");
  lines = loadStrings("../hitboxes/" + level + ".csv");
  
  // create the player and set the speed of the player 
  name = "Ed";
  player = new Player(start_x,start_y, width, height, name);
  speed = 5;
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
  if(main){
    background(255, 235, 0);
    image(logo, 118, 0, 750, 420);
  }else if(pause){
    textSize(80);
    fill(0,0,0);
    text("Time's Up!\n Score: "+player.distort,375,375);
  }else{
    
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
      next_distort += 100;
    }
    //distort.pixelate();
  
    //food.move(player);
    //food.display();
    
    fill(999,999,999);
    textSize(20);
    time_left= start_time - millis()/1000;
    text("Time Left: "+time_left,15,17);
    text("Score: "+player.distort,900,17);
    if(time_left <= 0){
      pause = true;
    }
  }
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
