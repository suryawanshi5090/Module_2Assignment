package modul_2_core_java;

public class Question38 {
	public static void main(String[] args) {
		int arr[] = new int[5];
		try {
			try {
//				arr[5] = 30/0;
				System.out.println(arr[10]);
			} catch (ArithmeticException e) {
				System.out.println("Any Value does not divide by zero.");
			}
		} catch (ArrayIndexOutOfBoundsException e) {
			System.out.println("Value does not fount at an index 10.");
		}
	}

}
