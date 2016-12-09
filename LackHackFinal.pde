class movingBlock {
  int x; 
  int y; 
  color c; 
  boolean isLeft; 
  int w; 
  int h; 
  boolean isTop; 
  boolean isBottom; 
  movingBlock(int x, int y, color c, int w, int h, boolean isLeft, boolean isTop, boolean isBottom) {
    this.x = x; 
    this.y = y; 
    this.c = c; 
    this.w = w; 
    this.h = h; 
    this.isTop = isTop; 
    this.isBottom = isBottom; 


    this.isLeft = isLeft;
  }
  void display() {

    fill(c); 
    rect(x, y, w, h);
  }
  void move() {
    if (isTop == false) {
      if (isLeft) {
        x+= 4;
      } else x-= 4;
    } else {
      if (isBottom) {
        y-= 4;
      } else y+= 4;
    }
  }
}

class Box {
  int x; 
  int y; 
  int w; 
  int h; 
  int c = 191; 
  Box(int x, int y, int w, int h) {
    this.x = x; 
    this.y = y; 
    this.h = h; 
    this.w = w;
  }
  void display() {

    if (alpha < 255) {  
      alpha += delta;
    }
    fill(191, 191, 191, alpha); 
    rect(x, y, w, h);
  }
}
int moveX; 
int moveY; 

int topMoveX; 
int topMoveY; 
boolean left2; 
int rectLen; 
color blockColor; 
boolean top1; 
boolean bot; 
int rectWid; 
ArrayList<movingBlock> movingBlocks = new ArrayList<movingBlock>(); 

int state = 0; 


//PFont font;
int alpha = 1; 
int delta = 1; 

int x = -150; 
int helpx = -50; 
Box play = new Box(0, 150, 400, 70); 
Box how = new Box(0, 250, 480, 70); 
Box about = new Box(0, 350, 560, 70); 

import processing.sound.*;
SoundFile file;
PFont font;
class Letter {
  int x; 
  int y; 
  PImage letter; 
  char letterchar; 
  Letter(int x, int y, char letter) {
    this.x = x; 
    this.y = y; 
    if (letter == 'a') {
      this.letter = A; 
      letterchar = letter;
    }
    if (letter == 's') {
      this.letter = S; 
      letterchar = letter;
    }
    if (letter == 'd') {
      this.letter = D; 
      letterchar = letter;
    }
    if (letter == 'w') {
      this.letter = W;
      letterchar = letter;
    }
  }
  void display() {
    //display the letter using img(letter, x, y);
    image(letter, x, y);
  }
  void move() {
    if (letterchar == 'a') {
      x += 1;
    } else if (letterchar == 's') {
      y -= 1;
    } else if (letterchar == 'w') {
      y += 1;
    } else if (letterchar == 'd') {
      x -= 1;
    }
  }
}

class Arrow {
  int x; 
  int y; 
  String arrowcode;
  PImage arrow; 
  Arrow(int x, int y, String str) {
    this.x = x; 
    this.y = y; 
    if (str == "up") {
      arrow = up; 
      arrowcode = "up";
    }
    if (str == "down") { 
      arrow = down; 
      arrowcode = "down";
    } 
    if (str == "left") {
      arrow = left; 
      arrowcode = "left";
    }
    if (str == "right") {
      arrow = right; 
      arrowcode = "right";
    }
  }
  void display() {
    //display the letter using img(letter, x, y);
    image(arrow, x, y);
  }
  void move() {
    if (arrowcode == "up") {
      y += 1;
      println("up");
    } else if (arrowcode == "down") {
      y -= 1;
      println("down");
    } else if (arrowcode == "left") {
      x += 1;
      println("left");
    } else if (arrowcode == "right") {
      x -= 1;
      println("right");
    }
  }
}

int spawn_x;
int spawn_y;
PImage up; 
PImage down; 
PImage left; 
PImage right; 

PImage W; 
PImage A; 
PImage S;
PImage D; 

int daw = 65; 
int dah = 87;

int raw = 87;
int rah = 66;

int law = 87;
int lah = 65;

int uaw = 65;
int uah = 87;

int lw = 81; 
int lh = 105; 

int aw = 81; 
int ah = 105;

int ww = 82;
int wh = 96;

int sw = 85;
int sh = 92;

int dw = 89;
int dh = 104;

int posx; 
int posy; 
char Char; 

int aposx; 
int aposy; 
String string; 

boolean up1; 
boolean down1; 
boolean left1; 
boolean right1; 
boolean w1; 
boolean a1; 
boolean s1; 
boolean d1; 

int score = 0;

void setup() {
  file = new SoundFile(this, "/Users/steveli/Desktop/LackHackFinal/song.mp3");

  font = createFont("Monoton.ttf", 48);
  textFont(font);
  up = loadImage("images/up.png"); 
  down = loadImage("images/down.png"); 
  left= loadImage("images/left.png");
  right = loadImage("images/right.png"); 

  W = loadImage("images/W.png"); 
  A = loadImage("images/A.png");
  S = loadImage("images/S.png"); 
  D = loadImage("images/D.png"); 


  size(900, 600);
}

ArrayList<Arrow> arrows = new ArrayList();
ArrayList<Letter> letters = new ArrayList();

void draw() {
  println(state); 
  if (state == 0) homeScreen(); 
  else if (state == 1) {
    play();
  } else if (state == 2) {
    how();
  } else if (state == 3) {
    cred();
  }
}  
void play() {

  imageMode(CENTER); 
  background(0); 
  stroke(255);
  strokeWeight(3); 
  line(450, 0, 450, 600);

  if (score < 0) {
    score = 0;
  }

  font = createFont("Monoton.ttf", 48);
  textFont(font);
  text(score, 50, 90);
  textSize(50);
  fill(150, 0, 255);

  image(up, 675, 250, uaw, uah); 
  image(down, 675, 350, daw, dah); 
  image(left, 625, 300, law, lah); 
  image(right, 725, 300, raw, rah); 

  image(A, 165, 300, aw, ah); 
  image(W, 225, 240, ww, wh); 
  image(S, 225, 360, sw, sh); 
  image(D, 285, 300, dw, dh); 

  if (up1) {
    uah = 110;
  } else if (up1 == false) {
    uah = 87;
  }
  if (down1) dah = 110; 
  else if (down1 == false) {
    dah = 87;
  }
  if (left1) law  = 110;
  else if (left1 == false) {
    law = 87;
  }
  if (right1) raw = 110; 
  else if (right1 == false) {
    raw = 87;
  }

  if (w1) {
    wh = 119;
  } else if (w1 == false) {
    wh = 96;
  }
  if (a1) aw = 104; 
  else if (a1 == false) {
    aw = 81;
  }
  if (s1) sh  = 115;
  else if (s1 == false) {
    sh = 92;
  }
  if (d1) dw = 114; 
  else if (d1 == false) {
    dw = 89;
  }

  int r = (int) random(4);
  if (frameCount % 75 == 0) {
    if (r == 0) {
      posx = 0; 
      posy = 300; 
      Char = 'a';
    }
    if (r == 1) {
      posx = 225; 
      posy = 0; 
      Char = 'w';
    }
    if (r == 2) {
      posx = 225; 
      posy = 600; 
      Char = 's';
    }
    if (r == 3) {
      posx = 450; 
      posy = 300; 
      Char = 'd';
    }

    Letter l = new Letter(posx, posy, Char); 
    letters.add(l);
  }
  for (int i = 0; i < letters.size(); i++) {
    Letter l = letters.get(i); 
    l.display(); 
    l.move();
    if (l.x < 175 && l.x > 155 && keyPressed && key == 'a') {
      score += 100;
      letters.remove(l);
      greenFlash();
    } else if (l.x < 185 && l.x > 145 && keyPressed && key == 'a') {
      score += 10;
      letters.remove(l);
    } else if (l.x < 215 && l.x > 115 && keyPressed && key == 'a') {
      score += 1;
      letters.remove(l);
    }
    if (l.x < 295 && l.x > 275 && keyPressed && key == 'd') {
      score += 100;
      letters.remove(l);
      greenFlash();
    } else if (l.x < 305 && l.x > 265 && keyPressed && key == 'd') {
      score += 10;
      letters.remove(l);
    } else if (l.x < 335 && l.x > 235 && keyPressed && key == 'd') {
      score += 1;
      letters.remove(l);
    }
    if (l.y > 350 && l.y < 370 && keyPressed && key == 's') {
      score += 100;
      letters.remove(l);
      greenFlash();
    } else if (l.y > 340 && l.y < 380 && keyPressed && key == 's') {
      score += 10;
      letters.remove(l);
    } else if (l.y > 310 && l.y < 410 && keyPressed && key == 's') {
      score += 1;
      letters.remove(l);
    }
    if (l.y > 230 && l.y < 250 && keyPressed && key == 'w') {
      score += 100;
      letters.remove(l);
      greenFlash();
    } else if (l.y > 220 && 260 > l.y && keyPressed && key == 'w') {
      score += 10;
      letters.remove(l);
    } else if (l.y > 190 && l.y < 290 && keyPressed && key == 'w') {
      score += 1;
      letters.remove(l);
    }
    if (l.x == 225 && (l.letterchar == 'd' || l.letterchar == 'a')) {
      letters.remove(l);
      score -= 50;
      redFlash();
    } 
    if (l.y == 300 && (l.letterchar == 'w' || l.letterchar == 's')) {
      letters.remove(l);
      score -= 50;
      redFlash();
    }
  }

  image(up, 675, 250, uaw, uah); 
  image(down, 675, 350, daw, dah); 
  image(left, 625, 300, law, lah); 
  image(right, 725, 300, raw, rah); 
  int ar = (int) random(4);
  if (frameCount % 75 == 0) {
    if (ar == 0) {
      aposx = 450; 
      aposy = 300; 
      string = "left";
    }
    if (ar == 1) {
      aposx = 675; 
      aposy = 0; 
      string = "up";
    }
    if (ar == 2) {
      aposx = 675; 
      aposy = 600; 
      string = "down";
    }
    if (ar == 3) {
      aposx = 890; 
      aposy = 300;  
      string = "right";
    }

    Arrow a = new Arrow(aposx, aposy, string); 
    arrows.add(a);
  }
  //println(letters.size()); 
  for (int i = 0; i < arrows.size(); i++) {
    Arrow a = arrows.get(i); 
    a.display(); 
    a.move();

    if (a.y < 260 && a.y > 240 && keyPressed && keyCode == UP) {
      arrows.remove(a); 
      score += 100;
      greenFlash();
    } else if (a.y < 270 && a.y > 230 && keyPressed && keyCode == UP) {
      arrows.remove(a);
      score += 10;
    } else if (a.y < 300 && a.y > 200 && keyPressed && keyCode == UP) {
      arrows.remove(a);
      score += 1;
    }
    if (a.x < 635 && a.x > 615 && keyPressed && keyCode == LEFT) {
      arrows.remove(a); 
      score += 100;
      greenFlash();
    } else if (a.x < 645 && a.x > 605 && keyPressed && keyCode == LEFT) {
      arrows.remove(a);
      score += 10;
    } else if (a.x < 675 && a.x > 575 && keyPressed && keyCode == LEFT) {
      arrows.remove(a);
      score += 1;
    } 
    if (a.x < 735 && a.x > 715 && keyPressed && keyCode == RIGHT) {
      score += 100;
      greenFlash();
      arrows.remove(a);
    } else if (a.x < 745 && a.x > 705 && keyPressed && keyCode == RIGHT) {
      arrows.remove(a);
      score += 10;
    } else if (a.x < 775 && a.x > 675 && keyPressed && keyCode == RIGHT) {
      arrows.remove(a);
      score += 1;
    }
    if (a.y < 360 && a.y > 340 && keyPressed && keyCode == DOWN) {
      score += 100;
      greenFlash();
      arrows.remove(a);
    } else if (a.y < 370 && a.y > 330 && keyPressed && keyCode == DOWN) {
      arrows.remove(a);
      score += 10;
    } else if (a.y < 400 && a.y > 300 && keyPressed && keyCode == DOWN) {
      arrows.remove(a);
      score += 1;
    }
    if (a.x == 675 && (a.arrowcode == "left" || a.arrowcode == "right")) {
      arrows.remove(a);
      score -= 50;
      redFlash();
    } 
    if (a.y == 300 && (a.arrowcode == "up" || a.arrowcode == "down")) {
      arrows.remove(a);
      score -= 50;
      redFlash();
    }
  }
}


void keyPressed() {
  if (keyCode  == UP)
  {
    up1 = true;
  } else if (keyCode == DOWN) 
  {
    down1 = true;
  } else if (keyCode == LEFT) 
  {
    left1 = true;
  } else if (keyCode == RIGHT) 
  {
    right1= true;
  }
  if (key  == 'w')
  {
    w1 = true;
  } else if (key == 'a') 
  {
    a1 = true;
  } else if (key == 's') 
  {
    s1 = true;
  } else if (key == 'd') 
  {
    d1= true;
  }
}
void keyReleased() {
  if (keyCode == UP)
  {
    up1= false;
  } else if (keyCode == DOWN) 
  {
    down1= false;
  } else if (keyCode == LEFT) 
  {
    left1= false;
  } else if (keyCode == RIGHT) 
  {
    right1= false;
  }
  if (key  == 'w')
  {
    w1 = false;
  } else if (key == 'a') 
  {
    a1 = false;
  } else if (key == 's') 
  {
    s1 = false;
  } else if (key == 'd') 
  {
    d1= false;
  }
}
void homeScreen() {
  background(0); 
  //rect(450, 300, x, y);
  fill(255); 
  textSize(32); 
  if (x < 20) x+= 6; 
  text("Ambidextrous   Rhythms", x, 80); 
  play.display(); 
  how.display(); 
  about.display(); 
  fill(0);
  text("Play", 20, 200);
  text("How   to   Play", 20, 300);
  text("Credits", 20, 400); 

  if (mouseX > 0 && mouseX < 400 && mouseY < 220 && mouseY > 150) {
    //  println("play"); 

    stroke(232, 35, 107);    
    strokeWeight(3); 
    play.display(); 
    fill(211, 11, 11); 
    text("Play", 20, 200);
  }
  noStroke(); 
  if (mouseX > 0 && mouseX < 480 && mouseY < 320 && mouseY > 250) {
    //println("how to play");
    stroke(232, 35, 107);
    strokeWeight(3); 
    how.display(); 
    fill(166, 22, 240); 
    text("How   to   Play", 20, 300);
  }
  noStroke(); 
  if (mouseX > 0 && mouseX < 520 && mouseY < 420 && mouseY > 350) {
    //println("about/help");  
    stroke(211, 98, 11);    
    strokeWeight(3); 
    about.display(); 
    fill(8, 16, 203); 
    text("Credits", 20, 400);
  }
  noStroke();


  // background(0); 
  int randPos = (int) random(3);
  int left = (int) random(2); 
  int len = (int)random(2, 10); 
  int randColor = (int) random(4); 
  int top = (int) random(2); 
  int bottom = (int) random(2); 

  if (frameCount% 30 == 0) {
    if (randPos == 0) {
      moveY = 500;
      topMoveX = 820;
    } else if (randPos == 1) {
      moveY = 520;
      topMoveX = 840;
    } else if (randPos == 2) {
      moveY = 540;
      topMoveX = 860;
    }
    if (left == 1) { 
      left2 = true; 
      moveX = -100;
    } else if (left == 0) {
      left2 = false; 
      moveX = 1000;
    }
    if (top == 1) {
      top1 = true;
      if (bottom == 1) {
        bot = true; 
        topMoveY = 700;
      } else {
        bot = false; 
        topMoveY = -200;
      }
    } else if (top == 0) {
      top1 = false;
    }
    rectLen = len*20; 
    rectWid = len*20; 
    if (randColor == 0) blockColor = color(166, 22, 240); 
    else if (randColor == 1) blockColor = color(232, 35, 107); 
    else if (randColor == 2) blockColor = color(211, 98, 11);   
    else if (randColor == 3) blockColor = color(8, 16, 203); 


    movingBlock block = new movingBlock(moveX, moveY, blockColor, rectLen, 10, left2, false, false);  
    movingBlock topblock = new movingBlock(topMoveX, topMoveY, blockColor, 10, rectWid, false, true, bot);   
    movingBlocks.add(block);
    movingBlocks.add(topblock);
  }

  for (int i = 0; i < movingBlocks.size(); i++) {
    movingBlock mb = movingBlocks.get(i); 
    mb.display(); 
    mb.move(); 
    if (mb.x > 1200 || mb.x < -200) movingBlocks.remove(i);
  }
}



void how() {
  background(0); 
  if (x < 20) {
    x+= 6;
  }
  fill(255); 
  text("How   to   play", x, 80); 
  Box help = new Box(0, 125, 600, 200); 
  help.display(); 
  //if(help.x < 0) help.x+=5; 
  fill(0); 
  text("Press   Arrow   Keys   or\n   WASD   and   press   the\n  corresponding   symbols", 22, 175);


  Box goBack = new Box(0, 500, 222, 80); 
  goBack.display();
  fill(0); 
  text("Go   Back", 22, 550); 
  if (mouseX > 0 && mouseX < 222 && mouseY > 500 && mouseY < 580) {
    stroke(232, 35, 107);
    strokeWeight(3); 
    goBack.display(); 
    fill(8, 16, 203); 

    text("Go   Back", 22, 550);
  }
  noStroke(); 
  //println(mouseY);
}

void cred() {
  background(0); 
  if (x < 20) {
    x+= 6;
  }
  fill(255); 
  text("Credits", x, 80); 
  Box help = new Box(0, 125, 600, 200); 
  help.display(); 
  //if(help.x < 0) help.x+=5; 
  fill(0); 
  text("Developers:\n Hugo   Zhang      Steve   Li\n   James   West", 22, 175);


  Box goBack = new Box(0, 500, 222, 80); 
  goBack.display();
  fill(0); 
  text("Go   Back", 22, 550); 
  if (mouseX > 0 && mouseX < 222 && mouseY > 500 && mouseY < 580) {
    stroke(232, 35, 107);
    strokeWeight(3); 
    goBack.display(); 
    fill(8, 16, 203); 

    text("Go   Back", 22, 550);
  }
  noStroke(); 
  //println(mouseY);
}
void mousePressed() {
  if (mouseX > 0 && mouseX < 480 && mouseY < 320 && mouseY > 250 && state!= 2 && state == 0) {
    x = -50; 
    alpha = 30; 
    state = 2; // how
  }
  if (mouseX > 0 && mouseX < 222 && mouseY > 500 && mouseY < 580 && state != 0) {


    x = -50; 
    alpha = 1; //home
    state = 0;
  }
  if ((mouseX > 0 && mouseX < 520) && (mouseY < 420 && mouseY > 350)) {
    if (state == 0) {
      println("true"); 
      println(state); 
      x = -50; 
      alpha = 30; // cred
      state = 3;
    }
  }
  if (mouseX > 0 && mouseX < 400 && mouseY < 220 && mouseY > 150 && state == 0 ) {
          file.play();
    
    state = 1; 
    }
  
}
void redFlash() {
  background(50, 0, 0);
}
void greenFlash() {
  background(0, 50, 0);
}