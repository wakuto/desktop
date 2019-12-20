static abstract class IconStatic {
  static int count;
  static ArrayList<Icon> icons = new ArrayList<Icon>();
  public static void Draw() {
    for(Icon icon : icons) {
      icon.Draws();
    }
  }
}
class Icon extends IconStatic {
  PImage icon;
  String name;
  final int intervalX = 10;
  final int intervalY = 10;
  final float dispScale = 0.5f;
  final String defaultIcon = "icon1.png";
  final int fontSize = 20;
  float x, y;
  int index;
  
  public Icon(String name, String icon) {
    this.icon = loadImage(icon);
    if (this.icon == null) {
      this.icon = loadImage(defaultIcon);
    }
    this.name = name;
    index = count;
    count++;
    icons.add(this);
    Draw();
  }
  
  public void Draws() {
    this.x = this.icon.width * dispScale;
    this.y = this.icon.height * dispScale;
    float interval = this.x - textWidth(this.name);
    image(this.icon, intervalX, intervalY + index * (this.y + fontSize + intervalY), this.x, this.y);
    textSize(fontSize);
    if (interval >= 0) {
      text(this.name, intervalX + interval/2, intervalY + this.y + fontSize + index * (this.y + fontSize + intervalY));
    } else {
      int word = 0;
      while(this.x >= textWidth(this.name.substring(0, ++word)));
      word--;
      text(this.name.substring(0, word), intervalX, intervalY + this.y + fontSize + index * (this.y + fontSize + intervalY));
    }
  }
  
  public String getName() {
    return this.name;
  }
}