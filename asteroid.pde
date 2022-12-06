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
}//end class
