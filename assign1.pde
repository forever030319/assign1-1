/* please implement your assign1 code in this file. */
PImage hpImg,boxImg,boatImg,enermyImg;
PImage bg1,bg2;
int x=600,y=450;
int x_flood, rand_flood;
int box_x,box_y;
int enermy_x,enermy_y;
int bg1_x,bg1_y;
int bg2_x,bg2_y;
void setup () {
  size(640,480) ;  // must use this size.
  background(0);
  
  hpImg = loadImage("img/hp.png");
  boxImg = loadImage("img/treasure.png");
  boatImg = loadImage("img/fighter.png");
  enermyImg = loadImage("img/enemy.png");
  bg1 = loadImage("img/bg1.png");
  bg2 = loadImage("img/bg2.png");
  
  
  box_x = floor(random(x));
  box_y = floor(random(y));
  
  enermy_x = 0;
  enermy_y = floor(random(y));
  
  x_flood = 200;
  rand_flood = floor(random(x_flood));

  bg1_x = -640;
  bg1_y = 0;
  bg2_x = 0;
  bg2_y = 0;
}

void draw() {
  background(0);
  image(bg1,bg1_x,0);
  image(bg2,bg2_x,0);
  stroke(0);
  fill(255,0,0);
  rect(5,4,rand_flood,20);
  
  image(hpImg,0,0);
  image(boatImg,580,240);
  image(boxImg,box_x,box_y);
  image(enermyImg,enermy_x,enermy_y);

  enermy_x = enermy_x + 3;
  enermy_x %= 640;
  
  bg2_x++;
  bg1_x++;

  if(bg2_x==640){
    bg2_x = -640;
  }
  if(bg1_x == 640){
   bg1_x =-640; 
  }
 
}
