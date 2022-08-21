class Ausgang {
  
  int xpos;
  int ypos;
  int xsize;
  int ysize;
  
  int mausX;
  int mausY;
  
  int multiplierX;
  int multiplierY;
  
  boolean ausgang = false;
  boolean ausgewählt;
  boolean sichtbar;
  
  boolean a = false;
  
  Verbindung verbindungA = new Verbindung();
  
  void Zeichnen() {
   
    if(ausgewählt) {
      
      multiplierX = int((mouseX - mausX) / 20);
      multiplierY = int((mouseY - mausY) / 20);
      
      xpos = 20 * multiplierX;
      ypos = 20 * multiplierY;
      
      if(xpos > 320) {
        sichtbar = true;
      } else {
        sichtbar = false;
      }
    } 
    
    if(verbindungA.verbunden) {
      if(sichtbar) {
        verbindungA.xEnd = xpos;
        verbindungA.yEnd = ypos + 20;
      } else {
        verbindungA.xEnd = 340;
        verbindungA.yEnd = ypos + 20;
      }
    }
    
    stroke(0);
    strokeWeight(1);
    
    if(!ausgewählt & bearbeitungsMod & !bewegungsMod) {
      if(!verbindungsMod || verbindung[verbindung.length - 1].ausgang) {
        if(mouseX >= xpos - 10 & mouseY >= ypos + 10 & mouseX <= xpos + 10 & mouseY <= ypos + 30 & !verbindungA.verbunden) {
          a = true;
          line(xpos - 10, ypos + 10, xpos + 10, ypos + 10);
          line(xpos + 10, ypos + 10, xpos + 10, ypos + 30);
          line(xpos + 10, ypos + 30, xpos - 10, ypos + 30);
          line(xpos - 10, ypos + 30, xpos - 10, ypos + 10);
        } else {
          a = false;
        }
      } else {
        a = false;
      }
    }
    
    if(sichtbar) {

      fill(255);
      strokeWeight(2);
      
      if(ausgewählt) {
        stroke(100);
      } else {
        stroke(0);
      }
      
      ellipse(xpos + 20, ypos + 20, 30, 30);
      line(xpos, ypos + 20, xpos + 5, ypos + 20);
      
      if(ausgewählt) {
        fill(100);
      } else {
        if(ausgang) {
          fill(0, 200, 0);
        } else {
          fill(0, 100, 0);
        }
      }
    
      strokeWeight(1);
      ellipse(xpos + 20, ypos + 20, 22, 22);
    
      fill(255);
      textSize(15);
      textAlign(CENTER, CENTER);
    
      if(ausgang) {
        text("1", xpos + 20, ypos + 20 - textAscent() * 0.15);
      } else {
        text("0", xpos + 20, ypos + 20 - textAscent() * 0.15);
      }
    }
  }
  
  void Operation() {
    if(verbindungA.on) {
      ausgang = true;
    } else {
      ausgang = false;
    }
  }
  
  void mousePressed() {
    if(ausgewählt) {
      ausgewählt = false;
      direktVerbindungAusgang(this);
    } else {
      if(mouseX >= xpos + 5 & mouseY >= ypos + 5 & mouseX <= xpos + 35 & mouseY <= ypos + 35 & !bewegungsMod) {
        ausgewählt = true;
        mausX = mouseX - xpos;
        mausY = mouseY - ypos;
        bewegungsMod = true;
        x = 1;
      }
    }
  }
}
