void option() {
  theme1.pause();
  theme3.play();
  background(bg1);
  button1("lv.1", 400, 350, 160, 160);
  button1("lv.2", 600, 350, 160, 160);
}

void  optionClicks() {
  if (mouseX > 320 && mouseX < 480 && mouseY > 270 && mouseY < 430) {
    difficulty = 1;
    mode = GAME;
  }
  if (mouseX >  520 && mouseX <  680 && mouseY > 270 && mouseY < 430) {
    difficulty = 2;
    mode = GAME;
  }
}
