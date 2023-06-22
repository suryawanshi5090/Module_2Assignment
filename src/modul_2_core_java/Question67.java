package modul_2_core_java;

import java.util.HashSet;

public class Question67 {
	public static void main(String[] args) {
		HashSet hs = new HashSet();
		hs.add("Pramod");
		hs.add("Aniket");
		hs.add("Mayur");
		hs.add("Tushar");
		hs.add("Kartik");
		
		System.out.println("Original Hashset: " +hs);
		
		String arr[] = new String[hs.size()];
		hs.toArray(arr);
		System.out.println("Array elements: ");
		for(String element: arr) {
			System.out.println(element);
		}
	}

}
