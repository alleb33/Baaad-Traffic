class CarRight {
  // class variables
  int x;
  int y;
  int w;
  int h;
  color c;
  
  float speed;

  int left;
  int right;
  int top;
  int bottom;
  
  boolean collision;

  // constructor function
  CarRight(int startingX, int startingY, int startingW, int startingH) {
    x = startingX;
    y = startingY;
    w = startingW;
    h = startingH;
    c = color(random(0, 255), random(0, 255), random(0, 255));
    speed = random(3, 7);
    
    left = x - w/2;
    right = x + w/2;
    top = y - h/2;
    bottom = y + h/2;
    
    collision = false;
  }

  // functions definitions
  void render() {
    rectMode(CENTER);
    fill(c);
    image(carRightImage, x, y);
    
    //line(left, top, right, top);
    //line(left, bottom, right, bottom);
    //line(left, top, left, bottom);
    //line(right, top, right, bottom);
  }

  void move() {
    left = x - w/2;
    right = x + w/2;
    top = y - h/2;
    bottom = y + h/2;
    
    x += speed;
  }

  void reset() {
    // detects wall detection
    if (x - w/2 >= width) {
      x = 0 - w/2;
    }
  }
  
  void playerCollide(Player aPlayer){
    if (aPlayer.top <= bottom &&
        aPlayer.bottom >= top &&
        aPlayer.right > left &&
        aPlayer.left <= left){
          aPlayer.x = width/2;
          aPlayer.y = height - h/2;
          collision = true;
          
          if (busSound.isPlaying() == false){
            busSound.play();
          }
        }
    if (aPlayer.top <= bottom &&
        aPlayer.bottom >= top &&
        aPlayer.left < right &&
        aPlayer.right >= right){
          aPlayer.x = width/2;
          aPlayer.y = height - h/2;
          collision = true;
          
          if (busSound.isPlaying() == false){
            busSound.play();
          }
        }
     if (aPlayer.left <= right &&
        aPlayer.right >= left &&
        aPlayer.bottom > top &&
        aPlayer.top <= top){
          aPlayer.x = width/2;
          aPlayer.y = height - h/2;
          collision = true;
          
          if (busSound.isPlaying() == false){
            busSound.play();
          }
        }
     if (aPlayer.left <= right &&
        aPlayer.right >= left &&
        aPlayer.top < bottom &&
        aPlayer.bottom >= bottom){
          aPlayer.x = width/2;
          aPlayer.y = height - h/2;
          collision = true;
          
          if (busSound.isPlaying() == false){
            busSound.play();
          }
        }
    }
    
    
    
    
}
