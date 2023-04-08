PImage velero;

void setup(){
  size(800,400);
  velero = loadImage("velero.png");
  background (2,9,124);
}
void draw(){
  image(velero,0,0,400,400);
  fill(189,115,193);
  beginShape();
  vertex(400,0);
  vertex(800,0);
  vertex(800,195);
  vertex(400,195);
  endShape(CLOSE);
  fill(245,193,138);
  beginShape();
  vertex(400,0);
  vertex(800,0);
  vertex(800,85);
  vertex(400,85);
  endShape(CLOSE);
  fill(255,255,255);
  beginShape();
  vertex(450,280);
  vertex(470,310);
  vertex(580,310);
  vertex(600,280);
  endShape(CLOSE);
  triangle(540,260,540,10,490,260);
  triangle(534,270,550,60,595,273);
  line(453,285,595,285);
  line(453,290,595,290);
}  
