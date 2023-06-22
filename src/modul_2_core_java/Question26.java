package modul_2_core_java;

class Rectangle{
	private int length;
	private int breadth;
	
	public Rectangle(int length,int breadth) {
		this.length = length;
		this.breadth = breadth;
	}
	
	public int area() {
		return length * breadth;
	}
	
	public int perimeter() {
		return 2 * (length + breadth);
	}
}

class Square extends Rectangle{
	
	public Square(int side) {
		super(side, side);
	}
}


public class Question26 {
	public static void main(String[] args) {
		Rectangle r = new Rectangle(5, 6);
		System.out.println("Rectangle Area: "+r.area());
		System.out.println("Rectangle Perimeter: " +r.perimeter());
		
		Square s = new Square(5);
		System.out.println("Square Area: "+s.area());
		System.out.println("Squre Perimeter: "+s.perimeter());
		
	}

}
