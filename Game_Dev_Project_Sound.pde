import processing.sound.*;
SoundFile file;
String[] songs = {"level1.mp3","level2.mp3","level3.mp3","level4.mp3","level5.mp3","level6.mp3"};
String loadingSound = "loading.wav";
String path;

Player player;
Car[] car;

float grid = 50;
String score_display = "Score: ";
int score = 0;
PFont font;
// game state variables
int gameState;
public final int INTRO = 1;
public final int PLAY = 2;
public final int PAUSE = 3;
public final int GAMEOVER = 4;
public final int OBJECTIVE = 5;


void setup() {
  size(600, 600);
  path = sketchPath("assets/" + loadingSound);
  file = new SoundFile(this, path);
  delay(1000);
  file.play();
  font = createFont("Cambria", 32); 
  frameRate(24);
  player = new Player(width/2-grid/2, height-grid, grid);
  gameState = INTRO;
  for (int i = 0; i < 6; i++) // Load all songs into memory
    {
      path = sketchPath("assets/" + songs[i]);
      file = new SoundFile(this, path);
    }
  if (score < 50)
    path = sketchPath("assets/" + songs[score/10]);
  else
     path = sketchPath("assets/" + songs[5]);
  file = new SoundFile(this, path);
  file.stop();
  file.play();
}



void draw()
{  
  switch(gameState) 
  {
    case INTRO:
      drawScreen("Welcome!", "Press \"s\" to start \n Press \"o\" for objective");
      break;
    case OBJECTIVE:
      drawObjective("Objective", "Objective: Move the white box to reach the \nwhite strip at the top of the screen\n to earn points \n without colliding with the other boxes. \nPress \"r\" to return ");
    break;
    case PAUSE:
      drawScreen("PAUSED", "Press \"p\" to resume");
      break;
    case GAMEOVER:
      drawScreen("GAME OVER", "Press \"s\" to try again \nPress \"e\" to exit game");
      break;
    case PLAY:
      background(0);
      controlDisplay("Controls: Arrow Keys");
      text(score_display, 200, 40);
      text(score, 350, 40);
      

      fill(215);
      rect(0,height-grid,width,grid);
      rect(0,height-grid*10,width,grid);
      player.show();
      if (player.y == height-grid*10)  {
        player = new Player(width/2-grid/2, height-grid, grid);
        score +=10;
        //stop current song, play next song
        file.stop();
        if (score <= 50)
        {
          path = sketchPath("assets/" + songs[score/10]);
          file = new SoundFile(this, path);
          file.loop();
        }
        else
        {
          path = sketchPath("assets/" + songs[5]); // final song will repeat for higher levels
          file = new SoundFile(this, path);
          file.loop((score / 10) - 4); // starts increasing song playback speed
        }
      }
       
      int red[] = {255,0,0};
      int green[] = {0,255,0};
      int blue[] = {0,0,255};
      int purple[] = {255,0,255};
      int yellow[] = {255,255,0};
      int cyan[] = {0,255,255};

      int[] colors[] = {red,green,blue,purple,yellow,cyan};
      
      for (Car car : car) {
        if (score <= 50)
        {
          car.show(colors[score/10]);
        }
        else if (score > 50)
        {
           car.show(colors[int(random(0,5))]); 
        }
        car.update(score);
        if (player.intersect(car)) {
          //drawScreen("GAME OVER", "Press s to try again");
          gameState = GAMEOVER;
          player = new Player(width/2-grid/2, height-grid, grid);
          score = 0;
          // stop current song, play song 1
          file.stop();
          path = sketchPath("assets/" + songs[score/10]);
          file = new SoundFile(this, path);
          file.play(); 
      }
    }
  }
}
       
      
void initializeGame() 
{
  int index = 0;
  car = new Car[15];
  
  //Row 1
  for (int i = 0; i < 2; i++) {
    float x = i * 500;
    car[index] = new Car(x, height-grid*2, grid*2, grid, 2);
    index++;
  }
  
    //Row 2
  for (int i = 0; i < 2; i++) {
    float x = i * 200 + 150;
    car[index] = new Car(x, height-grid*3, grid, grid, -4.5);
    index++;
  }
  
    //Row 3
  for (int i = 0; i < 3; i++) {
    float x = i * 150 + 25;
    car[index] = new Car(x, height-grid*4, grid, grid, 1.5);
    index++;
  }
  
    //Row 4
    for (int i = 0; i < 4; i++) {
    float x = i * 150 + 25;
    car[index] = new Car(x, height-grid*5, grid, grid, -3);
    index++;
  }
  
    //Row 5
    for (int i = 0; i < 3; i++) {
    float x = i * 150 + 25;
    car[index] = new Car(x, height-grid*6, grid, grid, 5);
    index++;
  }
  
  //Row 6
    for (int i = 0; i < 1; i++) {
    float x = i * 400 + 10;
    car[index] = new Car(x, height-grid*9, grid, grid, 50);
    index++;
  }
}

void keyPressed()
{ 
  if(key== 's' && ( gameState==INTRO || gameState==GAMEOVER )) 
  {
    initializeGame();
    player = new Player(width/2-grid/2, height-grid, grid);
    gameState=PLAY;    
  }
  
  //Display objective and controls 
  if(key =='o' && gameState == INTRO)
    gameState = OBJECTIVE;
  
  //Go from Objective to Intro Window
  if(key == 'r' && gameState == OBJECTIVE)
    gameState = INTRO;
    
  //Pause the game 
  if(key=='p' && gameState==PLAY)
    gameState=PAUSE;
  else if(key=='p' && gameState==PAUSE)
    gameState=PLAY;
    
  //Exit the game   
  if(key =='e' && gameState == GAMEOVER)
    exit();
    
  //Control white box
    if (keyCode == UP) {
    player.move(0, -1);
  }
  else if (keyCode == DOWN) {
    player.move(0,1);
  } else if (keyCode == RIGHT) {
    player.move(1,0);
  } else if (keyCode == LEFT) {
    player.move(-1,0);
  }
}


//Used for the display of the controls on screen
void controlDisplay(String control)
{
  fill(250);
  textSize(20);
  text(control, 90, 0);
 
}

void drawObjective(String title, String instructions) 
{
  background(0,0,0);
  
  // draw title
  fill(255,100,0);
  textSize(60);
  textAlign(CENTER, BOTTOM);
  text(title, width/2, height/2 - 80);
  
  // draw instructions
  fill(255,255,255);
  textSize(29);
  textAlign(CENTER, TOP);
  text(instructions, width/2, height/2 - 80);
}

void drawScreen(String title, String instructions) 
{
  background(0,0,0);
  
  // draw title
  fill(255,100,0);
  textSize(60);
  textAlign(CENTER, BOTTOM);
  text(title, width/2, height/2);
  
  // draw instructions
  fill(255,255,255);
  textSize(32);
  textAlign(CENTER, TOP);
  text(instructions, width/2, height/2);
}
