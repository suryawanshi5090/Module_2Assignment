package modul_2_core_java;

class PrintNumChar {
	public void print(int i, String s) {
		System.out.println("Print integer: "+i+" "+ "character: "+s);
	}
	
	public void print(String s,int i) {
		System.out.println("Print character: "+s +" " +"integer: "+i);
	}
}
public class Question22 {
	public static void main(String[] args) {
		PrintNumChar nc = new PrintNumChar();
		nc.print(10, "K");
		nc.print("P", 20);
	}

}
