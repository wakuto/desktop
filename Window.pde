static abstract class WindowStatic {
  static int count;
  static int currentPid = 0;
  static Window[] window = new Window[1000];
  
  // sort in display order
  static ArrayList<Integer> index = new ArrayList<Integer>();

  public static void drawWindows() {
    //reverse(window);
    for (int i = window.length - 1; i >= 0; i--) {
      if(window[i] != null) {
        window[i].drawWindow();
      }
    }
  }
  /*
  public static int ChechClickedTitlebar() {
    for (Window win : window) {
      if(win != null) {
        int id = win.checkClick();
        if(id != -1) return id;
      }
    }
    return -1;
  }*/
  
  public static void setMoveStates(boolean st) {
    for(int i : index) {
      window[i].setMoveState(st);
    }
  }
  public static void clickCloseButtons() {
    for(int i : index) {
      window[i].clickCloseButton();
    }
  }
  public static void moveWindow() {
    for(int i : index) {
      window[i].move();
    }
  }
  public static void closeWindows() {
    ArrayList<Integer> closeList = new ArrayList<Integer>();
    for(int i : index) {
      if(window[i].close) {
        //window[i].closeWindow();
        closeList.add(i);
      }
    }
    for(int i : closeList) {
      window[i].closeWindow();
      window[i] = null;
    }
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
  
  boolean close = false;
  boolean state = false;
  boolean isfirst = true;
  boolean visible = false;  // if you want to close this window, put true into this varible


  public Window(Icon icn) {
    name = icn.name;
    window[currentPid] = this;
    pid = currentPid;
    index.add(pid);
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

  private void drawWindow() {
    if(visible) {
      if(index.get(0) == pid) {
        fill(#FFFFFF);
        rect(posX, posY, sizeX, sizeY);
        fill(#F0F0F0);
        rect(posX, posY, sizeX, barY);
        fill(#FF0000);
        rect(posX + sizeX - buttonX, posY, buttonX, barY);
        textSize(28);
        fill(0,0,0);
        text(name, posX + barY, posY + barY - 10);
      } else {
        fill(#DDDDDD);
        rect(posX, posY, sizeX, sizeY);
        fill(#D0D0D0);
        rect(posX, posY, sizeX, barY);
        fill(#FF0000);
        rect(posX + sizeX - buttonX, posY, buttonX, barY);
        textSize(28);
        fill(0,0,0);
        text(name, posX + barY, posY + barY - 10);
      }
    }
  }
  
  public void move() {
    if(visible && state) {
      if(isfirst) {
        Window tmp = window[pid];
        window[pid] = window[index.get(0)];
        window[index.get(0)] = tmp;
        for(int i = 0; i < index.size(); i++) {
          if(index.get(i) == pid) {
            index.set(i, index.get(0));
            break;
          }
        }
        index.set(0, pid);
        java.util.Iterator<Integer> it = index.iterator();
        while(it.hasNext()) {
          if(it.next() == pid) break;
        }
        index.set(0, pid);
        
        
        disX = posX - Mouse.clickMousePosX;
        disY = posY - Mouse.clickMousePosY;
        isfirst = false;
      }
      posX = mouseX + disX;
      posY = mouseY + disY;
    }
  }
  
  public void setMoveState(boolean st) {
    // if mouse on the titlebar
    if(posX <= mouseX && mouseX <= (posX + sizeX) && posY + barY >= mouseY && mouseY >= posY) {
      state = st;
      if(!st) {
        isfirst = true;
      }
    }
  }
  
  public void clickCloseButton() {
    // if mouse on the close button
    if((posX + sizeX - buttonX) <= mouseX && mouseX <= (posX + sizeX) && posY + barY >= mouseY && mouseY >= posY && index.get(0) == pid) {
      //closeWindow();
      close = true;
    }
  }
  /*
  public int checkClick() {
    return -1;
  }*/
  
  public void closeWindow() {
    if(close) {
      close = false;
      visible = false;
      //window[pid] = null;
      java.util.Iterator<Integer> it = index.iterator();
      while(it.hasNext()) {
        int ind = it.next();
        if(ind == pid) {
          it.remove();
          break;
        }
      }
      println("closed");
    }
  }
}
