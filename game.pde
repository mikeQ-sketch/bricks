void game() {
  theme3.pause();
  theme.play();
  background(bg);
  strokeWeight(5);
  stroke(255);
  fill(0);

  //paddle=================
  circle(px, py, pd);
  if (akey == true) px = px - 8;
  if (dkey == true) px = px + 8;

  if (px >= width-pr) px = width-pr;
  if (px <= pr) px = pr;

  //ball====================
  circle(bx, by, bd);

  timer--;
  if (timer < 0 ) {
    bx = bx + vx;
    by = by + vy;
  }

  if (dist(bx, by, px, py) < br + pr) {
    vx = (bx - px) / 15;
    if (difficulty == 1) vy = (by - py) / 15;
    if (difficulty == 2) vy = (by - py) / 5;
  }

  //bouncing off wall
  if (bx < br || bx > width - br)  vx = vx * -1;

  if (by < br) vy = vy * -1;

  if (by > height - br) {  
    lives = lives - 1; 
    bx = width/2;
    by = height/2 + 80;
    vx = 0;
    if (difficulty == 1) vy = 5;
    if (difficulty == 2) vy = 15;
    timer = 50;
  }


  //bricks ======================
  int i = 0;

  if (difficulty == 1) n = 27;

  if (difficulty == 2)  n = 36;
 
  while (i < n) { 
    if (alive[i] == true) {
      brick(i);
    }
    i++;
  }

  //score + lives
  fill(255);
  textSize(50);
  text("Score: " + score, width/4, height - 80);
  text("Lives: " + lives, width/4*3, height - 80);
}


void brick(int i) {

  stroke(255);
  strokeWeight(1);
  int d = 50;
  while (d > 0) {
    if (d < 48) noStroke();

    fill(0, 0, map(d, 0, 50, 255, 0));
    if (y[i] == 50) fill(0, 0, map(d, 0, 50, 255, 0));
    if (y[i] == 150) fill(map(d, 0, 50, 255, 0), map(d, 0, 50, 255, 0), 0);
    if (y[i] == 250) fill(0, map(d, 0, 50, 255, 0), 0);
    if (y[i] == 350) fill(map(d, 0, 50, 255, 0), 0, map(d, 0, 50, 255, 0));

    circle(x[i], y[i], d); 
    d = d - 2;
  }

  if (dist(bx, by, x[i], y[i]) < bd/2 + brickd/2) {
    vx = (bx - x[i]) / 15;
    vy = (by - y[i]) / 15;
    alive[i] = false;
    score = score + 100;
    
    breaking.rewind();
    breaking.play();
    
  }

  if (lives == 0 || difficulty == 1 && score == 100 || difficulty == 2 && score == 200) {
    mode = GAMEOVER;
  }


  
}


void gameClicks() {
   mode = PAUSE;

}
