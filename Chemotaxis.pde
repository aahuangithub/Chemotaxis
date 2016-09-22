import java.util.*;
ArrayList all = new ArrayList();
Food one = new Food(-1, -1);
int gen;
void setup()   
 {     
 	gen = 0;
 	frameRate(60);
 	noStroke();
 	size (800, 800);
 	for (int i = 0; i<100; i++)
 	{
 		all.add(new Bacteria(i, 400, 400));
 	}
 }   
 void draw()   
 {    
 	background(255);
 	for (int i = 0; i<all.size(); i++)			//change to iterate through all list
 	{
 		println(all.get(i));
 		//(all.get(i)).display();
 		//(all.get(i)).move();
 		//(all.get(i)).update(abs(one.x-all[i].x), abs(one.y-all[i].y));
 	}
 	one.display();
 	fill(255, 0, 0);
 	text(gen, width-22, height-22);
 	
 }

 class Bacteria    
 {     
 	int x, y, id, maxLength;
 	float rot;
 	boolean isAlive;
 	Bacteria(int id, int x, int y)
 	{
 		this.x = x;
 		this.y = y;
 		this.isAlive = true;
 		this.id = id;
 		this.maxLength = (int)(Math.random()*5);
 		this.rot = (float)(Math.random()*TWO_PI);
 	}
 void display()
 	{
 		if (this.isAlive)
 		{
 			stroke(0);
 			strokeWeight(3);
 			fill((255*(float)(this.id)/all.size()), (int)(255*(float)this.maxLength/50), (int)(255*(this.rot/TWO_PI)));
 			ellipse(this.x, this.y, 20, 20);
 			noFill();
 			arc (this.x, this.y, 30, 30, this.rot, this.rot+PI);
 			noStroke();
 		}
 	}
 	void update(float dx, float dy)
 	{
 		float distance = sqrt(dx*dx+dy*dy);
    	if(frameCount%120 == 0){
    		//make the random chance to die here
    		if(distance>800)
    		{
    			this.isAlive=false;
    		}
    		else if(distance>400 && distance<800)
    		{
    			if (Math.random()<0.75)
    			{
    				this.isAlive=false;
    			}
    		}
    		else if(distance>200 && distance<400)
    		{
    			if (Math.random()<0.5)
    			{
    				this.isAlive=false;
    			}
    		}
    		else
    		{
    			if (this.isAlive){
    				if (Math.random()<0.25){
    					this.isAlive=true;
    				}
    			}
    			
    		}
    		if(this.isAlive){
    			//add another one of itself to the array but with slightly different things except id
    		}
			gen++;
    	}
 	}
  void move()
  {
     this.x = this.x + (int)(((Math.random()*this.maxLength))*cos(this.rot+(float)(Math.random()*PI)));
     this.y = this.y + (int)(((Math.random()*this.maxLength))*sin(this.rot+(float)(Math.random()*PI)));
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
 	one.x = mouseX;
 	one.y = mouseY;
 }