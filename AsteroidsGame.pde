Star [] NightSky = new Star[200];
Spaceship sal = new Spaceship();
ArrayList <Heart> hearts = new ArrayList <Heart>();
ArrayList <Bullet> bullets = new ArrayList <Bullet>();
boolean gameOver = false;
ArrayList <Asteroid> asteroids = new ArrayList <Asteroid>();
public void setup() {
  size(500, 500);
  for (int i = 0; i<NightSky.length; i++) {
    NightSky[i] = new Star();
  }
  for(int i = 0;i<10;i++){
    asteroids.add(new Asteroid((double)(Math.random()*-300)-50));
  }
  for(int i = 400;i<490;i+=30){
  hearts.add(new Heart (i,450));
  }
  
}

public void draw() {
  background(0);
  int t = (int)(millis()/1000);
  textAlign(CENTER);
  for (int i = 0; i<NightSky.length; i++) {
    NightSky[i].show();
  }
  sal.show();
  if (!gameOver){
  sal.move();
  }
  for (int i = 0; i<asteroids.size(); i++) {
    asteroids.get(i).show();
    asteroids.get(i).move();
    float d = dist((float)sal.getX(),(float)sal.getY(),(float)asteroids.get(i).getX(),(float)asteroids.get(i).getY()); 
     if (d<24 && hearts.size()>0){
      asteroids.remove(i);
      i--;
      hearts.remove(0);
     }
     if (hearts.size()==0){
     gameOver =true;
     fill(255,0,0);
     textSize(30);
     text("Oh no! 3 asteroids hit you!",250,250);
     textSize(20);
     text("Your ship has lost its integrity.",250,290);
 }
}
  for(int i = 0;i<asteroids.size();i++){
    if (asteroids.get(i).getY()>height+20){
      asteroids.get(i).setY(-20);
      asteroids.get(i).setX((double)(Math.random()*500));
    }
  }
  if(gameOver){noLoop();}
  if (asteroids.size()==0){
    fill(255,255,0);
    textSize(20);
    text("All asteroids have been eliminated-",250,250);
    textSize(40);
    text("You Win!",250,290);
    textSize(25);
    text("Your time was: " + t + " seconds", 250,320);
    gameOver = true; 
  }
    for(int i = 0; i<bullets.size();i++){
    bullets.get(i).show();
    bullets.get(i).move();
    if (bullets.get(i).getY()>500 ||bullets.get(i).getY()<0 ||bullets.get(i).getX()<0 ||bullets.get(i).getX()>500){
      bullets.remove(i);
      i--;
    }
    }
    for(int i = 0; i<bullets.size();i++){
    for(int j = 0; j<asteroids.size();j++){
      float d = dist((float)bullets.get(i).getX(),(float)bullets.get(i).getY(),(float)asteroids.get(j).getX(),(float)asteroids.get(j).getY());
       if(d<10){
         asteroids.remove(j);
         bullets.remove(i);
         break;
       }
    }
  }
  for(int i = 0; i<hearts.size();i++){
    hearts.get(i).show();
  }
  if(!gameOver){
  textSize(25);
  fill(255);
  text(t + "s",480,20);
}
  }


public void keyPressed() {
 if (gameOver == false){
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
  if(key==' '&& bullets.size()<12){
    bullets.add(new Bullet(sal));
 } 
}
}
