void tactile(int x, int y, int w, int h) {
  if (mouseX > x-w/2 && mouseX <x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
    fill(red);
  } else {
    fill(255);
  }
}


void button(String text, int x, int y, int w, int h) {
  noFill();
  noStroke();
  rect(x, y, w, h, 20);
  tactile(x, y, w, h);
  textSize(60);
  textFont(font);
  text(text, x, y-20);
}

void tactile1(int x, int y, int w, int h) {
  if (mouseX > x-w/2 && mouseX <x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
    strokeWeight(5);
    stroke(0, 255, 255);
  } else {
    strokeWeight(5);
    stroke(orange);
  }
}


void button1(String text, int x, int y, int w, int h) {

  fill(#E3CBB3);
  tactile1(x, y, w, h);
  rect(x, y, w, h, 20);
  fill(purple);
  textSize(60);
  textFont(font);
  text(text, x, y);
}


void reset() {
  brickd = 50;
  difficulty = 1;

  //if (difficulty == 1) n = 27;
  n = 36;
  x = new int[n];
  y = new int [n];
  alive = new boolean[n];

  tempx = 100;
  tempy = 50;

  int i = 0;
  while (i < n) {
    x[i] = tempx;
    y[i] = tempy;
    alive[i] = true;
    tempx = tempx + 100;
    if (tempx == width) {
      tempx = 100;
      tempy = tempy + 100;
    }

    i++;
  }


  lives = 3;
  score = 0;

  //paddle + ball ==================
  px = width/2;
  py = height;
  pd = 100;
  pr = pd/2;

  bx = width/2;
  by = height/2 + 80;
  bd = 30;
  br = bd/2;

  vx = 0;
  //if (difficulty == 1) vy = 5;
  //if (difficulty == 2) vy = 15;

  akey = false;
  dkey = false;
  
  theme1.rewind();
  theme.rewind();
  theme3.rewind();
  
  win.rewind();
  lost.rewind();
}
