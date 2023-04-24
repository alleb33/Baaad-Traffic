class Player {
  
  // vars
  int x;
  int y;
  int w;
  int h;
  
  boolean isMovingLeft;
  boolean isMovingRight;
  boolean isMovingUp;
  boolean isMovingDown;
  
  int speed;
  int buffer;
  
  int left;
  int right;
  int top;
  int bottom;
  
  // consttructor
  Player(int startingX, int startingY, int startingW, int startingH){
    x = startingX;
    y = startingY;
    w = startingW;
    h = startingH;
    
    isMovingLeft = false;
    isMovingRight = false;
    isMovingUp = false;
    isMovingDown = false;
    
    speed = 5;
    buffer = 6;
    
    left = x - w/2 - buffer;
    right = x + w/2 + buffer;
    top = y - h/2 - buffer;
    bottom = y + h/2 + buffer;
  }
  
  // functions
  
  void reset(){
    if(top <=0){
      y = height - 50;
    }
  }
  
  void render(){
    fill(255);
    rectMode(CENTER);
    sheepAnimation.display(x, y);
    
    //line(left, top, right, top);
    //line(left, bottom, right, bottom);
    //line(left, top, left, bottom);
    //line(right, top, right, bottom);
  }
  
  void move(){
    left = x - w/2 - buffer;
    right = x + w/2 + buffer;
    top = y - h/2 - buffer;
    bottom = y + h/2 + buffer;
    
    if (isMovingLeft ==true){
      x -= speed;
    }
    if (isMovingRight ==true){
      x += speed;
    }
    if (isMovingUp ==true){
      y -= speed;
    }
    if (isMovingDown ==true){
      y += speed;
    }
  }
  
}
