class Star{
 private int myX, myY;
 private color myC;
  public Star(){
    myX = (int)(Math.random()*width);
    myY = (int)(Math.random()*height);
    myC = color(255,255,(int)(Math.random()*135)+120);
  }
 public void show(){
    fill(myC);
    noStroke();
    ellipse(myX,myY,5,5);
  }
}
