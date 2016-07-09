/* parameter:
  hpImage: hp.png
  boxImg: treasure.png
  boatImg: fighter.png
  enermyImg: enemy.png
  bg1, bg2: background image 1,2
*/
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
  
  /* treasure position is random in the scene
     but if x=640, y=480, treasure may lose a part of it on the scene
     so x=600, y=450, represents treasure's position
  */
  box_x = floor(random(x));
  box_y = floor(random(y));
  
  // enermy's y position is random, but x position is static.
  enermy_x = 0;
  enermy_y = floor(random(y));
  
  // HP's width is 200, random(200) means: 0,1,2,...,199(full)
  x_flood = 200;
  rand_flood = floor(random(x_flood));

  /* bg1 starts at x=-640, bg2 starts at x=0
     bg1 and bg2's width are 640
     so when bg2's x position is 640, x becomes 0,
     when bg1's x position is 640, x becomes -640.
   
   -640      0      640
     ┌───────┬───────┐
     │  bg1  │  bg2  │
     └───────┴───────┘
             └ scene ┘
  */
  bg1_x = -640;
  bg1_y = 0;
  bg2_x = 0;
  bg2_y = 0;
}

void draw() {
  background(0); // clear scene
  image(bg1,bg1_x,0); 
  image(bg2,bg2_x,0);
  
  //HP
  stroke(0);
  fill(255,0,0);
  rect(5,4,rand_flood,20);
  
  image(hpImg,0,0);
  image(boatImg,580,240);
  image(boxImg,box_x,box_y);
  image(enermyImg,enermy_x,enermy_y);

  //enermy
  enermy_x = enermy_x + 3;
  enermy_x %= 640;
  
  //background image movement
  bg2_x++;
  bg1_x++;

  if(bg2_x==640){
    bg2_x = -640;
  }
  if(bg1_x == 640){
   bg1_x =-640; 
  }
 
}
