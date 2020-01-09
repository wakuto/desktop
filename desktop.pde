PImage background;

void setup() {
  fullScreen();
  if(displayWidth == 1920) {
    background = loadImage("FHD.png");
  } else {
    background = loadImage("background.png");
  }
  Icon icn = new Icon("test", "icon1.png");
  Window win = new Window(icn,600,400);
}

void draw() {
  Mouse.setMouse(mouseX, mouseY);
  image(background, 0, 0);
  Icon.Draw();
  Window.Draw();
  taskbar(displayHeight / 20, #FFFFFF);
}

void mouseDragged() {
  Window.window[0].Move();
}

void mousePressed() {
  Window.window[0].SetState(true);
  Window.window[0].click();
  Mouse.firstMousePos(mouseX, mouseY);
}

void mouseReleased() {
  Window.window[0].SetState(false);
}

void taskbar(float y, color col) {
  noStroke();
  fill(col);
  rect(0, displayHeight - y, displayWidth, y); 
}