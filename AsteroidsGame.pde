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
