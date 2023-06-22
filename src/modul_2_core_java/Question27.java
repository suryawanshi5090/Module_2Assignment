package modul_2_core_java;

class Triangle{
	private int a;
	private int b;
	private int c;
	
	public Triangle() {
		this.a = 3;
		this.b = 4;
		this.c = 5;
	}
	
	public double area() {
		double s = (double)(a+b+c) / 2.0;
		return Math.sqrt(s*(s - a) * (s - b) * (s - c));
	}
	
	public int perimeter() {
		return a+b+c;
	}
}



public class Question27 {
	public static void main(String[] args) {
		Triangle t1 = new Triangle();
		System.out.println("Triangle Area: "+t1.area());
		System.out.println("Triangle Perimeter: "+t1.perimeter());
	}

}
