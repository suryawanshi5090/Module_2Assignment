package modul_2_core_java;

import java.util.ArrayList;
import java.util.Collections;

public class Question56 {
	public static void main(String[] args) {
		ArrayList a = new ArrayList();
		a.add("Pramod");
		a.add("Aniket");
		a.add("Mayur");
		a.add("Tushar");
		a.add("Kartik");
		
		System.out.println(a);
		System.out.println("List before shuffling: " +a);
		
		Collections.shuffle(a);
		System.out.println("List after shuffling: " +a);
	}

}
