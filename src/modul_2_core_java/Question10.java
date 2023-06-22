package modul_2_core_java;

import java.util.Scanner;

public class Question10 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter a charactor: ");
		char ch = sc.next().charAt(0);
		int ascii = (int)ch;
		System.out.println("ASCII value of"+" "+ch+" "+"is"+" "+ascii);
	}

}
