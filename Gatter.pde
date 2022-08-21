class Gatter {
  
  int xpos;
  int ypos;
  int xsize;
  int ysize;
  
  int mausX;
  int mausY;
  
  int multiplierX;
  int multiplierY;
  
  boolean ausgewählt;
  boolean[] eingänge = new boolean[2];
  boolean ausgang = false;
  boolean sichtbar;
  
  boolean a = false;
  boolean b = false;
  boolean c = false;
  
  Verbindung verbindungA = new Verbindung();
  Verbindung verbindungB = new Verbindung();
  Verbindung verbindungC = new Verbindung();
  
  String welchesGatter = "";
  
  void Zeichnen() {
        
    xsize = 60;
    ysize = 80;
    
    if(ausgewählt) {
      
      multiplierX = int((mouseX - mausX) / 20);
      multiplierY = int((mouseY - mausY) / 20);
      
      xpos = 20 * multiplierX;
      ypos = 20 * multiplierY;
      
      if(xpos - 20 > 320) {
        sichtbar = true;
      } else {
        sichtbar = false;
      }
    }
    
    if(verbindungA.verbunden) {
      if(sichtbar) {
        verbindungA.xEnd = xpos - 20;
        verbindungA.yEnd = ypos + 20;
      } else {
        verbindungA.xEnd = 340;
        verbindungA.yEnd = ypos + 20;
      }
    }
    
    if(verbindungB.verbunden) {
      if(sichtbar) {
        verbindungB.xEnd = xpos - 20;
        verbindungB.yEnd = ypos + 60;
      } else {
        verbindungB.xEnd = 340;
        verbindungB.yEnd = ypos + 60;
      }
    }
    
    if(verbindungC.verbunden) {
      if(sichtbar) {
        verbindungC.xStart = xpos + 80;
        verbindungC.yStart = ypos + 40;
      } else {
        verbindungC.xStart = 340;
        verbindungC.yStart = ypos + 40;
      }
    }
    
    stroke(0);
    strokeWeight(1);
    
    if(!ausgewählt & bearbeitungsMod & !bewegungsMod) {
      if(!verbindungsMod || verbindung[verbindung.length - 1].ausgang) {
        if(mouseX >= xpos - 30 & mouseY >= ypos + 10 & mouseX <= xpos - 10 & mouseY <= ypos + 30 & !verbindungA.verbunden) {
          a = true;
          line(xpos - 30, ypos + 10, xpos - 10, ypos + 10);
          line(xpos - 10, ypos + 10, xpos - 10, ypos + 30);
          line(xpos - 10, ypos + 30, xpos - 30, ypos + 30);
          line(xpos - 30, ypos + 30, xpos - 30, ypos + 10);
        } else {
          a = false;
        }
      } else {
        a = false;
      }
      if(!verbindungsMod || verbindung[verbindung.length - 1].ausgang) {
        if(mouseX >= xpos - 30 & mouseY >= ypos + 50 & mouseX <= xpos - 10 & mouseY <= ypos + 70 & !verbindungB.verbunden) {
          b = true;
          line(xpos - 30, ypos + 50, xpos - 10, ypos + 50);
          line(xpos - 10, ypos + 50, xpos - 10, ypos + 70);
          line(xpos - 10, ypos + 70, xpos - 30, ypos + 70);
          line(xpos - 30, ypos + 70, xpos - 30, ypos + 50);
        } else {
          b = false;
        }
      } else {
        b = false;
      }
      if(!verbindungsMod || !verbindung[verbindung.length - 1].ausgang) {
        if(mouseX >= xpos + 70 & mouseY >= ypos + 30 & mouseX <= xpos + 90 & mouseY <= ypos + 50 & !verbindungC.verbunden) {
          c = true;
          line(xpos + 70, ypos + 30, xpos + 90, ypos + 30);
          line(xpos + 90, ypos + 30, xpos + 90, ypos + 50);
          line(xpos + 90, ypos + 50, xpos + 70, ypos + 50);
          line(xpos + 70, ypos + 50, xpos + 70, ypos + 30);
        } else {
          c = false;
        }
      } else {
        c = false;
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
    
      rect(xpos, ypos, xsize, ysize);
      line(xpos - 20, ypos + 20, xpos, ypos + 20);
      line(xpos - 20, ypos + 60, xpos, ypos + 60);
      
      if(welchesGatter == "Nand" || welchesGatter == "Nor" || welchesGatter == "Xnor") {
        ellipse(xpos + 64, ypos + 40, 8, 8);
        line(xpos + 68, ypos + 40, xpos + 80, ypos + 40);
      } else {
        line(xpos + 60, ypos + 40, xpos + 80, ypos + 40);
      }
    
      if(ausgewählt) {
        fill(100);
      } else {
        fill(0);
      }
      
      textSize(12);
      textAlign(LEFT, CENTER);
    
      if(eingänge[0]) {
        text("1", xpos + 5, ypos + 20 - textAscent() * 0.15);
      } else {
        text("0", xpos + 5, ypos + 20 - textAscent() * 0.15);
      }
    
      if(eingänge[1]) {
        text("1", xpos + 5, ypos + 60 - textAscent() * 0.15);
      } else {
        text("0", xpos + 5, ypos + 60 - textAscent() * 0.15);
      }
    
      if(ausgang) {
        text("1", xpos + xsize - 5 - textWidth("1"), ypos + 40 - textAscent() * 0.15);
      } else {
        text("0", xpos + xsize - 5 - textWidth("0"), ypos + 40 - textAscent() * 0.15);
      }
    
      textSize(30);
      textAlign(CENTER, CENTER);
    
      int textXpos = xpos + xsize / 2;
      float textYpos = ypos + ysize / 2 - textAscent() * 0.15;
    
      if(welchesGatter == "And") {
        text("&", textXpos, textYpos);
      } else if(welchesGatter == "Or") {
        text("≥1", textXpos, textYpos);
      } else if(welchesGatter == "Nand") {
        text("&", textXpos, textYpos);
      } else if(welchesGatter == "Nor") {
        text("≥1", textXpos, textYpos);
      } else if(welchesGatter == "Xor") {
        text("=1", textXpos, textYpos);
      } else if(welchesGatter == "Xnor") {
        text("=1", textXpos, textYpos);
      }
    }
  }
  
  void Operation() {
    
    if(verbindungA.on) {
      eingänge[0] = true;
    } else {
      eingänge[0] = false;
    }
    
    if(verbindungB.on) {
      eingänge[1] = true;
    } else {
      eingänge[1] = false;
    }
    
    if(welchesGatter == "And") {
      if(eingänge[0] & eingänge[1]) {
        ausgang = true;
      } else {
        ausgang = false;
      }
    } else if(welchesGatter == "Or") {
      if(eingänge[0] || eingänge[1]) {
        ausgang = true;
      } else {
        ausgang = false;
      }
    } else if(welchesGatter == "Nand") {
      if(!eingänge[0] || !eingänge[1]) {
        ausgang = true;
      } else {
        ausgang = false;
      }
    } else if(welchesGatter == "Nor") {
      if(!eingänge[0] & !eingänge[1]) {
        ausgang = true;
      } else {
        ausgang = false;
      }
    } else if(welchesGatter == "Xor") {
      if(!eingänge[0] & eingänge[1]) {
        ausgang = true;
      } else if(eingänge[0] & !eingänge[1]) {
        ausgang = true;
      } else {
        ausgang = false;
      }
    } else if(welchesGatter == "Xnor") {
      if(!eingänge[0] & !eingänge[1]) {
        ausgang = true;
      } else if(eingänge[0] & eingänge[1]) {
        ausgang = true;
      } else {
        ausgang = false;
      }
    }
    
    if(ausgang) {
      verbindungC.on = true;
    } else {
      verbindungC.on = false;
    }
  }
  
  void mousePressed() {
    if(ausgewählt) {
      ausgewählt = false;
      direktVerbindungGatter(this);
    } else {
      if(mouseX >= xpos & mouseY >= ypos & mouseX <= xpos + xsize & mouseY <= ypos + ysize & !bewegungsMod) {
        ausgewählt = true;
        mausX = mouseX - xpos;
        mausY = mouseY - ypos;
        bewegungsMod = true;
        x = 1;
      }
    }
  }
}
