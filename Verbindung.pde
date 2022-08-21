class Verbindung {
  
  int xStart = 0;
  int yStart = 0;
  int xEnd = 0;
  int yEnd = 0;
  
  boolean ausgang = false;
  boolean on = false;
  boolean verbunden = false;
  
  void Zeichnen() {
    
    if(verbunden) {
      
      if(xStart != xEnd & yStart != yEnd) {
        
        if(xStart < xEnd) {
          
          int differenz = xEnd - xStart;
          differenz = differenz / 20;
          
          if(differenz % 2 == 0) {
            
            Grade grade1 = new Grade();
            grade1.xStart = xStart;
            grade1.yStart = yStart;
            grade1.xEnd = xStart + differenz / 2 * 20;
            grade1.yEnd = yStart;
            grade1.Zeichnen();
            
            Grade grade2 = new Grade();
            grade2.xStart = xStart + differenz / 2 * 20;
            grade2.yStart = yStart;
            grade2.xEnd = xStart + differenz / 2 * 20;
            grade2.yEnd = yEnd;
            grade2.Zeichnen();
            
            Grade grade3 = new Grade();
            grade3.xStart = xStart + differenz / 2 * 20;
            grade3.yStart = yEnd;
            grade3.xEnd = xEnd;
            grade3.yEnd = yEnd;
            grade3.Zeichnen();
            
          } else {
            
            if(differenz == 1) {
              
              Grade grade1 = new Grade();
              grade1.xStart = xStart;
              grade1.yStart = yStart;
              grade1.xEnd = xEnd;
              grade1.yEnd = yStart;
              grade1.Zeichnen();
              
              Grade grade2 = new Grade();
              grade2.xStart = xEnd;
              grade2.yStart = yStart;
              grade2.xEnd = xEnd;
              grade2.yEnd = yEnd;
              grade2.Zeichnen();
              
            } else {
              
              Grade grade1 = new Grade();
              grade1.xStart = xStart;
              grade1.yStart = yStart;
              grade1.xEnd = xStart + (differenz + 1) / 2 * 20;
              grade1.yEnd = yStart;
              grade1.Zeichnen();
              
              Grade grade2 = new Grade();
              grade2.xStart = xStart + (differenz + 1) / 2 * 20;
              grade2.yStart = yStart;
              grade2.xEnd = xStart + (differenz + 1) / 2 * 20;
              grade2.yEnd = yEnd;
              grade2.Zeichnen();
              
              Grade grade3 = new Grade();
              grade3.xStart = xStart + (differenz + 1) / 2 * 20;
              grade3.yStart = yEnd;
              grade3.xEnd = xEnd;
              grade3.yEnd = yEnd;
              grade3.Zeichnen();
            }
          }
        } else if(xStart > xEnd) {
          
          int differenz = yEnd - yStart;
          differenz = differenz / 20;
          
          if(differenz % 2 == 0) {
            
            Grade grade1 = new Grade();
            grade1.xStart = xStart;
            grade1.yStart = yStart;
            grade1.xEnd = xStart; 
            grade1.yEnd = yStart + differenz / 2 * 20; 
            grade1.Zeichnen();
            
            Grade grade2 = new Grade();
            grade2.xStart = xStart;
            grade2.yStart = yStart + differenz / 2 * 20;
            grade2.xEnd = xEnd;
            grade2.yEnd = yStart + differenz / 2 * 20;
            grade2.Zeichnen();
            
            Grade grade3 = new Grade();
            grade3.xStart = xEnd; 
            grade3.yStart = yStart + differenz / 2 * 20; 
            grade3.xEnd = xEnd; 
            grade3.yEnd = yEnd;
            grade3.Zeichnen();
            
          } else {
            
            if(differenz == 1 || differenz == -1) {
              
              Grade grade1 = new Grade();
              grade1.xStart = xStart; 
              grade1.yStart = yStart; 
              grade1.xEnd = xEnd; 
              grade1.yEnd = yStart;
              grade1.Zeichnen();
              
              Grade grade2  = new Grade();
              grade2.xStart = xEnd; 
              grade2.yStart = yStart; 
              grade2.xEnd = xEnd; 
              grade2.yEnd = yEnd;
              grade2.Zeichnen();
              
            } else {
              
              Grade grade1 = new Grade();
              grade1.xStart = xStart; 
              grade1.yStart = yStart; 
              grade1.xEnd = xStart;
              if(differenz < 0) {
                grade1.yEnd = yStart + (differenz - 1) / 2 * 20;
              } else {
                grade1.yEnd = yStart + (differenz + 1) / 2 * 20;
              }
              grade1.Zeichnen();
              
              Grade grade2  = new Grade();
              grade2.xStart = xStart;
              if(differenz < 0) {
                grade2.yStart = yStart + (differenz - 1) / 2 * 20;
              } else {
                grade2.yStart = yStart + (differenz + 1) / 2 * 20;
              }
              grade2.xEnd = xEnd;
              if(differenz < 0) {
                grade2.yEnd = yStart + (differenz - 1) / 2 * 20;
              } else {
                grade2.yEnd = yStart + (differenz + 1) / 2 * 20;
              }
              grade2.Zeichnen();
              
             Grade grade3  = new Grade();
              grade3.xStart = xEnd;
              if(differenz < 0) {
                grade3.yStart = yStart + (differenz - 1) / 2 * 20;
              } else {
                grade3.yStart = yStart + (differenz + 1) / 2 * 20;
              }
              grade3.xEnd = xEnd; 
              grade3.yEnd = yEnd; 
              grade3.Zeichnen();
     
            }
          }
        }
      } else {
        stroke(0);
        strokeWeight(2);
        line(xStart, yStart, xEnd, yEnd);
      }
    }
  }
}
