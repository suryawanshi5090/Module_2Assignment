package modul_2_core_java;
class PrintArea{
	
	public void printArea(int side) {
		int area = side * side;
		System.out.println("Area of square with side" +" "+side +"=" +area);
	}
	public void printArea(int length,int breath) {
		int area = length * breath;
		System.out.println("Area of rectangle with length "+" "+length +"and breath" +" "+breath +"=" +area);
	}
}
public class Question23 {
	public static void main(String[] args) {
		PrintArea a = new PrintArea();
		a.printArea(5);
		a.printArea(5, 10);
	}

}
