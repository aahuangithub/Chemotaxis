Bacteria[] all = new Bacteria[100];
int[] food = new int[2];

void setup()   
 {     
 	size (800, 800);
 	for (int i = 0; i<all.length; i++)
 	{
 		all[i] = new Bacteria(400, 400);
 	}
 }   
 void draw()   
 {    
 	background(0);
 	for (int i = 0; i<all.length; i++)
 	{
 		all[i].display();
 		all[i].update();
 	}
 }

 class Bacteria    
 {     
 	int x, y;
 	color c;
 	Bacteria(int x, int y)
 	{
 		this.x = x;
 		this.y = y;
 		this.c = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
 	} 
 	void display()
 	{
 		fill (this.c);
 		ellipse(this.x, this.y, 10, 10);
 	}
 	void update()
 	{
 		this.x = this.x + (int)((Math.random()*111)-55);
 		this.y = this.y + (int)((Math.random()*111)-55);
 	}

 }    

 void mousePressed()
 {
 	food[0] = mouseX;
 	food[1] = mouseY;
 }