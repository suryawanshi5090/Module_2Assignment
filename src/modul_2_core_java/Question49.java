package modul_2_core_java;

import java.util.ArrayList;

public class Question49 {
	public static void main(String[] args) {
		
		ArrayList a = new ArrayList();
		a.add("Pramod");
		a.add("Keshree");
		a.add("Aniket");
		
		a.add(0, "Kunal");
		System.out.println("Names are: " +a);
	}

}
