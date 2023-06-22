package modul_2_core_java;

import java.util.HashMap;

public class Question69 {
	public static void main(String[] args) {
		 HashMap hm = new HashMap();
		 hm.put(1,"Pramod");
		 hm.put(2,"Aniket");
		 hm.put(3,"Mayur");
		 hm.put(4,"Tushar");
		 hm.put(5,"Kartik");
		 
		 System.out.println("Original Hashset: " +hm);
		 
		 boolean result  = hm.isEmpty();
		 System.out.println("Is Hashmap empty: " +result);
		 
		 hm.clear();
		 result = hm.isEmpty();
		 System.out.println("Is Hashmap empty: " +result);
	}

}
