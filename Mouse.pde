static class Mouse {
  static int prevMouseX;
  static int prevMouseY;
  static int moveX;
  static int moveY;
  static int clickMousePosX;
  static int clickMousePosY;
  static void setMouse(int x, int y) {
    prevMouseX = x;
    prevMouseY = y;
  }
  static void firstMousePos(int x, int y) {
    clickMousePosX = x;
    clickMousePosY = y;
  }
    
}