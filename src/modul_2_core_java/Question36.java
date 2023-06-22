package modul_2_core_java;

import java.util.Scanner;

public class Question36 {
	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter the value of A: ");
		int a = sc.nextInt();
		System.out.println("Enter the value of B: ");
		int b = sc.nextInt();
		
		try {
			int c = a/b;
		} catch (Exception e) {
			System.out.println("Any Value does not divide by 0");
		}
		
	}

}
