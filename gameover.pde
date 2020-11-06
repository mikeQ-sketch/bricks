void gameover() {
  theme.pause();
  theme1.play();
  image(gif[f], 0, 0, width, height);
  if (frameCount % 3 == 0) f++;
  if (f == frames) f = 0;

  if (difficulty == 1 && score == 100 || difficulty == 2 && score == 200) {

    textSize(200);
    fill(255);
    text("You won", width/2+4, height/4+4);
    fill(#CACE00);
    text("You won", width/2, height/4);
    
    win.play();
  }

  if (difficulty == 1 && score < 100 || difficulty == 2 && score < 200) {
    textSize(200);
    fill(255);
    text("You lost", (width/2)+4, (height/4)+4);
    fill(#CACE00);
    text("You lost", width/2, height/4);
    
    lost.play();
  }

  button("restart", width/4, height/4*3, 200, 100);
  button("quit", width/4*3, height/4*3, 100, 100);

}

void gameoverClicks() { 

  if (mouseX > width/4-100 && mouseX < width/4+100 && mouseY > height/4*3-50 && mouseY < height/4*3+50) {
    reset();
    mode = INTRO;
  }
  if (mouseX > width/4*3-50 && mouseX < width/4*3+50 && mouseY > height/4*3-50 && mouseY < height/4*3+50) {
    exit();}
    
  }

  
