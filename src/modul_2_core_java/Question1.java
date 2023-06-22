package modul_2_core_java;

import java.util.Scanner;

public class Question1 {
	public static void main(String[] args) {
		int a,b;
		
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter value of a: ");
		a = sc.nextInt();
		System.out.println("Enter value of b: ");
		b = sc.nextInt();
		
		if(a > b)
			System.out.println("A is greater");
		else
			System.out.println("B is greater");
	}
	
}
