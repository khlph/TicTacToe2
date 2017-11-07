//Size Row and Column
int rows;
int columns;

int turn = 1; // 1 = circle 2 = cross

//Mean that what's been tick
int[][] tictactoe = new int[rows][columns];


//How many time you have clicked
int countturn = 0;

//No one has win
int winners = 0;

//to store value from clickedgamemode
int selectedGame = 0;

//part of draw turn
int drawturn = 0;

//Check the start
boolean start = true;

boolean stop = false;

int gameMode;

boolean ChoseGameMode = true;

boolean drawtable = true;

void setup(){
  
  size(500,500);
  
}

void draw(){
  
  //Chose Game first page
  if(ChoseGameMode && !stop){
    chosegame();
  }
  
  //Draw Table
  if(gameMode != 0 && drawtable){
    Table(rows,columns);
    drawtable = false;
    stop = false;
  }
  
  if(winners != 0 || (countturn == rows*columns && countturn != 0 )){
    println("how");
    Endgamepanel();
    stop = true;
    winners = 0;
  }
    
  
}

void mousePressed(){
  
  if(!ChoseGameMode & !stop ){
  for( int row = 1; row <= rows ; row++){ 
    
    if (((mouseX >= ((row-1)*width)/rows) && (mouseX <= (row*width)/rows))){
    
      for( int column = 1; column <= columns; column++){
      
        if (((mouseY >= ((column-1)*height)/columns) && (mouseY <= (column*height)/columns))){
          
          //Check if its has been add or not
          if( tictactoe[row-1][column-1] != 0) return;
          
          tictactoe[row-1][column-1] = turn; 
          checkgame(selectedGame);
          Drawthat((row*2-1)*width/(rows*2),(column*2-1)*height/(columns*2));
          
          countturn++;
            }
        }
      }   
   }
   
  }
   /* Chose Game Mode*/
   
   if (ChoseGameMode == true && clickedgamemode() != 0){
     gameMode = clickedgamemode();
     if(gameMode == 1){
       rows = 3;
       columns = 3;
     }
     else if(gameMode == 2){
       rows = 4;
       columns = 4;
     }
     ChoseGameMode = false;
     tictactoe = new int[rows][columns];
     selectedGame = clickedgamemode();
   }
   //Clicked New Game
   if (clickednewgamebutton() && stop){
     ChoseGameMode = true;
     gameMode = 0;
     drawtable = true;
     stop = false;
     countturn = 0;
     for( int i = 0 ; i < rows ; i++){
      for( int j = 0 ; j < columns ; j++){
        tictactoe[i][j] = 0;
   }}
   } 
  
}

// X mean 3*3 or 4*4
void checkgame(int X){
  
  int k = 0; //Constant
  
  //3*3
  //Check vertical and horizontal 
  if( X == 1){
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
  }} //end check 3*3
  
  //4*4
  if(X == 2){
  for( int i = 0 ; i < 4 ; i++){
    
    //Check entire row when pressed
    if( tictactoe[k][i] == turn && tictactoe[k+1][i] == turn && tictactoe[k+2][i] == turn && tictactoe[k+3][i] == turn){
      //println(turn,"win");
      winners = turn;
    }
    
    //Check entire column when pressed
    else if( tictactoe[i][k] == turn && tictactoe[i][k+1] == turn && tictactoe[i][k+2] == turn && tictactoe[i][k+3] == turn){
      //println(turn,"win");
      winners = turn; 
    }
  }
  //Check diagonals
  if( tictactoe[k][k] == 1 && tictactoe[k+1][k+1] == 1 && tictactoe[k+2][k+2] == 1 && tictactoe[k+3][k+3] == 1 ){
    winners = 1;
  }
  if( tictactoe[k][k] == 2 && tictactoe[k+1][k+1] == 2 && tictactoe[k+2][k+2] == 2 && tictactoe[k+3][k+3] == 2){
    winners = 2;
  }
  if( tictactoe[k][k+2] == 1 && tictactoe[k+1][k+1] == 1 && tictactoe[k+2][k] == 1 && tictactoe[k+3][k] == 1 ){
    winners = 1;
  }
  if( tictactoe[k][k+2] == 2 && tictactoe[k+1][k+1] == 2 && tictactoe[k+2][k] == 2 && tictactoe[k+3][k] == 2){
    winners = 2;
  }
  }
}

boolean clickednewgamebutton(){
  if ((mouseX <= ((width/2)+100) && mouseX >= (width-200)/2) && ((mouseY >= ((height*2)/3))) && (mouseY <= ((height*2)/3)+100)){
    return true;
  }
    
  else{ return false; }
}

//mouse position in gameMode
int clickedgamemode(){
  if((mouseX <= ((width/2)+100) && mouseX >= (width-200)/2)){
    if ((mouseY >= ((height/3) )) && (mouseY <= ((height/3) + 100))){
      return 1;}
    if ((mouseY >= ((height*2/3) )) && (mouseY <= ((height*2/3) + 100))){
      return 2;}
  }
  return 0;
}

void Drawthat(float X, float Y){
  
  // 1 equal to circle
  // 2 equal to coss
  
  if (turn == 1){
    
    circle( X,  Y);
    if(selectedGame == 2 && drawturn != 1){
      drawturn++;
      return;
    }
    turn = 2;
    drawturn = 0;
    }
    
  else if (turn == 2){
    
    cross( X, Y);
    if(selectedGame == 2 && drawturn != 1){
      drawturn++;
      return;
    }
    turn = 1;
    drawturn = 0;
  }}
  
void Table(int X, int Y){
  /* Setup a XxY tale*/
  //Vertical line
  background(127);
  strokeWeight(5);
  fill(0);
  
  pushMatrix();
  
  for( int i = 0 ; i < X ; i++){
    
    translate(width/X, 0);
    line( 0, 0, 0, height);
  }
  
  popMatrix();
  //End Verical line
  
  //Horizontal line
  pushMatrix();
  
  for( int i = 0 ; i < Y ; i++){
    
    translate( 0, height/Y);
    line( 0, 0, width, 0);
  }
 
  popMatrix();
  //End Horizontal line
  /* End Setup X*Y table*/
}

void chosegame(){
  
  pushMatrix();
  background(127);
  translate( width/2, 0);
  textAlign(CENTER);
  textSize(30);
  fill(0);
  text("Chose game mode", 0, height/6);
  textSize(20);
  fill(255);
  rect( -100, height /3, 200, 75, 7);
  fill(0);
  text("3x3", 0, height/3 + (75/2)+5);
  fill(255);
  rect( -100, height*2 /3, 200, 75, 7);
  fill(0);
  text("4x4", 0, height*2/3 + (75/2)+5);
  popMatrix();

}

void cross(float X, float Y){
  
  int x = ((width-150)/rows)/2;
  
  pushMatrix();
  translate( X, Y);
  
  strokeWeight(20);
  stroke(255);
  noFill();
  line( -x, -x, x, x);
  line( -x, x, x, -x);
  
  popMatrix();
 }
 
void circle(float X, float Y){
  
  pushMatrix();
  translate( X, Y); // Reference in middle of the box
  
  strokeWeight(20);
  stroke(255);
  noFill();
  ellipse( 0, 0, (width/rows) -50 , (height/columns)-50);
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