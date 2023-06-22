package modul_2_core_java;

import java.util.ArrayList;
import java.util.Iterator;

public class Question72 {
	public static void main(String[] args) {
		ArrayList a = new ArrayList();
		a.add("Pramod");
		a.add("Aniket");
		a.add("Mayur");
		a.add("Tushar");
		a.add("Kartik");
		
		System.out.println("Original Arraylist: "+a);
		
		System.out.println("\nPrint using of an element position: ");
		Iterator itr = a.iterator();
		
		while(itr.hasNext()) {
			System.out.println(itr.next()); 
		}
	}

}
