void setup()
{
  noLoop();
  size(190, 190);
}

boolean[][] faces = {
  { // 0
    false, false, false,
    false, false, false,
    false, false, false,
  },
  { // 1
    false, false, false,
    false, true, false,
    false, false, false,
  },
  { // 2
    true, false, false,
    false, false, false,
    false, false, true,
  },
  { // 3 
    true, false, false,
    false, true, false,
    false, false, true,
  },
  { // 4
    true, false, true,
    false, false, false,
    true, false, true,
  },
  { // 5
    true, false, true,
    false, true, false,
    true, false, true,
  },
  { // 6
    true, false, true,
    true, false, true,
    true, false, true,
  },
};


void draw() {
  background(51);
  ArrayList<Die> dice = new ArrayList<Die>();

  for (int y = 0; y < 3; y += 1) {
    for (int x = 0; x < 3; x += 1) {
      dice.add(new Die(6));
    }
  }

  for (Die die : dice) {
    die.roll();
  }
  
  int total = 0;
  
  for (Die die : dice) {
    total += die.value;
  }

  for (int y = 0; y < 3; y += 1) {
    for (int x = 0; x < 3; x += 1) {
      dice.get(y*3+x).show(y*60+10, x*60+10);
    }
  }
  
  text("Total: " + total, 10, 10);
}
void mousePressed()
{
  redraw();
}

class Die //models one single dice cube
{
  //variable declarations here

  int value;
  int range;
  
  Die(int i_range) //constructor
  {
    range = i_range;
    //variable initializations here
  }
  void roll()
  {
    value = (int)(Math.random()*range)+1;
    //your code here
  }
  void show(int x, int y)
  {

    rect(x,y, 50, 50);
    fill(0x00, 0x00, 0x00);
    for (int iy = 0; iy < 3; iy += 1) {
      for (int ix = 0; ix < 3; ix += 1) {
        if (faces[value][iy*3+ix]) {
          ellipse(x+(15*ix)+10,y+(15*iy)+10, 10, 10);
        }
      }
    }
    fill(0xFF, 0xFF, 0xFF);
    //your code here
  }
}
