// declaration for files to be loaded for html embedding 
/* @pjs preload="../images/levels/O'Murphy's.png"; */
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
// This checks whether or not specific keys are being pressed. keys[0] = 'w', keys[1] = 'd', keys[2] = 's', keys[3] = 'a'
boolean[] keys = {false, false, false, false};
// Instantiate times for use of timing the spawn of the next batch of drinks 
int time_diff = 5000;
int curr_time = 0;

// Boolean used to see if the location of the pointer should be printed out for the purpose of finding the coordinates of the hitbox
boolean hitbox_checker = true;
// CSVReader to take in the coordinates of the hitboxes 
Table table;
int x1,y1,x2,y2;

void setup()
{
  level = "O'Murphy's";
  size(1000,800);
  smooth();
  noStroke();
  background(255);
  player = new Player(start_x,start_y, width, height);
  speed = 5;
  bg = loadImage("../images/levels/" + level + ".png");
  table = loadTable("../hitboxes/" + level + ".csv", "header");
  for(TableRow row: table.rows()){
    x1 = row.getInt("x1"); 
    y1 = row.getInt("y1"); 
    x2 = row.getInt("x2"); 
    y2 = row.getInt("y2"); 
    player.addHitboxCoords(x1,y1,x2,y2);
  }
}

void draw()
{
  background(bg);

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
  player.move(direction, speed);
  player.display();
}

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

void mouseClicked(){
  if(hitbox_checker){
    print(mouseX + ", " + mouseY + "\n");
  }
}
