Bacteria[] all = new Bacteria[100];
Food one = new Food(-1, -1);
int frame, gen;
void setup()   
 {     
 	frame = gen = 0;
 	frameRate(60);
 	noStroke();
 	size (800, 800);
 	for (int i = 0; i<all.length; i++)
 	{
 		all[i] = new Bacteria(400, 400);
 	}
 }   
 void draw()   
 {    
 	background(255);
 	for (int i = 0; i<all.length; i++)
 	{
 		all[i].display();
 		all[i].move();
 		all[i].update(abs(one.x-all[i].x), abs(one.y-all[i].y));
 	}
 	one.display();
 	fill(255, 0, 0);
 	text(gen, width-22, height-22);
 	frame++;
 }

 class Bacteria    
 {     
 	int x, y;
 	boolean isAlive;
 	color c;
 	Bacteria(int x, int y)
 	{
 		this.x = x;
 		this.y = y;
 		this.isAlive = true;
 		this.c = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
 	} 
 	void display()
 	{
 		if (this.isAlive)
 		{
 			fill(this.c);
 			ellipse(this.x, this.y, 10, 10);
 		}
 	}
 	void update(float dx, float dy)
 	{
 		float distance = sqrt(dx*dx+dy*dy);
    	if(frame==180){
    		//make the random chance to die here
			gen++;
			frame = 0;
    	}
   		if (distance>800){
			this.isAlive=false;
		}
 	}
  void move()
  {
     this.x = this.x + (int)((Math.random()*25)-12);
     this.y = this.y + (int)((Math.random()*25)-12);
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