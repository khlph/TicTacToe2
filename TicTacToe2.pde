int turn = 1; // 1 = circle 2 = cross

//Mean that what's been tick
int[][] tictactoe = new int[3][3]; 

//No one has win
int winners = 0;

//How many time you have clicked
int countturn = 0;

//Always start fresh
int newGame = 1;

//let you play when it's run
boolean stop = false;



void setup(){
  
  size(500,500);
  
}

void draw(){
  
  if(newGame == 1){
    Table();
    newGame = 0;
  }
  
  textSize( 50);
  textAlign(CENTER);
  
  //Winner
  if (winners != 0 && !stop){
    
    stroke(51);
    background(51);
    fill(255);
    if(winners == 1){
      text("Winner is Circle", width/2, height/2);
      newGamebutton();
      }

    else{
      text("Winner is Cross", width/2, height/2);
      newGamebutton();
      println(tictactoe[2][2],tictactoe[1][1],tictactoe[0][2]);
      }
    stop = true;
  }
  
  //Draw
  if (countturn == 9 && winners == 0 && !stop){ 
    stroke(51);
    background(51);
    fill(255);
    textAlign(CENTER);
    text("It's Draw", width/2, height/2);
    newGamebutton();
    stop = true;
    println("here");
  }
}

/* Code that calculate the position of the click and manipulate them
into middle of the box (return in float)*/

// X,Y based on pointer mouse click

void mousePressed() {
  
  //Check position mouseX and mouseY
  //2 loop for the row and column
  
  
  if(winners == 0 && !stop){ // if winners detected don't loop
    
  for( int column = 1; column <= 3 ; column++){ 
    
    if (((mouseX >= ((column-1)*width)/3) && (mouseX <= (column*width)/3))){
    
      for( int row = 1; row <= 3; row++){
      
        if (((mouseY >= ((row-1)*width)/3) && (mouseY <= (row*width)/3))){
          
          //Check if its has been add or not
          if( tictactoe[column-1][row-1] != 0) return;
          
          tictactoe[column-1][row-1] = turn; 
          
          checkgame();
          
          Drawthat((column*2-1)*width/6,(row*2-1)*height/6);
          
          countturn++;
            }
        }
      }   
   }
  }
  if (clickedbutton() && stop) {
    
    //set these value to an initial
    newGame = 1;
    winners = 0;
    turn = 1;// circle first
    stop = false;
    countturn = 0;
    
    //clear tictactoe value to draw next one
    for( int i = 0 ; i < 3 ; i++){
      for( int j = 0 ; j < 3 ; j++){
        tictactoe[i][j] = 0;}
    }  
  }
}

void checkgame(){
  
  int k = 0; //Constant
  
  //Check vertical and horizontal 
  for( int i = 0 ; i < 3 ; i++){
    
    //Check entire row when pressed
    if( tictactoe[k][i] == turn && tictactoe[k+1][i] == turn && tictactoe[k+2][i] == turn){
      //println(turn,"win");
      winners = turn;
    }
    
    //Check entire column when pressed
    if( tictactoe[i][k] == turn && tictactoe[i][k+1] == turn && tictactoe[i][k+2] == turn){
      //println(turn,"win");
      winners = turn; 
    }
  }
  //Check diagonals
  if( tictactoe[k][k] == 1 && tictactoe[k+1][k+1] == 1 && tictactoe[k+2][k+2] == 1 ){
    winners = 1;
  }
  if( tictactoe[k][k] == 2 && tictactoe[k+1][k+1] == 2 && tictactoe[k+2][k+2] == 2 ){
    winners = 2;
  }
  if( tictactoe[k][k+2] == 1 && tictactoe[k+1][k+1] == 1 && tictactoe[k+2][k] == 1 ){
    winners = 1;
  }
  if( tictactoe[k][k+2] == 2 && tictactoe[k+1][k+1] == 2 && tictactoe[k+2][k] == 2 ){
    winners = 2;
  }
}

void Drawthat(float X, float Y){
  
  // 1 equal to circle
  // 2 equal to coss
  
  if (turn == 1){
    
    circle( X,  Y);
    turn = 2;
    }
    
  else{
    
    cross( X, Y);
    turn = 1;
  }}

void cross(float X, float Y){
  
  int x = 50;
  
  pushMatrix();
  translate( X, Y);
  
  strokeWeight(25);
  stroke(255);
  noFill();
  line( -x, -x, x, x);
  line( -x, x, x, -x);
  
  popMatrix();
 }
 
void circle(float X, float Y){
  
  pushMatrix();
  translate( X, Y); // Reference in middle of the box
  
  strokeWeight(25);
  stroke(255);
  noFill();
  ellipse( 0, 0, 100, 100);
  
  popMatrix();
}

void newGamebutton(){
  //Draw button for New Game
  pushMatrix();
  translate(width/2, (height*2)/3);
  fill(100);
  rect( -100, 0, 200, 100, 20);
  textSize(22);
  fill(255);
  text("New Game", 0, 55);
  popMatrix();

}

boolean clickedbutton(){
  if ((mouseX <= ((width/2)+100) && mouseX >= (width-200)/2) && ((mouseY >= ((height*2)/3)-50)) && (mouseY <= ((height*2)/3)+100)){
    return true;
  }
    
  else{ return false; }
}

void Table(){
  /* Setup a 3x3 tale*/
  //Vertical line
  background(127);
  pushMatrix();
  strokeWeight(5);
  fill(0);
  translate(width/3, 0);
  line( 0, 0, 0, height);
  translate(width/3, 0);
  line( 0, 0, 0, height);
  popMatrix();
  //End Verical line
  
  //Horizontal line
  pushMatrix();
  translate( 0, height/3);
  line( 0, 0, width, 0);
  translate(  0, height/3);
  line( 0, 0, width, 0);
  popMatrix();
  //End Horizontal line
  /* End Setup 3x3 table*/
}