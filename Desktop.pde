PImage background;
void setup() {
  size(displayWidth, displayHeight);
  background = loadImage("background.png");
}

void draw() {
  image(background, 0, 0);
  Icon icn = new Icon("abc", "icon1.png");


}
