static abstract class WindowStatic {
  static int count;
  static boolean state = false;
  static ArrayList<Window> window = new ArrayList<Window>();

  public static void Draw() {
    for (Window win : window) {
      win.Draws();
    }
  }
}

class Window extends WindowStatic {
  int index;
  int posX = 300;
  int posY = 100;
  int sizeX = 400;
  int sizeY = 600;
  int barY = 40;
  int buttonX = 70;
  int disX = 0;
  int disY = 0;
  
  boolean isfirst = true;

  String name;
  public Window(Icon icn) {
    name = icn.name;
    window.add(this);
  }

  private void Draws() {
    rect(posX, posY, sizeX, sizeY);
    fill(#F0F0F0);
    rect(posX, posY - barY, sizeX, barY);
    fill(#FF0000);
    rect(posX + sizeX - buttonX, posY - barY, buttonX, barY);
  }
  
  public void Move() {
    if(isfirst && state) {
      disX = posX - Mouse.clickMousePosX;
      disY = posY - Mouse.clickMousePosY;
      isfirst = false;
    }
    
    if(state) {
      posX = mouseX + disX;
      posY = mouseY + disY;
    }
  }
  
  public void SetState(boolean st) {
    if(posX <= mouseX && mouseX <= (posX + sizeX) && posY >= mouseY && mouseY >= (posY - barY)) {
      state = st;
      if(!st) {
        isfirst = true;
      }
    }
  }
}
