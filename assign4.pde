int bgx, gamestate, life, gsec, enemystate;
float px, py, gx, gy;
PImage start1, start2, end1, end2, bg1, bg2, enemy, player, hp, gift, shoot;
final int GAMESTART=0, GAMEPLAY=1, GAMEWIN=2, GAMEOVER=3, A=4, B=5, C=6;
boolean upPressed = false, downPressed = false, leftPressed = false, rightPressed = false;;
//SHOOT
float sh1=600;
boolean space = false;
//ENEMY
int eY;
int []e1 = {-100, -165, -230, -295, -360};
int e2Ys=floor(random(0,175)); 
int []e2X = {-100, -165, -230, -295, -360};
int []e2Y = {e2Ys, e2Ys+60, e2Ys+120, e2Ys+180, e2Ys+240};
int e3Ys=floor(random(0,175));
int []e3X = {-360, -295, -295, -230, -230, -165, -165, -100};
int []e3Y = {e3Ys+120, e3Ys+60, e3Ys+180, e3Ys, e3Ys+240, e3Ys+60, e3Ys+180, e3Ys+120};
//FlAME
int flame=5;
int []fsec1 = new int [5];
int []fsec2 = new int [5];
int []fsec3 = new int [8];
int []f1X = new int [5];
int []f2X = new int [5];
int []f3X = new int [8];
PImage []flames = new PImage[flame];

void setup () {
  size(640, 480) ;
  background(255);
  start1 = loadImage("img/start1.png");
  start2 = loadImage("img/start2.png");
  bg1 = loadImage("img/bg1.png");
  end1 = loadImage("img/end1.png");
  end2 = loadImage("img/end2.png");
  bg2 = loadImage("img/bg2.png");
  ///HP///
  hp = loadImage("img/hp.png");
  life = 70;
  ///ENEMY///
  enemy = loadImage("img/enemy.png");
  eY = floor(random(1,420)); 
  enemystate = C;
  ///PLAYER///
  player = loadImage("img/fighter.png");
  px = 590;
  py = 240;
  ///SHOOT///
  shoot = loadImage("img/shoot.png");
  ///GIFT///
  gift = loadImage("img/treasure.png");
  gx=floor(random(0,600)); 
  gy=floor(random(1,439)); 
  ///FLAME///
  for(int i = 0; i<flame; i++){
    flames[i] = loadImage("img/flame"+(i+1)+".png");
  }
  gamestate = GAMESTART;
  frameRate(60);
}

void draw() {
  switch (gamestate) {
    //~~**GAMESTART**~~//
    case GAMESTART:
    image(start2,0,0);
    if(mousePressed) {
      gamestate = GAMEPLAY;}else {
        if(mouseX >= width/3 && mouseX <= 2*width/3 && mouseY >=380 && mouseY <=415) {
          image(start1,0,0);
        }
  }
  break;
    //~~**GAMEPLAY**~~//
    case GAMEPLAY:
    ///BACKGROUND///
    {image(bg1, bgx, 0); image(bg2, bgx-640, 0); image(bg1, bgx-1280, 0);
    bgx += 1;
    bgx %= 1280;
    }
    ///GIFT///
    image(gift, gx, gy);
    gsec++;
    if(gsec % 180 == 0) {
      gx=floor(random(0,600));
      gy=floor(random(0,440));
      
    }
    
    
    ///PLAYER///
    image(player, px, py);
    if(upPressed == true) { py -= 5; }
    if(downPressed == true) { py += 5; }
    if(leftPressed == true) { px -= 5; }
    if(rightPressed == true) { px += 5; }
    if(px <= 0) { px = 0; }; if(px >= 590) { px = 590; };
    if(py <= 0) { py = 0; }; if(py >= 430) { py = 430; };
    
    ///Enemy///
    switch(enemystate){
    case C:  
    for(int i = 0; i < e1.length; i++) {
        image(enemy, e1[i], eY);
        e1[i]+=3;
        //GOT HIT//
        if(i==0){
          f1X[i]+=3;
          if(px-40<=e1[i] && px+40>=e1[i] && py+40>eY && py-40<eY){
            e1[i]=800;life-=40;
            if(life<30){life=30;}
          }
          if(e1[i]>=800){
              f1X[i]-=3;
              fsec1[i] += 15;
              if(fsec1[i]>0&&fsec1[i]<=90){image(flames[0],f1X[i]-80,eY);}
              if(fsec1[i]>90&&fsec1[i]<=180){image(flames[1],f1X[i]-80,eY);}
              if(fsec1[i]>180&&fsec1[i]<=270){image(flames[2],f1X[i]-80,eY);}
              if(fsec1[i]>270&&fsec1[i]<=360){image(flames[3],f1X[i]-80,eY);}
              if(fsec1[i]>360&&fsec1[i]<=450){image(flames[4],f1X[i]-80,eY);}
          }
        }
        if(i==1){
          f1X[i]+=3;
          if(px-40<=e1[i] && px+40>=e1[i] && py+40>eY && py-40<eY){
              e1[i]=800;life-=40;
              if(life<30){life=30;}
            }
            if(e1[i]>=800){
                f1X[i]-=3;
                fsec1[i] += 15;
                if(fsec1[i]>0&&fsec1[i]<=90){image(flames[0],f1X[i]-140,eY);}
                if(fsec1[i]>90&&fsec1[i]<=180){image(flames[1],f1X[i]-140,eY);}
                if(fsec1[i]>180&&fsec1[i]<=270){image(flames[2],f1X[i]-140,eY);}
                if(fsec1[i]>270&&fsec1[i]<=360){image(flames[3],f1X[i]-140,eY);}
                if(fsec1[i]>360&&fsec1[i]<=450){image(flames[4],f1X[i]-140,eY);}
            }
          }
        if(i==2){
            f1X[i]+=3;
            if(px-40<=e1[i] && px+40>=e1[i] && py+40>eY && py-40<eY){
              e1[i]=800;life-=40;
              if(life<30){life=30;}
            }
            if(e1[i]>=800){
                f1X[i]-=3;
                fsec1[i] += 15;
                if(fsec1[i]>0&&fsec1[i]<=90){image(flames[0],f1X[i]-200,eY);}
                if(fsec1[i]>90&&fsec1[i]<=180){image(flames[1],f1X[i]-200,eY);}
                if(fsec1[i]>180&&fsec1[i]<=270){image(flames[2],f1X[i]-200,eY);}
                if(fsec1[i]>270&&fsec1[i]<=360){image(flames[3],f1X[i]-200,eY);}
                if(fsec1[i]>360&&fsec1[i]<=450){image(flames[4],f1X[i]-200,eY);}
            }
          }
        if(i==3){
            f1X[i]+=3;
            if(px-40<=e1[i] && px+40>=e1[i] && py+40>eY && py-40<eY){
              e1[i]=800;life-=40;
              if(life<30){life=30;}
            }
            if(e1[i]>=800){
                f1X[i]-=3;
                fsec1[i] += 15;
                if(fsec1[i]>0&&fsec1[i]<=90){image(flames[0],f1X[i]-260,eY);}
                if(fsec1[i]>90&&fsec1[i]<=180){image(flames[1],f1X[i]-260,eY);}
                if(fsec1[i]>180&&fsec1[i]<=270){image(flames[2],f1X[i]-260,eY);}
                if(fsec1[i]>270&&fsec1[i]<=360){image(flames[3],f1X[i]-260,eY);}
                if(fsec1[i]>360&&fsec1[i]<=450){image(flames[4],f1X[i]-260,eY);}
            }
          }
        if(i==4){
            f1X[i]+=3;
            if(px-40<=e1[i] && px+40>=e1[i] && py+40>eY && py-40<eY){
              e1[i]=800;life-=40;
              if(life<30){life=30;}
            }
            if(e1[i]>=800){
                f1X[i]-=3;
                fsec1[i] += 15;
                if(fsec1[i]>0&&fsec1[i]<=90){image(flames[0],f1X[i]-320,eY);}
                if(fsec1[i]>90&&fsec1[i]<=180){image(flames[1],f1X[i]-320,eY);}
                if(fsec1[i]>180&&fsec1[i]<=270){image(flames[2],f1X[i]-320,eY);}
                if(fsec1[i]>270&&fsec1[i]<=360){image(flames[3],f1X[i]-320,eY);}
                if(fsec1[i]>360&&fsec1[i]<=450){image(flames[4],f1X[i]-320,eY);}
            }
          }
        //NEXT//
        if(e1[0] >= 1200) {
        enemystate = B;
        e2X[0]=-100; e2X[1]=-165; e2X[2]=-230; e2X[3]=-295; e2X[4]=-360;
        e2Y[0]=e2Ys; e2Y[1]=e2Ys+60; e2Y[2]=e2Ys+120; e2Y[3]=e2Ys+180; e2Y[4]=e2Ys+240; 
        e2Ys=floor(random(1,175));
        fsec2[i]=0;
        f2X[i]=0;
        }
      
    }
    break;
    case B:
    for(int i = 0; i < 5; i++) {
      image(enemy, e2X[i], e2Y[i]);
      e2X[i]+=3;
      //GOT HIT//
      if(i==0){
          f2X[i]+=3;
          if(px-40<=e2X[i] && px+40>=e2X[i] && py+40>e2Y[i] && py-40<e2Y[i]){
            e2X[i]=800;life-=40; 
            if(life<30){life=30;}
          }
          if(e2X[i]>=800){
              f2X[i]-=3;
              fsec2[i] += 15;
              if(fsec2[i]>0&&fsec2[i]<=90){image(flames[0],f2X[i]-80,e2Y[i]);}
              if(fsec2[i]>90&&fsec2[i]<=180){image(flames[1],f2X[i]-80,e2Y[i]);}
              if(fsec2[i]>180&&fsec2[i]<=270){image(flames[2],f2X[i]-80,e2Y[i]);}
              if(fsec2[i]>270&&fsec2[i]<=360){image(flames[3],f2X[i]-80,e2Y[i]);}
              if(fsec2[i]>360&&fsec2[i]<=450){image(flames[4],f2X[i]-80,e2Y[i]);}
          }
        }
      if(i==1){
          f2X[i]+=3;
          if(px-40<=e2X[i] && px+40>=e2X[i] && py+40>e2Y[i] && py-40<e2Y[i]){
            e2X[i]=800;life-=40; 
            if(life<30){life=30;}
          }
          if(e2X[i]>=800){
              f2X[i]-=3;
              fsec2[i] += 15;
              if(fsec2[i]>0&&fsec2[i]<=90){image(flames[0],f2X[i]-140,e2Y[i]);}
              if(fsec2[i]>90&&fsec2[i]<=180){image(flames[1],f2X[i]-140,e2Y[i]);}
              if(fsec2[i]>180&&fsec2[i]<=270){image(flames[2],f2X[i]-140,e2Y[i]);}
              if(fsec2[i]>270&&fsec2[i]<=360){image(flames[3],f2X[i]-140,e2Y[i]);}
              if(fsec2[i]>360&&fsec2[i]<=450){image(flames[4],f2X[i]-140,e2Y[i]);}
          }
        }
      if(i==2){
          f2X[i]+=3;
          if(px-40<=e2X[i] && px+40>=e2X[i] && py+40>e2Y[i] && py-40<e2Y[i]){
            e2X[i]=800;life-=40; 
            if(life<30){life=30;}
          }
          if(e2X[i]>=800){
              f2X[i]-=3;
              fsec2[i] += 15;
              if(fsec2[i]>0&&fsec2[i]<=90){image(flames[0],f2X[i]-200,e2Y[i]);}
              if(fsec2[i]>90&&fsec2[i]<=180){image(flames[1],f2X[i]-200,e2Y[i]);}
              if(fsec2[i]>180&&fsec2[i]<=270){image(flames[2],f2X[i]-200,e2Y[i]);}
              if(fsec2[i]>270&&fsec2[i]<=360){image(flames[3],f2X[i]-200,e2Y[i]);}
              if(fsec2[i]>360&&fsec2[i]<=450){image(flames[4],f2X[i]-200,e2Y[i]);}
          }
        }
      if(i==3){
          f2X[i]+=3;
          if(px-40<=e2X[i] && px+40>=e2X[i] && py+40>e2Y[i] && py-40<e2Y[i]){
            e2X[i]=800;life-=40; 
            if(life<30){life=30;}
          }
          if(e2X[i]>=800){
              f2X[i]-=3;
              fsec2[i] += 15;
              if(fsec2[i]>0&&fsec2[i]<=90){image(flames[0],f2X[i]-260,e2Y[i]);}
              if(fsec2[i]>90&&fsec2[i]<=180){image(flames[1],f2X[i]-260,e2Y[i]);}
              if(fsec2[i]>180&&fsec2[i]<=270){image(flames[2],f2X[i]-260,e2Y[i]);}
              if(fsec2[i]>270&&fsec2[i]<=360){image(flames[3],f2X[i]-260,e2Y[i]);}
              if(fsec2[i]>360&&fsec2[i]<=450){image(flames[4],f2X[i]-260,e2Y[i]);}
          }
        }
      if(i==4){
          f2X[i]+=3;
          if(px-40<=e2X[i] && px+40>=e2X[i] && py+40>e2Y[i] && py-40<e2Y[i]){
            e2X[i]=800;life-=40; 
            if(life<30){life=30;}
          }
          if(e2X[i]>=800){
              f2X[i]-=3;
              fsec2[i] += 15;
              if(fsec2[i]>0&&fsec2[i]<=90){image(flames[0],f2X[i]-320,e2Y[i]);}
              if(fsec2[i]>90&&fsec2[i]<=180){image(flames[1],f2X[i]-320,e2Y[i]);}
              if(fsec2[i]>180&&fsec2[i]<=270){image(flames[2],f2X[i]-320,e2Y[i]);}
              if(fsec2[i]>270&&fsec2[i]<=360){image(flames[3],f2X[i]-320,e2Y[i]);}
              if(fsec2[i]>360&&fsec2[i]<=450){image(flames[4],f2X[i]-320,e2Y[i]);}
          }
        }
      //NEXT//
      if(e2X[0] >= 1200) {
      enemystate = A;
      //ENEMY3_X///
      e3X[0]=-360; 
      e3X[1]=-295; e3X[2]=-295; 
      e3X[3]=-230; e3X[4]=-230; 
      e3X[5]=-165; e3X[6]=-165; 
      e3X[7]=-100;
      ///ENEMY3_Y///
      e3Ys=floor(random(1,175));
      e3Y[0]=e3Ys+120; 
      e3Y[1]=e3Ys+60; e3Y[2]=e3Ys+180; 
      e3Y[3]=e3Ys; e3Y[4]=e3Ys+240; 
      e3Y[5]=e3Ys+60; e3Y[6]=e3Ys+180; 
      e3Y[7]=e3Ys+120;
      for(int j = 0; j <8; j++){
      fsec3[j]=0;
      f3X[j]=0;
      }
      }
      
    }
    break;
    case A:
      image(enemy,e3X[0],e3Y[0]);
      image(enemy,e3X[1],e3Y[1]);image(enemy,e3X[2],e3Y[2]);
      image(enemy,e3X[3],e3Y[3]);image(enemy,e3X[4],e3Y[4]);
      image(enemy,e3X[5],e3Y[5]);image(enemy,e3X[6],e3Y[6]);
      image(enemy,e3X[7],e3Y[7]);
      for(int i = 0; i < 8; i++) {
        e3X[i]+=3;
        if(i==0){
            f3X[i]+=3;
            if(px-40<=e3X[i] && px+40>=e3X[i] && py-40<=e3Y[i] && py+40>=e3Y[i]){
              e3X[i]=800;life-=40;
              if(life<30){life=30;}
            }
            if(e3X[i]>=800){
              f3X[i]-=3;
              fsec3[i] += 15;
              if(fsec3[i]>0&&fsec3[i]<=90){image(flames[0],f3X[i]-320,e3Y[i]);}
              if(fsec3[i]>90&&fsec3[i]<=180){image(flames[1],f3X[i]-320,e3Y[i]);}
              if(fsec3[i]>180&&fsec3[i]<=270){image(flames[2],f3X[i]-320,e3Y[i]);}
              if(fsec3[i]>270&&fsec3[i]<=360){image(flames[3],f3X[i]-320,e3Y[i]);}
              if(fsec3[i]>360&&fsec3[i]<=450){image(flames[4],f3X[i]-320,e3Y[i]);}
            }
          }
        if(i==1){
            f3X[i]+=3;
            if(px-40<=e3X[i] && px+40>=e3X[i] && py-40<=e3Y[i] && py+40>=e3Y[i]){
              e3X[i]=800;life-=40;
              if(life<30){life=30;}
            }
            if(e3X[i]>=800){
              f3X[i]-=3;
              fsec3[i] += 15;
              if(fsec3[i]>0&&fsec3[i]<=90){image(flames[0],f3X[i]-260,e3Y[i]);}
              if(fsec3[i]>90&&fsec3[i]<=180){image(flames[1],f3X[i]-260,e3Y[i]);}
              if(fsec3[i]>180&&fsec3[i]<=270){image(flames[2],f3X[i]-260,e3Y[i]);}
              if(fsec3[i]>270&&fsec3[i]<=360){image(flames[3],f3X[i]-260,e3Y[i]);}
              if(fsec3[i]>360&&fsec3[i]<=450){image(flames[4],f3X[i]-260,e3Y[i]);}
            }
          }
        if(i==2){
            f3X[i]+=3;
            if(px-40<=e3X[i] && px+40>=e3X[i] && py-40<=e3Y[i] && py+40>=e3Y[i]){
              e3X[i]=800;life-=40;
              if(life<30){life=30;}
            }
            if(e3X[i]>=800){
              f3X[i]-=3;
              fsec3[i] += 15;
              if(fsec3[i]>0&&fsec3[i]<=90){image(flames[0],f3X[i]-260,e3Y[i]);}
              if(fsec3[i]>90&&fsec3[i]<=180){image(flames[1],f3X[i]-260,e3Y[i]);}
              if(fsec3[i]>180&&fsec3[i]<=270){image(flames[2],f3X[i]-260,e3Y[i]);}
              if(fsec3[i]>270&&fsec3[i]<=360){image(flames[3],f3X[i]-260,e3Y[i]);}
              if(fsec3[i]>360&&fsec3[i]<=450){image(flames[4],f3X[i]-260,e3Y[i]);}
            }
          }
        if(i==3){
            f3X[i]+=3;
            if(px-40<=e3X[i] && px+40>=e3X[i] && py-40<=e3Y[i] && py+40>=e3Y[i]){
              e3X[i]=800;life-=40;
              if(life<30){life=30;}
            }
            if(e3X[i]>=800){
              f3X[i]-=3;
              fsec3[i] += 15;
              if(fsec3[i]>0&&fsec3[i]<=90){image(flames[0],f3X[i]-200,e3Y[i]);}
              if(fsec3[i]>90&&fsec3[i]<=180){image(flames[1],f3X[i]-200,e3Y[i]);}
              if(fsec3[i]>180&&fsec3[i]<=270){image(flames[2],f3X[i]-200,e3Y[i]);}
              if(fsec3[i]>270&&fsec3[i]<=360){image(flames[3],f3X[i]-200,e3Y[i]);}
              if(fsec3[i]>360&&fsec3[i]<=450){image(flames[4],f3X[i]-200,e3Y[i]);}
            }
          }
        if(i==4){
            f3X[i]+=3;
            if(px-40<=e3X[i] && px+40>=e3X[i] && py-40<=e3Y[i] && py+40>=e3Y[i]){
              e3X[i]=800;life-=40;
              if(life<30){life=30;}
            }
            if(e3X[i]>=800){
              f3X[i]-=3;
              fsec3[i] += 15;
              if(fsec3[i]>0&&fsec3[i]<=90){image(flames[0],f3X[i]-200,e3Y[i]);}
              if(fsec3[i]>90&&fsec3[i]<=180){image(flames[1],f3X[i]-200,e3Y[i]);}
              if(fsec3[i]>180&&fsec3[i]<=270){image(flames[2],f3X[i]-200,e3Y[i]);}
              if(fsec3[i]>270&&fsec3[i]<=360){image(flames[3],f3X[i]-200,e3Y[i]);}
              if(fsec3[i]>360&&fsec3[i]<=450){image(flames[4],f3X[i]-200,e3Y[i]);}
            }
          }
        if(i==5){
            f3X[i]+=3;
            if(px-40<=e3X[i] && px+40>=e3X[i] && py-40<=e3Y[i] && py+40>=e3Y[i]){
              e3X[i]=800;life-=40;
              if(life<30){life=30;}
            }
            if(e3X[i]>=800){
              f3X[i]-=3;
              fsec3[i] += 15;
              if(fsec3[i]>0&&fsec3[i]<=90){image(flames[0],f3X[i]-140,e3Y[i]);}
              if(fsec3[i]>90&&fsec3[i]<=180){image(flames[1],f3X[i]-140,e3Y[i]);}
              if(fsec3[i]>180&&fsec3[i]<=270){image(flames[2],f3X[i]-140,e3Y[i]);}
              if(fsec3[i]>270&&fsec3[i]<=360){image(flames[3],f3X[i]-140,e3Y[i]);}
              if(fsec3[i]>360&&fsec3[i]<=450){image(flames[4],f3X[i]-140,e3Y[i]);}
            }
          }
        if(i==6){
            f3X[i]+=3;
            if(px-40<=e3X[i] && px+40>=e3X[i] && py-40<=e3Y[i] && py+40>=e3Y[i]){
              e3X[i]=800;life-=40;
              if(life<30){life=30;}
            }
            if(e3X[i]>=800){
              f3X[i]-=3;
              fsec3[i] += 15;
              if(fsec3[i]>0&&fsec3[i]<=90){image(flames[0],f3X[i]-140,e3Y[i]);}
              if(fsec3[i]>90&&fsec3[i]<=180){image(flames[1],f3X[i]-140,e3Y[i]);}
              if(fsec3[i]>180&&fsec3[i]<=270){image(flames[2],f3X[i]-140,e3Y[i]);}
              if(fsec3[i]>270&&fsec3[i]<=360){image(flames[3],f3X[i]-140,e3Y[i]);}
              if(fsec3[i]>360&&fsec3[i]<=450){image(flames[4],f3X[i]-140,e3Y[i]);}
            }
          }
        if(i==7){
            f3X[i]+=3;
            if(px-40<=e3X[i] && px+40>=e3X[i] && py-40<=e3Y[i] && py+40>=e3Y[i]){
              e3X[i]=800;life-=40;
              if(life<30){life=30;}
            }
            if(e3X[i]>=800){
              f3X[i]-=3;
              fsec3[i] += 15;
              if(fsec3[i]>0&&fsec3[i]<=90){image(flames[0],f3X[i]-80,e3Y[i]);}
              if(fsec3[i]>90&&fsec3[i]<=180){image(flames[1],f3X[i]-80,e3Y[i]);}
              if(fsec3[i]>180&&fsec3[i]<=270){image(flames[2],f3X[i]-80,e3Y[i]);}
              if(fsec3[i]>270&&fsec3[i]<=360){image(flames[3],f3X[i]-80,e3Y[i]);}
              if(fsec3[i]>360&&fsec3[i]<=450){image(flames[4],f3X[i]-80,e3Y[i]);}
            }
          }
      //NEXT//
      if(e3X[7] >= 1200) {
      enemystate = C;
      e1[0] = -100;  e1[1] = -165;  e1[2] = -230;  e1[3] = -295;  e1[4] = -360; 
      eY = floor(random(1,420));
      fsec1[0]=fsec1[1]=fsec1[2]=fsec1[3]=fsec1[4]=0;
      f1X[0]=f1X[1]=f1X[2]=f1X[3]=f1X[4]=0;
      }
      }
    break;
    }
    
      //GOT GIFT//
      if(px <= gx + 40 && px >= gx - 30 && py <= gy + 40 && py >= gy - 30) {
      image(gift, gx, gy);
      gx=floor(random(0,600));
      gy=floor(random(0,440));
      gsec = 0;
      gsec++;
      if(gsec % 180 == 0) {
      gx=floor(random(0,600));
      gy=floor(random(0,440));
    }
      life += 20;
      if(life > 220) {
        life = 220;
      }
    }
      
      //DEAD//
      if(life == 30) {
        gamestate = GAMEOVER;
      }
      
        ///HP///
        colorMode(HSB,128,60,30);
        strokeWeight(20);
        stroke(180, 280, 30);
        line(30,32,life,32);
        image(hp, 20, 20);
    
      break;
      //~~**GAMEOVER**~~//
      case GAMEOVER:
      life = 70;
        px = 590;
        py = 240;
        gsec = 0;
      image(end2,0,0);
      if(mousePressed) {
      gamestate = GAMEPLAY; enemystate = C;e1[0] = -100;  e1[1] = -165;  e1[2] = -230;  e1[3] = -295;  e1[4] = -360; 
      eY = floor(random(1,420));}else {
        if(mouseX >= width/3 && mouseX <= 2*width/3 && mouseY >=315 && mouseY <=350) {
          image(end1,0,0);
        }
  }
  break;
    
}
}
  void keyPressed() {
    if (keyCode == ' '){
        space=true;
      }
    if(key == CODED) {
      switch(keyCode) {
        case UP:
        upPressed = true;
        break;
        case DOWN:
        downPressed = true;
        break;
        case LEFT:
        leftPressed = true;
        break;
        case RIGHT:
        rightPressed = true;
        break;
      }
    }
  }
   void keyReleased() {
     if (keyCode == ' '){
        space=false;
      }
     if(key == CODED) {
      switch(keyCode) {
        case UP:
        upPressed = false;
        break;
        case DOWN:
        downPressed = false;
        break;
        case LEFT:
        leftPressed = false;
        break;
        case RIGHT:
        rightPressed = false;
        break;
      }
    }
   }
