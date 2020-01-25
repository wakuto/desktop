//import java.lang.reflect.*;

PImage background;
PImage mouseCursor;
PApplet parent = this;

void setup() {
  //Tools.app = parent;
  // display setting
  fullScreen();
  if(displayWidth%16 == 0) {
    background = loadImage("FHD.png");
  } else {
    background = loadImage("background.png");
  }
  mouseCursor = loadImage("mouseCursor.png");
  // initialize
  Icon calc = new Icon("Calc", "calc.png", Calc.class);
  TaskbarSetting taskbar = new TaskbarSetting(displayHeight / 20, #FFFFFF);
}

void draw() {
  Mouse.setMouse(mouseX, mouseY);
  
  image(background, 0, 0, displayWidth, displayHeight);
  Icon.drawIcons();
  Window.drawWindows();
  Taskbar.drawTaskbar();
  Window.closeWindows();
  cursor(mouseCursor);
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

void mouseClicked(MouseEvent me) {
  if(me.getCount() == 2) {
    Icon.clickCheck(mouseX, mouseY);
  }
  Window.clickCheck(mouseX, mouseY);
  Taskbar.click(mouseX, mouseY);
}
