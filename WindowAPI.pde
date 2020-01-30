public class WindowAPI {
  Window target;
  int upX;
  int upY;
  Point up;
  int lowX;
  int lowY;
  Point low;
  
  public WindowAPI(Window win) {
    target = win;
    init();
  }
  
  private void init() {
    upX = target.posX;
    upY = target.posY + target.barY;
    lowX = target.posX + target.sizeX;
    lowY = target.posY + target.sizeY;
    up = new Point(upX, upY);
    low = new Point(lowX, lowY);
  }
  
  public void rect(Point pos, Point size) {
    init();
    if(size.x < 0 || size.y < 0) {
      println("ex");
      return; //throw new IllegalArgumentExeceptionxception("Negative value specified");
    }
    pos.add(up);
    boolean start = Tools.isInArea(pos, up, low);
    boolean end = Tools.isInArea(new Point(pos.x + size.x, pos.y + size.y), up, low);
    if(start && end) {
      parent.rect(pos.x, pos.y, size.x, size.y);
    } else if(start && !(end)) {
      parent.rect(pos.x, pos.y, low.x, low.y);
    } else if(!(start) && end) {
      parent.rect(up.x, up.y, size.x, size.y);
    }
    //println(start + "/" + end);
  }
  
  public void rect(float x, float y, float sizeX, float sizeY) {
    init();
    if(sizeX < 0 || sizeY < 0) {
      println("ex");
      return; //throw new IllegalArgumentExeceptionxception("Negative value specified");
    }
    x += upX;
    y += upY;
    boolean start = Tools.isInArea(x, y, upX, upY, lowX, lowY);
    boolean end = Tools.isInArea(x + sizeX, y + sizeY, upX, upY, lowX, lowY);
    if(start && end) {
      parent.rect(x, y, sizeX, sizeY);
    } else if(start && !(end)) {
      parent.rect(x, y, lowX, lowY);
    } else if(!(start) && end) {
      parent.rect(upX, upY, sizeX, sizeY);
    }
    //println(start + "/" + end);
  }
  public void rect(float x, float y, float sizeX, float sizeY, float r) {
    init();
    if(sizeX < 0 || sizeY < 0) {
      return; //throw new IlleagalArgumentException("Negative value specified");
    }
    x += upX;
    y += upY;
    boolean start = Tools.isInArea(x, y, upX, upY, lowX, lowY);
    boolean end = Tools.isInArea(x + sizeX, y + sizeY, upX, upY, lowX, lowY);
    if(start && end) {
      parent.rect(x, y, sizeX, sizeY, r);
    } else if(start && !end) {
      parent.rect(x, y, lowX, lowY, r);
    } else if(!start && end) {
      parent.rect(upX, upY, sizeX, sizeY, r);
    }
    //println(start + "/" + end);
  }
  
  public void line(float startX, float startY, float endX, float endY) {
    init();
    startX += upX;
    startY += upY;
    endX += upX;
    endY += upY;
    boolean start = Tools.isInArea(startX, startY, upX, upY, lowX, lowY);
    boolean end = Tools.isInArea(endX, endY, upX, upY, lowX, lowY);
    
    if(start && end) {
      line(startX, startY, endX, endY);
    } else {
      return;
    }
  }
  public void text(String str, float x, float y, float sizeX, float sizeY) {
    init();
    x += upX;
    y += upY;
    if(str != null && str != "") {
      parent.text(str, x, y, sizeX, sizeY);
    }
  }
}