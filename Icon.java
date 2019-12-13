import processing.core.*;

class Icon {
  public static int count = 0;
  PImage icon;
  String name;

  public Icon(String name, PImage icon) {
    this.icon = icon;
    this.name = name;
    count++;
    
    //image(this.icon);
  }
  
  public String getName() {
    return this.name;
  }
}