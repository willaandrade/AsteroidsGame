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
 
  public double getX(){
    return myCenterX;
  }
  public double getY(){
    return myCenterY;
  }
}
