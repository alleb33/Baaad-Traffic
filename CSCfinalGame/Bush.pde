class Bush{
 
  // vars
  int x;
  int y;
  int w;
  int h;
  
  int left; 
  int right;
  int top;
  int bottom;
  
  int buffer;
  
  // constructor
  Bush(int startingX, int startingY, int startingW, int startingH){
    x = startingX;
    y = startingY;
    w = startingW;
    h = startingH;
    
    buffer = 10;
    
    left = x - w/2;
    right = x + w/2;
    top = y - h/2;
    bottom = y + h/2;
  }
  
  void render(){
    fill(107, 213, 149);
    rectMode(CENTER);
    image(bushImage, x, y);
    
    //line(left, top, right, top);
    //line(left, bottom, right, bottom);
    //line(left, top, left, bottom);
    //line(right, top, right, bottom);
  }
  
  void playerCollide(Player aPlayer){
    if (aPlayer.top <= bottom &&
        aPlayer.bottom >= top &&
        aPlayer.right > left &&
        aPlayer.left <= left &&
        aPlayer.isMovingRight == true){
          aPlayer.isMovingRight = false;
          //aPlayer.x = left - aPlayer.w/2 - buffer;
          aPlayer.x -= aPlayer.speed;
          if (leavesSound.isPlaying() == false){
            leavesSound.play();
          }
        }
    if (aPlayer.top <= bottom &&
        aPlayer.bottom >= top &&
        aPlayer.left < right &&
        aPlayer.right >= right &&
        aPlayer.isMovingLeft == true){
          aPlayer.isMovingLeft = false;
          //aPlayer.x = right + aPlayer.w/2 + buffer;
          aPlayer.x += aPlayer.speed;
          if (leavesSound.isPlaying() == false){
            leavesSound.play();
          }
        }
     if (aPlayer.left <= right &&
        aPlayer.right >= left &&
        aPlayer.bottom > top &&
        aPlayer.top <= top && 
        aPlayer.isMovingDown == true){
          aPlayer.isMovingDown = false;
          //aPlayer.y = top - aPlayer.h/2 - buffer;
          aPlayer.y -= aPlayer.speed;
          if (leavesSound.isPlaying() == false){
            leavesSound.play();
          }
        }
     if (aPlayer.left <= right &&
        aPlayer.right >= left &&
        aPlayer.top < bottom &&
        aPlayer.bottom >= bottom &&
        aPlayer.isMovingUp == true){
          aPlayer.isMovingUp = false;
          //aPlayer.y = bottom + aPlayer.h/2 + buffer;
          aPlayer.y += aPlayer.speed;
          if (leavesSound.isPlaying() == false){
            leavesSound.play();
          }
        }
    }
  
  
}
