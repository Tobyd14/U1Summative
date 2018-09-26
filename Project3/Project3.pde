float Xs [] = new float [100];
float Ys [] = new float [100];
float As [] = new float [100];
float Bs [] = new float [100];
float boxx [] = new float [10];
float boxy [] = new float [10];
float x= 0;
float y= 560;
//scene3font
PFont f;
//scene2
PImage Laser;
PImage Fireball;
//scene1
PImage Car;
PImage Tree;
PImage Cloud;
//scene2
PImage Background;
int Scene = 0;
Car c;
Shark s;
Scene1 l;
void setup() {
  size(800, 800);
  //scene2items
  Background = loadImage("scene3background.png");
  Background.resize(800, 800);
  //scene3font
  f = createFont("Arial", 30, true);
  //scene1items
  Tree = loadImage("tree.png");
  Cloud = loadImage("clouds.png");
  Cloud.resize(300, 200);
  c=new Car();
  s=new Shark();
  l=new Scene1();
  //car image 
  for (int i=0; i<100; i++) {
    Xs[i] = random(0, width);
    Ys[i] = random(0, height);
  }
  //obstructions
  for (int i=0; i<5; i++) {
    boxx[i] = random(0, width);
    boxy[i] = random(0, height);
  }
  //scene 0 obstructions
  Fireball = loadImage("fireball.png");
  Fireball.resize(20, 20);
  for (int i=0; i<100; i++) {
    As[i] = random(0, width);
    Bs[i] = random(0, height);
  }
  Laser = loadImage("laser.jpg");
  Laser.resize(10, 10);
}
void draw() {
  //scene 0 background 
  if (Scene == 0) {
    background(0);
  }
  //scene 1 background
  if (Scene == 1) {
    background(0, 0, 255);
  }
  //scene2items
  if (Scene == 2) {
    background(Background);
  }
  //scene1items
  if (Scene == 1) {
    image(Tree, 200, 280);
  }
  if (Scene == 1) {
    image(Cloud, 200, 0);
  }
  if (Scene == 1) {
    image(Cloud, 500, 0);
  }
  if (Scene == 1) {
    image(Cloud, 350, 0);
  }
  if (Scene == 1) {
    image(Cloud, 50, 0);
  }
  //font
  if (Scene == 3) {
    background(0);
    textFont(f, 30);                  
    fill(255, 0, 0);                          
    text("Thanks For Playing!", 400, 400);
  }   
  if (Scene == 3) {
    textFont(f, 15);                  
    fill(255, 0, 0);   
    text("Game Created By Toby Dumbell", 0, 600);
  }
  //scene code
  if (x > width) {
    x=0;
    Scene+=1;
  }
  //scene 0 obstructions
  if (Scene == 0) {
    for (int i=0; i<100; i++) {
      image ( Laser, Xs[i], Ys[i]);
      Ys[i] = Ys[i] + 5;
      if (Ys[i] > height) {
        Ys[i] = 0;
      }
    }
  } 
  //scene 0 obstructions
  if (millis() < 5000) {
    for (int i=0; i<100; i++) {
      image ( Fireball, As[i], Bs[i]);
      Ys[i] = Ys[i] + 5;
      if (Ys[i] > height) {
        Ys[i] = 0;
      }
    }
  }
  fill(0, 255, 0);
  //scene 0/1 platform
  if (Scene == 1) {
    rect(0, 700, 800, 100);
  }
  if (Scene == 0) {
    rect(0, 700, 800, 100);
  }
  //scene1 obstructions
  if (Scene == 1) {
    for (int i=0; i<5; i++) {
      fill(0);
      ellipse (boxx[i], boxy[i], 50, 50);
      boxy[i] = boxy[i] +2;
      if (boxy[i] > height) {
        boxy[i] = 0;
      }
    }
  } 
  if (Scene == 2) {
    for (int i=0; i<5; i++) {
      fill(0);
      ellipse (boxx[i], boxy[i], 50, 50);
      boxy[i] = boxy[i] +5;
      if (boxy[i] > height) {
        boxy[i] = 0;
      }
    }
  } 
  if (Scene == 0) {
    for (int i=0; i<5; i++) {
      fill(255, 0, 0);
      ellipse (boxx[i], boxy[i], 50, 50);
      boxy[i] = boxy[i] +1;
      if (boxy[i] > height)
      {
        boxy[i] = 0;
      }
      if (dist(boxx[i]+50, boxy[i]+50, c.x+200, c.y)<10) {
  Scene = 4;
  }
}
}
    if (Scene == 4){
    background(0);
    textFont(f, 30);                  
    fill(255, 0, 0);                          
    text("You are Eliminated", 400, 400);
  } 
  c.render();
  c.move();
  if (Scene == 2) {
    s.render();
    s.move();
  }
  if (Scene == 1) {
    l.render();
    l.move();
  }
}

void keyPressed() {
  //up
  if (key == CODED)
    if (keyCode == RIGHT) {
      c.x+=8;
    }
  //down
  if (key == CODED)
    if (keyCode == LEFT ) {
      c.x-=8;
    }
  //up
  if (key == CODED)
    if (keyCode == UP) {
      c.y-=8;
    }
  //down
  if (key == CODED)
    if (keyCode == DOWN) {
      c.y+=8;
    }
  //speedup
  if (key == CODED)
    if (keyCode == ' ') {
      c.x=10;
    }
}
