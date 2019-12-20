PImage background;

void setup() {
  size(displayWidth, displayHeight);
  background = loadImage("background.png");
  Icon icn = new Icon("test", "icon1.png");
  Window win = new Window(icn);
}

void draw() {
  Mouse.setMouse(mouseX, mouseY);
  image(background, 0, 0);
  Icon.Draw();
  Window.Draw();
  taskbar(75, #FFFFFF);
  
}
void mouseDragged() {
  Window.window.get(0).Move();
  
}
void mouseClicked() {
  Mouse.firstMousePos(mouseX, mouseY);
}

void taskbar(float y, color col) {
  noStroke();
  fill(col);
  rect(0, displayHeight - y, displayWidth, y); 
}