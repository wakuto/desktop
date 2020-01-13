public class TaskbarSetting extends Taskbar{
  public TaskbarSetting(int y, color col) {
    if(isFirstTime) {
      this.y = y;
      this.col = col;
      taskbar = this;
      isFirstTime = false;
    }
  }
  
  protected void drawBar() {
    noStroke();
    fill(col);
    rect(0, displayHeight - y, displayWidth, y); 
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
}
