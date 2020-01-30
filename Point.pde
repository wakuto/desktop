public class Point {
  float x, y;
  
  public Point(float x, float y) {
    this.x = x;
    this.y = y;
  }
  public Point() {
    this.x = 0;
    this.y = 0;
  }
  
  public void add(Point po) {
    this.x += po.x;
    this.y += po.y;
  }
  
  public void set(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  public void sub(Point po) {
    this.x -= po.x;
    this.y -= po.y;
  }
}
