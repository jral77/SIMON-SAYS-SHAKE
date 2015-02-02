int color1R;
int color1G;
int color1B;
int color2R;
int color2G;
int color2B;
int color3R;
int color3G;
int color3B;
int color4R;
int color4G;
int color4B;
float ellipse1X;
float ellipse1Y;
float ellipse2X;
float ellipse2Y;
float ellipse3X;
float ellipse3Y;
float ellipse4X;
float ellipse4Y;
int ellipse1number;
int ellipse2number;
int ellipse3number;
int ellipse4number;
int[] colorArray = new int [25];
int playerSelect;
int currentColor = 0;
int currentColorShowing = 0;
float adjustedNumber = 2.0;
int roundNumber = 1;
int instructionNumber = 0; 
float timer1;
float timer2 = 0;
float timer3;
float timer4 = 0; 
int countdown = 5;
int playerKeySelect; 
boolean playerTurn = false;
boolean keyBeenPressed = false;
boolean numbersMatch = false;
boolean shake1 = false;
boolean shake2 = false;
boolean shake3 = false;
boolean shake4 = false;
boolean instructions = false; 
void setup()
{
  size(650, 600);
 
  setEllipseColors();
  for (int i = 0; i < 25; i++)
  {
    colorArray[i] = getColor();
  }
  
}
void draw()
{
  background(#32C6FA);    
  fill(0);
  if (instructions == false)
  {
    textSize(40);
    fill(#FAFEFF);
    text("Presionar ENTER", 120, 440);
    if (instructionNumber == 0)
    {
      textSize(50);
      fill(#FAFEFF);
      text("SIMON SAY-SHAKE", 70, 100);
      textSize(30);
      text("PROGRESO FINAL- INTERACTIVIDAD 1", 30, 150); 
    }
    if (instructionNumber == 1)
    {
      textSize(20);
      fill(#FAFEFF);
      text("INSTRUCCIONES:", 0, 50);
      text("Usted en la pantalla encontrara 4 elipses de diferentes colores", 0, 75);
      text("Cada una de ellas va a vibrar en orden aleatorio,presione un ", 0, 100);
      text("número según la elipse que corresponda: ", 0, 125);
      textSize(20);
      text("Esfera azul =  1", 0, 150);
      text("Esfera verde = 2", 0, 175);
      text("Esfera roja = 3", 0, 200);
      text("Esfera amarilla = 4", 0, 225);
    }
    if (instructionNumber == 2)
    {
      textSize(30);
      fill(#FAFEFF);
      text("Son 25 niveles, va tener pocos segundos", 0, 75);
      text("para presionar el correcto,RECUERDE QUE ", 0, 125);
      text("DEBE PRESIONAR EL NÚMERO CORRECTO", 0, 175);
      text("CUANDO LA ESFERA DEJE DE VIBRAR", 0, 225);
      fill(#84FF79);
      text("BUENA SUERTE",170,400);
      
    }
    if (instructionNumber == 3)
    {
      instructions = true;
    }
  }
  if (instructions == true)
  {
    tint(255, (roundNumber * 10));
    textSize(20);
    text("NIVEL: " + roundNumber, 50, 75);
    if(roundNumber < 25)
    {
    textSize(25);
    fill(#6270FF);
    text("AZUL = 1", 350, 75);
    fill(#62FF88);
    text("VERDE = 2", 350, 100);
    fill(#FA2D2D);
    text("ROJO = 3", 350, 125);
    fill(#FADC2D);
    text("AMARILL0 = 4", 350, 150);
    }
    if (countdown > 0)
    {
      timer1 += .0167;
      countdown = 7 - (int)timer1;
      textSize(30);
      fill(#FAFEFF);
      text("COMIENZA EN " + countdown , 0, 150);
    }
    if (countdown <= 0 )
    {
      if (playerTurn == false)
      {
         
        timer2 += .0167;
        //paintTool = 0;
        
        if (timer2 <= 1);
        {
          if (colorArray[currentColor] == 1 && timer2 <= adjustedNumber)
          {
 
            ellipse1Shake();
            displayEllipse1();
          }
          else if (colorArray[currentColor] == 1 && timer2 > adjustedNumber)
          {
            ellipse1StopShake();
            setEllipseColors();
          }
 
          else if (colorArray[currentColor] == 2 && timer2 <= adjustedNumber)
          {
 
            ellipse2Shake();
            displayEllipse2();
          }
          else if (colorArray[currentColor] == 2 && timer2 > adjustedNumber)
          {
            ellipse2StopShake();
            setEllipseColors();
          }
          else if (colorArray[currentColor] == 3 && timer2 <= adjustedNumber)
          {
 
            ellipse3Shake();
            displayEllipse3();
          }
          else if (colorArray[currentColor] == 3 && timer2 > adjustedNumber)
          {
            ellipse3StopShake();
            setEllipseColors();
          }
          else if (colorArray[currentColor] == 4 && timer2 <= adjustedNumber)
          {
 
            ellipse4Shake();
            displayEllipse4();
          }
          else if (colorArray[currentColor] == 4 && timer2 > adjustedNumber)
          {
            ellipse4StopShake();
            setEllipseColors();
          }
        }   
        if (timer2 > adjustedNumber)
        {
          timer2 = 0;
          playerTurn = true;
        }
      }
      
      println(colorArray[currentColor]);
      if (playerTurn == true )
      {
        timer3 += .0167;
        textSize(30);
        fill(#0D76A5);
        text("Your Turn", 50, 150);
        textSize(11);
        
        if (colorArray[currentColor] == playerSelect)
        {
          numbersMatch = true;
        }
        if (colorArray[currentColor] != playerSelect)
        {
          numbersMatch = false;
        }
      }
 
      checkFalse();
      checkTrue();
    }
    drawEllipse();
  }
} 
void checkFalse()
{
  if (numbersMatch == false && timer3 >= 2 || numbersMatch == false && keyBeenPressed == true )
  {
 
    fill(0);
    textSize(30);
    text("PERDISTE, REINICIAR" , 0, 200);
    noLoop();
    timer3 = 0;
  }
}
 
void checkTrue()
{
  if (numbersMatch == true && timer3 >= 2 || numbersMatch == true && keyBeenPressed == true )
  {
    playerTurn = false;
    timer3 = 0;
    playerSelect = 0;
    numbersMatch = false;
    keyBeenPressed = false;
    roundNumber++;
    currentColor++;
    if (roundNumber >= 1 && roundNumber <= 5)
    {
      adjustedNumber = 2;
    }
    if (roundNumber >= 8 && roundNumber <= 10)
    {
      adjustedNumber = 1.5;
    }
    if (roundNumber >= 11 && roundNumber <= 15)
    {
      adjustedNumber = 1;
    }
    if (roundNumber >= 16 && roundNumber <= 20)
    {
      adjustedNumber = .50;
    }
    if (roundNumber >= 21 && roundNumber <= 25)
    {
      adjustedNumber = .25;
    }
    if (roundNumber > 25)
    {
      textSize(25);
      text("GANASTE", 0, 450);
      noLoop();
    }
  }
}
 
void keyPressed()
{
 
  if (key == '1' && playerTurn == true)
  {
    playerSelect = 1;
    displayEllipse1();
    ellipse1Shake();
    keyBeenPressed = true;
  }
  if (key == '2' && playerTurn == true)
  {
    playerSelect = 2;
    displayEllipse2();
    ellipse2Shake();
    keyBeenPressed = true;
  }
  if (key == '3' && playerTurn == true)
  {
    playerSelect = 3;
    displayEllipse3();
    ellipse3Shake();
    keyBeenPressed = true;
  }
  if (key == '4' && playerTurn == true)
  {
    playerSelect = 4;
    displayEllipse4();
    ellipse4Shake();
    keyBeenPressed = true;
  }
  if (key == ENTER)
  {
    instructionNumber++;
  }
 
  }
 
void drawEllipse()
{
  ellipse(275, 400, 250, 250);
  fill(color1R, color1G, color1B);
  ellipse(400 + ellipse1number, 400, 150, 150);//azul
  fill(color2R, color2G, color2B);
  ellipse(275+ ellipse2number, 525, 150, 150); //verde
  fill(color3R, color3G, color3B);
  ellipse(275, 300 + ellipse3number,150,150); //rojo
  fill(color4R, color4G, color4B);
  ellipse(150, 400 + ellipse4number, 150, 150); // amarillo

}
 
int getColor()
{
  int colorCode;
 
  colorCode = (int)random(1, 5);
 
  return colorCode;
}
 
void displayEllipse1()
{
  color1R = 0;
  color1G = 0;
  color1B = 255;
  color2R = 64;
  color2G = 191;
  color2B = 83;
  color3R = 211;
  color3G = 64;
  color3B = 64;
  color4R = 211;
  color4G = 207;
  color4B = 64;
}
 
void displayEllipse2()
{
  color1R = 86;
  color1G = 72;
  color1B = 222;
  color2R = 0;
  color2G = 255;
  color2B = 0;
  color3R = 211;
  color3G = 64;
  color3B = 64;
  color4R = 211;
  color4G = 207;
  color4B = 64;
}
 
void displayEllipse3()
{
  color1R = 86;
  color1G = 72;
  color1B = 222;
  color2R = 64;
  color2G = 191;
  color2B = 83;
  color3R = 255;
  color3G = 0;
  color3B = 0;
  color4R = 211;
  color4G = 207;
  color4B = 64;
}
 
void displayEllipse4()
{
  color1R = 86;
  color1G = 72;
  color1B = 222;
  color2R = 64;
  color2G = 191;
  color2B = 83;
  color3R = 211;
  color3G = 64;
  color3B = 64;
  color4R = 255;
  color4G = 255;
  color4B = 0;
}
 
 
 
void ellipse1Shake()
{
  ellipse1number = (int)random(-5, 5);
  ellipse2number = 0;
  ellipse3number = 0;
  ellipse4number = 0;
}
 
void ellipse1StopShake()
{
  ellipse1number = 0;
  ellipse2number = 0;
  ellipse3number = 0;
  ellipse4number = 0;
}
 
void ellipse2Shake()
{
  ellipse1number = 0;
  ellipse2number = (int)random(-5, 5);
  ;
  ellipse3number = 0;
  ellipse4number = 0;
}
 
void ellipse2StopShake()
{
  ellipse1number = 0;
  ellipse2number = 0;
  ellipse3number = 0;
  ellipse4number = 0;
}
void ellipse3Shake()
{
 
  ellipse1number = 0;
  ellipse2number = 0;
  ellipse3number = (int)random(-5, 5);
  ;
  ellipse4number = 0;
}
 
void ellipse3StopShake()
{
  ellipse1number = 0;
  ellipse2number = 0;
  ellipse3number = 0;
  ellipse4number = 0;
}
void ellipse4Shake()
{
  ellipse1number = 0;
  ellipse2number = 0;
  ellipse3number = 0;
  ellipse4number = (int)random(-5, 5);
}
 
void ellipse4StopShake()
{
  ellipse1number = 0;
  ellipse2number = 0;
  ellipse3number = 0;
  ellipse4number = 0;
}
 
void setEllipseColors()
{
  color1R = 86;
  color1G = 72;
  color1B = 222;
  color2R = 64;
  color2G = 191;
  color2B = 83;
  color3R = 211;
  color3G = 64;
  color3B = 64;
  color4R = 211;
  color4G = 207;
  color4B = 64;
}
