package modul_2_core_java;

public class Question39 {
	
	public static void validate(int age) {
		if(age < 18) {
			throw new ArithmeticException("Person is not eligible for vote.");
		}
		else {
			System.out.println("Welcome to vote.");
		}
	}
	
	
	public static void main(String[] args) {
		validate(16);
		
	}

}
