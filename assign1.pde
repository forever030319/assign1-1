/* parameter:
  hpImage: hp.png
  treasureImg: treasure.png
  fighterImg: fighter.png
  enermyImg: enemy.png
  bg1, bg2: background image 1,2
*/
PImage hpImg,treasureImg,fighterImg,enermyImg;
PImage bg1,bg2;
int width=640, height=480;
int treasure_width=41, treasure_height=41; //size
int treasure_x,treasure_y; //position
int enermy_height=61; //size
int enermy_x,enermy_y; //position

int x=600,y=450;
int x_flood, rand_flood;


int bg1_x,bg1_y;
int bg2_x,bg2_y;



void setup () {
  size(640,480) ;  // must use this size.
  background(0);
  
  hpImg = loadImage("img/hp.png");
  treasureImg = loadImage("img/treasure.png");
  fighterImg = loadImage("img/fighter.png");
  enermyImg = loadImage("img/enemy.png");
  bg1 = loadImage("img/bg1.png");
  bg2 = loadImage("img/bg2.png");
  
  /* treasure position is random in the scene
     but if x=640, y=480, treasure may lose a part of it on the scene
     so x= "width - treasure's width", y= "height - treasure's height"
     which represent treasure's position
  */
  treasure_x = floor(random(width-treasure_width/2));
  treasure_y = floor(random(height-treasure_height/2));
  
  // enermy's y position is random, but x position is static.
  enermy_x = 0;
  enermy_y = floor(random(height-enermy_height));
  
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
  image(fighterImg,580,240);
  image(treasureImg,treasure_x,treasure_y);
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
