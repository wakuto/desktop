static abstract class WindowStatic {
  static int count;
  static boolean state = false;
  static int currentPid = 0;
  static Window[] window = new Window[1000];

  public static void Draw() {
    for (Window win : window) {
      if(win != null) {
        win.Draws();
      }
    }
  }
  public static int ChechClickedTitlebar() {
    for (Window win : window) {
      if(win != null) {
        int id = win.CheckClick();
        if(id != -1) return id;
      }
    }
    return -1;
  }
}

class Window extends WindowStatic {
  int posX = 0;  // window position(x)
  int posY = 0;  // window position(y)
  int sizeX = 400; // windows size(x)
  int sizeY = 600; // window size(y)
  int barY = 40;   // title bar height
  int buttonX = 70;// close button position(posX + x)
  int disX = 0;    // mousePosition(when mouse clicked) - posX
  int disY = 0;    // posY - mousePosition(when mouse clicked)
  int pid;         // process id
  String name;     // process name  
  
  boolean isfirst = true;
  boolean visible = false;  // if you want to close this window, put true into this varible


  public Window(Icon icn) {
    name = icn.name;
    window[currentPid] = this;
    pid = currentPid;
    currentPid++;
    visible = true;
  }
  public Window(Icon icn, int sizeX, int sizeY) {
    this(icn);
    this.sizeX = sizeX;
    this.sizeY = sizeY;
  }
  public Window(Icon icn, int sizeX, int sizeY, int posX, int posY) {
    this(icn, sizeX, sizeY);
    this.posX = posX;
    this.posY = posY;
  }

  private void Draws() {
    if(visible) {
      rect(posX, posY, sizeX, sizeY);
      fill(#F0F0F0);
      rect(posX, posY, sizeX, barY);
      fill(#FF0000);
      rect(posX + sizeX - buttonX, posY, buttonX, barY);
      textSize(28);
      fill(0,0,0);
      text(name, posX + barY, posY + barY - 10);
    }
  }
  
  public void Move() {
    if(visible) {
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
  }
  
  public void SetState(boolean st) {
    if(posX <= mouseX && mouseX <= (posX + sizeX) && posY + barY >= mouseY && mouseY >= posY) {
      state = st;
      if(!st) {
        isfirst = true;
      }
    }
  }
  
  public void click() {
    if((posX + sizeX - buttonX) <= mouseX && mouseX <= (posX + sizeX) && posY + barY >= mouseY && mouseY >= posY) {
      Close();
    }
  }
  
  public int CheckClick() {
    return -1;
  }
  
  public void Close() {
    visible = false;
    window[pid] = null;
    println("closed");
  }
}