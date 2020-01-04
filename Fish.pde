class fish {
  PVector pos;
  PVector vel;
  PVector acc;
  PVector dir;
  PVector origin;
  float tgtDir;
  int justrandom;


  fish() {
    pos=new PVector(random(0, width), random(0, height));
    vel=new PVector(0, 0);
    acc=new PVector(random(0, width), random(0, height));
    dir=new PVector(random(0, width), random(0, height));
    dir.normalize();
    origin= new PVector(width/2, height/2);
    tgtDir=PVector.angleBetween(acc, dir);
    justrandom=int(random(0, 2));
  }

  void setTgt() {

    if (vel.mag()<=0.01 && pos.x<=width && pos.x>=0 && pos.y<=height && pos.y>=0) {
      acc=new PVector(random(0, width), random(0, height));
      acc.sub(pos);
      acc.normalize();
      acc.mult(0.05);
      tgtDir=PVector.angleBetween(acc, dir);
    }

    vel.add(acc);
    if (vel.mag()>=3) {
      acc.mult(-1);
    }
  }
  void setDir() {
    if (tgtDir > 0.05) {
      vel.mult(0);
      acc.mult(0);    
      if (justrandom==1) {
        dir.rotate(0.01);
      } else {
        dir.rotate(-0.01);
      }
    }
  }

  void move() {
    pos.add(vel);
  }
  void checkEdges() {
    if (pos.x>width || pos.x<0 || pos.y>height || pos.y<0) {
      acc.mult(0);
      vel.mult(0);
      acc=PVector.sub(origin, pos);
      acc.normalize();
      acc.mult(0.05);
      tgtDir=PVector.angleBetween(acc, dir);
    }
  }


  void display() {
    translate(pos.x, pos.y);
    rotate(dir.heading());
    //ekor
    fill(#FA6F12);
    quad(-5, -8, -25, -20, -5, 8, -25, 20);
    quad(-30, -5, -50, -20, -50, 20, -30, 5);
    //body
    fill(#FA6F12);
    ellipse(-15, 0, 50, 20);
    fill(255);
    ellipse(-20, 0, 10, 20);
    //head
    fill(#FA6F12);
    ellipse(0, 0, 20, 20);
    //eyes
    fill(255);
    ellipse(2, -7, 10, 10);
    ellipse(2, 7, 10, 10);
    fill(0);
    ellipse(3, -10, 4, 4);
    ellipse(3, 10, 4, 4);

    resetMatrix();
  }
}