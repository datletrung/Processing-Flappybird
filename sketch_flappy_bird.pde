PImage start = loadImage("https://i.imgur.com/2gBRsj6.png");
PImage background = loadImage("https://i.imgur.com/L4W9kcm.png");
PImage base = loadImage("https://i.imgur.com/bqmbxim.png");
PImage bird = loadImage("https://i.imgur.com/ap8LaJr.png");
PImage pipe = loadImage("https://i.imgur.com/mOAmlfc.png");
PImage gameover = loadImage("https://i.imgur.com/mheO6bF.png");
PImage score0 = loadImage("https://i.imgur.com/xuVoscO.png");
PImage score1 = loadImage("https://i.imgur.com/L9gIQ3h.png");
PImage score2 = loadImage("https://i.imgur.com/ANII9vz.png");
PImage score3 = loadImage("https://i.imgur.com/7LrubyO.png");
PImage score4 = loadImage("https://i.imgur.com/YuDh1Cl.png");
PImage score5 = loadImage("https://i.imgur.com/8DMNHrF.png");
PImage score6 = loadImage("https://i.imgur.com/PXA1Uyd.png");
PImage score7 = loadImage("https://i.imgur.com/zA5uYOF.png");
PImage score8 = loadImage("https://i.imgur.com/vgBYlbV.png");
PImage score9 = loadImage("https://i.imgur.com/4gnggkr.png");
int x = 0, pos_bird = 400, state = 0, pos_pipe, by, px, score, ss;
int ai_pos_bird, ai_pos_bird_pipe, ai_pos_pipe_up,  ai_pos_pipe_down, ai_score;


void setup() {
  size(600, 800);
  //frameRate(30);
  imageMode(CORNER);
  image(background, 0, 0);
  pos_pipe = (int)random(120,580);
}

void draw(){
  if (state == 1){
    imageMode(CORNER);
    image(background, x, 0);
    image(background, x+background.width, 0);
    imageMode(CENTER);  
    //image(base, 300, 750, 600, 112);
    image(bird, 300, pos_bird);
    if (px <= 0){
      ss=0;
      px = width;
      pos_pipe = (int)random(120,580);
    }  
    render_pipe(px, pos_pipe);
    render_pipe(px+background.width, pos_pipe);
    if (px <= 260 && ss == 0){
      score++;
      ss=1;
    }  
    render_score(score);
    if (pos_bird >= 730 || pos_bird <= -100) gameover();
    //println(pos_bird,pos_pipe,pos_pipe+80,pos_pipe-80,px);
    if ((px >= 260 && px <= 340) && (pos_bird <= pos_pipe-80 || pos_bird >= pos_pipe+80)) gameover();
    x-=3;
    px-=3;
    by++;
    pos_bird+=by;
    ai_pos_bird = pos_bird;
    ai_pos_bird_pipe = max(px-300,0);
    ai_pos_pipe_up = pos_bird-(pos_pipe-80);
    ai_pos_pipe_down = pos_bird-(pos_pipe+80);
    ai_score++;
    println(ai_pos_bird,ai_pos_bird_pipe,ai_pos_pipe_up,ai_pos_pipe_down,ai_score);
  }else{
    imageMode(CENTER);
    image(start, width/2, height/2);
  }
}

void mousePressed(){
  state = 1;
  by = -16;
}

void keyPressed(){
  state = 1;
  by = -16;
}


void render_pipe(int x, int y){
  imageMode(CENTER);
  image(pipe, x, y+80+300);
  pushMatrix();
  scale(1, -1);
  image(pipe, x, -(y-80-300));
  popMatrix();
  image(base, 300, 750, 600, 100);
}

void render_score(int s){
  imageMode(CENTER);
  if (s <=9){
    image(re_score(s), 300, 50);
  }else if (s >=10 && s <= 99){
    image(re_score((int)s/10), 285, 50);
    image(re_score((int)s%10), 315, 50);
  }else{
    image(re_score((int)s/100), 280, 50);
    s = (int)s%100;
    image(re_score((int)s/10), 300, 50);
    image(re_score((int)s%10), 320, 50);
  }
}

PImage re_score(int s){
  switch (s){
    case 0:
      return score0;
    case 1:
      return score1;
    case 2:
      return score2;
    case 3:
      return score3;
    case 4:
      return score4;
    case 5:
      return score5;
    case 6:
      return score6;
    case 7:
      return score7;
    case 8:
      return score8;
    case 9:
      return score9;
  }
  return score0;
}

void gameover(){
  noLoop();
  state = 0;
  imageMode(CENTER);  
  image(gameover, 300, 400, 400, 100);
}
