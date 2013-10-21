PFont font;
String lines[] = loadStrings("http://databeleving.nl/processing/knmi.txt");

void setup() {
  size(800, 400);
  frameRate(30);
  noStroke();

}
 
void draw() {
  fill(0, 46, 184);
  background(255);
  fill(0);
  text("bron: KNMI", (width - 80), (height - 15));
  text("Temperaturen in augustus 2013, Eindhoven", (240), (20));
 
  for (int i = 12 ; i < lines.length; i++) { 

  String[] list = split(lines[i], ',');

  int maxTemp = int(trim(list[3]));
  int minTemp = int(trim(list[2]));
  int avTemp = (maxTemp + minTemp)/2; 
  String labelMax = "" + (maxTemp / 10);
  String labelMin = "" + (minTemp / 10);
  String labelGem = "" + ((maxTemp + minTemp)/2 / 10);
  
  int x = (i * 20) - 120;
    
    if (mouseX>x && mouseX<=x+20 && mouseY<=(height/2)) {

      fill(0);
      text(labelMax + " graden", x-6, 40);
      text(labelGem + " graden", 30, (height/2)+10);
      text("Max. temp.", 30, 40);

      fill(185, 54, 54);
    }
 
   else if (mouseX>x && mouseX<=x+20 && mouseY>(height/2)) {
     
     fill(0);
     text(labelMin + " graden", x-6, (height-20));
     text(labelGem + " graden", 30, (height/2)+10);
     text("Min. temp.", 30, (height-20));
     
     fill(68, 143, 182);
   
   }
    else {
      fill(0);
    }
 
 
    float h = map(maxTemp, 150 , 361, 10, 150);
    rect(x, (height-(h))-200, 10, h);
 
    float s = map(minTemp, 88, 194, 10, 150);
    rect(x, 210, 10, s);
 
    x+=40;
  }
}
