package modul_2_core_java;

import java.util.Scanner;

public class Question5 {
	public static void main(String[] args) {
		int num,sum=0;
		double average;
		
		Scanner sc = new Scanner(System.in);
		num = sc.nextInt();
		
		for(int i = 1;i <= 5;i++) {
			
			System.out.print("Enter number"+i+":");
			
			num = sc.nextInt();
			sum = sum + num;
			
		}
		average = (double)sum/5;
		
		System.out.println("Sum of the 5 numbers is: "+sum);
		System.out.println("Average of the 5 numbers is: "+average);
		

	}

}
