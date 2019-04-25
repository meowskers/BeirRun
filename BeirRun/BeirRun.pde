
// used to see if the game should be at the main menu or not 
PImage logo;
PFont font;

// keeps track of the current state of the game
// 0 = main menu
// 1 = play game 
// 2 = settings menu 
// 3 = pause menu 
int state;

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

// Boolean used to see if the location of the pointer should be printed out for the purpose of finding the coordinates of the hitbox
boolean hitbox_checker = true;

// CSVReader to take in the coordinates of the hitboxes 
//Table table;
String[] lines;
String line;
int[] coords;


void setup()
{
  // set the game state
  state = 0;
  // setup for the main menu of the game 
  logo = loadImage("Assets/logo.png");
  font = createFont("fantasy", 32);
  textFont(font);
  textAlign(CENTER, CENTER);
  
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
  if(state == 0){
    // main menu
    background(255, 170, 0);
    image(logo, 118, 0, 750, 420);
    text("PLAY", width/2, height/2);
    text("SETTINGS", width/2, width/2);
    
  }else if(state == 1){
    // playing the game 
    bg = loadImage("../images/levels/" + level + "/1.png");
    lines = loadStrings("../hitboxes/" + level + ".csv");
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
  }else if(state == 2){
    // in the settings menu  
    background(255, 170, 0);
    image(logo, 118, 0, 750, 420);
    fill(255);
    text("Pick Your Level:", width/2, height/2);
    if(level == "OMurphys"){
      fill(173, 216, 230);
    }
    text("O'Murphy's", width/3, height/2 + 40);
    fill(255);
    if(level == "BeirMeadow"){
      fill(173, 216, 230);
    }
    text("BeirMeadow", 2*width/3, height/2 + 40);
    fill(255);
    text("Back", width/2, 3*height/4);
  }else if(state == 3){
    // in the paused menu  
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

// function for when the mouse is clicked. handles finding hitboxes and changing game states (game, menu, pause)
void mouseClicked(){
  // this is to find mouseX and mouseY for debugging and finding hitboxes 
  if(hitbox_checker){
    print(mouseX + ", " + mouseY + "\n");
  }
  // this is for the changing of gamestates
  // check the coordinates of the mouse and depending on the current game state, has options of different coords to change the game state 
  if(state == 0){
    // main menu
    if(mouseX >= 454 && mouseX <= 543 && mouseY >= 387 && mouseY <= 424){
      state = 1; 
    }else if(mouseX >= 429 && mouseX <= 575 && mouseY >= 485 && mouseY <= 526){
      state = 2; 
    }
  }else if(state == 1){
    // play game  
  }else if(state == 2){
    // settings  
    if(mouseX >= 244 && mouseX <= 418 && mouseY >= 431 && mouseY <= 459){
      level = "OMurphys";
    }else if(mouseX >= 572 && mouseX <= 760 && mouseY >= 431 && mouseY <= 459){
      level = "BeirMeadow";
    }else if(mouseX >= 454 && mouseX <= 542 && mouseY >= 588 && mouseY <= 623){
      state = 0; 
    }
  }else if(state == 3){
    // pause menu  
  }
  
}
