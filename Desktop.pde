PImage background;

void setup() {
  size(displayWidth, displayHeight);
  background = loadImage("background.png");
}

void draw() {
  background(background);
  Icon icn = new Icon("abc", loadImage("icon1.png"));
  taskbar(30, #FFFFFF);
}

void taskbar(float y, color col) {
  noStroke();
  fill(col);
  rect(0, displayHeight - y, displayWidth, y); 
}