package modul_2_core_java;

import java.util.HashSet;
import java.util.Iterator;

public class Question58 {
	public static void main(String[] args) {
		HashSet h = new HashSet();
		h.add("Pramod");
		h.add("Aniket");
		h.add("Mayur");
		h.add("Tushar");
		h.add("Kartik");
		
		System.out.println(h);
		
		System.out.println("Iterating through Iterator");
		Iterator itr = h.iterator();
		
		while(itr.hasNext()) {
			System.out.println(itr.next()); 
		}
	}

}
