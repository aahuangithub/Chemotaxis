import java.util.*;
ArrayList<Bacteria> all = new ArrayList<Bacteria>();
Food one = new Food(-1, -1);
int gen;
void setup()   
 {     
 	gen = 0;
 	frameRate(60);
 	noStroke();
 	size (800, 800);
 	for (int i = 0; i<75; i++)
 	{
 		all.add(new Bacteria(i, 400, 400));
 	}
 }   
 void draw()   
 {    
 	background(255);
 	for (int i = 0; i<all.size(); i++)			//change to iterate through all list
 	{
        all.get(i).move();
        all.get(i).display();
 		all.get(i).update(abs(one.x-all.get(i).x), abs(one.y-all.get(i).y));
 	}
    for (int i = 0; i<all.size(); i++)
    {
        if (!(all.get(i).isAlive))              //cleans up dead cells
        {
            all.remove(i);
        }
    }
    println(all.size());
 	one.display();
 	fill(255, 0, 0);
 	text(gen, width-22, height-22);
 	
 }

 class Bacteria    
 {     
 	int x, y, id, maxLength, dx, dy;
 	float rot;
 	boolean isAlive;
 	Bacteria(int id, int x, int y)
 	{
 		this.x = dx = x;
 		this.y = dy = y;
 		this.isAlive = true;
 		this.id = id;
 		this.maxLength = (int)(Math.random()*5+3);
 		this.rot = (float)(Math.random()*TWO_PI);
 	}
 void display()
 	{
 		if (this.isAlive)
 		{
 			stroke(0);
 			strokeWeight(2);
 			fill((255*(float)(this.id)/all.size()), (int)(255*(float)(this.maxLength-3)/5), (int)(255*(this.rot/TWO_PI)));
 			ellipse(this.x, this.y, 10, 10);
 			noFill();
            stroke((255*(float)(this.id)/all.size()), (int)(255*(float)(this.maxLength-3)/5), (int)(255*(this.rot/TWO_PI)));
            arc (this.x, this.y, 20, 20, this.rot, this.rot+PI);
            line(this.dx, this.dy, this.x, this.y);
            noStroke();
 		}
 	}
 	void update(float dx, float dy)
 	{
 		float distance = sqrt(dx*dx+dy*dy);
    	if(frameCount%120 == 0){
    		//make the random chance to die here
    		if(distance>800 || (this.x>400 || this.x<0 || this.y>400 || this.y<0))
    		{
    			this.isAlive=false;
    		}
    		else if(distance>400 && distance<800)
    		{
    			if (Math.random()<0.88)
    			{
    				this.isAlive=false;
    			}
    		}
    		else if(distance>200 && distance<400)
    		{
    			if (Math.random()<0.66)
    			{
    				this.isAlive=false;
    			}
    		}
    		else
    		{
    			if (this.isAlive){
    				if (Math.random()<0.33){
    					this.isAlive=true;
    				}
    			}
    			
    		}

			gen++;
    	}
        if(this.isAlive && frameCount%121 == 0){
            //all.add(new Bacteria (this.id, this.x, this.y));
        }
 	}
  void move()
  {
    if (frameCount % 20 == 0)
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
 	  one.x = mouseX;
 	  one.y = mouseY;
    }
    else
    {
        for (int i = 0; i<10; i++)
        {
            all.add(new Bacteria(all.size(), mouseX, mouseY));
        }
    }
 }