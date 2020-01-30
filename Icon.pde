import java.lang.reflect.Method; //<>//
import java.lang.reflect.Constructor;

static abstract class IconStatic {
  static int count;
  static ArrayList<Icon> icons = new ArrayList<Icon>();
  static desktop parent = new desktop();
  // draws all icons
  public static void drawIcons() {
    for (Icon icon : icons) {
      icon.drawIcon();
    }
  }

  public static void clickCheck(int x, int y) {
    for (Icon icon : icons) {
      icon.checkIcon(x, y);
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
  int sizeX, sizeY;
  int posX, posY;

  int index;
  Class clazz;

  public Icon(String name, String icon, Class clazz) {
    this.clazz = clazz;
    this.icon = loadImage(icon);
    if (this.icon == null) {
      this.icon = loadImage(defaultIcon);
    }
    this.name = name;
    index = count;
    count++;
    icons.add(this);
    this.sizeX = (int)(this.icon.width * dispScale);
    this.sizeY = (int)(this.icon.height * dispScale);
    drawIcon();
  }

  protected void drawIcon() {
    float interval = this.sizeX - textWidth(this.name);
    posX = intervalX;
    posY = intervalY + index * (this.sizeY + fontSize + intervalY);
    image(this.icon, posX, posY, this.sizeX, this.sizeY);
    textSize(fontSize);
    fill(#FFFFFF);
    if (interval >= 0) {
      text(this.name, intervalX + interval/2, intervalY + this.sizeY + fontSize + index * (this.sizeY + fontSize + intervalY));
    } else {
      int word = 0;
      while (this.sizeX >= textWidth(this.name.substring(0, ++word)));
      word--;
      text(this.name.substring(0, word), intervalX, intervalY + this.sizeY + fontSize + index * (this.sizeY + fontSize + intervalY));
    }
  }

  public String getName() {
    return this.name;
  }

  protected void checkIcon(int x, int y) {
    if(Tools.isInArea(x, y, this.posX, this.posY, this.posX + this.sizeX, this.posY + this.sizeY)) {
      launchApp();
    }
  }

  private void launchApp() {
    switch(clazz.getName()) {
      case "desktop$Calc": {
        Calc cal = new Calc(this);
        break;
      }
    }    
  }
}
