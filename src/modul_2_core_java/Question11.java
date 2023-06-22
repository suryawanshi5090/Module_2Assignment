package modul_2_core_java;

import java.util.Scanner;

public class Question11 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter number: ");
		int n = sc.nextInt();
		
		int sum = n+(n*10+n)+(n*100+n*10+n);
		
		System.out.println("Sum of"+" "+n+"+"+n+n+"+"+n+n+n+"="+sum);
	}

}
