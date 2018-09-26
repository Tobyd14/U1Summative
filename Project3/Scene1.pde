class Scene1{
 float x;
 float y;
 PImage Img; 
 Scene1(){
Img = loadImage("lion.png");
Img.resize(300,250);
x=600;
y=500;}
void render(){
image(Img,x,y);}
void move(){
 if (y > height) {
 y=0;}}}
