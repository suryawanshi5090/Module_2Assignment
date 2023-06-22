package modul_2_core_java;

import java.util.Scanner;

public class Question33 {
	public static void main(String[] args) {
		int marks;
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter your marks out of 100:");
		marks = sc.nextInt();
		getGrade(marks);
	}
	public static void getGrade(int marks) {
		String grade = "null";
		if(marks >= 90 && marks <= 100) {
			System.out.println("A");
		}
		else if(marks >= 80 && marks <= 90) {
			grade = "B";
		}
		else if(marks >= 70 && marks <= 80) {
			grade = "C";
		}
		else if(marks >= 60 && marks <= 70) {
			grade = "D";
		}
		else if(marks >= 50 && marks <= 60) {
			grade = "E";
		}
		else if(marks >= 0 && marks <= 50) {
			grade = "FAIL";
		}
		else {
			System.out.println("Invalid marks entered.");
			return;
		}
		System.out.println("Your grade is: " +grade);
	}

}
