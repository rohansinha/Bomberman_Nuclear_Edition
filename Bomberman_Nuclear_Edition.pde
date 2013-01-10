PFont font, bombFont, timeFont, exitFont;

//X co-ordinates of all the boxes
int B1X = 130;
int B2X = 230;
int B3X = 130;
int B4X = 430;
int B5X= 530;
int B6X = 330;
int B7X = 230;
int B8X = 430;
int B9X = 30;
int B10X = 430;

//Y co-ordiantes of all the boxes
int B1Y = 30;
int B2Y = 130;
int B3Y = 330;
int B4Y = 430;
int B5Y = 130;
int B6Y = 230;
int B7Y = 530;
int B8Y = 330;
int B9Y = 430;
int B10Y = 30;

//fill for box 1
int r1 = 25;
int g1 = 125;
int b1 = 255;
int a1 = 75;
//fill for box 2
int r2 = 25;
int g2 = 125;
int b2 = 255;
int a2 = 75;
//fill for box 3
int r3 = 25;
int g3 = 125;
int b3 = 255;
int a3 = 75;
//fill for box 4
int r4 = 25;
int g4 = 125;
int b4 = 255;
int a4 = 75;
//fill for box 5
int r5 = 25;
int g5 = 125;
int b5 = 255;
int a5 = 75;
//fill for box 6
int r6 = 25;
int g6 = 125;
int b6 = 255;
int a6 = 75;
//fill for box 7
int r7 = 25;
int g7 = 125;
int b7 = 255;
int a7 = 75;
//fill for box 8
int r8 = 25;
int g8 = 125;
int b8 = 255;
int a8 = 75;
//fill for box 9
int r9 = 25;
int g9= 125;
int b9 = 255;
int a9 = 75;
//fill for box 10
int r10 = 25;
int g10 = 125;
int b10 = 255;
int a10 = 75;


int Cry = 600;
int bombs = 10;
int parts = 0;
int boxCount = 10;
float startTime, currentTime; 
float blownTime;

man[] a;
bomb[] b;

PImage guyw;
PImage guya;
PImage guys;
PImage guyd;
//PImage guy;
PImage title;
PImage credits;
PImage story;
PImage bomb;
PImage bombXplod;
PImage charge1;
PImage charge2;
PImage charge3;
PImage charge4;
PImage charge5;
PImage charge6;
PImage charge7;
PImage charge8;
PImage charge9;
PImage charge10;
PImage nuke;

int scr = 1;

color C1 = color (136,21,21);
boolean wPressed, aPressed, sPressed, dPressed, bPressed, bReleased;
boolean bombTime = false;
boolean counting = false;
boolean blownUp = false;
boolean minusBomb = false;
boolean bombsRemain = true;
boolean charge1Visible = false;
boolean charge2Visible = false;
boolean charge3Visible = false;
boolean charge4Visible = false;
boolean charge5Visible = false;
boolean charge6Visible = false;
boolean charge7Visible = false;
boolean charge8Visible = false;
boolean charge9Visible = false;
boolean charge10Visible = false;

boolean isItWorking = true;

void setup()
{
  frameRate (15);
  size (800, 600);
  background (C1);
  noStroke(); 
  font = loadFont("Verdana-36.vlw");
  bombFont = loadFont("Dialog-20.vlw");
  timeFont = loadFont("ACaslonPro-Italic-14.vlw");
  exitFont = loadFont("Algerian-22.vlw");

  title = loadImage("Title.jpg");
  credits = loadImage("Credits.jpg");
  story = loadImage("Story.png");
  //guy = loadImage("guy.gif");
  
  guyw = loadImage("guyw.PNG");
  guya = loadImage("guya.PNG");
  guys = loadImage("guys.PNG");
  guyd = loadImage("guyd.PNG");
  
  bomb = loadImage("bomb.png");
  bombXplod = loadImage("bombXplod.png");
  charge1 = loadImage("charge.png");
  charge2 = loadImage("charge.png");
  charge3 = loadImage("charge.png");
  charge4 = loadImage("charge.png");
  charge5 = loadImage("charge.png");
  charge6 = loadImage("charge.png");
  charge7 = loadImage("charge.png");
  charge8 = loadImage("charge.png");
  charge9 = loadImage("charge.png");
  charge10 = loadImage("charge.png");
  nuke = loadImage("bigBomb.png");

  a = new man [1];
  a[0] = new man();
  a[0].manX = 525;
  a[0].manY = 525;

  a[0].wallX = 75;
  a[0].wallY = 75;
  a[0].wallsize = 50;

  b = new bomb[9];
  for(int i = 0; i < b.length; i++)
  {
    b[i] = new bomb();
  }
}

void draw()
{
  field(); 
  
  if(bombs == 0)
  {
    bombsRemain = false;
    if(a[0].manX == 25 && a[0].manY == 25)
    {
      scr = 4;
    }
  }
  
  if(scr == 1)
  {
    image(title, 25, 200);
  }
  if(mousePressed && scr == 1)
  {
    scr = 2;
  } 
  else if(mousePressed && scr == 2)
  {
    scr = 3;
  } 
  /**
   * 
   */

  if(scr == 2)
  {
    image(story, 50, 100);
  } 

  if(scr == 3)
  {
    score();
    
    if(parts > 10)
    {
      parts -= 1;
    }
    
    fill(25, 255, 150, 500);
    textFont(exitFont);
    text("EXIT", 26, 55);
    fill(25, 255, 150, 25);
    rect(25, 25, 50, 50);
    fill(r1, g1, b1, a1);
    rect(B1X, B1Y, 40, 40);    //box one at 130, 30
    fill(r2, g2, b2, a2);
    rect(B2X, B2Y, 40, 40);   //box two at 230, 130
    fill(r3, g3, b3, a3);
    rect(B3X, B3Y, 40, 40);   //box three at 130, 330
    fill(r4, g4, b4, a4);
    rect(B4X, B4Y, 40, 40);   //box four at 430, 430
    fill(r5, g5, b5, a5);
    rect(B5X, B5Y, 40, 40);   //box five at 530, 130
    fill(r6, g6, b6, a6);
    rect(B6X, B6Y, 40, 40);   //box six at 330, 230
    fill(r7, g7, b7, a7);
    rect(B7X, B7Y, 40, 40);   //box seven at 230, 530
    fill(r8, g8, b8, a8);
    rect(B8X, B8Y, 40, 40);   //box eight at 430, 330
    fill(r9, g9, b9, a9);
    rect(B9X, B9Y, 40, 40);    //box nine at 30, 430
    fill(r10, g10, b10, a10);
    rect(B10X, B10Y, 40, 40);    //box ten at 430, 30

    a[0].wall();
    a[0].show();
    a[0].move();

    if(bPressed == true)//bomb activate
    {
      for(int i = 0; i < b.length; i++)
      {
        b[i].x = a[0].manX;
        b[i].y = a[0].manY;
      }
    }

    if(bombTime)
    {
      counting = true;
      startTime = millis();
    }
    
    //Kill!!!!!!!!!!!!
    if(bReleased == true)
    {
      for(int i = 0; i < b.length; i++)
      {
        b[i].show();
      }
      if(counting)
      {
        currentTime = millis();
        blownTime = (float)((currentTime-startTime)/1000);
        //text(blownTime, 600, 250);
      }
      bombTime = false;
      blownUp = false;
    } 

    if(blownTime > 2)
    {
      if(blownUp) 
      {
       for(int i = 0; i < b.length; i++)
        {
          //Box distance test At
          float blowAt1 = dist(b[i].x, b[i].y, B1X, B1Y);
          float blowAt2 = dist(b[i].x, b[i].y, B2X, B2Y);
          float blowAt3 = dist(b[i].x, b[i].y, B3X, B3Y);
          float blowAt4 = dist(b[i].x, b[i].y, B4X, B4Y);
          float blowAt5 = dist(b[i].x, b[i].y, B5X, B5Y);
          float blowAt6 = dist(b[i].x, b[i].y, B6X, B6Y);
          float blowAt7 = dist(b[i].x, b[i].y, B7X, B7Y);
          float blowAt8 = dist(b[i].x, b[i].y, B8X, B8Y);
          float blowAt9 = dist(b[i].x, b[i].y, B9X, B9Y);
          float blowAt10 = dist(b[i].x, b[i].y, B10X, B10Y);
          
          //Box distance test Right
          float blowRight1 = dist(b[i].x +50, b[i].y, B1X, B1Y);
          float blowRight2 = dist(b[i].x +50, b[i].y, B2X, B2Y);
          float blowRight3 = dist(b[i].x +50, b[i].y, B3X, B3Y);
          float blowRight4 = dist(b[i].x +50, b[i].y, B4X, B4Y);
          float blowRight5 = dist(b[i].x +50, b[i].y, B5X, B5Y);
          float blowRight6 = dist(b[i].x +50, b[i].y, B6X, B6Y);
          float blowRight7 = dist(b[i].x +50, b[i].y, B7X, B7Y);
          float blowRight8 = dist(b[i].x +50, b[i].y, B8X, B8Y);
          float blowRight9 = dist(b[i].x +50, b[i].y, B9X, B9Y);
          float blowRight10 = dist(b[i].x +50, b[i].y, B10X, B10Y);
                  
          //Box distance test Left
          float blowLeft1 = dist(b[i].x -50, b[i].y, B1X, B1Y);
          float blowLeft2 = dist(b[i].x -50, b[i].y, B2X, B2Y);
          float blowLeft3 = dist(b[i].x -50, b[i].y, B3X, B3Y);
          float blowLeft4 = dist(b[i].x -50, b[i].y, B4X, B4Y);
          float blowLeft5 = dist(b[i].x -50, b[i].y, B5X, B5Y);
          float blowLeft6 = dist(b[i].x -50, b[i].y, B6X, B6Y);
          float blowLeft7 = dist(b[i].x -50, b[i].y, B7X, B7Y);
          float blowLeft8 = dist(b[i].x -50, b[i].y, B8X, B8Y);
          float blowLeft9 = dist(b[i].x -50, b[i].y, B9X, B9Y);
          float blowLeft10 = dist(b[i].x -50, b[i].y, B10X, B10Y);
                    
          //Box distance test Up
          float blowUp1 = dist(b[i].x , b[i].y -50, B1X, B1Y);
          float blowUp2 = dist(b[i].x , b[i].y -50, B2X, B2Y);
          float blowUp3 = dist(b[i].x , b[i].y -50, B3X, B3Y);
          float blowUp4 = dist(b[i].x , b[i].y -50, B4X, B4Y);
          float blowUp5 = dist(b[i].x , b[i].y -50, B5X, B5Y);
          float blowUp6 = dist(b[i].x , b[i].y -50, B6X, B6Y);
          float blowUp7 = dist(b[i].x , b[i].y -50, B7X, B7Y);
          float blowUp8 = dist(b[i].x , b[i].y -50, B8X, B8Y);
          float blowUp9 = dist(b[i].x , b[i].y -50, B9X, B9Y);
          float blowUp10 = dist(b[i].x , b[i].y -50, B10X, B10Y);
          
          //Box distance test Down
          float blowDown1 = dist(b[i].x , b[i].y -50, B1X, B1Y);
          float blowDown2 = dist(b[i].x , b[i].y -50, B2X, B2Y);
          float blowDown3 = dist(b[i].x , b[i].y -50, B3X, B3Y);
          float blowDown4 = dist(b[i].x , b[i].y -50, B4X, B4Y);
          float blowDown5 = dist(b[i].x , b[i].y -50, B5X, B5Y);
          float blowDown6 = dist(b[i].x , b[i].y -50, B6X, B6Y);
          float blowDown7 = dist(b[i].x , b[i].y -50, B7X, B7Y);
          float blowDown8 = dist(b[i].x , b[i].y -50, B8X, B8Y);
          float blowDown9 = dist(b[i].x , b[i].y -50, B9X, B9Y);
          float blowDown10 = dist(b[i].x , b[i].y -50, B10X, B10Y);
          
          if ((blowAt1 == 0) ||
              (blowRight1 < 50) ||
              (blowLeft1 < 50) ||
              (blowUp1 < 50) ||
              (blowDown1 < 50)) 
              {
                r1 = 136;
                g1 = 21;
                b1 = 21;
                a1 = 0;
                image(charge1, B1X-5, B1Y-5);
                charge1Visible = true;
              } else
          if ((blowAt2 == 0) ||
              (blowRight2 < 50) ||
              (blowLeft2 < 50) ||
              (blowUp2 < 50) ||
              (blowDown2 < 50)) 
              {
                r2 = 136;
                g2 = 21;
                b2 = 21;
                a2 = 0;
                image(charge2, B2X-5, B2Y-5);
                charge2Visible = true;
              } else
          if ((blowAt3 == 0) ||
              (blowRight3 < 50) ||
              (blowLeft3 < 50) ||
              (blowUp3 < 50) ||
              (blowDown3 < 50)) 
              {
                r3 = 136;
                g3 = 21;
                b3 = 21;
                a3 = 0;
                image(charge3, B3X-5, B3Y-5);
                charge3Visible = true;
              } else
          if ((blowAt4 == 0) ||
              (blowRight4 < 50) ||
              (blowLeft4 < 50) ||
              (blowUp4 < 50) ||
              (blowDown4 < 50)) 
              {
                r4 = 136;
                g4 = 21;
                b4 = 21;
                a4 = 0;
                image(charge4, B4X-5, B4Y-5);
                charge4Visible = true;
              } else
          if ((blowAt5 == 0) ||
              (blowRight5 < 50) ||
              (blowLeft5 < 50) ||
              (blowUp5 < 50) ||
              (blowDown5 < 50)) 
              {
                r5 = 136;
                g5 = 21;
                b5 = 21;
                a5 = 0;
                image(charge5, B5X-5, B5Y-5);
                charge5Visible = true;
              } else
          if ((blowAt6 == 0) ||
              (blowRight6 < 50) ||
              (blowLeft6 < 50) ||
              (blowUp6 < 50) ||
              (blowDown6 < 50)) 
              {
                r6 = 136;
                g6 = 21;
                b6 = 21;
                a6 = 0;
                image(charge6, B6X-5, B6Y-5);
                charge6Visible = true;
              } else
          if ((blowAt7 == 0) ||
              (blowRight7 < 50) ||
              (blowLeft7 < 50) ||
              (blowUp7 < 50) ||
              (blowDown7 < 50)) 
              {
                r7 = 136;
                g7 = 21;
                b7 = 21;
                a7 = 0;
                image(charge7, B7X-5, B7Y-5);
                charge7Visible = true;
              } else
          if ((blowAt8 == 0) ||
              (blowRight8 < 50) ||
              (blowLeft8 < 50) ||
              (blowUp8 < 50) ||
              (blowDown8 < 50)) 
              {
                r8 = 136;
                g8 = 21;
                b8 = 21;
                a8 = 0;
                image(charge8, B8X-5, B8Y-5);
                charge8Visible = true;
              } else
          if ((blowAt9 == 0) ||
              (blowRight9 < 50) ||
              (blowLeft9 < 50) ||
              (blowUp9 < 50) ||
              (blowDown9 < 50)) 
              {
                r9 = 136;
                g9 = 21;
                b9 = 21;
                a9 = 0;
                image(charge9, B9X-5, B9Y-5);
                charge9Visible = true;
              } else
          if ((blowAt10 == 0) ||
              (blowRight10 < 50) ||
              (blowLeft10 < 50) ||
              (blowUp10 < 50) ||
              (blowDown10 < 50)) 
              {
                r10 = 136;
                g10 = 21;
                b10 = 21;
                a10 = 0;
                image(charge10, B10X-5, B10Y-5);
                charge10Visible = true;
              }
            }  
            if(charge1Visible)
            {
              if(a[0].manX == B1X-5 && a[0].manY == B1Y-5)
              {
                parts += 1;
                charge1Visible = false;
              }
            } else
            if(charge2Visible)
            {
              if(a[0].manX == B1X-5 && a[0].manY == B1Y-5)
              {
                parts += 1;
                charge2Visible = false;
              }
            } else
            if(charge3Visible)
            {
              if(a[0].manX == B1X-5 && a[0].manY == B1Y-5)
              {
                parts += 1;
                charge3Visible = false;
              }
            } else
            if(charge4Visible)
            {
              if(a[0].manX == B1X-5 && a[0].manY == B1Y-5)
              {
                parts += 1;
                charge4Visible = false;
              }
            } else
            if(charge5Visible)
            {
              if(a[0].manX == B1X-5 && a[0].manY == B1Y-5)
              {
                parts += 1;
                charge5Visible = false;
              }
            } else
            if(charge6Visible)
            {
              if(a[0].manX == B1X-5 && a[0].manY == B1Y-5)
              {
                parts += 1;
                charge6Visible = false;
              }
            } else
            if(charge7Visible)
            {
              if(a[0].manX == B1X-5 && a[0].manY == B1Y-5)
              {
                parts += 1;
                charge7Visible = false;
              }
            } else
            if(charge8Visible)
            {
              if(a[0].manX == B1X-5 && a[0].manY == B1Y-5)
              {
                parts += 1;
                charge8Visible = false;
              }
            } else
            if(charge9Visible)
            {
              if(a[0].manX == B1X-5 && a[0].manY == B1Y-5)
              {
                parts += 1;
                charge9Visible = false;
              }
            } else
            if(charge10Visible)
            {
              if(a[0].manX == B1X-5 && a[0].manY == B1Y-5)
              {
                parts += 1;
                charge10Visible = false;
              }
            }
      } 
      else 
      {
        for(int i = 0; i < b.length; i++)
        { 
          image(bombXplod, b[i].x, b[i].y);
          fill(150,0,0);

          //Kill Guy
          float killat = dist(b[i].x, b[i].y, a[0].manX, a[0].manY);
          float killright = dist(b[i].x +50, b[i].y, a[0].manX, a[0].manY);
          float killleft = dist(b[i].x -50, b[i].y, a[0].manX, a[0].manY);
          float killup = dist(b[i].x , b[i].y -50, a[0].manX, a[0].manY);
          float killdown = dist(b[i].x , b[i].y +50, a[0].manX, a[0].manY);
          
           if ((killat == 0) ||
            (killright < 50) ||
            (killleft < 50) ||
            (killup < 50) ||
            (killdown < 50)) 
          {
            scr = 5;
          }
        }

        bReleased = false;
        blownUp = true;
        minusBomb = true;
      }
      
      if(minusBomb)
      {
        bombs -= 1;
        minusBomb = false;
      }
    }
  }
  
  if(scr == 4)
  {
    field();
    score();
    image(nuke, 135, 100);
  }
  if(scr == 5)
  {  
    textFont(font);
    text("You Died!", 200, 300);
    image(credits, 25, Cry);
    Cry = Cry - 5;
  }

  if(scr == 6)
  {  
    image(credits, 25, Cry);
    text("SUCCESS!!! You Win!", 200, 300);
    Cry = Cry - 5;
  }
  
  textFont(timeFont);
  int s = second();  // Values from 0 - 59
  int m = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23
  fill(0);
  text("The time is-"+h+":"+m+":"+s, 625, 570); 
}

void keyPressed()
{
  if (key == 'b'  && bombsRemain == true) 
  {
    bPressed = true;
    status("BOMB!!! Run!");
  }
  if (key == 'w') 
  {
    wPressed = true;
    bombTime = false;
    status("up");
  }
  if (key == 'a') 
  {
    aPressed = true;
    bombTime = false;
    status("left");
  }
  if (key == 's') 
  {
    sPressed = true;
    bombTime = false;
    status("down");
  }
  if (key == 'd') 
  {
    dPressed = true;
    bombTime = false;
    status("right");
  }
}

void keyReleased()
{
  if (key == 'b'  && bombsRemain == true) bReleased = true; 
  if (key == 'b' && bombsRemain == true) bombTime = true; 
  if (key == 'b') bPressed = false; 
  if (key == 'w') wPressed = false;
  if (key == 'a') aPressed = false;
  if (key == 's') sPressed = false;
  if (key == 'd') dPressed = false;
}

void field()
{
  //bg
  //background (C1);
  fill (100);
  rect (25,25,550,550);
  rect (600,25,175,550);

}

void score()
{
  fill(0);
  textFont(font);
  float now = millis();
  int sec = (int)(now/1000);
  text("Time:"+sec, 600, 75);

  //bombs
  textFont(bombFont);
  text("Bombs:"+bombs, 600, 150);

  //parts
  text("Charges:"+parts+"/10", 600, 175);
}
class bomb
{
  float x, y;

  void show()
  {
    for(int i = 0; i < b.length; i++)
    {
      image(bomb, b[i].x, b[i].y); 
    }
  }
}

class man
{
  float manX, manY, mansize, wallX, wallY, wallsize;
  int imagecount;

  void wall()
  {
    for(wallX = 75; wallX < 550; wallX += 100)
    {
      for(wallY = 75 ; wallY  < 550; wallY  += 100)
      {
        fill (C1);
        rect (wallX,wallY, wallsize,wallsize);
      }
    }
  }  

  void show ()
  {
    fill(100);
    rect (manX,manY,50,50);
    image (guyw,manX,manY);
    
    if (imagecount == 1)
    {
      rect (manX,manY,50,50);
      image(guyw,manX,manY);
    }
    else if (imagecount == 2)
    {
      rect (manX,manY,50,50);
      image(guys,manX,manY);
    }
    else if (imagecount == 3)
    {
      rect (manX,manY,50,50);
      image(guya,manX,manY);
    }
    else if (imagecount == 4)
    {
      rect (manX,manY,50,50);
      image(guyd,manX,manY);
    }
  }
  
  void move ()
  { 
     if (wPressed) 
    {
      manY-=50;
      imagecount = 1;
    }
    if (sPressed) 
    {
      manY+=50;  
      imagecount =2; 
    }
    if (aPressed) 
    {
      manX-=50; 
      imagecount = 3;  
    }
    if (dPressed) 
    {
      manX+=50;
      imagecount = 4;  
    }

    // -----BLOCK FOR FIRST ROW-----
    if(wPressed)
    {    
      if((manX == 75 && manY == 75) ||
        (manX == 175 && manY == 75) ||
        (manX == 275 && manY == 75) ||
        (manX == 375 && manY == 75) ||
        (manX == 475 && manY == 75))
      {
        manY += 50;
      }
    }
    if(aPressed)
    {    
      if((manX == 75 && manY == 75) ||
        (manX == 175 && manY == 75) ||
        (manX == 275 && manY == 75) ||
        (manX == 375 && manY == 75) ||
        (manX == 475 && manY == 75))
      {
        manX += 50;
      }
    }
    if(sPressed)
    {    
      if((manX == 75 && manY == 75) ||
        (manX == 175 && manY == 75) ||
        (manX == 275 && manY == 75) ||
        (manX == 375 && manY == 75) ||
        (manX == 475 && manY == 75))
      {
        manY -= 50;
      }
    }
    if(dPressed)
    {    
      if((manX == 75 && manY == 75) ||
        (manX == 175 && manY == 75) ||
        (manX == 275 && manY == 75) ||
        (manX == 375 && manY == 75) ||
        (manX == 475 && manY == 75))
      {
        manX -= 50;
      }
    }

    //-----BLOCK FOR SECOND ROW-----
    if(wPressed)
    {    
      if((manX == 75 && manY == 175) ||
        (manX == 175 && manY == 175) ||
        (manX == 275 && manY == 175) ||
        (manX == 375 && manY == 175) ||
        (manX == 475 && manY == 175))
      {
        manY += 50;
      }
    }
    if(aPressed)
    {    
      if((manX == 75 && manY == 175) ||
        (manX == 175 && manY == 175) ||
        (manX == 275 && manY == 175) ||
        (manX == 375 && manY == 175) ||
        (manX == 475 && manY == 175))
      {
        manX += 50;
      }
    }
    if(sPressed)
    {    
      if((manX == 75 && manY == 175) ||
        (manX == 175 && manY == 175) ||
        (manX == 275 && manY == 175) ||
        (manX == 375 && manY == 175) ||
        (manX == 475 && manY == 175))
      {
        manY -= 50;
      }
    }
    if(dPressed)
    {    
      if((manX == 75 && manY == 175) ||
        (manX == 175 && manY == 175) ||
        (manX == 275 && manY == 175) ||
        (manX == 375 && manY == 175) ||
        (manX == 475 && manY == 175))
      {
        manX -= 50;
      }
    }

    //-----BLOCK FOR THIRD ROW-----
    if(wPressed)
    {    
      if((manX == 75 && manY == 275) ||
        (manX == 175 && manY == 275) ||
        (manX == 275 && manY == 275) ||
        (manX == 375 && manY == 275) ||
        (manX == 475 && manY == 275))
      {
        manY += 50;
      }
    }
    if(aPressed)
    {    
      if((manX == 75 && manY == 275) ||
        (manX == 175 && manY == 275) ||
        (manX == 275 && manY == 275) ||
        (manX == 375 && manY == 275) ||
        (manX == 475 && manY == 275))
      {
        manX += 50;
      }
    }
    if(sPressed)
    {    
      if((manX == 75 && manY == 275) ||
        (manX == 175 && manY == 275) ||
        (manX == 275 && manY == 275) ||
        (manX == 375 && manY == 275) ||
        (manX == 475 && manY == 275))
      {
        manY -= 50;
      }
    }
    if(dPressed)
    {    
      if((manX == 75 && manY == 275) ||
        (manX == 175 && manY == 275) ||
        (manX == 275 && manY == 275) ||
        (manX == 375 && manY == 275) ||
        (manX == 475 && manY == 275))
      {
        manX -= 50;
      }
    }

    //-----BLOCK FOR FOURTH ROW-----
    if(wPressed)
    {    
      if((manX == 75 && manY == 375) ||
        (manX == 175 && manY == 375) ||
        (manX == 275 && manY == 375) ||
        (manX == 375 && manY == 375) ||
        (manX == 475 && manY == 375))
      {
        manY += 50;
      }
    }
    if(aPressed)
    {    
      if((manX == 75 && manY == 375) ||
        (manX == 175 && manY == 375) ||
        (manX == 275 && manY == 375) ||
        (manX == 375 && manY == 375) ||
        (manX == 475 && manY == 375))
      {
        manX += 50;
      }
    }
    if(sPressed)
    {    
      if((manX == 75 && manY == 375) ||
        (manX == 175 && manY == 375) ||
        (manX == 275 && manY == 375) ||
        (manX == 375 && manY == 375) ||
        (manX == 475 && manY == 375))
      {
        manY -= 50;
      }
    }
    if(dPressed)
    {    
      if((manX == 75 && manY == 375) ||
        (manX == 175 && manY == 375) ||
        (manX == 275 && manY == 375) ||
        (manX == 375 && manY == 375) ||
        (manX == 475 && manY == 375))
      {
        manX -= 50;
      }
    }

    //-----BLOCK FOR FIFTH ROW-----
    if(wPressed)
    {    
      if((manX == 75 && manY == 475) ||
        (manX == 175 && manY == 475) ||
        (manX == 275 && manY == 475) ||
        (manX == 375 && manY == 475) ||
        (manX == 475 && manY == 475))
      {
        manY += 50;
      }
    }
    if(aPressed)
    {    
      if((manX == 75 && manY == 475) ||
        (manX == 175 && manY == 475) ||
        (manX == 275 && manY == 475) ||
        (manX == 375 && manY == 475) ||
        (manX == 475 && manY == 475))
      {
        manX += 50;
      }
    }
    if(sPressed)
    {    
      if((manX == 75 && manY == 475) ||
        (manX == 175 && manY == 475) ||
        (manX == 275 && manY == 475) ||
        (manX == 375 && manY == 475) ||
        (manX == 475 && manY == 475))
      {
        manY -= 50;
      }
    }
    if(dPressed)
    {    
      if((manX == 75 && manY == 475) ||
        (manX == 175 && manY == 475) ||
        (manX == 275 && manY == 475) ||
        (manX == 375 && manY == 475) ||
        (manX == 475 && manY == 475))
      {
        manX -= 50;
      }
    }

    //border
    if(manY <= 24)
    {
      manY = 25;
    }
    if (manY >= 526)
    {
      manY = 525;
    }
    if (manX >= 526)
    {
      manX = 525;
    }
    if (manX <= 24)
    {
      manX = 25;
    }
  }
}

