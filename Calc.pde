import javax.script.*;
public abstract class CalcSub extends Application {
  
}
public class Calc extends CalcSub {
  int space = 10;
  int buttonSize = 50;
  String text = "";
  int res = 0;
  int resTmp = 0;
  Point mouse = new Point();
  WindowAPI win;
  public Calc(Icon ico) {
    Window cal = new Window(ico, buttonSize * 4 + space * 5, buttonSize * 6 + space * 7 + Window.barY);
    Process.process[cal.pid] = this;
    win = new WindowAPI(cal);
  }
  void drawButton() {
    for(int i = 3; i <= 6; i++) {
      for(int j = 1; j <= 3; j++) {
        fill(#FFFFFF);
        win.rect(space * j + buttonSize * (j-1), space * i + buttonSize * (i-1), buttonSize, buttonSize);
        textSize(32);
        fill(#000000);
        textAlign(CENTER, CENTER);
        String text = ((Integer)(j + 3 * (i-3))).toString();
        if(i == 6) {
          switch(j) {
            case 1: {
              text = ".";
              break;
            }
            case 2: {
              text = "0";
              break;
            }
            case 3: {
              text = "=";
              break;
            }
          }
        }
        win.text(text, space * j + buttonSize * (j-1), space * i + buttonSize * (i-1), buttonSize, buttonSize);
        textAlign(BASELINE);
      }
    }
   
    for(int i = 1; i <= 5; i++) {
      String text = "";
      fill(#FFFFFF);
      float signSize = buttonSize * 4 + space * 5;
      signSize /= 6.5;
      
      win.rect(space * 4 + buttonSize * 3, space * 3 + buttonSize * 2 + signSize * (i-1) + space * (i-1), buttonSize, signSize);
      switch(i) {
        case 1: {
          text = "DEL";
          break;
        }
        case 2: {
          text = "/";
          break;
        }
        case 3: {
          text = "*";
          break;
        }
        case 4: {
          text = "-";
          break;
        }
        case 5: {
          text = "+";
          break;
        }
      }
      textSize(20);
      textAlign(CENTER);
      fill(#000000);
      win.text(text, space * 4 + buttonSize * 3, space * 3 + buttonSize * 2 + signSize * (i-1) + space * (i-1), buttonSize, signSize);
      textAlign(BASELINE);
    }
  }
  
  void draws() {
    drawButton();
    drawResult(text);
  }
  
  void click(int x, int y) {
    mouse.set(x, y);
    Point up = new Point();
    Point low = new Point();
    for(int i = 3; i <= 6; i++) {
      for(int j = 1; j <= 3; j++) {
        up.set(space * j + buttonSize * (j-1), space * i + buttonSize * i);
        low.set(buttonSize + up.x, buttonSize + up.y);
        
        if(Tools.isInArea(mouse, up, low)) {
          if(i == 6) {
            switch(j) {
              case 1: {
                text += ".";
                break;
              }
              case 2: {
                text += "0";
                break;
              }
              case 3: {
                //text = "=";
                calculation();
                break;
              }
            }
          } else {
            text += ((Integer)(j + 3 * (i-3))).toString();
          }
        }
      }
    }
    for(int i = 1; i <= 5; i++) {
      float signSize = buttonSize * 4 + space * 5;
      signSize /= 6.5;
      up.set(space * 4 + buttonSize * 3, space * 3 + buttonSize * 2 + signSize * (i-1) + space * i);
      low.set(buttonSize + up.x, buttonSize + up.y);
      if(Tools.isInArea(mouse, up, low)) {
        switch(i) {
          case 1: {
            if(text.length() >= 1) {
              text = text.substring(0, text.length() - 1);
            }
            break;
          }
          case 2: {
            //res /= Integer.parseInt(text);
            text += "/";
            break;
          }
          case 3: {
            //res *= Integer.parseInt(text);
            text += "*";
            break;
          }
          case 4: {
            //res -= Integer.parseInt(text);
            text += "-";
            break;
          }
          case 5: {
            //res += Integer.parseInt(text);
            //text = ((Integer)res).toString();
            text += "+";
            break;
          }
        }
      }
    }
    
    drawResult(text);
  }
  
  void drawResult(String text) {
    textSize(32);
    fill(0,0,0);
    textAlign(RIGHT, CENTER);
    win.text(text, space, space, buttonSize * 4 + space * 3, buttonSize * 2 + space);
    textAlign(BASELINE);
  }
  
  void calculation() {
    try {
      ScriptEngineManager factory = new ScriptEngineManager();
      ScriptEngine engine = factory.getEngineByName("JavaScript");
      engine.eval("var num = " + text);
      Object result = engine.get("num");
      text = result.toString();
    } catch(ScriptException e) {
      //throw new RuntimeException(e);
      text = "Error";
    }
  }
    
}
