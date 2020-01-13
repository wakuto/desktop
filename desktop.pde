PImage background;

void setup() {
  // display setting
  fullScreen();
  if(displayWidth == 1920) {
    background = loadImage("FHD.png");
  } else {
    background = loadImage("background.png");
  }
  
  // initialize
  Icon icn = new Icon("test", "icon1.png");
  Window win = new Window(icn,600,400);
  Window win2 = new Window(icn, 400, 600);
  TaskbarSetting taskbar = new TaskbarSetting(displayHeight / 20, #FFFFFF);
}

void draw() {
  Mouse.setMouse(mouseX, mouseY);
  
  image(background, 0, 0);
  
  Icon.drawIcons();
  Window.drawWindows();
  Taskbar.drawTaskbar();
  Window.closeWindows();
}

void mouseDragged() {
  Window.moveWindow();
}

void mousePressed() {
  Window.setMoveStates(true);
  Window.clickCloseButtons();
  Mouse.firstMousePos(mouseX, mouseY);
}

void mouseReleased() {
  Window.setMoveStates(false);
}
