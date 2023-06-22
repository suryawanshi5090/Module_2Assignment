package modul_2_core_java;

import java.util.Scanner;

public class Question35 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter the Value of A: ");
		int a = sc.nextInt();
		System.out.println("Enter the value of B: ");
		int b = sc.nextInt();
		
		try {
			int c = a/b;
			System.out.println(c);
		} catch (ArithmeticException e) {
			System.out.println("Any value does not divided by zero.");
		}
	}

}
