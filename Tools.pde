public static class Tools {
  
  public static boolean isInArea(float targetX, float targetY, float upX, float upY, float lowX, float lowY) {
    if(upX <= targetX && targetX <= lowX && upY <= targetY && targetY <= lowY) {
      return true;
    }
    return false;
  }
  public static boolean isInArea(Point target, Point up, Point low) {
    if(up.x <= target.x && target.x <= low.x && up.y <= target.y && target.y <= low.y) {
      return true;
    }
    return false;
  }
}
