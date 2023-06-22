package modul_2_core_java;

import java.util.ArrayList;

public class Question52 {
	public static void main(String[] args) {
		ArrayList a = new ArrayList();
		a.add("Pramod");
		a.add("Aniket");
		a.add("Mayur");
		a.add("Tushar");
		a.add("Kartik");
		
		System.out.println(a);
		a.remove(2);
		System.out.println(a);
	}

}
