package modul_2_core_java;

public class Question37 {
	public static void main(String[] args) {
		
		int arr[] = new int[5];
		
		try {
//			arr[5] = 30/0;
			System.out.println(arr[10]);
		}
		catch (ArithmeticException e) {
			System.out.println("Any value does not divide by 0.");
		}
		catch (ArrayIndexOutOfBoundsException e) {
			System.out.println("Value did not found at an index 10.");
		}
			
	}

}
