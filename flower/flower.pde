ArrayList<Flower> flower;
ArrayList<Stem> stem;

void setup(){
  size(800,800);
  background(0);
  flower=new ArrayList<Flower>();
  stem =new ArrayList<Stem>();
  for(int i=0;i<100;++i){
    flower.add(new Flower());
  }
  stem.add(new Stem());
  for(int i=0;i<flower.size();++i){
    stroke(255);
    Flower f=(Flower) flower.get(i);
    pushMatrix();
    translate(width/2,height/2);
    rotate(radians(f.startAngle));
    f.display(f.segment);
    popMatrix();
  }
  Stem s=(Stem) stem.get(0);
  pushMatrix();
  translate(width/2,height/2);
  rotate(radians(s.startAngle));
  s.display(s.segment);
  popMatrix();
}

class Flower{
  float segment;
  float startAngle;
  float angle;
  float theta;
  float num;
  
  Flower(){
    segment=random(80);
    startAngle=random(-90,90);
    angle=map(startAngle,-90,90,-10,10);
  }
  
  void display(float l){
    l*=0.85;
    float t=random(3);
    theta=angle+sin(l+num)*10;
    strokeWeight(t*2);
    noFill();
    line(0,0,0,-l);
    
    translate(0,-l);
    if(l>5){
      pushMatrix();
      rotate(radians(-theta));
      display(l);
      popMatrix();
    }
    num+=0.001;
  }
}

class Stem{
  float segment;
  float startAngle;
  float angle;
  float theta;
  float num;
  
  Stem(){
    segment=80;
    startAngle=random(170,190);
    angle=map(startAngle,170,190,-10,10);
  }
  
  void display(float l){
    l*=0.85;
    float t=random(3);
    theta=angle+sin(l+num)*10;
    strokeWeight(t*2);
    noFill();
    line(0,0,0,-l);
    
    translate(0,-l);
    if(l>5){
      pushMatrix();
      rotate(radians(-theta));
      display(l);
      popMatrix();
    }
    num+=0.001;
  }
}
