class Not {
  
  int xpos;
  int ypos;
  
  int mausX;
  int mausY;
  
  int multiplierX;
  int multiplierY;
  
  boolean ausgewählt;
  boolean eingang;
  boolean ausgang;
  boolean sichtbar;
  
  boolean a = false;
  boolean b = false;
  
  Verbindung verbindungA = new Verbindung();
  Verbindung verbindungB = new Verbindung();
  
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
    
    if(verbindungB.verbunden) {
      if(sichtbar) {
        verbindungB.xStart = xpos + 40;
        verbindungB.yStart = ypos + 20;
      } else {
        verbindungB.xStart = 340;
        verbindungB.yStart = ypos + 20;
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
      if(!verbindungsMod || !verbindung[verbindung.length - 1].ausgang) {
        if(mouseX >= xpos + 30 & mouseY >= ypos + 10 & mouseX <= xpos + 50 & mouseY <= ypos + 30 & !verbindungB.verbunden) {
          b = true;
          line(xpos + 30, ypos + 10, xpos + 50, ypos + 10);
          line(xpos + 50, ypos + 10, xpos + 50, ypos + 30);
          line(xpos + 50, ypos + 30, xpos + 30, ypos + 30);
          line(xpos + 30, ypos + 30, xpos + 30, ypos + 10);
        } else {
          b = false;
        }
      } else {
        b = false;
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
    
      triangle(xpos + 6, ypos + 10, xpos + 26, ypos + 20, xpos + 6, ypos + 30);
      ellipse(xpos + 30, ypos + 20, 8, 8);
      line(xpos, ypos + 20, xpos + 6, ypos + 20);
      line(xpos + 34, ypos + 20, xpos + 40, ypos + 20);
    }
  }
  
  void Operation() {
    
    if(verbindungA.on) {
      eingang = true;
    } else {
      eingang = false;
    }
    
    if(eingang) {
      ausgang = false;
    } else {
      ausgang = true;
    }
    
    if(ausgang) {
      verbindungB.on = true;
    } else {
      verbindungB.on = false;
    }
  }
  
  void mousePressed() {
    if(ausgewählt) {
      ausgewählt = false;
      direktVerbindungNicht(this);
    } else {
      if(mouseX >= xpos + 6 & mouseY >= ypos + 10 & mouseX <= xpos + 34 & mouseY <= ypos + 30 & !bewegungsMod) {
        ausgewählt = true;
        mausX = mouseX - xpos;
        mausY = mouseY - ypos;
        bewegungsMod = true;
        x = 1;
      }
    }
  }
}
