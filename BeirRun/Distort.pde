class Distort{
  int width; 
  int height;
  int pixel_size;
  int row;
  int col;
  int board[][];
 
  // create a distortion. Use the width and height of the map in order make a 2d array.
  // the 2d array will overlay different areas of gray or black to the board in order
  // to make it harder to see.
  Distort(int width, int height, int pixel_size){
    this.width = width;
    this.height = height;
    this.pixel_size = pixel_size;
    row = height / pixel_size;
    col = width / pixel_size;
    board = new int[row][col];
  }
  
  // the function to make and change the distortions 
  // the distortion level will dictate how transparent the distortion is and other things 
  void randomize(){
    for(int i = 0; i < row; i++){
      for(int j = 0; j < col; j++){
        board[i][j] = (int)random(0,2);
      }
    }
  }
  
  void pixelate(){
    for(int i = 0; i < row; i++){
      for(int j = 0; j < col; j++){
        if(board[i][j] == 0){
          fill(0, 0, 0, 70);
          rect(j*pixel_size, i*pixel_size, pixel_size, pixel_size);
        }
      }
    }
  }
}
