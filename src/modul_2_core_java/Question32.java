package modul_2_core_java;

abstract class Shape{
	abstract double RectangleArea(double length,double breadth);
	abstract double SquareArea(double side);
	abstract double CircleArea(double radius);
	
}

class Area extends Shape{
	double RectangleArea(double length,double breadth) {
		return length * breadth;
	}
	
	double SquareArea(double side) {
		return side * side;
	}
	
	double CircleArea(double radius) {
		return Math.PI *  radius * radius;
	}
	
}


public class Question32 {
	public static void main(String[] args) {
		Area a = new Area();
		System.out.println("Area of rectangle with length 5 and breadth 6 is " +a.RectangleArea(5, 6));
		System.out.println("Area of square with side 4 is "+ a.SquareArea(4));
		System.out.println("Area of circle with radius 3 is "+ a.CircleArea(3));
		
	}

}
