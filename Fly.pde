class fly { 
  PVector pos;
  PVector vel;
  PVector acc;
  PVector origin;
  float maxsp;
  float dir;

  fly() {
    pos=new PVector(random(100, 500), random(100, 500));
    vel=new PVector(0, 0);
    acc=new PVector(0, 0);
    maxsp=1;
    dir= (random(-1, 1));
    origin=new PVector(height/2, width/2);
  }
  void move() {
    acc=new PVector(random(-1, 1), random(-1, 1));

    if (pos.x>=width || pos.x<=0 || pos.y>=height || pos.y<=0) {
      acc=PVector.sub(origin, pos);
      acc.normalize();
    }
    vel.add(acc);
    vel.limit(maxsp);
    pos.add(vel);
  }
  void display() {
    //direction
    if (dir>=0) {
      dir =1;
    } else {
      dir=-1;
    }
    //body
    fill(100);
    ellipse(pos.x-(dir*10), pos.y+5, 30, 20);
    //upperwing
    fill(200);
    ellipse(pos.x-(dir*10), pos.y, 20, 10);
    //righteye
    fill(255);
    ellipse(pos.x+(dir*5), pos.y+2, 10, 10);
    fill(0);
    ellipse(pos.x+(dir*7), pos.y+2, 2.5, 2.5);
    //lefteye
    fill(255);
    ellipse(pos.x, pos.y, 10, 10);
    fill(0);
    ellipse(pos.x+(dir*2), pos.y, 3, 3);
  }
}