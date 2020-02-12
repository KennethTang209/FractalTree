private double fractionLength = .75; 
private int smallestBranch = 10; 
private double branchAngle = .5; 
 
public void setup() 
{   
	size(1000,900);
	noLoop();
	strokeWeight(2);    
} 
public void draw() 
{   
	background(127);      
	for(int i = 0; i < 3; i++){
		stroke((float)(Math.random()*256), (float)(Math.random()*256), (float)(Math.random()*256));
		int x = (int)(Math.random()*500)+200;
		int y = (int)(Math.random()*150)+50;
		line(x,900,x,900-y);
		drawBranches(x,900-y,y,3*Math.PI/2);
	}

} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	double angle1 = angle + branchAngle;
	double angle2 = angle - branchAngle;
	int endX1 = (int)(branchLength*Math.cos(angle1) + x);
	int endY1 = (int)(branchLength*Math.sin(angle1) + y);
	int endX2 = (int)(branchLength*Math.cos(angle2) + x);
	int endY2 = (int)(branchLength*Math.sin(angle2) + y);
	stroke((float)(Math.random()*256), (float)(Math.random()*256), (float)(Math.random()*256));
	line(x, y, endX1, endY1);
	stroke((float)(Math.random()*256), (float)(Math.random()*256), (float)(Math.random()*256));  
	line(x, y, endX2, endY2); 
	if(branchLength > smallestBranch){
		drawBranches(endX1, endY1, branchLength*fractionLength, angle1);
		drawBranches(endX2, endY2, branchLength*fractionLength, angle2);
	}
} 
