class Shark{
  float x;
  float y;
  PImage img;
  Shark (){
    img = loadImage("Shark.png");
   img.resize(250,250);
   x=400;
   y=800;
  }
  void render(){
  image(img, x, y);
  y+=0.5; }
  void move(){
  if (y > height) {
      y=0;}}}
