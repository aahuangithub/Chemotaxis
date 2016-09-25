import java.util.*;
ArrayList<Bacteria> all = new ArrayList<Bacteria>();
Food one = new Food(-1, -1);
int arraySize;
void setup()   
 {     
  noLoop();
 	frameRate(60);
 	noStroke();
 	size (800, 800);
 	for (int i = 0; i<75; i++)
 	{
 		all.add(new Bacteria(i, 400, 400, -1, -1, -1));
 	}
 }   
 void draw()   
 {    
 	background(255);
  arraySize = all.size();
 	for (int i = 0; i<arraySize; i++)			//change to iterate through all list
 	{
        all.get(i).move();
        all.get(i).display();
 		    all.get(i).update(abs(one.x-all.get(i).x), abs(one.y-all.get(i).y));
 	}
 	one.display();
 	fill(255, 0, 0);
 }

 class Bacteria    
 {     
 	int x, y, id, maxLength, dx, dy, v;
 	float rot;
 	Bacteria(int id, int x, int y, float newRotate, int newLength, int v)
 	{
 		this.x = dx = x;
 		this.y = dy = y;
 		this.id = id;
    if (newRotate == -1 && newLength == -1 && v == -1 ){
 		  this.rot = (float)(Math.random()*TWO_PI);
      this.maxLength = (int)(Math.random()*5+3);
      this.v = (int)(Math.random()*11);
    }
    else
    {
      this.rot = newRotate + (float)Math.random()*(HALF_PI*v*0.1)-(PI*v*0.1);
      this.maxLength = newLength + (int)(Math.random()*v*0.01*3);
      if (v>1){
        this.v = v+(int)(Math.random()*3)-1;
      }
      else{
      this.v = v;
    }
    }
 	}
 void display()
 	{
 			stroke(0);
 			strokeWeight(2);
 			fill((255*(float)(this.id)/all.size()), (255*(float)(v*0.1)), (255*(this.rot/TWO_PI)));
 			ellipse(this.x, this.y, 10, 10);
 			noFill();
            stroke((255*(float)(this.id)/all.size()), (int)(255*(float)(v*0.1)), (int)(255*(this.rot/TWO_PI)));
            arc (this.x, this.y, 20, 20, this.rot, this.rot+PI);
            line(this.dx, this.dy, this.x, this.y);
            noStroke();
 	}
 	void update(float dx, float dy)
 	{
 		float distance = sqrt(dx*dx+dy*dy);
    	if(frameCount %120 == 119){
      fill(0);
      rect(0, 0, 800, 800);
    		//make the random chance to die here
    		if(distance>800 || (this.x>400 || this.x<0 || this.y>400 || this.y<0))
    		{
    			all.remove(this);
          arraySize-=1;
    		}
    		else if(distance>400 && distance<800)
    		{
    			if (Math.random()<0.88)
    			{
    				all.remove(this);
            arraySize-=1;
    			}
    		}
    		else if(distance>200 && distance<400)
    		{
    			if (Math.random()<0.66)
    			{
				     all.remove(this);
             arraySize-=1;
    			}
    		}
    		else
    		{
          if(Math.random()>0.1){
    					all.add( new Bacteria(this.id, this.x, this.y, this.rot, this.maxLength, v));
              all.add( new Bacteria(this.id, this.x, this.y, this.rot, this.maxLength, v));
              all.add( new Bacteria(this.id, this.x, this.y, this.rot, this.maxLength, v));
              all.remove(this);
          }
    		}
    	}
 	}
  void move()
  {
    if (frameCount % 30 == 0)
    {
         this.dx = this.x;
         this.dy = this.y;
     }

       this.x += (int)(((Math.random()*this.maxLength))*cos(this.rot+(float)(Math.random()*PI)));
       this.y += (int)(((Math.random()*this.maxLength))*sin(this.rot+(float)(Math.random()*PI)));

 }    
 }
class Food
{
	int x, y;
	Food(int x, int y)
	{
		this.x = x;
		this.y = y;
	}
	void display()
	{
		fill(255, 0, 0, 20);
		for(int i =  0; i<4; i++)
		{
			ellipse(this.x, this.y, (float)(200*Math.pow(2, i)), (float)(200*Math.pow(2, i)));
		}
	}
}
 void mousePressed()
 {
    if (mouseButton == LEFT){
      loop();
 	  one.x = mouseX;
 	  one.y = mouseY;
    }
    else
    {
        for (int i = 0; i<10; i++)
        {
            all.add(new Bacteria(all.size(), mouseX, mouseY, -1, -1, -1));
        }
    }
 }