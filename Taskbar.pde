public class TaskbarSetting extends Taskbar{
  PImage power;
  Point pos;
  public TaskbarSetting(int y, color col) {
    if(isFirstTime) {
      this.y = y;
      this.col = col;
      taskbar = this;
      isFirstTime = false;
      power = loadImage("Power.png");
    }
    pos = new Point(0, displayHeight - y);
  }
  
  protected void clickButton(int x, int y) {
    Point mouse = new Point(x, y);
    if(Tools.isInArea(mouse, pos, new Point(pos.x + y, pos.y + y))) {
      exit();
    }
  }
  
  protected void drawBar() {
    noStroke();
    fill(col);
    rect(pos.x, pos.y, displayWidth, y); 
    fill(#000000);
    int fontsize = 20;
    textSize(fontsize);
    String time = ((Integer)hour()).toString() + ":" + ((Integer)minute()).toString() + "  ";
    text(time, displayWidth - textWidth(time), displayHeight - fontsize);
    image(power, pos.x, pos.y, y, y);
  }
}
public static class Taskbar {
  
  protected static boolean isFirstTime = true;
  protected static int y;
  protected static color col;
  protected static TaskbarSetting taskbar;
  
  public static void drawTaskbar() {
    taskbar.drawBar();
  }
  public static void click(int x, int y) {
    taskbar.clickButton(x, y);
  }
}
