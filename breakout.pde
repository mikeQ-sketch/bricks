import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;




//brick variables=====
int[] x;
int[] y;
int brickd;
int n;
int tempx, tempy;

boolean[] alive;
int difficulty = 1;

//mode=========
int mode;
final int INTRO = 1;
final int GAME = 2;
final int  PAUSE = 3;
final int GAMEOVER = 4;
final int OPTION = 5;

//paddle + ball
float px, py, pd, pr;
float bx, by, bd, br;
float vx, vy;
boolean akey, dkey;

//skittles!
color orange, yellow, green, purple, red;

//gif
PImage[] gif;
int frames;
int f;

//background
PImage bg, bg1;

//score  lives  timer
int score = 0;
int lives = 3;
int timer = 50;

//font
PFont font; 

//
Minim minim;
AudioPlayer theme, theme1, theme3, breaking, bump, win, lost;


void setup() {


  size(1000, 700, FX2D);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  mode = INTRO;


  //brick ============

  brickd = 50;

  n= 36;
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

  //color variable
  orange = #e64808;
  yellow = #f1be02;
  green = #048207;
  purple = #5D2B7D;
  red = #c0043f;


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
  if (difficulty == 1) vy = 5;
  if (difficulty == 2) vy = 15;

  akey = false;
  dkey = false;

  //images ========================
  bg = loadImage("bg.jpg");
  bg1 = loadImage("bg1.jpg");

  frames = 49;
  gif = new PImage[frames];

  int p = 0;
  while (p < frames) {
    gif[p] = loadImage("frame_"+p+"_delay-0.04s.gif");
    p++;
  }
  f = 0;

  //
  font = createFont("font.ttf", 60);

  minim = new Minim(this);
  breaking = minim.loadFile("break.wav");
  theme = minim.loadFile("theme.wav");
  theme1 = minim.loadFile("theme1.wav");
  win = minim.loadFile("win.wav");
  lost = minim.loadFile("failure.wav");
  theme3 = minim.loadFile("theme3.mp3");
}


void draw() {
  if (mode == INTRO) {
    intro();
  } else  if (mode == GAME) {
    game();
  } else  if (mode == PAUSE) {
    pause();
  } else  if (mode == GAMEOVER) {
    gameover();
  } else if (mode == OPTION) {
    option();
  } else {
    println("Mode error: " + mode);
  }
}
