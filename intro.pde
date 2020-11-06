void intro() {
  
  
  win.pause();
  lost.pause();
  
  theme1.play();
  
  image(gif[f], 0, 0, width, height);
  if (frameCount % 3 == 0) f++;
  //%3 == if the remainder of frameCount/3 is 0, then ...
  if (f == frames) f = 0;

  title();
  button("S t a r t", width/4, height/4*3, 200, 100);
  button("O p t i o n s", width/4*3, height/4*3, 300, 100);
}


void introClicks() {
  if (mouseX > width/4-100 && mouseX < width/4+100 && mouseY > height/4*3-50 && mouseY < height/4*3+50) {

    mode = GAME;
  }
  if (mouseX >  (width/4*3 )- 150 && mouseX <  width/4*3+150 && mouseY > height/4*3-50 && mouseY < height/4*3+50) {

    mode = OPTION;
  }
}

void title() {
  textSize(200);
  fill(255);
  text("BRICKS", width/2+4, height/4+4);
  fill(#CACE00);
  text("BRICKS", width/2, height/4);
}
