Star [] NightSky = new Star[200];
Spaceship sal = new Spaceship();
public void setup(){
  size(500,500);
    for(int i = 0; i<NightSky.length;i++){
  NightSky[i] = new Star();
  }
}

public void draw(){
  background(0);
  for(int i = 0; i<NightSky.length;i++){
  NightSky[i].show();
  }
  sal.show();
  sal.move();
}

public void keyPressed(){
  if(key == 'd'){
    sal.turn(5);
  }
  if(key == 'a'){
    sal.turn(-5);
  }
  if (key =='w'){
    sal.accelerate(0.1);
  }
  if (key=='f'){
    sal.reset4hyperspace();
  }
}
