class Car{
  float x;
  float y;
  PImage Img;
  Car() {
    Img = loadImage("car.png");
   Img.resize(200,200);
    x=0;
    y=560;}
  void render() {
    image(Img, x, y);}
  void move() {
    if (x > width) {
      x=0;
      Scene+=1;}}}
