package modul_2_core_java;

import java.util.HashSet;

public class Question73 {
	public static void main(String[] args) {
		HashSet hs1 = new HashSet();
		hs1.add("Pramod");
		hs1.add("Aniket");
		hs1.add("Mayur");
		hs1.add("Tushar");
		hs1.add("Kartik");
		
		System.out.println("First Hashset: " +hs1);
		
		HashSet hs2 = new HashSet();
		hs2.add("Pramod");
		hs2.add("Aniket");
		hs2.add("Rupesh");
		hs2.add("Palash");
		hs2.add("Kartik");
		
		System.out.println("Second Hashset: " +hs2);
		
		hs1.retainAll(hs2);
		System.out.println("Same Elements: ");
		System.out.println(hs1);
	}

}
