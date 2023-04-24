// declaring vars
import processing.sound.*;
Animation sheepAnimation;
PImage[] sheepImages = new PImage[3];
PImage bushImage;
PImage carLeftImage;
PImage carRightImage;
PImage levelOneBackground;
PImage levelTwoBackground;
PImage levelThreeBackground;
PImage gameOverScreen;
PImage startScreen;

// global vars
int state = 0;

int startTime;
int currentTime;
int timer;

Player p1;
Bush firstB1;
Bush firstB2;
CarLeft firstL1;
CarLeft firstL2;
CarRight firstR1;
CarRight firstR2;

Bush secondB1;
Bush secondB2;
CarLeft secondL1;
CarLeft secondL2;
CarRight secondR1;
CarRight secondR2;

Bush thirdB1;
Bush thirdB2;
CarLeft thirdL1;
CarLeft thirdL2;
CarRight thirdR1;
CarRight thirdR2;

SoundFile busSound;
SoundFile pianoSound;
SoundFile leavesSound;

ArrayList<Bush> firstBushList;
ArrayList<CarLeft> firstCarLeftList;
ArrayList<CarRight> firstCarRightList;

ArrayList<Bush> secondBushList;
ArrayList<CarLeft> secondCarLeftList;
ArrayList<CarRight> secondCarRightList;

ArrayList<Bush> thirdBushList;
ArrayList<CarLeft> thirdCarLeftList;
ArrayList<CarRight> thirdCarRightList;



void setup() {
  size(800, 600);
  textAlign(CENTER);
  textSize(75);
  startTime = millis();
  timer = 0;

  // initializing vars
  p1 = new Player(width/2, height - 50, 50, 50);

  // level 1
  firstB1 = new Bush(width - 200, height/2, 100, 75);
  firstB2 = new Bush(width/4, height/2, 100, 75);

  firstL1 = new CarLeft(width, height/4 + 50, 100, 55);
  firstL2 = new CarLeft(width + 400, height/4 - 50, 100, 55);

  firstR1 = new CarRight(0, height - 150, 100, 55);
  firstR2 = new CarRight(0 - 400, height - 225, 100, 55);

  // level 2
  secondB1 = new Bush(width - 200, height/2 + 10, 100, 75);
  secondB2 = new Bush(width/3 - 75, height/4, 100, 75);

  secondL1 = new CarLeft(0 - 400, height - 225, 100, 55);
  secondL2 = new CarLeft(width + 400, height/4 - 85, 100, 55);

  secondR1 = new CarRight(width, height/4 + 75, 100, 55);
  secondR2 = new CarRight(0 - 400, height - 150, 100, 55);

  // level 3
  thirdB1 = new Bush(width/2, height/2, 100, 75);
  thirdB2 = new Bush(width/4*3, height/4 + 10, 100, 75);

  thirdL1 = new CarLeft(0, height - 150, 100, 55);
  thirdL2 = new CarLeft(0 - 400, height - 235, 100, 55);

  thirdR1 = new CarRight(width, height/4 + 70, 100, 55);
  thirdR2 = new CarRight(width + 400, height/4 - 80, 100, 55);

  // array list level 1
  firstBushList = new ArrayList<Bush>();
  firstCarLeftList = new ArrayList<CarLeft>();
  firstCarRightList = new ArrayList<CarRight>();

  firstBushList.add(firstB1);
  firstBushList.add(firstB2);
  firstCarLeftList.add(firstL1);
  firstCarLeftList.add(firstL2);
  firstCarRightList.add(firstR1);
  firstCarRightList.add(firstR2);

  // array list level 2
  secondBushList = new ArrayList<Bush>();
  secondCarLeftList = new ArrayList<CarLeft>();
  secondCarRightList = new ArrayList<CarRight>();

  secondBushList.add(secondB1);
  secondBushList.add(secondB2);
  secondCarLeftList.add(secondL1);
  secondCarLeftList.add(secondL2);
  secondCarRightList.add(secondR1);
  secondCarRightList.add(secondR2);

  // array list level 3
  thirdBushList = new ArrayList<Bush>();
  thirdCarLeftList = new ArrayList<CarLeft>();
  thirdCarRightList = new ArrayList<CarRight>();

  thirdBushList.add(thirdB1);
  thirdBushList.add(thirdB2);
  thirdCarLeftList.add(thirdL1);
  thirdCarLeftList.add(thirdL2);
  thirdCarRightList.add(thirdR1);
  thirdCarRightList.add(thirdR2);

  // sounds
  busSound = new SoundFile(this, "bus.wav");
  busSound.amp(0.20);
  pianoSound = new SoundFile(this, "piano.wav");
  pianoSound.amp(0.10);
  leavesSound = new SoundFile(this, "leaves.wav");
  leavesSound.amp(0.35);

  // picture setup
  bushImage = loadImage("bush0.png");
  bushImage.resize(int(bushImage.width*5),
    int(bushImage.height*5) );

  carLeftImage = loadImage("carLeft0.png");
  carLeftImage.resize(int(carLeftImage.width*5.5),
    int(carLeftImage.height*5.5) );

  carRightImage = loadImage("carRight0.png");
  carRightImage.resize(int(carRightImage.width*5.5),
    int(carRightImage.height*5.5) );

  levelOneBackground = loadImage("level_one.png");
  levelTwoBackground = loadImage("level_two.png");
  levelThreeBackground = loadImage("level_three.png");
  gameOverScreen = loadImage("game_over.png");
  startScreen = loadImage("start_screen.png");

  for (int index = 0; index < 3; index++) {
    sheepImages[index] = loadImage("sheepGIF" + index + ".png");
  }

  sheepAnimation = new Animation(sheepImages, 0.05, 4);
}  // end setup



void draw() {
  currentTime = millis();

  if (currentTime - startTime >= 1000) {
    startTime = millis();
    timer++;
  }


  // state case
  switch(state) {
  case 0:
    startScreen();
    resetThings();
    currentTime = 0;
    break;

  case 1:
    background(levelOneBackground);
    p1.render();
    p1.move();
    levelOne();

    textSize(32);
    fill(0);
    textAlign(CENTER);
    text("Score:", 0 + 80 - 36, 0 + 35);
    text(timer, 0 + 80 + 36, 0 + 35);

    // sound statements
    if (pianoSound.isPlaying() == false) {
      pianoSound.play();
    }

    // screne statememnts
    if (p1.top <= 0) {
      state = int(random(1, 4));
    }
    if (firstL1.collision == true ||
      firstL2.collision == true) {
      state = 4;
    }
    if (firstR1.collision == true ||
      firstR2.collision == true) {
      state = 4;
    }
    break;

  case 2:
    background(levelTwoBackground);
    p1.render();
    p1.reset();
    p1.move();
    levelTwo();

    textSize(32);
    fill(0);
    textAlign(CENTER);
    text("Score:", 0 + 80 - 36, 0 + 35);
    text(timer, 0 + 80 + 36, 0 + 35);

    // sound statements
    if (pianoSound.isPlaying() == false) {
      pianoSound.play();
    }

    // screne statememnts
    if (p1.top <= 0) {
      state = int(random(1, 4));
    }
    if (secondL1.collision == true ||
      secondL2.collision == true) {
      state = 4;
    }

    if (secondR1.collision == true ||
      secondR2.collision == true) {
      state = 4;
    }
    break;

  case 3:
    background(levelThreeBackground);
    p1.render();
    p1.reset();
    p1.move();
    levelThree();

    textSize(32);
    fill(0);
    textAlign(CENTER);
    text("Score:", 0 + 80 - 36, 0 + 35);
    text(timer, 0 + 80 + 36, 0 + 35);

    // sound statements
    if (pianoSound.isPlaying() == false) {
      pianoSound.play();
    }

    // screne statememnts
    if (p1.top <= 0) {
      state = int(random(1, 4));
    }
    if (thirdL1.collision == true ||
      thirdL2.collision == true) {
      state = 4;
    }

    if (thirdR1.collision == true ||
      thirdR2.collision == true) {
      state = 4;
    }
    break;

  case 4:
    startTime = millis();
    playerLose();
    break;
    
  }  // end state
}  // end draw


// screens
void startScreen() {
  background(startScreen);
  textSize(75);
  fill(color(255));

  if (pianoSound.isPlaying() == false) {
    pianoSound.play();
  }
}

void playerLose() {
  background(gameOverScreen);
  textSize(75);
  fill(color(255, 255, 167));

  text(timer, width - 175, height - 55);

  if (pianoSound.isPlaying() == true) {
    pianoSound.stop();
  }
}

void levelOne() {
  for (Bush aBush : firstBushList) {
    aBush.render();
    aBush.playerCollide(p1);
  }
  for (CarLeft aCar : firstCarLeftList) {
    aCar.render();
    aCar.move();
    aCar.reset();
    aCar.playerCollide(p1);
  }
  for (CarRight aCar : firstCarRightList) {
    aCar.render();
    aCar.move();
    aCar.reset();
    aCar.playerCollide(p1);
  }
}

void levelTwo() {
  for (Bush aBush : secondBushList) {
    aBush.render();
    aBush.playerCollide(p1);
  }
  for (CarLeft aCar : secondCarLeftList) {
    aCar.render();
    aCar.move();
    aCar.reset();
    aCar.playerCollide(p1);
  }
  for (CarRight aCar : secondCarRightList) {
    aCar.render();
    aCar.move();
    aCar.reset();
    aCar.playerCollide(p1);
  }
}

void levelThree() {
  for (Bush aBush : thirdBushList) {
    aBush.render();
    aBush.playerCollide(p1);
  }
  for (CarLeft aCar : thirdCarLeftList) {
    aCar.render();
    aCar.move();
    aCar.reset();
    aCar.playerCollide(p1);
  }
  for (CarRight aCar : thirdCarRightList) {
    aCar.render();
    aCar.move();
    aCar.reset();
    aCar.playerCollide(p1);
  }
}


// keys
void keyPressed() {
  if (key == 'r') {
    state += 1; // random state

    if (state >= 2) { // if statte is too big, start over
      state = 0;
    }
  }

  if (key == 'a') {
    p1.isMovingLeft = true;
    sheepAnimation.isAnimating = true;
  }
  if (key == 'd') {
    p1.isMovingRight = true;
    sheepAnimation.isAnimating = true;
  }
  if (key == 'w') {
    p1.isMovingUp = true;
    sheepAnimation.isAnimating = true;
  }
  if (key == 's') {
    p1.isMovingDown = true;
    sheepAnimation.isAnimating = true;
  }
}

void keyReleased() {
  if (key == 'a') {
    p1.isMovingLeft = false;
    sheepAnimation.isAnimating = false;
  }
  if (key == 'd') {
    p1.isMovingRight = false;
    sheepAnimation.isAnimating = false;
  }
  if (key == 'w') {
    p1.isMovingUp = false;
    sheepAnimation.isAnimating = false;
  }
  if (key == 's') {
    p1.isMovingDown = false;
    sheepAnimation.isAnimating = false;
  }
}


// funciton instead of calling setup
void resetThings() {
  startTime = millis();
  timer = 0;

  // initializing vars
  p1 = new Player(width/2, height - 50, 50, 50);

  // level 1
  firstB1 = new Bush(width - 200, height/2, 100, 75);
  firstB2 = new Bush(width/4, height/2, 100, 75);

  firstL1 = new CarLeft(width, height/4 + 50, 100, 55);
  firstL2 = new CarLeft(width + 400, height/4 - 50, 100, 55);

  firstR1 = new CarRight(0, height - 150, 100, 55);
  firstR2 = new CarRight(0 - 400, height - 225, 100, 55);

  // level 2
  secondB1 = new Bush(width - 200, height/2 + 10, 100, 75);
  secondB2 = new Bush(width/3 - 75, height/4, 100, 75);

  secondL1 = new CarLeft(0 - 400, height - 225, 100, 55);
  secondL2 = new CarLeft(width + 400, height/4 - 85, 100, 55);

  secondR1 = new CarRight(width, height/4 + 75, 100, 55);
  secondR2 = new CarRight(0 - 400, height - 150, 100, 55);

  // level 3
  thirdB1 = new Bush(width/2, height/2, 100, 75);
  thirdB2 = new Bush(width/4*3, height/4 + 10, 100, 75);

  thirdL1 = new CarLeft(0, height - 150, 100, 55);
  thirdL2 = new CarLeft(0 - 400, height - 235, 100, 55);

  thirdR1 = new CarRight(width, height/4 + 70, 100, 55);
  thirdR2 = new CarRight(width + 400, height/4 - 80, 100, 55);

  // array list level 1
  firstBushList = new ArrayList<Bush>();
  firstCarLeftList = new ArrayList<CarLeft>();
  firstCarRightList = new ArrayList<CarRight>();

  firstBushList.add(firstB1);
  firstBushList.add(firstB2);
  firstCarLeftList.add(firstL1);
  firstCarLeftList.add(firstL2);
  firstCarRightList.add(firstR1);
  firstCarRightList.add(firstR2);

  // array list level 2
  secondBushList = new ArrayList<Bush>();
  secondCarLeftList = new ArrayList<CarLeft>();
  secondCarRightList = new ArrayList<CarRight>();

  secondBushList.add(secondB1);
  secondBushList.add(secondB2);
  secondCarLeftList.add(secondL1);
  secondCarLeftList.add(secondL2);
  secondCarRightList.add(secondR1);
  secondCarRightList.add(secondR2);

  // array list level 3
  thirdBushList = new ArrayList<Bush>();
  thirdCarLeftList = new ArrayList<CarLeft>();
  thirdCarRightList = new ArrayList<CarRight>();

  thirdBushList.add(thirdB1);
  thirdBushList.add(thirdB2);
  thirdCarLeftList.add(thirdL1);
  thirdCarLeftList.add(thirdL2);
  thirdCarRightList.add(thirdR1);
  thirdCarRightList.add(thirdR2);
}
