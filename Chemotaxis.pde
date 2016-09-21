Bacteria[] all = new Bacteria[100];
Food one = new Food(-1, -1);
int gen;
void setup()   
 {     
 	gen = 0;
 	frameRate(60);
 	noStroke();
 	size (800, 800);
 	for (int i = 0; i<all.length; i++)
 	{
 		all[i] = new Bacteria(i, 400, 400);
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
 		this.maxLength = (int)(Math.random()*51);
 		this.rot = (float)(Math.random()*TWO_PI);
 	}
 void display()
 	{
 		if (this.isAlive)
 		{
 			fill((255*(float)(this.id)/all.length), (int)(255*(float)this.maxLength/50), (int)(255*(this.rot/TWO_PI)));
 			ellipse(this.x, this.y, 10, 10);
 		}
 	}
 	void update(float dx, float dy)
 	{
 		float distance = sqrt(dx*dx+dy*dy);
    	if(frameCount%180 == 0){
    		//make the random chance to die here
			gen++;
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