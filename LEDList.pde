int col = 12;
int row = 14;
int[][] led = new int[col][row];//12cols x 14rows 

int ledLoc = 0;
int[] ledLength = {13, 12, 11, 7, 7, 8, 11, 8, 9, 9, 7};

int w = 400/14;
int ledX = -1;
int ledY;
void setup() {
  size(400, 400);
  frameRate(6);

  //LED Matrix Initiate
  for (int y=0; y<led.length; y++) {
    for (int x=0; x<led[y].length; x++) {
      led[y][x] = -1;
    }
  }

  //Set 1st LED position of every LEDstrip
  for (int y=0; y<led.length-1; y++) {
    if (y==0) {
      led[y][0]=0;
    } else {
      led[y][0]=led[y-1][0]+ledLength[y-1];
    }
    //print((y+1)+":"+led[y][0]+",");
  }

  //Initiate every posible LEDs
  for (int y=0; y<led.length-1; y++) {
    for (int x=0; x<ledLength[ledLoc]; x++) {
      led[y][x+1] = led[y][x]+1;
      //print(led[y][x]+",");
    }
    ledLoc++;
    //println();
  }
}

void draw() {
  //LEDBoard Visualization
  background(255);
  for (int y=0; y<w; y++) {
    for (int x=0; x<w; x++) {
      stroke(0);
      noFill();
      rect(x*w, y*w, w, w);

      stroke(0);
      noFill();
      ellipse(x*w+w/2, y*w+w/2, w/2, w/2);
    }
  }
  //TurnOn exist LEDs
  for (ledY=0; ledY<11; ledY++) {
    if (ledX<ledLength[ledY]) {
      fill(255, 0, 0);
      ellipse(ledX*w+w/2, ledY*w+w/2, w/2, w/2);
    }
  }
  if (ledX < 14) {
    ledX++;
  }
}
