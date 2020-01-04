fly[] nervousFly=new fly[10];
fish[] swimmingFish=new fish[7];
cockroach[] coro=new cockroach[5];

void setup() {
  size(400, 400);
  background(#B4DFFF);
  noStroke();
  rectMode(CENTER);
  for (int i=0; i<nervousFly.length; i++) {
    nervousFly[i]=new fly();
  }
  for (int i=0; i<swimmingFish.length; i++) {
    swimmingFish[i]=new fish();
  }
for (int i=0; i<coro.length; i++) {
  coro[i]=new cockroach();
  }
}

void draw() {
  background(#B4DFFF);

for (int i=0; i<coro.length; i++) {
    coro[i].move();
    coro[i].checkEdges();
    coro[i].display();
    }
  for (int i=0; i<swimmingFish.length; i++) {
    swimmingFish[i].setTgt();
    swimmingFish[i].setDir();
    swimmingFish[i].move();
    swimmingFish[i].checkEdges();
    swimmingFish[i].display();
  }
  for (int i=0; i<nervousFly.length; i++) {
    nervousFly[i].move();
    nervousFly[i].display();
  }
}