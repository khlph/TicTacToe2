//Size Row and Column
int rows = 4;
int columns = 4;

int turn = 1; // 1 = circle 2 = cross

//Mean that what's been tick
int[][] tictactoe = new int[rows][columns]; 

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
    Table(rows,columns);
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
  if (countturn == (rows*columns) && winners == 0 && !stop){ 
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
    
  for( int row = 1; row <= rows ; row++){ 
    
    if (((mouseX >= ((row-1)*width)/rows) && (mouseX <= (row*width)/rows))){
    
      for( int column = 1; column <= columns; column++){
      
        if (((mouseY >= ((column-1)*height)/columns) && (mouseY <= (column*height)/columns))){
          
          //Check if its has been add or not
          if( tictactoe[row-1][column-1] != 0) return;
          
          tictactoe[row-1][column-1] = turn; 
          
          checkgame();
          
          Drawthat((row*2-1)*width/(rows*2),(column*2-1)*height/(columns*2));
          
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
    for( int i = 0 ; i < rows ; i++){
      for( int j = 0 ; j < columns ; j++){
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