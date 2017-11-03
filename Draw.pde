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

void cross(float X, float Y){
  
  int x = (width/rows)/2 - 100;
  
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