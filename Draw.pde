String x;

void Endgamepanel(){
  
  if(winners == 1){
    x = "Winner is Circle";
    background(#FA0000);
  }
  else if (winners == 2){
    x = "Winner is Cross";
    background(#0075FA);
  }
  else {
    x = "It's Draw";
    background(127);
  }
  fill(255);
  textSize(30);
  text(x, width / 2 , height/3);
  
  newGamebutton();
}