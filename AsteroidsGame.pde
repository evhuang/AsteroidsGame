Star [] stars;
SpaceShip b2;
public void setup() 
{
  stars = new Star[100];
  for(int i = 0; i< stars.length; i++)
  {
    stars[i] = new Star();
  }
  size(1000,700);
  background(0);
  b2 = new SpaceShip(); 
}
public void draw() 
{
  //your code here
  fill(0);
  rect(0,0,1000,700);
  for(int i = 0; i< stars.length; i++)
  {
    stars[i].show();
  }
  b2.show();
  b2.move();
}
public void keyPressed()
{
  if(key == 'w'){b2.accelerate(0.2);}
  if(key == 's'){b2.accelerate(-0.2);}
  if(key == 'a'){b2.rotate(-10);}
  if(key == 'd'){b2.rotate(10);}
  if(key == 'f')
    {
      b2.setX((int)(Math.random()*1000));
      b2.setY((int)(Math.random()*700));
      b2.setDirectionX(0);
      b2.setDirectionY(0);
    }
}
class SpaceShip extends Floater  
{  
  public SpaceShip()
  {
  corners = 12;
  xCorners = new int[corners];
  yCorners = new int[corners];
  xCorners[0] = 8;
  yCorners[0] = 0;
  xCorners[1] = -6;
  yCorners[1] = -20;
  xCorners[2] = -8;
  yCorners[2] = -17;
  xCorners[3] = -4;
  yCorners[3] = -11;
  xCorners[4] = -7;
  yCorners[4] = -6;
  xCorners[5] = -5;
  yCorners[5] = -3;
  xCorners[6] = -8;
  yCorners[6] = 0;
  xCorners[7] = -5;
  yCorners[7] = 3;
  xCorners[8] = -7;
  yCorners[8] = 6;
  xCorners[9] = -4;
  yCorners[9] = 11;
  xCorners[10] = -8;
  yCorners[10] = 17;
  xCorners[11] = -6;
  yCorners[11] = 20;
  myColor = color(255,255,255);
  myCenterX = 500;
  myCenterY = 350;
  myDirectionX = 0;
  myDirectionY = 0;
  myPointDirection = 270;
  }
  public void setX(int x) {myCenterX = x;}
  public int getX() {return (int)myCenterX;} 
  public void setY(int y) {myCenterY = y;}  
  public int getY() {return (int)myCenterY;}
  public void setDirectionX(double x) {myDirectionX = x;}   
  public double getDirectionX() {return myDirectionX;} 
  public void setDirectionY(double y) {myDirectionY = y;}   
  public double getDirectionY() {return myDirectionY;}  
  public void setPointDirection(int degrees) {myPointDirection = degrees;}   
  public double getPointDirection() {return myPointDirection;}

 }
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);
  abstract public int getX();
  abstract public void setY(int y);
  abstract public int getY(); 
  abstract public void setDirectionX(double x);  
  abstract public double getDirectionX(); 
  abstract public void setDirectionY(double y); 
  abstract public double getDirectionY();
  abstract public void setPointDirection(int degrees);  
  abstract public double getPointDirection();

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 
class Star
{
  private int myX, myY, mySize, myR, myG, myB;
  public Star()
  {
    myX = (int)(Math.random() * 1000) + 1;
    myY = (int)(Math.random() * 700) + 1;
    mySize = (int)(Math.random() * 5) + 5;
    myR = (int)(Math.random() * 175) + 80;
    myG = (int)(Math.random() * 175) + 80;
    myB = (int)(Math.random() * 175) + 80;
  }
  public int getX() {return myX;}
  public int getY() {return myY;}
  public int getColor1() {return myR;}
  public int getColor2() {return myG;}
  public int getColor3() {return myB;}
  public int getSize() {return mySize;}
  public void show()
  {
    noStroke();
    fill(getColor1(), getColor2(), getColor3());
    ellipse(getX(),getY(),getSize(),getSize());
  }
}