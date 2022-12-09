class Bullet extends Floater{
  int startTime;
  Bullet(Spaceship theShip){
    myCenterX = theShip.getX();
    myCenterY = theShip.getY();
    myXspeed = theShip.getXspeed()+3*Math.cos(theShip.myPointDirection*(Math.PI/180));
    myYspeed = theShip.getYspeed()+3*Math.sin(theShip.myPointDirection*(Math.PI/180));
    myPointDirection = theShip.getDirection();
    myColor = 255;
    corners = 7;
    xCorners = new int[]{4,2,-5,-5,2,4,4};
    yCorners = new int[]{1,3,3,-3,-3,-1,1};
    startTime = millis();
  } 
    public void move (){          
    myCenterX += myXspeed;    
    myCenterY += myYspeed;    
  }
  public void show(){
     int t = millis()-startTime;
    if(t<3000){
       myColor = 255-(int)(t/20);
      super.show();
    }
  }
}
