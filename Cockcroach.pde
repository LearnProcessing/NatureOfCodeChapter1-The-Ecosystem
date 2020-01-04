class cockroach {
  PVector pos;
  PVector vel;
  PVector acc;
  float dir;
  float xoff;
  float yoff;
  float maxsp=1;

  cockroach() {

      xoff=random(0, 5000);
      yoff=random(10000, 15000);
      acc=new PVector(0, 0);
      vel=new PVector(0, 0);
      pos=new PVector(random(0, width), random(0, height));
      dir=0;
    
  }  
  void move() {
    
      acc=new PVector (map(noise(xoff), 0, 1, -0.1, 0.1), map(noise(yoff), 0, 1, -0.1, 0.1));
      vel.add(acc);
      vel.limit(maxsp);
      pos.add(vel);
      xoff+=0.007;
      yoff+=0.007;
      dir=vel.heading();
    
  }
  void display() {
    
      
      translate(pos.x, pos.y);
      rotate(dir); 
      fill(#670707);
      stroke(0);
      ellipse(0, 0, 25, 10);
      fill(#ED5F00);
      ellipse(0, 0, 20, 8);
      fill(#ED5F00);
      ellipse(0+10, 0, 10, 10);
      
      line(12, 2, 17, 5);
      line(17, 5, 22, 4);
      line(12, -2, 17, -5);
      line(17, -5, 22, -4);

      line(3, 4, 10, 10);
      line(3, -4, 10, -10);
      line(2, 4, -5, 10);
      line(2, -4, -5, -10);
      line(-6, 4, -13, 10);
      line(-6, -4, -13, -10);
      noStroke();
      resetMatrix();
    
  }
  void checkEdges() {
    
      if (pos.x>width) {      
        pos.x=0;
      } else if (pos.x<0) {
        pos.x=width;
      }
      if (pos.y>height) {
        pos.y=0;
      } else if (pos.y<0) {
        pos.y=height;
      }
    }
  
}