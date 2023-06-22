package modul_2_core_java;

class PrintNumber{
	
	public void printn(int num) {
		System.out.println("Print Integer num: "+num);
	}
	public void printn(float num) {
		System.out.println("Print float num:"+num);
	}
	
	public void printn(double num) {
		System.out.println("Print double num: "+num);
	}
	
	public void printn(String str) {
		System.out.println("Print string: "+str);
	}
	public void printn(boolean b) {
		System.out.println("Print boolean: "+b);
	}
}
public class Question21 {
	public static void main(String[] args) {
		PrintNumber p1 = new PrintNumber();
		p1.printn(100);
		p1.printn(100.00);
		p1.printn(100000.0);
		p1.printn("Pramod");
		p1.printn(true);
		
	}

}
