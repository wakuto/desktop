static abstract class WindowStatic {
  static int count;
  static ArrayList<Window> window = new ArrayList<Window>();
  public static void Draw() {
    for(Window win : window) {
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
  int prevMouseX = 0;
  int prevMouseY = 0;
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
  
  void mouseClicked() {
    if(posX < mouseX && mouseX < posX + sizeX && posY < mouseY && mouseY < posY - barY) {
      // move
    }
  }
    
}
