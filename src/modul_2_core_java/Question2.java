package modul_2_core_java;

import java.util.Scanner;

public class Question2 {
	public static void main(String[] args) {
		char ch;
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter Alphabet: ");
		ch = sc.next().charAt(0);
		
		switch (ch) {
		case 'a': 
		case 'e':
		case 'i':
		case 'o':
		case 'u':
			System.out.println("Vowel");
			break;
			
		default:
		    System.out.println("Consonats");
		    break;
		}
		
	}

}
