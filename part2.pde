Star [] NightSky = new Star[200];
Spaceship sal = new Spaceship();
ArrayList <Asteroid> asteroids = new ArrayList <Asteroid>();
public void setup() {
  size(500, 500);
  for (int i = 0; i<NightSky.length; i++) {
    NightSky[i] = new Star();
  }
  asteroids.add(new Asteroid(-150));
  asteroids.add(new Asteroid(-100));
  asteroids.add(new Asteroid(-50));
  asteroids.add(new Asteroid(-100));
  asteroids.add(new Asteroid(-150));
}

public void draw() {
  background(0);
  for (int i = 0; i<NightSky.length; i++) {
    NightSky[i].show();
  }
  sal.show();
  sal.move();
  for (int i = 0; i<asteroids.size(); i++) {
    asteroids.get(i).show();
    asteroids.get(i).move();
    if ((asteroids.get(i).getX()< sal.getX()+10 && asteroids.get(i).getX()> sal.getX()-10 && asteroids.get(i).getY()>sal.getY()-10 && asteroids.get(i).getY()<sal.getY()+10) || asteroids.get(i).getY()>height) {
      sal.boom(asteroids.get(i).getX(), asteroids.get(i).getY()); 
      asteroids.remove(i);
      i--;
    }
  }
}
public void keyPressed() {
  if (key == 'd') {
    sal.turn(5);
    sal.showLeftFire();
  }
  if (key == 'a') {
    sal.turn(-5);
    sal.showRightFire();
  }
  if (key =='w') {
    sal.accelerate(0.1);
    sal.showRightFire();
    sal.showLeftFire();
  }
  if (key=='f') {
    sal.reset4hyperspace();
  }
}
class Asteroid extends Floater{
  private double rotateSpeed;
  
  Asteroid(double yStart){
    rotateSpeed = (double)(Math.random()*3)+1;
    double chance  = Math.random();
    if (chance<0.5){
    corners = 19;
    xCorners = new int[]{0,3,9,8,7,9,7,4,0,-3,-7,-10,-11,-13,-12,-10,-9,-8,0};
    yCorners = new int[]{9,7,6,3,0,-4,-7,-11,-13,-10,-8,-6,-3,0,3,6,8,9,9};
    }
    else{
     corners = 22;
     xCorners  = new int[]{1,4,6,9,10,8,11,11,10,9,6,5,3,0,-1,-4,-8,-9,-8,-4,-3,1};
     yCorners = new int[]{12,10,12,11,8,5,3,-1,-3,-5,-6,-10,-11,-9,-6,-5,-4,0,6,7,10,12};
      
    }
    myColor = 255;
    myCenterX = (int)(Math.random()*500);
    myCenterY = yStart;
    myXspeed = 0;
    myYspeed = (int)(Math.random()*3)+1;
    myPointDirection = Math.random()*360;
  }//end constructor
  public void move(){
    myCenterX += myXspeed;    
    myCenterY += myYspeed;  
    myPointDirection+=rotateSpeed;
  }//end move
  public double getX(){
    return myCenterX;
  }
  public double getY(){
    return myCenterY;
  }
  public void disappear(){
    if (myCenterX < sal.getX()+10 && myCenterX> sal.getX()-10 && myCenterY>sal.getY()-10 && myCenterY<sal.getY()+10){
      
    }
    
  }
}//end class
class Star{
 private int myX, myY;
 private color myC;
  public Star(){
    myX = (int)(Math.random()*width);
    myY = (int)(Math.random()*height);
    myC = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
  }
 public void show(){
    fill(myC);
    noStroke();
    ellipse(myX,myY,5,5);
  } 
}
class Floater //Do NOT modify the Floater class! Make changes in the Spaceship class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myXspeed, myYspeed; //holds the speed of travel in the x and y directions   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myXspeed += ((dAmount) * Math.cos(dRadians));    
    myYspeed += ((dAmount) * Math.sin(dRadians));       
  }   
  public void turn (double degreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=degreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myXspeed and myYspeed       
    myCenterX += myXspeed;    
    myCenterY += myYspeed;     

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
    
    //translate the (x,y) center of the ship to the correct position
    translate((float)myCenterX, (float)myCenterY);

    //convert degrees to radians for rotate()     
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    
    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);
    
    //draw the polygon
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xCorners[nI], yCorners[nI]);
    }
    endShape(CLOSE);

    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }   
} 
class Spaceship extends Floater{
  
  public Spaceship(){
    corners = 19;
    xCorners = new int[]{15,14,13,11,9,6,4,-15,-15,-12,-12,-15,-15,4,6,9,11,13,14};
    yCorners = new int[]{0,-3,-5,-8,-10,-12,-13,-13,-4,-4,4,4,13,13,12,10,8,5,3};
    myColor = 100;
    myCenterX = width/2;
    myCenterY =  height/2;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = 0;
  }
  public void reset4hyperspace(){
    myCenterX = (double)(Math.random()*(width-50))+25;
    myCenterX = (double)(Math.random()*(height-50))+25;
    myXspeed = myYspeed = 0;
    myPointDirection = (double)(Math.random()*360);
  }
  public void showLeftFire(){
    int [] leftFireX = new int[] {-20,-40,-20,-20};
    int [] leftFireY = new int[] {-13,-7,1,-13};
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    translate((float)myCenterX, (float)myCenterY);
    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);
    fill(255,0,0);
    beginShape();
    for (int nI = 0; nI < 4; nI++)
    {
      vertex(leftFireX[nI],leftFireY[nI]);
    }
    endShape(CLOSE);
     rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }
  public void showRightFire(){
    int [] rightFireX = new int[] {-20,-40,-20,-20};
    int [] rightFireY = new int[] {0,6,14,0};
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    translate((float)myCenterX, (float)myCenterY);
    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);
    fill(255,0,0);
    beginShape();
    for (int nI = 0; nI < 4; nI++)
    {
      vertex(rightFireX[nI],rightFireY[nI]);
    }
    endShape(CLOSE);
     rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }
  public void boom(double x, double y){
    fill(255,0,0);
    int[] xbCorners = new int[]{0,3,3,6,4,5,2,2,0,-3,-3,-6,-4,-7,-4,-4,-2,-1,0};
    int[] ybCorners = new int[]{4,6,3,2,0,-3,-2,-6,-3,-5,-2,-3,0,1,2,5,3,6,4};
    beginShape();
    for (int nI = 0; nI < 4; nI++)
    {
      vertex(xbCorners[nI],ybCorners[nI]);
    }
    endShape(CLOSE);
  }
  public double getX(){
    return myCenterX;
  }
  public double getY(){
    return myCenterY;
  }
}
