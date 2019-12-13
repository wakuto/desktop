class Icon {
  static int count = 0;
  PImage icon;
  String name;

  public Icon(String name, PImage icon) {
    this.icon = icon;
    this.name = name;
    count++;
  }
  public Icon(String name, String iconname) {
    PImage icon = loadImage(iconname);
    this.icon = icon;
    this.name = name;
    count++;
  }

  public Icon(String name) {
    this.name = name;
    this.icon = null;
    count++;
  }
}
