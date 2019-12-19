PImage background;

void setup() {
  size(displayWidth, displayHeight);
  background = loadImage("background.png");
}

void draw() {
  image(background, 0, 0);
  Icon icn = new Icon("Empty file", "icon1.png");
  taskbar(30, #FFFFFF);
}

void taskbar(float y, color col) {
  noStroke();
  fill(col);
  rect(0, displayHeight - y, displayWidth, y); 
}

static abstract class IconStatic {
  static int count;
  static ArrayList<Icon> icons = new ArrayList<Icon>();

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
  
  public Icon(String name, String icon) {
    this.icon = loadImage(icon);
    if (this.icon == null) {
      this.icon = loadImage(defaultIcon);
    }
    this.name = name;
    count++;
    icons.add(this);
    
    
    this.x = this.icon.width * dispScale;
    this.y = this.icon.height * dispScale;
    float interval = this.x - textWidth(this.name);
    image(this.icon, intervalX, intervalY, this.x, this.y);
    textSize(fontSize);
    if (interval >= 0) {
      text(this.name, intervalX + interval/2, intervalY + this.y + fontSize);
    } else {
      int word = 0;
      while(this.x >= textWidth(this.name.substring(0, ++word)));
      word--;
      text(this.name.substring(0, word), intervalX, intervalY + this.y + fontSize);
    }
  }
  
  public String getName() {
    return this.name;
  }
}
