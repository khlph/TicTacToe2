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