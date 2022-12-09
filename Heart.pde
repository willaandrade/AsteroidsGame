class Heart{
  int myX, myY;
  boolean isDead;
  Heart(int x, int y){
   myX = x;
   myY = y;
   isDead = false;
  }
  
  void show(){
    int [] xCoords = new int[] {0,-1,-2,-3,-5,-6,-6,-5,0,5,6,6,5,3,2,1,0};
    int[] yCoords = new int[]{-2,-3,-4,-4,-3,-2,-1,0,5,0,-1,-2,-3,-4,-4,-3,-2};
    fill(255,0,0);
    beginShape();
    for (int nI = 0;nI<17;nI++){
      vertex(myX+(xCoords[nI]*2),myY+(yCoords[nI]*2));
    }
    endShape();
  }
}
